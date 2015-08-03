//-------------------------------------------------------------------------*
// 文件名: isr.c                                                           *
// 说  明: 中断处理例程                                                    *

#include "includes.h"
#include "math.h"
#include "control.h"
#define Initial_Ok 0xe9

float revise_x  = 0;
float revise_y  = 0;
uint32 Time_counter = 0;
uint16 Height = 0;
uint16 BaseHeight = 0;
bool send_data = false;
bool Pit_update = false;
bool Landing  = false;
bool Start_flag = false;
bool Stop_flag = false;
bool Backup_landing = false;
bool Height_update = false;
bool Send_flag = false;
bool Initial_flag = false;
bool startMotion = false;
bool signal_target = false;//用以判断摄像头是否发现目标

uint8 motionState = motionClear;
float data_high[7] = {0};
float datas_mid[7];

uint8 irq_counter = 0;

int16 Pwm_h = 0;
//uint8 Fix_high = 0;
//uint16 Fix_h = 0;
uint8 Clear = 1;
float High = 0;

double Axis_x = 0;
double Axis_y = 0;
bool Axis_update = false;
int16 isrcounter = 0;

uint8 Fly_Mode = 0x6e;//默认为自由模式
uint8 Debug_Mode = LoacalK60Mod;
float c_revise_x = 0,c_revise_y = 0;
float signal_x =0,signal_y = 0;
float median(float *data, char length, float high)
{
    unsigned char ii, jj, mid;
    float data_tmp;


    data_high[0] = data_high[1];
    data_high[1] = data_high[2];
    data_high[2] = data_high[3];
    data_high[3] = data_high[4];
    data_high[4] = data_high[5];
    data_high[5] = data_high[6];
    data_high[6] = high;

    mid = length >> 1;
    for(ii = 0; ii < length; ii++)
    {
        *(datas_mid + ii) = *(data + ii);
    }

    for(ii = 0; ii <= mid; ii++)
        for(jj = ii + 1; jj < length; jj++)
        {

            if (*(datas_mid + ii) < *(datas_mid + jj) )
            {
                data_tmp = *(datas_mid + ii);
                *(datas_mid + ii) = *(datas_mid + jj);
                *(datas_mid + jj) = data_tmp;
            }
        }
    return *(datas_mid + mid);
}

/*
int get_mid(int a, int b,int c)
{
 int x=0;
 if(a>b){x=b;b=a;a=x;}
 if(b>c){x=c;c=b;b=x;}
 if(a>b){x=b;b=a;a=x;}
 return b ;
}
*/
//-------------------------------------------------------------------------*
//函数名: uart0_isr                                                        *
//功  能: 串口0数据接收中断例                                              *
//说  明: 无                                                               *
//-------------------------------------------------------------------------*
void uart0_isr(void)
{ uint8 ch = 0;
  static uint8 send_data_flag = 0;
  uart_re1 (UART0, &ch);
   if(Stop_flag == true)
 {
    if(send_data_flag = 0 && ch == 0xaa)send_data_flag = 1;
    else if(send_data_flag = 1 && ch == 0x4a)send_data_flag = 2;
    else if(send_data_flag = 2 && ch == 0x06)send_data_flag = 3;
    else if(send_data_flag = 3 && ch == 0xbb)
    {
      send_data_flag = 0;
      Send_flag = true;
    }
   else send_data_flag = 0;
 }
 
 if(ch == 0xee)print_pixel_data();
 
}
//-------------------------------------------------------------------------*
//函数名: uart0_isr                                                        *
//功  能: 串口1数据接收中断例                                              *
//说  明: 无                                                               *
//-------------------------------------------------------------------------*
int re_X;
int re_Y;
uint8 CH;
//extern int PointX,PointY;
//int targetlosetime=0;

//int GlobleRec[10];
void uart1_isr(void)
{
    uint8 ch;
    static uint8 data_flag = 0;
    //static uint8 i = 0;
    //static uint8 axis[4] = {0};
    static uint8 rec0[4]={0};
    //static uint8 send0[6]={0};
    static bool data_finish = true;
    static bool rev_data_fish = true;
    static uint8 revise_flag = 0;
    static uint8 buff_counter=0;
 
    
    //接收一个字节数据并回发
    uart_re1 (UART1, &ch);
    CH=ch;
    

   if(ch>0x60 &&ch<0x80)//判断接受字节为此范围数据则是遥控器信号
   {
//////////////////////////////接收目标位置坐标//////////////////////////////////
//    if(data_flag == 2)
//    {
//        axis[i] = ch;
//        i++;
//    }
//    if(i >= 4)
//    {
//        data_finish = false;
//        axistemp = *(int32 *)axis;
//        Axis_x = axistemp % 1000;
//        Axis_y = axistemp / 1000 % 1000;
//        symbolBit = axistemp / 1000000;
//        //Axis_y = *(int16 *)(axis + 2);
//        if(symbolBit == 1)Axis_y = -Axis_y;
//        if(symbolBit == 2)Axis_x = -Axis_x;
//        if(symbolBit == 3){Axis_y = -Axis_y;Axis_x = -Axis_x;}
//        i = 0;
//        data_flag = 0;
//        isrcounter++;
//        Axis_update = true;
//    }
//    else
//    {
//        data_finish = true;
//    }
//    
//    if(data_flag == 0 && Start_flag == true)
//    {
//        if(ch == Axis_First_Frame) data_flag = 1;
//        else           data_flag = 0;
//    }
//    else if (data_flag == 1 )
//    {
//        if(ch == Axis_End_Frame) data_flag = 2;
//        else           data_flag = 0;
//    }
////////////////////////////////////////////////////////////////////////////////    
//////////////////////////初始化参数接收////////////////////////////////////////
//  rev_data_fish = true;
//  if(Initial_flag == false)
//  {
//    if(revise_flag == 2)
//    {
//        revise_data[j] = ch;
//        j++;
//    }
//    if(j >= 82  && revise_data[80]== 0xD3 && revise_data[81]== 0xDA)
//    {
//        rev_data_fish = false;
//        c_revise_y = *(float *)revise_data;
//        c_revise_x = *(float *)(revise_data + 4 * 1);
//        Kp3 = *(float *)(revise_data + 4 * 2);
//        Ki3 = *(float *)(revise_data + 4 * 3);
//        Kd3 = *(float *)(revise_data + 4 * 4);
//        
//        Kp2 = *(float *)(revise_data + 4 * 5);
//        Ki2 = *(float *)(revise_data + 4 * 6);
//        Kd2 = *(float *)(revise_data + 4 * 7);
//        
//        Kp4 = *(float *)(revise_data + 4 * 8);
//        Ki4 = *(float *)(revise_data + 4 * 9);
//        Kd4 = *(float *)(revise_data + 4 * 10);
//        
//        Kx = *(float *)(revise_data + 4 * 11);
//        Kix = *(float *)(revise_data + 4 * 12);
//        Kdx = *(float *)(revise_data + 4 *13);
//        
//        Ky = *(float *)(revise_data + 4 * 14);
//        Kiy = *(float *)(revise_data + 4 * 15);
//        Kdy = *(float *)(revise_data + 4 * 16);
//        
//        Kp1 = *(float *)(revise_data + 4 * 17);
//        Ki1 = *(float *)(revise_data + 4 * 18);
//        Kd1 = *(float *)(revise_data + 4 * 19);   
//        j = 0;
//        revise_flag = 0;
//        Initial_flag = true;
//        
//        uart_send1 (UART1, Initial_Ok);
//        uart_send1 (UART1, Initial_Ok);
//        uart_send1 (UART1, Initial_Ok);//初始化完成
//        LED3_OFF;
//    }
//
//    
//        
//    
//    
//    if(revise_flag == 0 )
//    {
//        if(ch == Revise_First_Frame) revise_flag = 1;
//        else           revise_flag = 0;
//    }
//    else if (revise_flag == 1 )
//    {
//        if(ch == Revise_End_Frame) revise_flag = 2;
//        else           revise_flag = 0;
//    }
//  }
////////////////////////////////////////////////////////////////////////////////    
//////////////////////////判断发送数据命令//////////////////////////////////////
// if(Stop_flag == true)
// {
//    if(send_data_flag = 0 && ch == 0xaa)send_data_flag = 1;
//    else if(send_data_flag = 1 && ch == 0x4a)send_data_flag = 2;
//    else if(send_data_flag = 2 && ch == 0x06)send_data_flag = 3;
//    else if(send_data_flag = 3 && ch == 0xbb)
//    {
//      send_data_flag = 0;
//      Send_flag = true;
//    }
//   else send_data_flag = 0;
// }
////////////////////////////////////////////////////////////////////////////////    
//////////////////////////////控制命令//////////////////////////////////////////
    if(data_flag == 0 && revise_flag == 0 && data_finish == true && rev_data_fish == true)
    {
        switch( ch )
        {
        case 0x70 :
            Stop_flag = true;
            POWER_OFF;
            break;//停止
        case 0x6F :
            Landing   = true;
            break;//缓慢降落
        case 0x6D :
            Start_flag  = true;
            break;//握手信号
        case 0x6c :
            Backup_landing  = true;
            break;
        case FreeMode ://6e
            Fly_Mode = FreeMode;
            break;
        case 0x6b:
            startMotion = true;
            break;
        case 0x69:
          send_data =true;//开始发数据
          break;
        case 0x67:
          send_data = false;//停止发数据
          break;

        }
    }
   }
   
   else   //其余为舵机控制信号
   {  
        //接收数据缓冲区
        for(int i=0;i<3;i++)
        rec0[i]=rec0[i+1];//接收数据更新
        rec0[3]=ch;

        if(255==rec0[0])
        {
          if(rec0[1]>95)
          {
            rec0[1]=rec0[1];
          }
          if(rec0[2]>95)
          {
            rec0[2]=rec0[2];
          }
          if(253==rec0[3])
          {
            re_X=rec0[1];
            re_Y=rec0[2];
          }
          else if(252==rec0[3])
          {
            re_X=rec0[1];
            re_X=-re_X;
            re_Y=rec0[2];
          }
          else if(251==rec0[3])
          {
            re_X=rec0[1];
            re_Y=rec0[2];
            re_Y=-re_Y;
          }
          else if(250==rec0[3])
          {
            re_X=rec0[1];
            re_Y=rec0[2];
            re_X=-re_X;
            re_Y=-re_Y;
          }
          for(int j=0;j<4;j++)//读取数据后缓冲区清零
          {
              rec0[j]=0;
          }
          signal_target=true;
        }
//        if(255==rec0[0]&&254==rec0[5])
//        {
//          if(0!=rec0[1])
//          {
//            re_X=rec0[1];
//          }
//          else
//          {
//            re_X=-rec0[2];
//          }
//          if(0!=rec0[3])
//          {
//            re_Y=rec0[3];
//          }
//          else
//          {
//            re_Y=-rec0[4];
//          }
//          for(int j=0;j<6;j++)//读取数据后缓冲区清零
//          {
//             rec0[j]=0;
//          }
//          signal_target=true;
//          
//        }
//        else if(253==rec0[0])
//        {
//            targetlosetime++;
//            if(targetlosetime==10)
//            {
//              //signal_target=false;
//              targetlosetime=0;
//            }
//        }

//        send0[0]=255;
//        if(PointX>=0)
//          {
//            send0[1]=(uint8)PointX;
//          }
//          else
//          {
//            send0[2]=(uint8)-PointX;
//          }
//        if(PointY>=0)
//          {
//            send0[3]=(uint8)PointY;
//          }
//          else
//          {
//            send0[4]=(uint8)-PointY;
//          }
//        send0[5]=254;
//        
//          uart_send1 (UART1, send0[buff_counter]);
//          buff_counter++;
//          if(buff_counter==6)buff_counter=0;
   }
  
   
        
}
//==========================================================================
//函数名称：pit0_isr
//功能概要：中断例程
//参数说明：无
//函数返回：无
//==========================================================================
void pit0_isr(void)
{
    //DisableInterrupts;	                                //关总中断
    PIT_TFLG(0) |= PIT_TFLG_TIF_MASK; //清中断标志
    Pit_update = true;

    Time_counter ++ ;


    if(Time_counter <= COUNTER)                      //数据初始化完成开始
    {
        ReadMPU3205();
        ReadBMA180();
        ReadMPUsteer();
        ReadBMAsteer();
        //read_hmc5883l();
        //read_L3G4200D();
        //read_ADXL345();
    }
}

void PORTE_isr(void)
{
    uint32 timer_count = 0;
    uint16 hight = 0;
    uint32 time = 0;
    static uint32 s_time = 0, r_time = 0;
  
    //PORTE_ISFR

    timer_count = PIT_CVAL(1);
    irq_counter++;
    if(irq_counter == 1)
    {
        s_time = timer_count;
    }
    else if(irq_counter == 2)
    {
        LED1_Change;
        irq_counter = 0;
        r_time = timer_count;
        time =  (s_time - r_time) * 1000 / periph_clk_khz; //微秒us
        hight = time  / 58 ;                               //时间(微秒)除以58就是距离(厘米)
        if(hight < 250 )
        {
            Height_update = true;
            Height = hight;
        }
    }
}

