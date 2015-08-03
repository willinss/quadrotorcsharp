//============================================================================
//工程名称：
//硬件连接：
//程序描述：
//工程说明：
//版权所有：中山大学NCSLab
//============================================================================

#include "includes.h"

//全局变量声明


//主函数
void main(void)
{   
    DisableInterrupts;                              //禁止总中断
    Delay_ms(100);                                 //延时100ms开始执行程序
    LED_OFF;                                        //Led亮表示开机 
    LED1_OFF;
    LED2_OFF;
    LED3_OFF;
    while(!Initial());                         //等待初始化结束
    EnableInterrupts;			          //开总中断
    
  //Led灭初始化结束                                      
    while(!CheckHeightSensor());                  //等待高度初始化完成
    LED_ON;                                       //指示灯亮，等待遥控开始指令
    
    while(Start_flag == false );                  
   
    LED_OFF;                                      //所有初始化正常LED灭
    Buzzer_OFF;
    enable_pit_interrupt(PIT0);
   
    while(Time_counter <= COUNTER);               //数据初始化完成开始
   // hw_gpio_init(PORT_B,23, 1, 0); 
   
     
    while(1)
    {
  //===========================主循环（开始）===================================
        while(Pit_update == false);
       //hw_gpio_set(PORT_B,23, 1);
        Pit_update = false;

        ReadMPU3205();
        ReadBMA180();
        if((int)(Time_counter * T) % 25 == 0)   //20ms测量一次高度
        {   irq_counter = 0;
            LED1_ON;
            Trig_ON;
            Delay_10us();
            Trig_OFF;
            LED_Change;
        }
//================================不使用磁力计=============================================        
        MahonyAHRSupdateIMU(Dot_xgyro, Dot_ygyro, Dot_zgyro, Dot_xacc, Dot_yacc, Dot_zacc);
//=========================================================================================
        
        //==========================================使用磁力计====================================
        //参数说明：(float)mx,(float)my,(float)mz)为磁力计的数据
        //MahonyAHRSupdate(Dot_xgyro, Dot_ygyro, Dot_zgyro, Dot_xacc, Dot_yacc, Dot_zacc,(float)mx,(float)my,(float)mz);
        //========================================================================================
        
        //对角度数据进行校正
        Angle_X = (Angle_X + Q_x) / 2 ;//+ revise_x + c_revise_x;
        Angle_Y = (Angle_Y + Q_y) / 2 ;//+ revise_y + c_revise_y;
        Angle_Z = (Angle_Z + Q_z) / 2 ;
        
        High = High_update(); 
        
//================================更新云台姿态角=============================================

        ReadMPUsteer();
        ReadBMAsteer();        
        MahonyAHRSupdateIMU1(Dot_xgyro0, Dot_ygyro0, Dot_zgyro0, Dot_xacc0, Dot_yacc0, Dot_zacc0);
        //对角度数据进行校正
        Angle_X0 = Q_x1;//(Angle_X0 + Q_x1) / 2 ;
        Angle_Y0 = Q_y1;//(Angle_Y0 + Q_y1) / 2 ;
        Angle_Z0 = Q_z1;//(Angle_Z0 + Q_z1) / 2 ;
        

        //修正参数，计算像素坐标到图像中心点的实际距离
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
                      
            image_distance=108/cy;//摄像头物距
            revise_Y=-RE_X*image_distance/450;//180为摄像头标定水平焦距
            revise_X=RE_Y*image_distance/471;//190为摄像头标定竖直焦距


            //====================将摄像机坐标转换为世界坐标系=====================    

           //转换为世界坐标系
            PointX=cy*cz*revise_X +(sy*sx*cz-cx*sz)*revise_Y +(sy*cx*cz+sx*sz)*image_distance ;
            PointY=cy*sz*revise_X +(sx*sy*sz+cx*cz)*revise_Y +(sy*cx*sz-sx*cz)*image_distance;
            //Zs=-sy*revise_X        + sx*cy*revise_Y                         +cy*cx*image_distance;
          
            
            //转换为世界坐标系
            //PointX= Xs;//image_distance*Xs/Zs ; 
            //PointY= Ys;//image_distance*Ys/Zs ;
        
            //====================将目标坐标转换为世界坐标系=====================
    
            if(PointX - prePointX > 8)PointX = prePointX + 8;
            else if(PointX - prePointX < -8)PointX = prePointX - 8;
            if(PointY - prePointY > 8)PointY = prePointY + 8;
            else if(PointY - prePointY < -8)PointY = prePointY - 8;
            //平滑
            PointX=0.6*PointX+0.4*prePointX;
            PointY=0.6*PointY+0.4*prePointY;
            prePointX = PointX;
            prePointY = PointY;
          

         }
       
//=========================================================================================    
        
        Quadrotor_pid(Angle_X, Angle_Y, Angle_Z, High,PointX,PointY , Angle_X0,Angle_Y0,Angle_Z0 );//Angle_Y为Y轴向下倾斜为正向,Angle_X为x轴向上为正向
        
        ////////////////////飞行器停止////////////////////////
        while(Stop_flag == true || abs((int)Angle_X) >= 70 || abs((int)Angle_Y) >= 70)
        {
            disable_pit_interrupt(PIT0);
            POWER_OFF;
            LED_OFF;
            
            ftm0_pwm_change_duty(0,850);//控制舵机上下
            ftm0_pwm_change_duty(5,1370);//控制舵机左右
            //if(SendToGUI_Flag == true)SendStopToGUI();
            //if(Send_flag == true)Senddata();
             if(Send_flag == true)SendDataToGUI();
        }
    // hw_gpio_set(PORT_B,23,0);
   //=============================主循环（结束）================================
    }
}//end main
