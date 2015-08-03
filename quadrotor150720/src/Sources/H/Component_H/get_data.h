#ifndef __GET_DATA_H__
#define __GET_DATA__

#include "common.h"

#define g  9.6   //�����������ٶ�

#define   OSS 0	 //	BMP085ʹ��

//L3G4200D�ڲ��Ĵ���
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

extern float Angle_accx;        //���ٶȼƲ�����X��Ƕ�
extern float Angle_accy;       //���ٶȼƲ�����Y��Ƕ�
extern float Angle_accz;      //���ٶȼƲ�����Z��Ƕ�
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
//extern    void Init_L3G4200D();		     //��ʼ��L3G4200D
//extern    void read_hmc5883l();
//extern    void read_ADXL345();
//extern    void read_L3G4200D();
//extern    void read_BMP085();
//extern    void adxl345_angle();
//extern    float SquareRootFloat( float number)/********����˷���������ƽ����*********/
extern    void Delay_ms(float n);

extern void putstr(char ch[]);
extern void uart_putchar(unsigned char data);
extern void Delay_10us();
/***********************************************��������*****************************************************
* ��������: void Init_BMP085(void) 
* �������: void 
* ���ز���: void  
* ��    ��: ��ʼ����ѹ��  
* ��    ��: by yuson
* ��    ��: 2012-5-7
************************************************************************************************************/ 
//extern void Init_BMP085(void);

/***********************************************��������*****************************************************
* ��������: float read_BMP085(void) 
* �������: void 
* ���ز���: void  
* ��    ��: ��ȡ��ѹֵ  
* ��    ��: by yuson
* ��    ��: 2012-5-7
************************************************************************************************************/ 
//extern float read_BMP085(void);
/***********************************************��������*****************************************************
* ��������: boid Init_HMC5883L(void) 
* �������: void 
* ���ز���: boid  
* ��    ��: ��ʼ��������  
* ��    ��: by yuson
* ��    ��: 2012-5-12
************************************************************************************************************/ 
//void Init_HMC5883L(void);
/***********************************************��������*****************************************************
* ��������: void read_hmc5883l(void) 
* �������: void 
* ���ز���: void  
* ��    ��: �����Ƶ�ֵ  
* ��    ��: by Yuson
* ��    ��: 2012-5-12
************************************************************************************************************/ 
//void read_hmc5883l(void);


/***********************************************��������*****************************************************
* ��������: unsigned in detect_KS101B(unsighen char Ks101B_Addr,usigned char command) 
* �������: unsighen char Ks101B_Addr,usigned char command 
* ���ز���: unsigned in  
* ��    ��: ���������  
* ��    ��: by Yuson
* ��    ��: 2012-5-31
************************************************************************************************************/ 
unsigned int detect_KS101B(unsigned char Ks101B_Addr,unsigned char command);

void InitMPU3205();
void ReadMPU3205();
void InitBMA180();
void ReadBMA180();
//==============��������=============
//IMUģ�����ڶ�ȡ��̨��̬��
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