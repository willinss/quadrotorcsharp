//============================================================================
//�������ƣ�
//Ӳ�����ӣ�
//����������
//����˵����
//��Ȩ���У���ɽ��ѧNCSLab
//============================================================================

#include "includes.h"

//ȫ�ֱ�������


//������
void main(void)
{   
    DisableInterrupts;                              //��ֹ���ж�
    Delay_ms(100);                                 //��ʱ100ms��ʼִ�г���
    LED_OFF;                                        //Led����ʾ���� 
    LED1_OFF;
    LED2_OFF;
    LED3_OFF;
    while(!Initial());                         //�ȴ���ʼ������
    EnableInterrupts;			          //�����ж�
    
  //Led���ʼ������                                      
    while(!CheckHeightSensor());                  //�ȴ��߶ȳ�ʼ�����
    LED_ON;                                       //ָʾ�������ȴ�ң�ؿ�ʼָ��
    
    while(Start_flag == false );                  
   
    LED_OFF;                                      //���г�ʼ������LED��
    Buzzer_OFF;
    enable_pit_interrupt(PIT0);
   
    while(Time_counter <= COUNTER);               //���ݳ�ʼ����ɿ�ʼ
   // hw_gpio_init(PORT_B,23, 1, 0); 
   
     
    while(1)
    {
  //===========================��ѭ������ʼ��===================================
        while(Pit_update == false);
       //hw_gpio_set(PORT_B,23, 1);
        Pit_update = false;

        ReadMPU3205();
        ReadBMA180();
        if((int)(Time_counter * T) % 25 == 0)   //20ms����һ�θ߶�
        {   irq_counter = 0;
            LED1_ON;
            Trig_ON;
            Delay_10us();
            Trig_OFF;
            LED_Change;
        }
//================================��ʹ�ô�����=============================================        
        MahonyAHRSupdateIMU(Dot_xgyro, Dot_ygyro, Dot_zgyro, Dot_xacc, Dot_yacc, Dot_zacc);
//=========================================================================================
        
        //==========================================ʹ�ô�����====================================
        //����˵����(float)mx,(float)my,(float)mz)Ϊ�����Ƶ�����
        //MahonyAHRSupdate(Dot_xgyro, Dot_ygyro, Dot_zgyro, Dot_xacc, Dot_yacc, Dot_zacc,(float)mx,(float)my,(float)mz);
        //========================================================================================
        
        //�ԽǶ����ݽ���У��
        Angle_X = (Angle_X + Q_x) / 2 ;//+ revise_x + c_revise_x;
        Angle_Y = (Angle_Y + Q_y) / 2 ;//+ revise_y + c_revise_y;
        Angle_Z = (Angle_Z + Q_z) / 2 ;
        
        High = High_update(); 
        
//================================������̨��̬��=============================================

        ReadMPUsteer();
        ReadBMAsteer();        
        MahonyAHRSupdateIMU1(Dot_xgyro0, Dot_ygyro0, Dot_zgyro0, Dot_xacc0, Dot_yacc0, Dot_zacc0);
        //�ԽǶ����ݽ���У��
        Angle_X0 = Q_x1;//(Angle_X0 + Q_x1) / 2 ;
        Angle_Y0 = Q_y1;//(Angle_Y0 + Q_y1) / 2 ;
        Angle_Z0 = Q_z1;//(Angle_Z0 + Q_z1) / 2 ;
        

        //���������������������굽ͼ�����ĵ��ʵ�ʾ���
          if(re_X !=0 && re_Y !=0)
          {
            cx=cos(Angle_X0);
            cy=cos(Angle_Y0);
            cz=cos(Angle_Z0);
            sx=sin(Angle_X0);
            sy=sin(Angle_Y0);
            sz=sin(Angle_Z0);
            
            RE_X=(float)re_X;
            RE_Y=(float)re_Y;
                      
            image_distance=108/cy;//����ͷ���
            revise_Y=-RE_X*image_distance/450;//180Ϊ����ͷ�궨ˮƽ����
            revise_X=RE_Y*image_distance/471;//190Ϊ����ͷ�궨��ֱ����


            //====================�����������ת��Ϊ��������ϵ=====================    

           //ת��Ϊ��������ϵ
            PointX=cy*cz*revise_X +(sy*sx*cz-cx*sz)*revise_Y +(sy*cx*cz+sx*sz)*image_distance ;
            PointY=cy*sz*revise_X +(sx*sy*sz+cx*cz)*revise_Y +(sy*cx*sz-sx*cz)*image_distance;
            //Zs=-sy*revise_X        + sx*cy*revise_Y                         +cy*cx*image_distance;
          
            
            //ת��Ϊ��������ϵ
            //PointX= Xs;//image_distance*Xs/Zs ; 
            //PointY= Ys;//image_distance*Ys/Zs ;
        
            //====================��Ŀ������ת��Ϊ��������ϵ=====================
    
            if(PointX - prePointX > 8)PointX = prePointX + 8;
            else if(PointX - prePointX < -8)PointX = prePointX - 8;
            if(PointY - prePointY > 8)PointY = prePointY + 8;
            else if(PointY - prePointY < -8)PointY = prePointY - 8;
            //ƽ��
            PointX=0.6*PointX+0.4*prePointX;
            PointY=0.6*PointY+0.4*prePointY;
            prePointX = PointX;
            prePointY = PointY;
          

         }
       
//=========================================================================================    
        
        Quadrotor_pid(Angle_X, Angle_Y, Angle_Z, High,PointX,PointY , Angle_X0,Angle_Y0,Angle_Z0 );//Angle_YΪY��������бΪ����,Angle_XΪx������Ϊ����
        
        ////////////////////������ֹͣ////////////////////////
        while(Stop_flag == true || abs((int)Angle_X) >= 70 || abs((int)Angle_Y) >= 70)
        {
            disable_pit_interrupt(PIT0);
            POWER_OFF;
            LED_OFF;
            
            ftm0_pwm_change_duty(0,850);//���ƶ������
            ftm0_pwm_change_duty(5,1370);//���ƶ������
            //if(SendToGUI_Flag == true)SendStopToGUI();
            //if(Send_flag == true)Senddata();
             if(Send_flag == true)SendDataToGUI();
        }
    // hw_gpio_set(PORT_B,23,0);
   //=============================��ѭ����������================================
    }
}//end main
