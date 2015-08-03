//============================================================================
//文件名称：
//功能概要：使用PID对飞行器进行姿态控制
//版权所有：中山大学NCSLab
//============================================================================

#include "control.h"
#include "filters.h"
#include "pit.h"
#include  <math.h>

#define THREAD_TOP     1990   //PWM   
#define THREAD_BOTTOM  1000   //PWM 1000表示的是1毫秒
#define Inc_max        30     //PWM的数值防止跳变
#define Dec_max       -30

#define OptSamTime  30       
#define Velocity    60.0f         //速度0.6m/s

//================================全局变量声明=================================
float Kp1 = -6 ; //垂直控制
float Kp2 = -6 ; //滚转控制y
float Kp3 = -6 ;//俯仰控制x
float Kp4 = -100;//偏航控制

float Kd1 = -2500 ;    //垂直控制
float Kd2 = -600  ;   //滚转控制
float Kd3 = -600 ;    //俯仰控制
float Kd4 = -10000 ;    //偏航控制

float Ki1 = -0.02;
float Ki2 = -0.00;
float Ki3 = -0.00;
float Ki4 = -0.01;

float Kx = -0.20;
float Ky = -0.20;


float Kx1 = -0.14;
float Ky1 = -0.14;

float Kdx1 = -2.1;
float Kdy1 = -2.1;


float Kix = -0.0003;
float Kiy = -0.0003;

float Kdx = -4.0;
float Kdy = -4.0;

float kvx = -5.0;
float kvy = -5.0;

//float kdx = -10.0;
//float kdy = -10.0;


float errX = 0;
float errY = 0;

uint16 BASE_VALUE = 1000;
float wx[DataLength] = {0}, wy[DataLength] = {0}, wz[DataLength] = {0};//DataLength=60000
//float Posx[DataLength] = {0};
//float Posy[DataLength] = {0};
float *px = wx, *py = wy, *pz = wz;
//float *posx = Posx, *posy = Posy ;
float lastHeight = 0;
float preHeight = 0;
int dataLencounter = 0;
int sendcount =0;
bool camflag=false;

bool _flag_=true;//消除微分项突变...


static float TEST1=0,TEST2=0,TEST3=0,TEST4=0,TEST5=0;

//float Xb=0,Yb=0,Zb=0;

//float Alphard=0,Beta=0;
//float Phi=0,Teta=0;

//float AngleSteering=0;

static int PWM_X=1370,PWM_Y=850;

static uint8 steerFlag=0;
//float camPointX=0,camPointY=0,camPointZ=0,camHeight=0;
float theta=0;
static float err_angX=0,err_angY=0;
static float pre_err_angX=0,pre_err_angY=0;
static int position_f = 0;
//float Xs=0,Ys=0,Zs=0;
float image_distance=0;
float revise_X=0,revise_Y=0;
float cx=0,cy=0,cz=0,sx=0,sy=0,sz=0;
float PointX=0,PointY=0;
static float des_PointX =0;
static float des_PointY =0;
 float RE_X=0,RE_Y=0;
float prePointX=0,prePointY=0;//保存偏移值用以修正图像坐标
static float preposx=0,preposy=0;

//================================全局变量声明=================================

//============================================================================
//函数名称：Quadrotor_pid
//函数返回：无
//参数说明：
//功能概要：
//============================================================================

void Quadrotor_pid(float angle_X, float angle_Y, float angle_Z, float height,float PointX,float PointY,float angle_X0,float angle_Y0, float angle_Z0)
{
    float U1 = 0, U2 = 0, U3 = 0, U4 = 0;
    float W1 = 0, W2 = 0, W3 = 0, W4 = 0;
    static int32 w1 = 0, w2 = 0, w3 = 0, w4 = 0;
    static int32 last_w1 = 1000, last_w2 = 1000, last_w3 = 1000, last_w4 = 1000;
    float err_p = 0;    //俯仰角误差
    float err_r  = 0;   //滚转角误差
    float err_y   = 0;  //偏航角误差
    float err_h     = 0;//高度偏差

    float err_pitch = 0;  //本次俯仰角误差
    float err_roll  = 0;  //本次滚转角误差
    float err_yaw   = 0;  //本次偏航角误差
    float err_high  = 0;  //本次高度偏差

    static float des_pitch = 0.0;
    static float des_roll = 0.0;
    static float des_yaw = 0.0;
    static float pre_err_pitch = 0;  //上一次俯仰角误差
    static float pre_err_roll  = 0;  //上一次滚转角误差
    static float pre_err_yaw   = 0;  //上一次偏航角误差
    static float pre_err_high  = 0;  //上一次高度偏差

    static double sum_err_pitch = 0, sum_err_roll = 0, sum_err_yaw = 0, sum_err_high = 0;

    static float count = 0;

    static float des_high = 50;
    static uint8 K = 0;
    static uint8 high_f = 0;


    static float W_Axis_1 = 0;
    static float W_Axis_2 = 0;
    static float W_Axis_3 = 0;
    static float W_Axis_4 = 0;

    static float k_high = 0;
    
    float dotErrX = 0,dotErrY=0;
    static float lastErrX=0,lastErrY=0;
    static double sumErrX=0,sumErrY=0;


    if(abs((int)angle_X) > 20 || abs((int)angle_Y) > 20)
    {
        Landing = true;
        LED2_OFF;
    }
    if(abs((int)angle_X) > 30 || abs((int)angle_Y) > 30)
    {
        Backup_landing = true;
        LED3_OFF;
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////**********目标高度设定*********///////////////////////////////////////
    if(abs((int)(height - lastHeight)) > 3 )
        height = lastHeight;
    else
        lastHeight = height;

    if(height > 50 && high_f == 0)
    {
        K = 1;
        des_high = 80;

    }
    if(height > 70 && high_f == 0)
    {
        des_high = 110;
        high_f = 1;
    }
    
    //    if(height > 20 && high_f == 0)
    //    {
    //      K = 1;
    //      des_high += 0.05;
    //      if(des_high >= 140 )
    //      {
    //        des_high = 140;
    //        high_f = 1;
    //      }
    //    }
    if(height >= 80) k_high = 1;
    if( Backup_landing == true)K = 0;
    /////////求出本次偏差//////////////////////////////////////////////////////////
    err_pitch = des_pitch - angle_X;
    err_roll  = des_roll - angle_Y;
    err_yaw   = des_yaw - angle_Z;
    err_high  = des_high - height ;
    err_high  = err_high * K;


    ////////////偏差积分///////////////////////////////////////////////////////////
    if(height > BaseHeight + 1 )
    {
        sum_err_pitch += err_pitch;
        sum_err_roll  += err_roll;
        sum_err_yaw   += err_yaw;
        // k_high = 1;
    }
    if(Integral_high == true)
    {
        Integral_high = false;
        sum_err_high  += err_high;
        sum_err_high = sum_err_high * k_high;
    }
    //////////求出增量是偏差P///////////////////////////////////////////////////////
    err_p = err_pitch - pre_err_pitch;
    err_r = err_roll  - pre_err_roll;
    err_y = err_yaw   - pre_err_yaw;
    err_h = err_high  - pre_err_high;

    /////////更新上一次偏差////////////////////////////////////////////////////////
    pre_err_pitch = err_pitch;
    pre_err_roll  = err_roll;
    pre_err_yaw   = err_yaw;
    pre_err_high  = err_high;

    U1 = -Kp1 * err_high - Ki1 * sum_err_high - Kd1 * err_h;
    U2 = -Kp2 * err_roll - Ki2 * sum_err_roll - Kd2 * err_r;
    U3 = -Kp3 * err_pitch - Ki3 * sum_err_pitch - Kd3 * err_p;
    U4 = -Kp4 * err_yaw - Ki4 * sum_err_yaw - Kd4 * err_y;

    //////////求出对应电机的PWM////////////////////////////////////////////////////
    W1 = U1 / 4 - U3 / 2 - U4 / 4;
    W2 = U1 / 4 - U2 / 2 + U4 / 4;
    W3 = U1 / 4 + U3 / 2 - U4 / 4;
    W4 = U1 / 4 + U2 / 2 + U4 / 4;

    if(Backup_landing == false && Landing == false && (height - BaseHeight) <= 3 )count = count + 0.2;
    if(Landing == true && des_high > 2 ) des_high -= 0.1 ; //安全降落
    if(Landing == true && abs(height - BaseHeight) <= 12)Stop_flag = true;         //降落离地低于5cm关螺旋桨
    if(Backup_landing == true && count >= 450 )count = count - 0.25 ;          //高度传感器错误，备用降落
    if(Time_counter *T / 1000 >= 150 )Landing = true ;                         //飞行时间超过200s自动降落
    
    //if(Time_counter - COUNTER >= 11000 && count >= 400){count -=  1; Landing = 0;}//超声波和遥控出错降落

    BASE_VALUE = 1000 + (int)count;
    // BASE_VALUE = 1000;
    static double sum_axisx = 0;
    static double sum_axisy = 0;
    static float target_x = 0;
    static float target_y = 0;
    static float dot_targetx = 0;
    static float dot_targety = 0;

    static float des_x = 0;
    static float des_y = 0;

    float err_dotvx = 0;
    float err_dotvy = 0;
    float err_vx=0;
    float err_vy=0;

    static float last_dotx = 0, last_doty = 0;
    static float lastx=0,lasty=0;
    static float des_vx=0,des_vy=0;
    float meanvx=0,meanvy=0;
    float xpos=0,ypos=0;
    extern bool send_data;
        sendcount++;
        if(send_data == true)
        {
          //sendcount =0;
          SendFloat(angle_X0,UART1);
          SendFloat(angle_Y0,UART1);
          SendFloat(angle_Z0,UART1);
          SendFloat(height,UART1);
        }
    
    
    if((int)(Time_counter * T) % OptSamTime == 0)
    {

        ReadANDS3080();
        
        //=======================================

        
        
        
       if(signal_target==false && high_f==1) //
       {
         
         
          if(steerFlag==0)
          {
             PWM_Y=1020;
             PWM_X+=22;
          }
          if(PWM_X>=2100&&steerFlag==0)
          {
             steerFlag=1;
          } 
          if(steerFlag==1)
          {
             PWM_X-=22;
             PWM_Y=1200;
          }
          if(PWM_X<=700&&steerFlag==1)
          {
             steerFlag=2;
          }
          if(steerFlag==2)
          {
             PWM_Y=1450;
             PWM_X+=22;
          }
          if(PWM_X>=2100&&steerFlag==2)
          {
             steerFlag=3;
          }
          if(steerFlag==3)
          {
             PWM_Y=1600;
             PWM_X-=22;
          }
           if(PWM_X<=700&&steerFlag==3)
          {
             steerFlag=0;
          }
         
       }
       else
       {         
         


          //==============计算摄像头与地面夹角，即外参数==================================
         
          //定义坐标
          //Teta=-angle_X*3.14/180;//绕飞行器Y轴逆时针
          //Phi=angle_Y*3.14/180;//绕飞行器x轴逆时针旋转
          //Alphard=( PWM_X - 1350 )*3.14 / 1900;//定义X轴为云台正方向，Z轴向下，y轴向右
          //Beta   =( PWM_Y -850 )*3.14 / 1900;
         
          
          //计算出云台与地面夹角
          //==============计算摄像头与地面夹角，即外参数==================================
         
         // image_distance=108/cos(AY);//摄像头物距

          
          //修正参数，计算像素坐标到图像中心点的实际距离
          if(re_X !=0 && re_Y !=0)
          {
           
            //=====================云台控制，利用像素转换为角度==================
            err_angX = atan2((float)re_X,450);
            err_angY = atan2((float)re_Y,471);
            
            pre_err_angX=err_angX; 
            pre_err_angY=err_angY;
            //=====================云台控制，利用像素转换为角度==================
            
          
            
           PWM_X=(int)(PWM_X-(0.20*err_angX)*1200 - 0.12*(err_angX - pre_err_angX)*1200);//600--2300(1370y轴负方向)
           PWM_Y=(int)(PWM_Y+(0.20*err_angY)*1200 + 0.12*(err_angY - pre_err_angY)*1200);//850___1800(850为垂直向下)
          }
          else//未接受到数据时则认为误差角度为0
          {
             err_angX = 0;
             err_angY = 0;
          }
    
        
         //PWM_X=(int)(PWM_X-(0.85*err_angX)*1200) - 0.7*(err_angX - pre_err_angX)*1200);//600--2300(1370y轴负方向)
         //PWM_Y=(int)(PWM_Y+(0.85*err_angY)*1200) + 0.7*(err_angY - pre_err_angY)*1200);//850___1800(850为垂直向下)
         if(camflag==true)
         {
            PWM_X=1350;
            PWM_Y=850;
         }

       }
       
          
        //限制舵机旋转范围
        if(PWM_Y<850) PWM_Y=850;
        if(PWM_Y>1800) PWM_Y=1800;
        if(PWM_X<600) PWM_X=600;
        if(PWM_X>2300) PWM_X=2300;
      
        ftm0_pwm_change_duty(0,PWM_Y);//控制舵机上下
        ftm0_pwm_change_duty(5,PWM_X);//控制舵机左右

        
        //用完的偏移值清零
        re_Y=0;
        re_X=0;
        //=======================================      
        
        
        if(startMotion == true && signal_target==true && Landing == false)
        {

            
          des_PointX =0; //PointX;
          des_PointY =0; //PointY;
            
          errX = PointX-des_PointX;
          errY = PointY-des_PointY;
          
 
            //控制跟随小车
            //设定飞行器跟随在识别目标x轴后方2米的位置
//            des_PointX = 200-PointX;
//            des_PointY = 0-PointY;
            theta = atan2(errX , -errY);
            
            float kk=0,RR=0;
            RR=sqrt(errX*errX+errY*errY);
            kk=0.1*log(RR/10.0)/log(2.0);
            if(RR<25)
            {
              camflag=true;
            }
            if(RR>25)
            { 
                des_x -=kk*(Velocity / OptSamTime) * sin(theta);
                des_y -=kk*(Velocity / OptSamTime) * cos(theta);

                _flag_=true;
//               
           }
            else
            {
//              if(RR>0)
//              {
//                float k_follow=0.1,kd_follow=2.0,ux=0,uy=0,dot_errX=0,dot_errY,temperrX=0,temperrY=0;
//
//                static float pre_errX=0,pre_errY=0,predot_errX,predot_errY;
//                if(_flag_==true)
//                {pre_errX=errX;pre_errY=errY;_flag_=false;}
//                temperrX=0.8*errX+0.20*pre_errX;
//                temperrY=0.8*errY+0.20*pre_errY;
//                dot_errX=temperrX-pre_errX;
//                dot_errY=temperrY-pre_errY;
//                
//                predot_errX=dot_errX;
//                predot_errY=dot_errY;
//                ux=k_follow*temperrX+kd_follow*dot_errX;
//                uy=k_follow*temperrY+kd_follow*dot_errY;
//                pre_errX=temperrX;
//                pre_errY=temperrY;
//                des_x -=ux*(Velocity / OptSamTime) ;
//                des_y -=uy*(Velocity / OptSamTime) ;
//
//              }
//              else
//              {
               des_x -=0;//.1*(Velocity / OptSamTime) ;
               des_y -=0;//.1*(Velocity / OptSamTime) ;
//
//               _flag_=true;
//              }

            }
           
            
         }

//==============================================================================
    
        
        
        //==================================
        xpos = 0.2 * SumDeltX + 0.8 * preposx;
        ypos = 0.2 * SumDeltY + 0.8 * preposy;
       
        Axis_x = xpos - des_x;
        Axis_y = ypos - des_y;

        dot_targetx = Axis_x -  target_x;
        dot_targety = Axis_y - target_y ;
        
        dot_targetx = (dot_targetx + last_dotx) / 2.0;
        dot_targety = (dot_targety + last_doty) / 2.0;
        
        err_vx = dot_targetx - last_dotx;
        err_vy = dot_targety - last_doty;
     
        preposx = xpos;
        preposy = ypos;
        
        target_x = Axis_x;
        target_y = Axis_y;
        
        last_dotx = dot_targetx;
        last_doty = dot_targety;
        
        sum_axisx += target_x ;//* k_high;
        sum_axisy += target_y ;//* k_high;

        
        //=========================================
        float tempdotErrX = 0,tempdotErrY=0;
        static float lastdotErrX=0,lastdotErrY=0;
       
        tempdotErrX = errX - lastErrX;
        tempdotErrY = errY - lastErrY;
       
        dotErrX = 0.3*tempdotErrX + 0.7*lastdotErrX;
        dotErrY = 0.3*tempdotErrY + 0.7*lastdotErrY;
        
        lastdotErrX = dotErrX;
        lastdotErrY = dotErrY;
              
        sumErrX += errX;
        sumErrY += errY;
           
        lastErrX = errX;
        lastErrY = errY;
        //=========================================

        //  if(sum_axisx > 1500000)sum_axisx = 1500000;
        //  else if(sum_axisx < -1500000)sum_axisx = -1500000;
        //  if(sum_axisy > 1500000)sum_axisy = 1500000;
        //  else if(sum_axisy < -1500000)sum_axisy = -1500000;
        


        
        W_Axis_1 = target_x     * Kx + sum_axisx * Kix + Kdx * dot_targetx  + err_vx * kvx ;
        W_Axis_2 = (-target_y ) * Ky - sum_axisy * Kiy - Kdy * dot_targety  - err_vy * kvy ;
        W_Axis_3 = (-target_x ) * Kx - sum_axisx * Kix - Kdx * dot_targetx  - err_vx * kvx ;
        W_Axis_4 = target_y     * Ky + sum_axisy * Kiy + Kdy * dot_targety  + err_vy * kvy ;
        
//        if(startMotion == true && signal_target==true && Landing == false)
//        {
//          W_Axis_1 =   (-errX)  * Kx1   - dotErrX * Kdx1;//  - sumErrX * Kix;              
//          W_Axis_2 =    -errY   * Ky1   - dotErrY * Kdy1;//  + sumErrY * Kiy;
//          W_Axis_3 =    errX    * Kx1   + dotErrX * Kdx1;//  + sumErrX * Kix;
//          W_Axis_4 =   (errY)   * Ky1   + dotErrY * Kdy1;//  - sumErrY * Kiy;
//        }

//        *posx = SumDeltX;
//        posx++;
//        *posy = SumDeltY;
//        posy++;
    }
   // BASE_VALUE = 1000;W1=0;W2=0;W3=0;W4=0 
    w1 =  BASE_VALUE + (int)(W1 + W_Axis_1);
    w2 =  BASE_VALUE + (int)(W2 + W_Axis_2);
    w3 =  BASE_VALUE + (int)(W3 + W_Axis_3);
    w4 =  BASE_VALUE + (int)(W4 + W_Axis_4);
    
          //TEST5=(int)(W1 + W_Axis_1);

    if(w1 - last_w1 > Inc_max)w1 = last_w1 + Inc_max;
    else if(w1 - last_w1 < Dec_max)w1 = last_w1 + Dec_max;

    if(w2 - last_w2 > Inc_max)w2 = last_w2 + Inc_max;
    else if(w2 - last_w2 < Dec_max)w2 = last_w2 + Dec_max;

    if(w3 - last_w3 > Inc_max)w3 = last_w3 + Inc_max;
    else if(w3 - last_w3 < Dec_max)w3 = last_w3 + Dec_max;

    if(w4 - last_w4 > Inc_max)w4 = last_w4 + Inc_max;
    else if(w4 - last_w4 < Dec_max)w4 = last_w4 + Dec_max;


    // ctrl+k 注释
    // ctrl+shift+k取消注释
    //////////限制电机PWM在电调范围内1ms-2ms///////////////////////////////////////


    if(w1 < THREAD_BOTTOM)   w1 = THREAD_BOTTOM;
    else if(w1 > THREAD_TOP) w1 = THREAD_TOP;

    if(w2 < THREAD_BOTTOM)   w2 = THREAD_BOTTOM;
    else if(w2 > THREAD_TOP) w2 = THREAD_TOP;

    if(w3 < THREAD_BOTTOM)   w3 = THREAD_BOTTOM;
    else if(w3 > THREAD_TOP) w3 = THREAD_TOP;

    if(w4 < THREAD_BOTTOM)    w4 = THREAD_BOTTOM;
    else if(w4 > THREAD_TOP) w4 = THREAD_TOP;

    
    /////////////输出PWM////////////////////////////////////////////////////////////
//        if(w1 > 1200)w1=1200;
//        if(w2 > 1200)w2=1200;
//        if(w3 > 1200)w3=1200;
//        if(w4 > 1200)w4=1200;
//   w1 = (2*w1 + 8*last_w1)/10;
//   w2 = (2*w2 + 8*last_w2)/10;
//   w3 = (2*w3 + 8*last_w3)/10;
//   w4 = (2*w4 + 8*last_w4)/10;
    set_pwm(w1, w2, w3, w4);
    last_w1 = w1;
    last_w2 = w2;
    last_w3 = w3;
    last_w4 = w4;
    // set_pwm(1000, 1000, 1200,1000);
    //POWER_OFF;
    
      

       if(startMotion == true )//&& signal_target==true && Landing == false)
       {
          writeDataToMemory(TEST1, TEST2, TEST3);
       }
    
    //Q_x, Q_y, Q_z,三个姿态角=====SumDeltX, SumDeltY, height为相对坐标
}

