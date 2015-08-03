#include  <math.h>
#include "get_data.h"
#include  "hw_i2c.h"
#include  "uart.h"
#include  "stdio.h"
#include  "pit.h"
#include "Balance_Kalman.h"
#include "isr.h"
#include "hw_gpio.h"
#include"OpticalSensor.h"

#define   OSS 0	 //	BMP085使用

//定义器件在IIC总线中的从地址,根据ALT  ADDRESS地址引脚不同修改
#define	HMC5883L_Addr   0x3C	//磁场传感器器件地址
#define	ADXL345_Addr    0xA6	//加速度传感器器件地址
#define	BMP085_Addr     0xee	//气压传感器器件地址
#define	L3G4200_Addr    0xD2	//陀螺仪传感器器件地址

//定义MPU3050内部地址********************
#define WHO     0x00
#define	SMPL	0x15
#define DLPF	0x16
#define INT_C	0x17
#define INT_S	0x1A
#define	TMP_H	0x1B
#define	TMP_L	0x1C
#define	GX_H	0x1D
#define	GX_L	0x1E
#define	GY_H	0x1F
#define	GY_L	0x20
#define GZ_H	0x21
#define GZ_L	0x22
#define PWR_M	0x3E
//****************************

#define BMA180 		0x80
#define ChipID		0x00
#define Version		0x01
#define DATAX0      0x02
#define DATAX1      0x03
#define DATAY0      0x04
#define DATAY1      0x05
#define DATAZ0      0x06
#define DATAZ1      0x07
#define Ctrl_reg0	0x0d
#define Ctrl_reg1	0x0e
#define Ctrl_reg2	0x0f
#define BW_TCS		0x20
#define Ctrl_reg3	0x21
#define TCO_Z		0x30
#define Offset_lsb1	0x35

#define	MPU3205_Addr   0xD0	  //定义器件在IIC总线中的从地址,根据ALT  ADDRESS地址引脚不同修改

unsigned char BUF[6];                         //接收数据缓存区
char  test = 0;
//int   x,y;
//float angle;
short A_X, A_Y, A_Z;
short T_X, T_Y, T_Z;
int  mx, my, mz;
short data_xyz[3];
//float Roll,Pitch,Q,T,K;
float Angle_accx = 0, Angle_accy = 0, Angle_accz = 0;
float Dot_gyro_x = 0, Dot_gyro_y = 0, Dot_gyro_z = 0;
float Angle_gyrox = 0, Angle_gyroy = 0, Angle_gyroz = 0;
float Q_x, Q_y, Q_z;

float Q_x1, Q_y1, Q_z1;
float Dot_gyro_x0 = 0, Dot_gyro_y0 = 0, Dot_gyro_z0 = 0;
float Angle_gyrox0 = 0, Angle_gyroy0 = 0, Angle_gyroz0 = 0;
float Angle_accx0 = 0, Angle_accy0 = 0, Angle_accz0 = 0;

//***BMP085使用
uint8 AC[22] = {0};
short ac1;
short ac2;
short ac3;
unsigned short ac4;
unsigned short ac5;
unsigned short ac6;
short b1;
short b2;
short mb;
short mc;
short md;

long  temperature;
long  pressure;

float Dot_xgyro, Dot_ygyro, Dot_zgyro , Dot_xacc, Dot_yacc, Dot_zacc;
float Dot_xgyro0, Dot_ygyro0, Dot_zgyro0 , Dot_xacc0, Dot_yacc0, Dot_zacc0;
signed char DeltX = 0, DeltY = 0;
double SumDeltX = 0, SumDeltY = 0;
int maxDelt = 0;
//--------------------------------------
//##Soft filter 软件滤波
#define FILTERNUM		4 //Soft filter buffer size
#define FILTERMASK		3 //Idx from 0~7
#define WARP(X)			(X=((X+1)&FILTERMASK))
uint8 GyroRolIdx = 0, GyroPitIdx = 0, GyroYawIdx = 0;
float   GyroRolBuf[FILTERNUM], GyroPitBuf[FILTERNUM], GyroYawBuf[FILTERNUM];
float 	dot_GyroRol, dot_GyroPit, dot_GyroYaw;
float 	GyroRol, GyroPit, GyroYaw;

void GyroRead();
float Filter(float *value);
int get_mid(int a, int b, int c);

/********卡马克方法求算术平方根*********/
float SquareRootFloat(float number)
{
    long i;
    float x, y;
    const float f = 1.5F;
    x = number * 0.5F;
    y  = number;
    i  = * ( long * ) &y;
    i  = 0x5f3759df - ( i >> 1 );        //注意这一行
    y  = * ( float * ) &i;
    y  = y * ( f - ( x * y * y ) );
    y  = y * ( f - ( x * y * y ) );
    return number * y;
}
//============================================================================
//函数名称：Delay_Nms
//功能概要：延时ms。
//参数说明：N为延时的时间单位ms
//函数返回：无
//============================================================================
void Delay_ms(float n)
{
    uint32 i = 24000;
    i = (int)(i * n);
    while(i > 0)i--;
}
void Delay_10us()
{
    uint32 i = 400;
    //i = (int)(i * n);
    while(i > 0)i--;
}
////////////////////////////////////////////////////////////////////////////////
void uart_putchar(unsigned char data)
{
    while(!(UART1_S1 & UART_S1_TDRE_MASK)); //等待发送缓冲区空
    UART1_D = data;
}

void putstr(char ch[])
{
    unsigned char ptr = 0;
    while(ch[ptr])
    {
        uart_putchar((unsigned char)ch[ptr++]);
    }
}

long bmp085ReadTemp(void)
{
    uint8  temp_ut_l = 0, temp_ut_h = 0;
    short temp_ut;

    hw_iic_write1(0, BMP085_Addr, 0xF4, 0x2E);
    Delay_ms(5);	// max time is 4.5ms
    hw_iic_read1(0, BMP085_Addr, 0xF6, &temp_ut_h);
    hw_iic_read1(0, BMP085_Addr, 0xF7, &temp_ut_l);
    temp_ut = temp_ut_h ;
    temp_ut = (temp_ut << 8) | temp_ut_l ;
    return  temp_ut ;
}


//void  Init_BMP085(void)
//{
//    while(hw_iic_readn(0, BMP085_Addr, 0xAA, AC, 22));
//    ac1 = AC[0];
//    ac1 = ac1 << 8 | AC[1];
//
//    ac2 = AC[2];
//    ac2 = ac2 << 8 | AC[3];
//
//    ac3 = AC[4];
//    ac3 = ac3 << 8 | AC[5];
//
//    ac4 = AC[6];
//    ac4 = ac4 << 8 | AC[7];
//
//    ac5 = AC[8];
//    ac5 = ac5 << 8 | AC[9];
//
//    ac6 = AC[10];
//    ac6 = ac6 << 8 | AC[11];
//
//    b1 = AC[12];
//    b1 = b1 << 8 | AC[13];
//
//    b2 = AC[14];
//    b2 = b2 << 8 | AC[15];
//
//    mb = AC[16];
//    mb = mb << 8 | AC[17];
//
//    mc = AC[18];
//    mc = mc << 8 | AC[19];
//
//    md = AC[20];
//    md = md << 8 | AC[21];
//    /*
//    ac1 = hw_iic_read1(BMP085_Addr,0xAA);
//    	ac1 = (ac1<<8)|hw_iic_read1(BMP085_Addr,0xAB);
//
//    ac2 = hw_iic_read1(BMP085_Addr,0xAC);
//    	ac2 = (ac2<<8)| hw_iic_read1(BMP085_Addr,0xAD);
//
//    	ac3 = hw_iic_read1(BMP085_Addr,0xAE);
//    	ac3 = (ac3<<8)| hw_iic_read1(BMP085_Addr,0xAF);
//
//    	ac4 = hw_iic_read1(BMP085_Addr,0xB0);
//    	ac4 = (ac4<<8)| hw_iic_read1(BMP085_Addr,0xB1);
//
//    	ac5 = hw_iic_read1(BMP085_Addr,0xB2);
//    	ac5 = (ac5<<8)| hw_iic_read1(BMP085_Addr,0xB3);
//
//    	ac6 = hw_iic_read1(BMP085_Addr,0xB4);
//    	ac6 = (ac6<<8)| hw_iic_read1(BMP085_Addr,0xB5);
//
//    	b1 = hw_iic_read1(BMP085_Addr,0xB6);
//    	b1 = (b1<<8)| hw_iic_read1(BMP085_Addr,0xB7);
//
//    	b2 = hw_iic_read1(BMP085_Addr,0xB8);
//    	b2 = (b2<<8)| hw_iic_read1(BMP085_Addr,0xB9);
//
//    	mb = hw_iic_read1(BMP085_Addr,0xBA);
//    	mb = (mb<<8)| hw_iic_read1(BMP085_Addr,0xBB);
//
//    	mc = hw_iic_read1(BMP085_Addr,0xBC);
//    	mc = (mc<<8)| hw_iic_read1(BMP085_Addr,0xBD);
//
//    	md = hw_iic_read1(BMP085_Addr,0xBE);
//    	md = (md<<8)| hw_iic_read1(BMP085_Addr,0xBF);
//    */
//
//}
//
//long bmp085ReadPressure(void)
//{
//	uint8  pressure_l,pressure_h;
//        int32 pressure;
//	hw_iic_write1(0,BMP085_Addr,0xF4,0x34);
//	Delay_ms(5);	// max time is 4.5ms
//	hw_iic_read1(0,BMP085_Addr,0xF6,&pressure_h);
//        hw_iic_read1(0,BMP085_Addr,0xF7,&pressure_l);
//	pressure = pressure_h;
//        pressure = (pressure<<8)| pressure_l;
//	pressure &= 0x0000FFFF;
//	return pressure;
//}



//****************************
//
//void  Init_HMC5883L()
//{
//    hw_iic_write1(0, HMC5883L_Addr, 0x00, 0x18); //
//    hw_iic_write1(0, HMC5883L_Addr, 0x02, 0x00); //
//}

//*****************************************
//
//void read_hmc5883l(void)
//{
//    static int Revise_mx = 0, Revise_my = 0, Revise_mz = 0;
//    static int sum_mx = 0, sum_my = 0, sum_mz = 0;
//    // uint8 x_l,x_h,y_l,y_h;
//
//    // int32 temp;
//    // char txtbuf[]={0};
//
//    //hw_iic_write1(0,HMC5883L_Addr,0x00,0x14);   //
//    //hw_iic_write1(0,HMC5883L_Addr,0x02,0x00);   //
//    //Delay_ms(10);
//    while(hw_iic_readn(0, HMC5883L_Addr, 0x03, BUF, 6));
//    mx = (BUF[0] << 8 | BUF[1]) - Revise_mx; //Combine MSB and LSB of X Data output register
//    mz = (BUF[2] << 8 | BUF[3]); //Combine MSB and LSB of Z Data output register
//    my = (BUF[4] << 8 | BUF[5]) - Revise_my; //Combine MSB and LSB of Y Data output register
//    if(Time_counter < COUNTER)
//    {
//        sum_mx += mx;
//        sum_my += my;
//        sum_mz += mz;
//    }
//    if(Time_counter == COUNTER)
//    {
//        Revise_mx = sum_mx / COUNTER ;
//        Revise_my = sum_my / COUNTER ;
//        Revise_mz = sum_mz / COUNTER ;
//
//    }
//    //if(mx > 0x7fff)mx -= 0xffff;
//    //if(my > 0x7fff)my -= 0xffff;
//    //angle = atan2(my, mx) * (180 / 3.14159265) + 180; // angle in degrees
//    /*
//        if(angle > 0) //补码求出加速度原始对应数值
//    {
//         temp =  angle * 100;
//         //wz=((float)(0xffff-wz+1))*10000*3.9*0.896; //扩大一万倍，好取出整数部分
//    // height += (984.6788 - wz) *10000* 0.02 * 0.02 ;
//         sprintf(txtbuf,"\n angle:%d.%04d",temp/100,temp%100);
//    putstr(txtbuf);
//    }
//      else
//    {
//         temp =  -angle * 100;
//    sprintf(txtbuf,"\n angle:-%d.%04d",temp/100,temp%100);
//    putstr(txtbuf);
//     }
//     */
//}

//****************************************

//*****************************************
//
//float read_BMP085(void)
//{
//    float altitude = 0;
//    long ut;
//    long up;
//    long x1, x2, b5 = 0, b6, x3, b3, p;
//    unsigned long b4, b7;
//
//    uint8  pressure_l, pressure_h;
//    uint32 pressure_t;
//
//
//    while(hw_iic_write1(0, BMP085_Addr, 0xF4, 0x34));
//    Delay_ms(50);	// max time is 4.5ms
//    while(hw_iic_read1(0, BMP085_Addr, 0xF6, &pressure_h));
//    while(hw_iic_read1(0, BMP085_Addr, 0xF7, &pressure_l));
//    pressure_t = pressure_h;
//    pressure_t = (pressure_t << 8) | pressure_l;
//    pressure_t &= 0x0000FFFF;
//
//
//    ut = bmp085ReadTemp();	   // 读取温度
//    ////	ut = bmp085ReadTemp();	   // 读取温度
//    ////	up = bmp085ReadPressure();  // 读取压强
//    ////	up = bmp085ReadPressure();  // 读取压强
//    x1 = ((long)ut - ac6) * ac5 >> 15;
//    x2 = ((long) mc << 11) / (x1 + md);
//    b5 = x1 + x2;
//    temperature = (b5 + 8) >> 4;
//    //
//
//    up = pressure_t;
//    b6 = b5 - 4000;
//    x1 = (b2 * (b6 * b6 >> 12)) >> 11;
//    x2 = ac2 * b6 >> 11;
//    x3 = x1 + x2;
//    b3 = (((long)ac1 * 4 + x3) + 2) / 4;
//    x1 = ac3 * b6 >> 13;
//    x2 = (b1 * (b6 * b6 >> 12)) >> 16;
//    x3 = ((x1 + x2) + 2) >> 2;
//    b4 = (ac4 * (unsigned long) (x3 + 32768)) >> 15;
//    b7 = ((unsigned long) up - b3) * (50000 >> OSS);
//    if( b7 < 0x80000000)
//        p = (b7 * 2) / b4 ;
//    else
//        p = (b7 / b4) * 2;
//    x1 = (p >> 8) * (p >> 8);
//    x1 = (x1 * 3038) >> 16;
//    x2 = (-7357 * p) >> 16;
//    pressure = p + ((x1 + x2 + 3791) >> 4);
//    altitude = 44330 * (1 - (pow((float)pressure / 101325, 1 / 5.255)));
//
//    return altitude;
//}





//初始化MPU3050，根据需要请参考pdf进行修改************************
void InitMPU3205()
{
    Delay_ms(1);
    while(hw_iic_write1(1, MPU3205_Addr, PWR_M, 0x00));
    Delay_ms(1);
    while(hw_iic_write1(1, MPU3205_Addr, SMPL, 0x07));
    Delay_ms(1);
    while(hw_iic_write1(1, MPU3205_Addr, DLPF, 0x1E));
    Delay_ms(1);
    while(hw_iic_write1(1, MPU3205_Addr, INT_C, 0x00));
    Delay_ms(1);
    // while(hw_iic_write1(0,MPU3205_Addr,PWR_M, 0x00));
    /*
    Single_WriteMPU3050(PWR_M, 0x80);   //
    Single_WriteMPU3050(SMPL, 0x07);    //
    Single_WriteMPU3050(DLPF, 0x1E);    //±2000°
    Single_WriteMPU3050(INT_C, 0x00 );  //
    Single_WriteMPU3050(PWR_M, 0x00);   //
    */
}

//初始化MPU3205，于I2C0************************
void InitMPUsteer()
{
    Delay_ms(1);
    while(hw_iic_write1(0, MPU3205_Addr, PWR_M, 0x00));
    Delay_ms(1);
    while(hw_iic_write1(0, MPU3205_Addr, SMPL, 0x07));
    Delay_ms(1);
    while(hw_iic_write1(0, MPU3205_Addr, DLPF, 0x1E));
    Delay_ms(1);
    while(hw_iic_write1(0, MPU3205_Addr, INT_C, 0x00));
    Delay_ms(1);
    // while(hw_iic_write1(0,MPU3205_Addr,PWR_M, 0x00));
    /*
    Single_WriteMPU3050(PWR_M, 0x80);   //
    Single_WriteMPU3050(SMPL, 0x07);    //
    Single_WriteMPU3050(DLPF, 0x1E);    //±2000°
    Single_WriteMPU3050(INT_C, 0x00 );  //
    Single_WriteMPU3050(PWR_M, 0x00);   //
    */
}

//读取MPU3205，于I2C0************************
void ReadMPUsteer()
{
   
    static float Revise_gyroX = 0, Revise_gyroY = 0, Revise_gyroZ = 0;
    int16 gyrox, gyroy, gyroz;
    static float dotx_gyro[3] = {0}, doty_gyro[3] = {0}, dotz_gyro[3] = {0};

    while(hw_iic_readn(0, MPU3205_Addr, GX_H, BUF, 6));

    gyrox = (BUF[0] << 8) + BUF[1] ;
    gyroy = (BUF[2] << 8) + BUF[3] ;
    gyroz = (BUF[4] << 8) + BUF[5] ;

    Dot_gyro_x0 = (float)gyrox  / 14.375 - Revise_gyroX / T * 1000;
    Dot_gyro_y0 = (float)gyroy  / 14.375 - Revise_gyroY / T * 1000;
    Dot_gyro_z0 = (float)gyroz  / 14.375 - Revise_gyroZ / T * 1000;

    for(uint8 i = 1; i < 3; i++)
    {
        dotx_gyro[i-1] = dotx_gyro[i];
        doty_gyro[i-1] = doty_gyro[i];
        dotz_gyro[i-1] = dotz_gyro[i];
    }
    dotx_gyro[2] = Dot_gyro_x0;
    doty_gyro[2] = Dot_gyro_y0;
    dotz_gyro[2] = Dot_gyro_z0;

    Dot_xgyro0 = (dotx_gyro[2] * 0.5  + dotx_gyro[1] * 0.3  + dotx_gyro[0] * 0.2)  / 57.3 ;
    Dot_ygyro0 = (doty_gyro[2] * 0.5  + doty_gyro[1] * 0.3  + doty_gyro[0] * 0.2)  / 57.3 ;
    Dot_zgyro0 = (dotz_gyro[2] * 0.5  + dotz_gyro[1] * 0.3  + dotz_gyro[0] * 0.2)  / 57.3 ;

    Angle_gyrox0 += Dot_gyro_x0 * T / 1000 ;
    Angle_gyroy0 += Dot_gyro_y0 * T / 1000 ;
    Angle_gyroz0 += Dot_gyro_z0 * T / 1000 ;

    //////////////////////////修正0点，读COUNTER次然后取平均////////////////////////////
    if(Time_counter == COUNTER)
    {
        Revise_gyroX = Angle_gyrox0 / COUNTER ;
        Revise_gyroY = Angle_gyroy0 / COUNTER ;
        Revise_gyroZ = Angle_gyroz0 / COUNTER ;
        Angle_gyrox0 = 0;
        Angle_gyroy0 = 0;
        Angle_gyroz0 = 0;
    }
}

void ReadMPU3205()
{
    //float temp_dotgyrox, temp_dotgyroy, temp_dotgyroz;
    static float Revise_gyroX = 0, Revise_gyroY = 0, Revise_gyroZ = 0;
    int16 gyrox, gyroy, gyroz;
    static float dotx_gyro[3] = {0}, doty_gyro[3] = {0}, dotz_gyro[3] = {0};
    //  static float sum_gyrox = 0, sum_gyroy = 0, sum_gyroz = 0;
    //   float gx, gy, gz;

    while(hw_iic_readn(1, MPU3205_Addr, GX_H, BUF, 6));

    gyrox = (BUF[0] << 8) + BUF[1] ;
    gyroy = (BUF[2] << 8) + BUF[3] ;
    gyroz = (BUF[4] << 8) + BUF[5] ;


    //gyrox = get_mid(xgyro[0],xgyro[1],xgyro[2]);
    //gyroy = get_mid(ygyro[0],ygyro[1],ygyro[2]);
    //gyroz = get_mid(zgyro[0],zgyro[1],zgyro[2]);

    Dot_gyro_x = (float)gyrox  / 14.375 - Revise_gyroX / T * 1000;
    Dot_gyro_y = (float)gyroy  / 14.375 - Revise_gyroY / T * 1000;
    Dot_gyro_z = (float)gyroz  / 14.375 - Revise_gyroZ / T * 1000;

    for(uint8 i = 1; i < 3; i++)
    {
        dotx_gyro[i-1] = dotx_gyro[i];
        doty_gyro[i-1] = doty_gyro[i];
        dotz_gyro[i-1] = dotz_gyro[i];
    }
    dotx_gyro[2] = Dot_gyro_x;
    doty_gyro[2] = Dot_gyro_y;
    dotz_gyro[2] = Dot_gyro_z;
    //temp_dotgyrox = Dot_gyro_x  / 57.3;
    //temp_dotgyroy = -Dot_gyro_y / 57.3;
    //temp_dotgyroz = Dot_gyro_z /  57.3;
    Dot_xgyro = (dotx_gyro[2] * 0.5  + dotx_gyro[1] * 0.3  + dotx_gyro[0] * 0.2)  / 57.3 ;
    Dot_ygyro = (doty_gyro[2] * 0.5  + doty_gyro[1] * 0.3  + doty_gyro[0] * 0.2)  / 57.3 ;
    Dot_zgyro = (dotz_gyro[2] * 0.5  + dotz_gyro[1] * 0.3  + dotz_gyro[0] * 0.2)  / 57.3 ;
    //Dot_xgyro = Dot_gyro_x / 57.3;
    //Dot_ygyro = -Dot_gyro_y / 57.3;
    //Dot_zgyro = Dot_gyro_z / 57.3;

    Angle_gyrox += Dot_gyro_x * T / 1000 ;
    Angle_gyroy += Dot_gyro_y * T / 1000 ;
    Angle_gyroz += Dot_gyro_z * T / 1000 ;

    //////////////////////////修正0点，读COUNTER次然后取平均////////////////////////////
    if(Time_counter == COUNTER)
    {
        Revise_gyroX = Angle_gyrox / COUNTER ;
        Revise_gyroY = Angle_gyroy / COUNTER ;
        Revise_gyroZ = Angle_gyroz / COUNTER ;
        Angle_gyrox = 0;
        Angle_gyroy = 0;
        Angle_gyroz = 0;
    }
}


/**********************************************函数定义*****************************************************
* 函数名称: void InitBMA180(void)
* 输入参数: void
* 返回参数: void
* 功    能: 初始化BMA180
* 作    者: by Yuson
* 日    期: 2012-6-2
************************************************************************************************************/
void InitBMA180(void)
{
    uint8 temp;
    Delay_ms(1);
    while(hw_iic_read1(1, BMA180, ChipID, &temp));
    while(temp != 0x03);
    Delay_ms(1);
    while(hw_iic_write1(1, BMA180, Ctrl_reg0, 0x10));	//ee-w 1
    Delay_ms(1);
    while(hw_iic_read1(1, BMA180, BW_TCS, &temp));
    temp &= 0x0f;
    temp |= 1 << 4;
    Delay_ms(1);
    while(hw_iic_write1(1, BMA180, BW_TCS, temp));
    Delay_ms(1);
    while(hw_iic_read1(1, BMA180, TCO_Z, &temp));
    temp &= 0xfc;
    temp |= 0;
    Delay_ms(1);
    while(hw_iic_write1(1, BMA180, TCO_Z, temp));
    Delay_ms(1);
    while(hw_iic_read1(1, BMA180, Offset_lsb1, &temp));
    temp &= 0xf1;
    temp |= 0x02 << 1;//+-2g 0.25mg/lsb
    Delay_ms(1);
    while(hw_iic_write1(1, BMA180, Offset_lsb1, temp));
    Delay_ms(1);
}


/**********************************************函数定义*****************************************************
* 函数名称: void ReadBMA180(void)
* 输入参数: void
* 返回参数: void
* 功    能: 读取BMA180的数据
* 作    者: by Yuson
* 日    期: 2012-6-2
************************************************************************************************************/
void ReadBMA180(void)
{
#define count  20
    static float xacc[count] = {0}, yacc[count] = {0}, zacc[count] = {0};
    int16 Xdat, Ydat, Zdat;
    static float Revise_accX = 0, Revise_accY = 0, Revise_accZ = 0;
    static float sum_accx = 0, sum_accy = 0, sum_accz = 0;

    while(hw_iic_readn(1, BMA180, DATAX0, BUF, 6));
    Xdat = BUF[1] << 8 | BUF[0];
    Ydat = BUF[3] << 8 | BUF[2];
    Zdat = BUF[5] << 8 | BUF[4];

    if(Time_counter <= COUNTER)
    {
        sum_accx += Xdat;
        sum_accy += Ydat;
        sum_accz += Zdat;
    }
    if(Time_counter == COUNTER)
    {
        Revise_accX = sum_accx / COUNTER;
        Revise_accY = sum_accy / COUNTER;
        Revise_accZ = sum_accz / COUNTER;
        Angle_accx = 0;
        Angle_accy = 0;
        Angle_accz = 0;
    }
    if(Time_counter > COUNTER)
    {
        for(uint8 i = 1; i < count; i++)
        {
            xacc[i-1] = xacc[i];
            yacc[i-1] = yacc[i];
            zacc[i-1] = zacc[i];
        }

        xacc[count-1] = Xdat;
        yacc[count-1] = Ydat;
        zacc[count-1] = Zdat;

        float xdata = 0, ydata = 0, zdata = 0;
        for(uint8 i = 0; i < count; i++)
        {
            xdata += xacc[i] / (float)count;
            ydata += yacc[i] / (float)count;
            zdata += zacc[i] / (float)count;
        }

        Dot_xacc = (xdata - Revise_accX) * 0.244 / 4000.0;
        //if(Dot_xacc > 0 ) Dot_xacc /= 1.025;
        //else Dot_xacc /= 0.945;
        Dot_yacc = (ydata - Revise_accY) * 0.244 / 4000.0;
        //if(Dot_yacc > 0)Dot_yacc /= 0.982;
        Dot_zacc = (zdata - (Revise_accZ - 16393)) * 0.244 / 4000.0;
    }
}

/**********************************************函数定义*****************************************************
* 函数名称: void InitBMAsteer(void)
* 输入参数: void
* 返回参数: void
* 功    能: 初始化BMA180
* 作    者: by Hins
* 日    期: 2015-3-5
************************************************************************************************************/
void InitBMAsteer(void)
{
    uint8 temp;
    Delay_ms(1);
    while(hw_iic_read1(0, BMA180, ChipID, &temp));
    while(temp != 0x03);
    Delay_ms(1);
    while(hw_iic_write1(0, BMA180, Ctrl_reg0, 0x10));	//ee-w 1
    Delay_ms(1);
    while(hw_iic_read1(0, BMA180, BW_TCS, &temp));
    temp &= 0x0f;
    temp |= 1 << 4;
    Delay_ms(1);
    while(hw_iic_write1(0, BMA180, BW_TCS, temp));
    Delay_ms(1);
    while(hw_iic_read1(0, BMA180, TCO_Z, &temp));
    temp &= 0xfc;
    temp |= 0;
    Delay_ms(1);
    while(hw_iic_write1(0, BMA180, TCO_Z, temp));
    Delay_ms(1);
    while(hw_iic_read1(0, BMA180, Offset_lsb1, &temp));
    temp &= 0xf1;
    temp |= 0x02 << 1;//+-2g 0.25mg/lsb
    Delay_ms(1);
    while(hw_iic_write1(0, BMA180, Offset_lsb1, temp));
    Delay_ms(1);
}


/**********************************************函数定义*****************************************************
* 函数名称: void ReadBMAsteer(void)
* 输入参数: void
* 返回参数: void
* 功    能: 读取BMA180的数据
* 作    者: by Hins
* 日    期: 2015-3-5
************************************************************************************************************/
void ReadBMAsteer(void)
{
#define count  20
    static float xacc[count] = {0}, yacc[count] = {0}, zacc[count] = {0};
    int16 Xdat, Ydat, Zdat;
    static float Revise_accX = 0, Revise_accY = 0, Revise_accZ = 0;
    static float sum_accx = 0, sum_accy = 0, sum_accz = 0;

    while(hw_iic_readn(0, BMA180, DATAX0, BUF, 6));
    Xdat = BUF[1] << 8 | BUF[0];
    Ydat = BUF[3] << 8 | BUF[2];
    Zdat = BUF[5] << 8 | BUF[4];

    if(Time_counter <= COUNTER)
    {
        sum_accx += Xdat;
        sum_accy += Ydat;
        sum_accz += Zdat;
    }
    if(Time_counter == COUNTER)
    {
        Revise_accX = sum_accx / COUNTER;
        Revise_accY = sum_accy / COUNTER;
        Revise_accZ = sum_accz / COUNTER;
        Angle_accx0 = 0;
        Angle_accy0 = 0;
        Angle_accz0 = 0;
    }
    if(Time_counter > COUNTER)
    {
        for(uint8 i = 1; i < count; i++)
        {
            xacc[i-1] = xacc[i];
            yacc[i-1] = yacc[i];
            zacc[i-1] = zacc[i];
        }

        xacc[count-1] = Xdat;
        yacc[count-1] = Ydat;
        zacc[count-1] = Zdat;

        float xdata = 0, ydata = 0, zdata = 0;
        for(uint8 i = 0; i < count; i++)
        {
            xdata += xacc[i] / (float)count;
            ydata += yacc[i] / (float)count;
            zdata += zacc[i] / (float)count;
        }

        Dot_xacc0 = (xdata - Revise_accX) * 0.244 / 4000.0;
        //if(Dot_xacc > 0 ) Dot_xacc /= 1.025;
        //else Dot_xacc /= 0.945;
        Dot_yacc0 = (ydata - Revise_accY) * 0.244 / 4000.0;
        //if(Dot_yacc > 0)Dot_yacc /= 0.982;
        Dot_zacc0 = (zdata - (Revise_accZ - 16393)) * 0.244 / 4000.0;
    }
}



//************初始化L3G4200D*********************************
//void Init_L3G4200D(void)
//{
//    Delay_ms(1);
//    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG1, 0x0f));
//    Delay_ms(1);
//    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG2, 0x00));
//    Delay_ms(1);
//    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG3, 0x08));
//    Delay_ms(1);
//    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG4, 0x00));	//+-250dps
//    Delay_ms(1);
//    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG5, 0x00));
//    Delay_ms(1);
//}

//******读取陀螺仪L3G4200D数据****************************************
//void read_L3G4200D(void)
//{
//    //char txtbuf[22];
//    float temp_dotgyrox, temp_dotgyroy, temp_dotgyroz;
//    static float Revise_gyroX = 0, Revise_gyroY = 0, Revise_gyroZ = 0;
//    while(hw_iic_readn(0, L3G4200_Addr, OUT_X_L, BUF, 6));
//
//    T_X =	(BUF[1] << 8) | BUF[0];
//    T_Y =	-((BUF[3] << 8) | BUF[2]);
//    T_Z =	(BUF[5] << 8) | BUF[4];
//
//    Dot_gyro_x = (float)T_X * 8.75 / 1000 - Revise_gyroX / T * 1000;
//    Dot_gyro_y = (float)T_Y * 8.75 / 1000 - Revise_gyroY / T * 1000;
//    Dot_gyro_z = (float)T_Z * 8.75 / 1000 - Revise_gyroZ / T * 1000;
//
//    temp_dotgyrox = Dot_gyro_x  / 57.3;
//    temp_dotgyroy = -Dot_gyro_y / 57.3;
//    temp_dotgyroz = Dot_gyro_z /  57.3;
//    Dot_xgyro = (temp_dotgyrox + Dot_xgyro) / 2.0;
//    Dot_ygyro = (temp_dotgyroy + Dot_ygyro) / 2.0;
//    Dot_zgyro = (temp_dotgyroz + Dot_zgyro) / 2.0;
//    // Angle_gyrox = GyroIntegral(Angle_gyrox,Dot_gyro_x );
//    // Angle_gyroy = GyroIntegral(Angle_gyroy,Dot_gyro_y );
//    // Angle_gyroz = GyroIntegral(Angle_gyroz,Dot_gyro_z );
//
//    Angle_gyrox += Dot_gyro_x * T / 1000 ;
//    Angle_gyroy += Dot_gyro_y * T / 1000 ;
//    Angle_gyroz += Dot_gyro_z * T / 1000 ;
//
//    //////////////////////////修正0点，读COUNTER次然后取平均////////////////////////////
//    if(Time_counter == COUNTER)
//    {
//        Revise_gyroX = Angle_gyrox / COUNTER ;
//        Revise_gyroY = Angle_gyroy / COUNTER ;
//        Revise_gyroZ = Angle_gyroz / COUNTER ;
//        Angle_gyrox = 0;
//        Angle_gyroy = 0;
//        Angle_gyroz = 0;
//    }
//}
//***************************

//void  Init_ADXL345(void)
//{
//    Delay_ms(1);
//    // while(hw_iic_write1(0,ADXL345_Addr,0x31,0x0B));   //测量范围,正负16g，13位模式 1000 2g
//    while(hw_iic_write1(0, ADXL345_Addr, 0x31, 0x08)); //测量范围,正负2g，13位模式 1000 2g
//    Delay_ms(1);
//    while(hw_iic_write1(0, ADXL345_Addr, 0x2C, 0x08)); //速率设定为100hz 参考pdf13页
//    Delay_ms(1);
//    while(hw_iic_write1(0, ADXL345_Addr, 0x2D, 0x08)); //选择电源模式   参考pdf24页
//    Delay_ms(1);
//    while(hw_iic_write1(0, ADXL345_Addr, 0x2E, 0x80)); //使能 DATA_READY 中断
//    Delay_ms(1);
//    while(hw_iic_write1(0, ADXL345_Addr, 0x1E, 0x00)); //X 偏移量 根据测试传感器的状态写入pdf29页
//    Delay_ms(1);
//    while(hw_iic_write1(0, ADXL345_Addr, 0x1F, 0x00)); //Y 偏移量 根据测试传感器的状态写入pdf29页
//    Delay_ms(1);
//    while(hw_iic_write1(0, ADXL345_Addr, 0x20, 0x00)); //Z 偏移量 根据测试传感器的状态写入pdf29页
//    Delay_ms(1);
//}
//
//void read_ADXL345(void)
//{
//    // char txtbuf[22];
//    float X0 = 0, Y0 = 0, Z0 = 0;
//    static float Revise_accX = 0, Revise_accY = 0, Revise_accZ = 0;
//    static float sum_accx = 0, sum_accy = 0, sum_accz = 0;
//    static float sum_dotx = 0, sum_doty = 0, sum_dotz = 0;
//    static float Revise_dotX = 0, Revise_dotY = 0, Revise_dotZ = 0;
//    //int high = 0;
//
//    while(hw_iic_readn(0, ADXL345_Addr, 0x32, BUF, 6));
//    A_X = (BUF[1] << 8) + BUF[0]; //合成数据
//    A_Y = (BUF[3] << 8) + BUF[2]; //合成数据
//    A_Z = (BUF[5] << 8) + BUF[4]; //合成数据
//
//    Dot_xacc = (float)A_X * 3.9 / 1000 - Revise_dotX;//
//    Dot_yacc = (float)A_Y * 3.9 / 1000  - Revise_dotY; //
//    Dot_zacc = (float)A_Z * 3.9 / 1000;
//
//
//    X0 = (float)A_X * 0.49;
//    Y0 = (float)A_Y * 0.49;
//    Z0 = -(float)A_Z * 0.49;
//
//
//    //Roll = (float)((atan2(K,Q)*180)/3.14159265 + 90);   //X轴角度值 滚转角
//    //Pitch = (float)((atan2(K,R)*180)/3.14159265 + 90);  //Y轴角度值 俯仰角
//    //Yaw = (float)((atan2(R,Q)*180)/3.14159265 + 90);  //Z轴角都值 偏航角 顺时针+
//    Angle_accx = atan2(X0, SquareRootFloat(Y0 * Y0 + Z0 * Z0)) * 57.3 - Revise_accX;
//    Angle_accy = atan2(Y0, SquareRootFloat(X0 * X0 + Z0 * Z0)) * 57.3 - Revise_accY;
//    Angle_accz = -(atan2(Z0, SquareRootFloat(X0 * X0 + Y0 * Y0)) * 57.3 + 90 + Revise_accZ);
//    //////////////////////////修正0点，读COUNTER次然后取平均////////////////////////////
//    if(Time_counter <= COUNTER)
//    {
//        sum_accx += Angle_accx;
//        sum_accy += Angle_accy;
//        sum_accz += Angle_accz;
//
//        sum_dotx += Dot_xacc;
//        sum_doty += Dot_yacc;
//        sum_dotz += Dot_zacc;
//    }
//    if(Time_counter == COUNTER)
//    {
//        Revise_accX = sum_accx / COUNTER;
//        Revise_accY = sum_accy / COUNTER;
//        Revise_accZ = sum_accz / COUNTER;
//
//        Revise_dotX = sum_dotx / COUNTER;
//        Revise_dotY = sum_doty / COUNTER;
//        Revise_dotZ = sum_dotz / COUNTER;
//
//        Angle_accx = 0;
//        Angle_accy = 0;
//        Angle_accz = 0;
//    }
//}


//void GyroRead(void)
//{
//    static float x[3] = {0};
//    static float y[3] = {0};
//    static float z[3] = {0};
//    x[0] = x[1];
//    x[1] = x[2];
//    x[2] = Dot_gyro_x;
//    y[0] = y[1];
//    y[1] = y[2];
//    y[2] = Dot_gyro_y;
//    z[0] = z[1];
//    z[1] = z[2];
//    z[2] = Dot_gyro_z;
//
//
//    dot_GyroRol = (x[0] + x[1] + x[2]) / 3.0;
//    dot_GyroPit = (y[0] + y[1] + y[2]) / 3.0;
//    dot_GyroYaw = (z[0] + z[1] + z[2]) / 3.0;
//
//    //Middle value filter
//    //中值滤波
//    GyroRolBuf[WARP(GyroRolIdx)] = dot_GyroRol;
//    GyroPitBuf[WARP(GyroPitIdx)] = dot_GyroPit;
//    GyroYawBuf[WARP(GyroYawIdx)] = dot_GyroYaw;
//
//    dot_GyroRol = Filter(GyroRolBuf);
//    dot_GyroPit = Filter(GyroPitBuf);
//    dot_GyroYaw = Filter(GyroYawBuf);
//    //    Dot_xgyro = dot_GyroRol;
//    //    Dot_ygyro = dot_GyroPit;
//    //    Dot_zgyro = dot_GyroYaw;
//    //GyroRol += dot_GyroRol * T / 1000 ;
//    //GyroPit += dot_GyroPit * T / 1000 ;
//    //GyroYaw += dot_GyroYaw * T / 1000 ;
//}

//###############################################
//
//   Soft filter
//   软件滤波器
//
float Filter(float *value)
{
#if 0		   //中值滤波
    bool swap;
    uchar i;
    do
    {
        swap = 0;
        for(i = 1; i < FILTERNUM; i++)
        {
            if(value[i-1] > value[i])
            {
                int t = value[i-1];
                value[i-1] = value[i];
                value[i] = t;
                swap = 1;
            }
        }
    }
    while(swap);

    return value[FILTERNUM/2];
#else	   //滑动窗口滤波
    uint8 i;
    int vs = 0;
    for(i = 0; i < FILTERNUM; i++)
    {
        vs += value[i];
    }
    return vs / FILTERNUM;
#endif
}

int get_mid(int a, int b, int c)
{
    int x = 0;
    if(a > b)
    {
        x = b;
        b = a;
        a = x;
    }
    if(b > c)
    {
        x = c;
        c = b;
        b = x;
    }
    if(a > b)
    {
        x = b;
        b = a;
        a = x;
    }
    return b ;
}

void ReadANDS3080()
{
    uint8 temp = 0;
    double temp0 = 0;
    //static double sumX = 0;
    //static double sumY = 0;
    DeltX = 0;
    DeltY = 0;
    if(High <= (BaseHeight + 10))
    {
        WriteByte(0x12, 0x00); //Motion clear
    }
    else
    {
        temp = ReadByte(0x02);
        if((temp & 0X80) != 0)
        {
           
            DeltY = ReadByte(0x04);
            DeltX = ReadByte(0x03);
            //s = ReadByte(0x05);
            temp0 = DeltX;
            temp0 = temp0 * High * 0.3 / 58.2;
           // sumX += temp0;
           // SumDeltX = sumX -  High * tan(Angle_X / 57.3);
            SumDeltX += temp0;
            
            temp0 = DeltY;
            temp0 = temp0 * High * 0.3 / 58.2;
            //sumY += temp0;
           // SumDeltY = sumY -  High * tan(Angle_Y / 57.3);
            SumDeltY += temp0;
        }
    }
}
void writeDataToMemory(float xpos,float ypos ,float high)
{   
    const uint8 interval = 8; //sampling interval
    static float count1 = 0;
   
    if (count1 * T < 4000.0)count1++; // discard the first four seconds datas
    else
    {
        if(Time_counter % interval == 0 && dataLencounter < DataLength )
        {
       
           dataLencounter++;
            *px = xpos;
            px++;
            
            *py = ypos;
            py++;
            
            *pz = high;
            pz++;
        }

    }
}
/*************结束***************/
