#ifndef __GET_DATA_H__
#define __GET_DATA__

#include "common.h"

#define g  9.6   //定义重力加速度

#define   OSS 0	 //	BMP085使用

//L3G4200D内部寄存器
#define CTRL_REG1 0x20
#define CTRL_REG2 0x21
#define CTRL_REG3 0x22
#define CTRL_REG4 0x23
#define CTRL_REG5 0x24
#define OUT_X_L 0x28
#define OUT_X_H 0x29
#define OUT_Y_L 0x2A
#define OUT_Y_H 0x2B
#define OUT_Z_L 0x2C
#define OUT_Z_H 0x2D

extern float Angle_accx;        //加速度计测量与X轴角度
extern float Angle_accy;       //加速度计测量与Y轴角度
extern float Angle_accz;      //加速度计测量与Z轴角度
extern float Dot_gyro_x;
extern float Dot_gyro_y;
extern float Dot_gyro_z;
extern float Angle_gyroz;
extern float Angle_gyrox;
extern float Angle_gyroy;
extern float Dot_xgyro;
extern float Dot_ygyro;
extern float Dot_zgyro;
extern float Dot_xacc;
extern float Dot_yacc;
extern float Dot_zacc;  
extern float Q_x;
extern float Q_y;
extern float Q_z;
extern float Q_x1;
extern float Q_y1;
extern float Q_z1;

extern int  mx;
extern int  my;
extern int  mz;
extern signed char DeltX ;
extern signed char DeltY;
extern double SumDeltX;
extern double SumDeltY;
//extern    void Read_data();
//extern    void Init_HMC5883L();
//extern    void Init_ADXL345();
//extern    void Init_BMP085();
//extern    void Init_L3G4200D();		     //初始化L3G4200D
//extern    void read_hmc5883l();
//extern    void read_ADXL345();
//extern    void read_L3G4200D();
//extern    void read_BMP085();
//extern    void adxl345_angle();
//extern    float SquareRootFloat( float number)/********卡马克方法求算术平方根*********/
extern    void Delay_ms(float n);

extern void putstr(char ch[]);
extern void uart_putchar(unsigned char data);
extern void Delay_10us();
/***********************************************函数声明*****************************************************
* 函数名称: void Init_BMP085(void) 
* 输入参数: void 
* 返回参数: void  
* 功    能: 初始化气压计  
* 作    者: by yuson
* 日    期: 2012-5-7
************************************************************************************************************/ 
//extern void Init_BMP085(void);

/***********************************************函数声明*****************************************************
* 函数名称: float read_BMP085(void) 
* 输入参数: void 
* 返回参数: void  
* 功    能: 读取气压值  
* 作    者: by yuson
* 日    期: 2012-5-7
************************************************************************************************************/ 
//extern float read_BMP085(void);
/***********************************************函数声明*****************************************************
* 函数名称: boid Init_HMC5883L(void) 
* 输入参数: void 
* 返回参数: boid  
* 功    能: 初始化磁力计  
* 作    者: by yuson
* 日    期: 2012-5-12
************************************************************************************************************/ 
//void Init_HMC5883L(void);
/***********************************************函数声明*****************************************************
* 函数名称: void read_hmc5883l(void) 
* 输入参数: void 
* 返回参数: void  
* 功    能: 磁力计的值  
* 作    者: by Yuson
* 日    期: 2012-5-12
************************************************************************************************************/ 
//void read_hmc5883l(void);


/***********************************************函数声明*****************************************************
* 函数名称: unsigned in detect_KS101B(unsighen char Ks101B_Addr,usigned char command) 
* 输入参数: unsighen char Ks101B_Addr,usigned char command 
* 返回参数: unsigned in  
* 功    能: 超声波测距  
* 作    者: by Yuson
* 日    期: 2012-5-31
************************************************************************************************************/ 
unsigned int detect_KS101B(unsigned char Ks101B_Addr,unsigned char command);

void InitMPU3205();
void ReadMPU3205();
void InitBMA180();
void ReadBMA180();
//==============函数声明=============
//IMU模块用于读取云台姿态角
void InitMPUsteer();
void ReadMPUsteer();
void InitBMAsteer();
void ReadBMAsteer();

extern float Dot_xgyro0;
extern float Dot_ygyro0;
extern float Dot_zgyro0;
extern float Dot_xacc0;
extern float Dot_yacc0;
extern float Dot_zacc0; 
//===================================
extern void ReadANDS3080();
extern void writeDataToMemory(float xpos,float ypos ,float high);
#endif 