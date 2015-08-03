///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:12 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\get_data.c            /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\get_data.c" -D IAR   /
//                    -D TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quadroto /
//                    r150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\bin\Flash\List\" -lB       /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\bin\Flash\List\" -o                            /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\bin\Flash\Obj\" --no_cse --no_unroll           /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "E:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.4\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\H\" -I                             /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\H\Component_H\" -I                 /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\H\Frame_H\" -Ol --use_c++_inline   /
//    List file    =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\bin\Flash\List\get_data.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME get_data

        #define SHT_PROGBITS 0x1

        EXTERN BaseHeight
        EXTERN `High`
        EXTERN ReadByte
        EXTERN Time_counter
        EXTERN WriteByte
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2d
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN dataLencounter
        EXTERN hw_iic_read1
        EXTERN hw_iic_readn
        EXTERN hw_iic_write1
        EXTERN px
        EXTERN py
        EXTERN pz

        PUBLIC AC
        PUBLIC A_X
        PUBLIC A_Y
        PUBLIC A_Z
        PUBLIC Angle_accx
        PUBLIC Angle_accx0
        PUBLIC Angle_accy
        PUBLIC Angle_accy0
        PUBLIC Angle_accz
        PUBLIC Angle_accz0
        PUBLIC Angle_gyrox
        PUBLIC Angle_gyrox0
        PUBLIC Angle_gyroy
        PUBLIC Angle_gyroy0
        PUBLIC Angle_gyroz
        PUBLIC Angle_gyroz0
        PUBLIC BUF
        PUBLIC Delay_10us
        PUBLIC Delay_ms
        PUBLIC DeltX
        PUBLIC DeltY
        PUBLIC Dot_gyro_x
        PUBLIC Dot_gyro_x0
        PUBLIC Dot_gyro_y
        PUBLIC Dot_gyro_y0
        PUBLIC Dot_gyro_z
        PUBLIC Dot_gyro_z0
        PUBLIC Dot_xacc
        PUBLIC Dot_xacc0
        PUBLIC Dot_xgyro
        PUBLIC Dot_xgyro0
        PUBLIC Dot_yacc
        PUBLIC Dot_yacc0
        PUBLIC Dot_ygyro
        PUBLIC Dot_ygyro0
        PUBLIC Dot_zacc
        PUBLIC Dot_zacc0
        PUBLIC Dot_zgyro
        PUBLIC Dot_zgyro0
        PUBLIC Filter
        PUBLIC GyroPit
        PUBLIC GyroPitBuf
        PUBLIC GyroPitIdx
        PUBLIC GyroRol
        PUBLIC GyroRolBuf
        PUBLIC GyroRolIdx
        PUBLIC GyroYaw
        PUBLIC GyroYawBuf
        PUBLIC GyroYawIdx
        PUBLIC InitBMA180
        PUBLIC InitBMAsteer
        PUBLIC InitMPU3205
        PUBLIC InitMPUsteer
        PUBLIC Q_x
        PUBLIC Q_x1
        PUBLIC Q_y
        PUBLIC Q_y1
        PUBLIC Q_z
        PUBLIC Q_z1
        PUBLIC ReadANDS3080
        PUBLIC ReadBMA180
        PUBLIC ReadBMAsteer
        PUBLIC ReadMPU3205
        PUBLIC ReadMPUsteer
        PUBLIC SquareRootFloat
        PUBLIC SumDeltX
        PUBLIC SumDeltY
        PUBLIC T_X
        PUBLIC T_Y
        PUBLIC T_Z
        PUBLIC ac1
        PUBLIC ac2
        PUBLIC ac3
        PUBLIC ac4
        PUBLIC ac5
        PUBLIC ac6
        PUBLIC b1
        PUBLIC b2
        PUBLIC bmp085ReadTemp
        PUBLIC data_xyz
        PUBLIC dot_GyroPit
        PUBLIC dot_GyroRol
        PUBLIC dot_GyroYaw
        PUBLIC get_mid
        PUBLIC maxDelt
        PUBLIC mb
        PUBLIC mc
        PUBLIC md
        PUBLIC mx
        PUBLIC my
        PUBLIC mz
        PUBLIC pressure
        PUBLIC putstr
        PUBLIC temperature
        PUBLIC test
        PUBLIC uart_putchar
        PUBLIC writeDataToMemory

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\get_data.c
//    1 #include  <math.h>
//    2 #include "get_data.h"
//    3 #include  "hw_i2c.h"
//    4 #include  "uart.h"
//    5 #include  "stdio.h"
//    6 #include  "pit.h"
//    7 #include "Balance_Kalman.h"
//    8 #include "isr.h"
//    9 #include "hw_gpio.h"
//   10 #include"OpticalSensor.h"
//   11 
//   12 #define   OSS 0	 //	BMP085Ê¹ÓÃ
//   13 
//   14 //¶¨ÒåÆ÷¼þÔÚIIC×ÜÏßÖÐµÄ´ÓµØÖ·,¸ù¾ÝALT  ADDRESSµØÖ·Òý½Å²»Í¬ÐÞ¸Ä
//   15 #define	HMC5883L_Addr   0x3C	//´Å³¡´«¸ÐÆ÷Æ÷¼þµØÖ·
//   16 #define	ADXL345_Addr    0xA6	//¼ÓËÙ¶È´«¸ÐÆ÷Æ÷¼þµØÖ·
//   17 #define	BMP085_Addr     0xee	//ÆøÑ¹´«¸ÐÆ÷Æ÷¼þµØÖ·
//   18 #define	L3G4200_Addr    0xD2	//ÍÓÂÝÒÇ´«¸ÐÆ÷Æ÷¼þµØÖ·
//   19 
//   20 //¶¨ÒåMPU3050ÄÚ²¿µØÖ·********************
//   21 #define WHO     0x00
//   22 #define	SMPL	0x15
//   23 #define DLPF	0x16
//   24 #define INT_C	0x17
//   25 #define INT_S	0x1A
//   26 #define	TMP_H	0x1B
//   27 #define	TMP_L	0x1C
//   28 #define	GX_H	0x1D
//   29 #define	GX_L	0x1E
//   30 #define	GY_H	0x1F
//   31 #define	GY_L	0x20
//   32 #define GZ_H	0x21
//   33 #define GZ_L	0x22
//   34 #define PWR_M	0x3E
//   35 //****************************
//   36 
//   37 #define BMA180 		0x80
//   38 #define ChipID		0x00
//   39 #define Version		0x01
//   40 #define DATAX0      0x02
//   41 #define DATAX1      0x03
//   42 #define DATAY0      0x04
//   43 #define DATAY1      0x05
//   44 #define DATAZ0      0x06
//   45 #define DATAZ1      0x07
//   46 #define Ctrl_reg0	0x0d
//   47 #define Ctrl_reg1	0x0e
//   48 #define Ctrl_reg2	0x0f
//   49 #define BW_TCS		0x20
//   50 #define Ctrl_reg3	0x21
//   51 #define TCO_Z		0x30
//   52 #define Offset_lsb1	0x35
//   53 
//   54 #define	MPU3205_Addr   0xD0	  //¶¨ÒåÆ÷¼þÔÚIIC×ÜÏßÖÐµÄ´ÓµØÖ·,¸ù¾ÝALT  ADDRESSµØÖ·Òý½Å²»Í¬ÐÞ¸Ä
//   55 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   56 unsigned char BUF[6];                         //½ÓÊÕÊý¾Ý»º´æÇø
BUF:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   57 char  test = 0;
test:
        DS8 1
//   58 //int   x,y;
//   59 //float angle;

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   60 short A_X, A_Y, A_Z;
A_X:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
A_Y:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
A_Z:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   61 short T_X, T_Y, T_Z;
T_X:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
T_Y:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
T_Z:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   62 int  mx, my, mz;
mx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
my:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
mz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   63 short data_xyz[3];
data_xyz:
        DS8 8
//   64 //float Roll,Pitch,Q,T,K;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   65 float Angle_accx = 0, Angle_accy = 0, Angle_accz = 0;
Angle_accx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_accy:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_accz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   66 float Dot_gyro_x = 0, Dot_gyro_y = 0, Dot_gyro_z = 0;
Dot_gyro_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_gyro_y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_gyro_z:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   67 float Angle_gyrox = 0, Angle_gyroy = 0, Angle_gyroz = 0;
Angle_gyrox:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_gyroy:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_gyroz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   68 float Q_x, Q_y, Q_z;
Q_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Q_y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Q_z:
        DS8 4
//   69 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   70 float Q_x1, Q_y1, Q_z1;
Q_x1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Q_y1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Q_z1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   71 float Dot_gyro_x0 = 0, Dot_gyro_y0 = 0, Dot_gyro_z0 = 0;
Dot_gyro_x0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_gyro_y0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_gyro_z0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   72 float Angle_gyrox0 = 0, Angle_gyroy0 = 0, Angle_gyroz0 = 0;
Angle_gyrox0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_gyroy0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_gyroz0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   73 float Angle_accx0 = 0, Angle_accy0 = 0, Angle_accz0 = 0;
Angle_accx0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_accy0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_accz0:
        DS8 4
//   74 
//   75 //***BMP085Ê¹ÓÃ

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   76 uint8 AC[22] = {0};
AC:
        DS8 24

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   77 short ac1;
ac1:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   78 short ac2;
ac2:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   79 short ac3;
ac3:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   80 unsigned short ac4;
ac4:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   81 unsigned short ac5;
ac5:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   82 unsigned short ac6;
ac6:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   83 short b1;
b1:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   84 short b2;
b2:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   85 short mb;
mb:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   86 short mc;
mc:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   87 short md;
md:
        DS8 2
//   88 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   89 long  temperature;
temperature:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   90 long  pressure;
pressure:
        DS8 4
//   91 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   92 float Dot_xgyro, Dot_ygyro, Dot_zgyro , Dot_xacc, Dot_yacc, Dot_zacc;
Dot_xgyro:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_ygyro:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_zgyro:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_xacc:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_yacc:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_zacc:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   93 float Dot_xgyro0, Dot_ygyro0, Dot_zgyro0 , Dot_xacc0, Dot_yacc0, Dot_zacc0;
Dot_xgyro0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_ygyro0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_zgyro0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_xacc0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_yacc0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_zacc0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   94 signed char DeltX = 0, DeltY = 0;
DeltX:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
DeltY:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
//   95 double SumDeltX = 0, SumDeltY = 0;
SumDeltX:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
SumDeltY:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   96 int maxDelt = 0;
maxDelt:
        DS8 4
//   97 //--------------------------------------
//   98 //##Soft filter Èí¼þÂË²¨
//   99 #define FILTERNUM		4 //Soft filter buffer size
//  100 #define FILTERMASK		3 //Idx from 0~7
//  101 #define WARP(X)			(X=((X+1)&FILTERMASK))

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  102 uint8 GyroRolIdx = 0, GyroPitIdx = 0, GyroYawIdx = 0;
GyroRolIdx:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
GyroPitIdx:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
GyroYawIdx:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  103 float   GyroRolBuf[FILTERNUM], GyroPitBuf[FILTERNUM], GyroYawBuf[FILTERNUM];
GyroRolBuf:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
GyroPitBuf:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
GyroYawBuf:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  104 float 	dot_GyroRol, dot_GyroPit, dot_GyroYaw;
dot_GyroRol:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
dot_GyroPit:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
dot_GyroYaw:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  105 float 	GyroRol, GyroPit, GyroYaw;
GyroRol:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
GyroPit:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
GyroYaw:
        DS8 4
//  106 
//  107 void GyroRead();
//  108 float Filter(float *value);
//  109 int get_mid(int a, int b, int c);
//  110 
//  111 /********¿¨Âí¿Ë·½·¨ÇóËãÊõÆ½·½¸ù*********/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 float SquareRootFloat(float number)
//  113 {
SquareRootFloat:
        PUSH     {R4-R7,LR}
        MOVS     R4,R0
//  114     long i;
//  115     float x, y;
//  116     const float f = 1.5F;
        MOVS     R7,#+1069547520
//  117     x = number * 0.5F;
        MOVS     R0,#+1056964608
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R6,R0
//  118     y  = number;
        MOVS     R5,R4
//  119     i  = * ( long * ) &y;
//  120     i  = 0x5f3759df - ( i >> 1 );        //×¢ÒâÕâÒ»ÐÐ
        LDR.W    R0,??DataTable5  ;; 0x5f3759df
        SUBS     R5,R0,R5, ASR #+1
//  121     y  = * ( float * ) &i;
//  122     y  = y * ( f - ( x * y * y ) );
        MOVS     R0,R6
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R5,R0
//  123     y  = y * ( f - ( x * y * y ) );
        MOVS     R0,R6
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R5,R0
//  124     return number * y;
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_fmul
        POP      {R4-R7,PC}       ;; return
//  125 }
//  126 //============================================================================
//  127 //º¯ÊýÃû³Æ£ºDelay_Nms
//  128 //¹¦ÄÜ¸ÅÒª£ºÑÓÊ±ms¡£
//  129 //²ÎÊýËµÃ÷£ºNÎªÑÓÊ±µÄÊ±¼äµ¥Î»ms
//  130 //º¯Êý·µ»Ø£ºÎÞ
//  131 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  132 void Delay_ms(float n)
//  133 {
Delay_ms:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  134     uint32 i = 24000;
        MOVW     R0,#+24000
//  135     i = (int)(i * n);
        BL       __aeabi_ui2f
        MOVS     R1,R4
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        B.N      ??Delay_ms_0
//  136     while(i > 0)i--;
??Delay_ms_1:
        SUBS     R0,R0,#+1
??Delay_ms_0:
        CMP      R0,#+0
        BNE.N    ??Delay_ms_1
//  137 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  138 void Delay_10us()
//  139 {
//  140     uint32 i = 400;
Delay_10us:
        MOV      R0,#+400
        B.N      ??Delay_10us_0
//  141     //i = (int)(i * n);
//  142     while(i > 0)i--;
??Delay_10us_1:
        SUBS     R0,R0,#+1
??Delay_10us_0:
        CMP      R0,#+0
        BNE.N    ??Delay_10us_1
//  143 }
        BX       LR               ;; return
//  144 ////////////////////////////////////////////////////////////////////////////////

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  145 void uart_putchar(unsigned char data)
//  146 {
//  147     while(!(UART1_S1 & UART_S1_TDRE_MASK)); //µÈ´ý·¢ËÍ»º³åÇø¿Õ
uart_putchar:
??uart_putchar_0:
        LDR.W    R1,??DataTable4  ;; 0x4006b004
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??uart_putchar_0
//  148     UART1_D = data;
        LDR.W    R1,??DataTable5_1  ;; 0x4006b007
        STRB     R0,[R1, #+0]
//  149 }
        BX       LR               ;; return
//  150 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  151 void putstr(char ch[])
//  152 {
putstr:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//  153     unsigned char ptr = 0;
        MOVS     R5,#+0
        B.N      ??putstr_0
//  154     while(ch[ptr])
//  155     {
//  156         uart_putchar((unsigned char)ch[ptr++]);
??putstr_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R4]
        BL       uart_putchar
        ADDS     R5,R5,#+1
//  157     }
??putstr_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R4]
        CMP      R0,#+0
        BNE.N    ??putstr_1
//  158 }
        POP      {R0,R4,R5,PC}    ;; return
//  159 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  160 long bmp085ReadTemp(void)
//  161 {
bmp085ReadTemp:
        PUSH     {R7,LR}
//  162     uint8  temp_ut_l = 0, temp_ut_h = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  163     short temp_ut;
//  164 
//  165     hw_iic_write1(0, BMP085_Addr, 0xF4, 0x2E);
        MOVS     R3,#+46
        MOVS     R2,#+244
        MOVS     R1,#+238
        MOVS     R0,#+0
        BL       hw_iic_write1
//  166     Delay_ms(5);	// max time is 4.5ms
        LDR.W    R0,??DataTable5_2  ;; 0x40a00000
        BL       Delay_ms
//  167     hw_iic_read1(0, BMP085_Addr, 0xF6, &temp_ut_h);
        ADD      R3,SP,#+0
        MOVS     R2,#+246
        MOVS     R1,#+238
        MOVS     R0,#+0
        BL       hw_iic_read1
//  168     hw_iic_read1(0, BMP085_Addr, 0xF7, &temp_ut_l);
        ADD      R3,SP,#+1
        MOVS     R2,#+247
        MOVS     R1,#+238
        MOVS     R0,#+0
        BL       hw_iic_read1
//  169     temp_ut = temp_ut_h ;
        LDRB     R0,[SP, #+0]
//  170     temp_ut = (temp_ut << 8) | temp_ut_l ;
        LDRB     R1,[SP, #+1]
        ORRS     R0,R1,R0, LSL #+8
//  171     return  temp_ut ;
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        POP      {R1,PC}          ;; return
//  172 }
//  173 
//  174 
//  175 //void  Init_BMP085(void)
//  176 //{
//  177 //    while(hw_iic_readn(0, BMP085_Addr, 0xAA, AC, 22));
//  178 //    ac1 = AC[0];
//  179 //    ac1 = ac1 << 8 | AC[1];
//  180 //
//  181 //    ac2 = AC[2];
//  182 //    ac2 = ac2 << 8 | AC[3];
//  183 //
//  184 //    ac3 = AC[4];
//  185 //    ac3 = ac3 << 8 | AC[5];
//  186 //
//  187 //    ac4 = AC[6];
//  188 //    ac4 = ac4 << 8 | AC[7];
//  189 //
//  190 //    ac5 = AC[8];
//  191 //    ac5 = ac5 << 8 | AC[9];
//  192 //
//  193 //    ac6 = AC[10];
//  194 //    ac6 = ac6 << 8 | AC[11];
//  195 //
//  196 //    b1 = AC[12];
//  197 //    b1 = b1 << 8 | AC[13];
//  198 //
//  199 //    b2 = AC[14];
//  200 //    b2 = b2 << 8 | AC[15];
//  201 //
//  202 //    mb = AC[16];
//  203 //    mb = mb << 8 | AC[17];
//  204 //
//  205 //    mc = AC[18];
//  206 //    mc = mc << 8 | AC[19];
//  207 //
//  208 //    md = AC[20];
//  209 //    md = md << 8 | AC[21];
//  210 //    /*
//  211 //    ac1 = hw_iic_read1(BMP085_Addr,0xAA);
//  212 //    	ac1 = (ac1<<8)|hw_iic_read1(BMP085_Addr,0xAB);
//  213 //
//  214 //    ac2 = hw_iic_read1(BMP085_Addr,0xAC);
//  215 //    	ac2 = (ac2<<8)| hw_iic_read1(BMP085_Addr,0xAD);
//  216 //
//  217 //    	ac3 = hw_iic_read1(BMP085_Addr,0xAE);
//  218 //    	ac3 = (ac3<<8)| hw_iic_read1(BMP085_Addr,0xAF);
//  219 //
//  220 //    	ac4 = hw_iic_read1(BMP085_Addr,0xB0);
//  221 //    	ac4 = (ac4<<8)| hw_iic_read1(BMP085_Addr,0xB1);
//  222 //
//  223 //    	ac5 = hw_iic_read1(BMP085_Addr,0xB2);
//  224 //    	ac5 = (ac5<<8)| hw_iic_read1(BMP085_Addr,0xB3);
//  225 //
//  226 //    	ac6 = hw_iic_read1(BMP085_Addr,0xB4);
//  227 //    	ac6 = (ac6<<8)| hw_iic_read1(BMP085_Addr,0xB5);
//  228 //
//  229 //    	b1 = hw_iic_read1(BMP085_Addr,0xB6);
//  230 //    	b1 = (b1<<8)| hw_iic_read1(BMP085_Addr,0xB7);
//  231 //
//  232 //    	b2 = hw_iic_read1(BMP085_Addr,0xB8);
//  233 //    	b2 = (b2<<8)| hw_iic_read1(BMP085_Addr,0xB9);
//  234 //
//  235 //    	mb = hw_iic_read1(BMP085_Addr,0xBA);
//  236 //    	mb = (mb<<8)| hw_iic_read1(BMP085_Addr,0xBB);
//  237 //
//  238 //    	mc = hw_iic_read1(BMP085_Addr,0xBC);
//  239 //    	mc = (mc<<8)| hw_iic_read1(BMP085_Addr,0xBD);
//  240 //
//  241 //    	md = hw_iic_read1(BMP085_Addr,0xBE);
//  242 //    	md = (md<<8)| hw_iic_read1(BMP085_Addr,0xBF);
//  243 //    */
//  244 //
//  245 //}
//  246 //
//  247 //long bmp085ReadPressure(void)
//  248 //{
//  249 //	uint8  pressure_l,pressure_h;
//  250 //        int32 pressure;
//  251 //	hw_iic_write1(0,BMP085_Addr,0xF4,0x34);
//  252 //	Delay_ms(5);	// max time is 4.5ms
//  253 //	hw_iic_read1(0,BMP085_Addr,0xF6,&pressure_h);
//  254 //        hw_iic_read1(0,BMP085_Addr,0xF7,&pressure_l);
//  255 //	pressure = pressure_h;
//  256 //        pressure = (pressure<<8)| pressure_l;
//  257 //	pressure &= 0x0000FFFF;
//  258 //	return pressure;
//  259 //}
//  260 
//  261 
//  262 
//  263 //****************************
//  264 //
//  265 //void  Init_HMC5883L()
//  266 //{
//  267 //    hw_iic_write1(0, HMC5883L_Addr, 0x00, 0x18); //
//  268 //    hw_iic_write1(0, HMC5883L_Addr, 0x02, 0x00); //
//  269 //}
//  270 
//  271 //*****************************************
//  272 //
//  273 //void read_hmc5883l(void)
//  274 //{
//  275 //    static int Revise_mx = 0, Revise_my = 0, Revise_mz = 0;
//  276 //    static int sum_mx = 0, sum_my = 0, sum_mz = 0;
//  277 //    // uint8 x_l,x_h,y_l,y_h;
//  278 //
//  279 //    // int32 temp;
//  280 //    // char txtbuf[]={0};
//  281 //
//  282 //    //hw_iic_write1(0,HMC5883L_Addr,0x00,0x14);   //
//  283 //    //hw_iic_write1(0,HMC5883L_Addr,0x02,0x00);   //
//  284 //    //Delay_ms(10);
//  285 //    while(hw_iic_readn(0, HMC5883L_Addr, 0x03, BUF, 6));
//  286 //    mx = (BUF[0] << 8 | BUF[1]) - Revise_mx; //Combine MSB and LSB of X Data output register
//  287 //    mz = (BUF[2] << 8 | BUF[3]); //Combine MSB and LSB of Z Data output register
//  288 //    my = (BUF[4] << 8 | BUF[5]) - Revise_my; //Combine MSB and LSB of Y Data output register
//  289 //    if(Time_counter < COUNTER)
//  290 //    {
//  291 //        sum_mx += mx;
//  292 //        sum_my += my;
//  293 //        sum_mz += mz;
//  294 //    }
//  295 //    if(Time_counter == COUNTER)
//  296 //    {
//  297 //        Revise_mx = sum_mx / COUNTER ;
//  298 //        Revise_my = sum_my / COUNTER ;
//  299 //        Revise_mz = sum_mz / COUNTER ;
//  300 //
//  301 //    }
//  302 //    //if(mx > 0x7fff)mx -= 0xffff;
//  303 //    //if(my > 0x7fff)my -= 0xffff;
//  304 //    //angle = atan2(my, mx) * (180 / 3.14159265) + 180; // angle in degrees
//  305 //    /*
//  306 //        if(angle > 0) //²¹ÂëÇó³ö¼ÓËÙ¶ÈÔ­Ê¼¶ÔÓ¦ÊýÖµ
//  307 //    {
//  308 //         temp =  angle * 100;
//  309 //         //wz=((float)(0xffff-wz+1))*10000*3.9*0.896; //À©´óÒ»Íò±¶£¬ºÃÈ¡³öÕûÊý²¿·Ö
//  310 //    // height += (984.6788 - wz) *10000* 0.02 * 0.02 ;
//  311 //         sprintf(txtbuf,"\n angle:%d.%04d",temp/100,temp%100);
//  312 //    putstr(txtbuf);
//  313 //    }
//  314 //      else
//  315 //    {
//  316 //         temp =  -angle * 100;
//  317 //    sprintf(txtbuf,"\n angle:-%d.%04d",temp/100,temp%100);
//  318 //    putstr(txtbuf);
//  319 //     }
//  320 //     */
//  321 //}
//  322 
//  323 //****************************************
//  324 
//  325 //*****************************************
//  326 //
//  327 //float read_BMP085(void)
//  328 //{
//  329 //    float altitude = 0;
//  330 //    long ut;
//  331 //    long up;
//  332 //    long x1, x2, b5 = 0, b6, x3, b3, p;
//  333 //    unsigned long b4, b7;
//  334 //
//  335 //    uint8  pressure_l, pressure_h;
//  336 //    uint32 pressure_t;
//  337 //
//  338 //
//  339 //    while(hw_iic_write1(0, BMP085_Addr, 0xF4, 0x34));
//  340 //    Delay_ms(50);	// max time is 4.5ms
//  341 //    while(hw_iic_read1(0, BMP085_Addr, 0xF6, &pressure_h));
//  342 //    while(hw_iic_read1(0, BMP085_Addr, 0xF7, &pressure_l));
//  343 //    pressure_t = pressure_h;
//  344 //    pressure_t = (pressure_t << 8) | pressure_l;
//  345 //    pressure_t &= 0x0000FFFF;
//  346 //
//  347 //
//  348 //    ut = bmp085ReadTemp();	   // ¶ÁÈ¡ÎÂ¶È
//  349 //    ////	ut = bmp085ReadTemp();	   // ¶ÁÈ¡ÎÂ¶È
//  350 //    ////	up = bmp085ReadPressure();  // ¶ÁÈ¡Ñ¹Ç¿
//  351 //    ////	up = bmp085ReadPressure();  // ¶ÁÈ¡Ñ¹Ç¿
//  352 //    x1 = ((long)ut - ac6) * ac5 >> 15;
//  353 //    x2 = ((long) mc << 11) / (x1 + md);
//  354 //    b5 = x1 + x2;
//  355 //    temperature = (b5 + 8) >> 4;
//  356 //    //
//  357 //
//  358 //    up = pressure_t;
//  359 //    b6 = b5 - 4000;
//  360 //    x1 = (b2 * (b6 * b6 >> 12)) >> 11;
//  361 //    x2 = ac2 * b6 >> 11;
//  362 //    x3 = x1 + x2;
//  363 //    b3 = (((long)ac1 * 4 + x3) + 2) / 4;
//  364 //    x1 = ac3 * b6 >> 13;
//  365 //    x2 = (b1 * (b6 * b6 >> 12)) >> 16;
//  366 //    x3 = ((x1 + x2) + 2) >> 2;
//  367 //    b4 = (ac4 * (unsigned long) (x3 + 32768)) >> 15;
//  368 //    b7 = ((unsigned long) up - b3) * (50000 >> OSS);
//  369 //    if( b7 < 0x80000000)
//  370 //        p = (b7 * 2) / b4 ;
//  371 //    else
//  372 //        p = (b7 / b4) * 2;
//  373 //    x1 = (p >> 8) * (p >> 8);
//  374 //    x1 = (x1 * 3038) >> 16;
//  375 //    x2 = (-7357 * p) >> 16;
//  376 //    pressure = p + ((x1 + x2 + 3791) >> 4);
//  377 //    altitude = 44330 * (1 - (pow((float)pressure / 101325, 1 / 5.255)));
//  378 //
//  379 //    return altitude;
//  380 //}
//  381 
//  382 
//  383 
//  384 
//  385 
//  386 //³õÊ¼»¯MPU3050£¬¸ù¾ÝÐèÒªÇë²Î¿¼pdf½øÐÐÐÞ¸Ä************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  387 void InitMPU3205()
//  388 {
InitMPU3205:
        PUSH     {R7,LR}
//  389     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  390     while(hw_iic_write1(1, MPU3205_Addr, PWR_M, 0x00));
??InitMPU3205_0:
        MOVS     R3,#+0
        MOVS     R2,#+62
        MOVS     R1,#+208
        MOVS     R0,#+1
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitMPU3205_0
//  391     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  392     while(hw_iic_write1(1, MPU3205_Addr, SMPL, 0x07));
??InitMPU3205_1:
        MOVS     R3,#+7
        MOVS     R2,#+21
        MOVS     R1,#+208
        MOVS     R0,#+1
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitMPU3205_1
//  393     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  394     while(hw_iic_write1(1, MPU3205_Addr, DLPF, 0x1E));
??InitMPU3205_2:
        MOVS     R3,#+30
        MOVS     R2,#+22
        MOVS     R1,#+208
        MOVS     R0,#+1
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitMPU3205_2
//  395     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  396     while(hw_iic_write1(1, MPU3205_Addr, INT_C, 0x00));
??InitMPU3205_3:
        MOVS     R3,#+0
        MOVS     R2,#+23
        MOVS     R1,#+208
        MOVS     R0,#+1
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitMPU3205_3
//  397     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  398     // while(hw_iic_write1(0,MPU3205_Addr,PWR_M, 0x00));
//  399     /*
//  400     Single_WriteMPU3050(PWR_M, 0x80);   //
//  401     Single_WriteMPU3050(SMPL, 0x07);    //
//  402     Single_WriteMPU3050(DLPF, 0x1E);    //¡À2000¡ã
//  403     Single_WriteMPU3050(INT_C, 0x00 );  //
//  404     Single_WriteMPU3050(PWR_M, 0x00);   //
//  405     */
//  406 }
        POP      {R0,PC}          ;; return
//  407 
//  408 //³õÊ¼»¯MPU3205£¬ÓÚI2C0************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  409 void InitMPUsteer()
//  410 {
InitMPUsteer:
        PUSH     {R7,LR}
//  411     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  412     while(hw_iic_write1(0, MPU3205_Addr, PWR_M, 0x00));
??InitMPUsteer_0:
        MOVS     R3,#+0
        MOVS     R2,#+62
        MOVS     R1,#+208
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitMPUsteer_0
//  413     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  414     while(hw_iic_write1(0, MPU3205_Addr, SMPL, 0x07));
??InitMPUsteer_1:
        MOVS     R3,#+7
        MOVS     R2,#+21
        MOVS     R1,#+208
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitMPUsteer_1
//  415     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  416     while(hw_iic_write1(0, MPU3205_Addr, DLPF, 0x1E));
??InitMPUsteer_2:
        MOVS     R3,#+30
        MOVS     R2,#+22
        MOVS     R1,#+208
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitMPUsteer_2
//  417     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  418     while(hw_iic_write1(0, MPU3205_Addr, INT_C, 0x00));
??InitMPUsteer_3:
        MOVS     R3,#+0
        MOVS     R2,#+23
        MOVS     R1,#+208
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitMPUsteer_3
//  419     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  420     // while(hw_iic_write1(0,MPU3205_Addr,PWR_M, 0x00));
//  421     /*
//  422     Single_WriteMPU3050(PWR_M, 0x80);   //
//  423     Single_WriteMPU3050(SMPL, 0x07);    //
//  424     Single_WriteMPU3050(DLPF, 0x1E);    //¡À2000¡ã
//  425     Single_WriteMPU3050(INT_C, 0x00 );  //
//  426     Single_WriteMPU3050(PWR_M, 0x00);   //
//  427     */
//  428 }
        POP      {R0,PC}          ;; return
//  429 
//  430 //¶ÁÈ¡MPU3205£¬ÓÚI2C0************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  431 void ReadMPUsteer()
//  432 {
ReadMPUsteer:
        PUSH     {R3-R7,LR}
//  433    
//  434     static float Revise_gyroX = 0, Revise_gyroY = 0, Revise_gyroZ = 0;
//  435     int16 gyrox, gyroy, gyroz;
//  436     static float dotx_gyro[3] = {0}, doty_gyro[3] = {0}, dotz_gyro[3] = {0};
//  437 
//  438     while(hw_iic_readn(0, MPU3205_Addr, GX_H, BUF, 6));
??ReadMPUsteer_0:
        MOVS     R0,#+6
        STR      R0,[SP, #+0]
        LDR.W    R3,??DataTable5_3
        MOVS     R2,#+29
        MOVS     R1,#+208
        MOVS     R0,#+0
        BL       hw_iic_readn
        CMP      R0,#+0
        BNE.N    ??ReadMPUsteer_0
//  439 
//  440     gyrox = (BUF[0] << 8) + BUF[1] ;
        LDR.W    R0,??DataTable5_3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        LDR.W    R1,??DataTable5_3
        LDRB     R1,[R1, #+1]
        ADDS     R0,R0,R1
//  441     gyroy = (BUF[2] << 8) + BUF[3] ;
        LDR.W    R1,??DataTable5_3
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+8
        LDR.W    R2,??DataTable5_3
        LDRB     R2,[R2, #+3]
        ADDS     R7,R1,R2
//  442     gyroz = (BUF[4] << 8) + BUF[5] ;
        LDR.W    R1,??DataTable5_3
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+8
        LDR.W    R2,??DataTable5_3
        LDRB     R2,[R2, #+5]
        ADDS     R6,R1,R2
//  443 
//  444     Dot_gyro_x0 = (float)gyrox  / 14.375 - Revise_gyroX / T * 1000;
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_4  ;; 0x402cc000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable5_8
        STR      R0,[R1, #+0]
//  445     Dot_gyro_y0 = (float)gyroy  / 14.375 - Revise_gyroY / T * 1000;
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        MOVS     R0,R7
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_4  ;; 0x402cc000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable5_10
        STR      R0,[R1, #+0]
//  446     Dot_gyro_z0 = (float)gyroz  / 14.375 - Revise_gyroZ / T * 1000;
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_4  ;; 0x402cc000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable5_12
        STR      R0,[R1, #+0]
//  447 
//  448     for(uint8 i = 1; i < 3; i++)
        MOVS     R0,#+1
        B.N      ??ReadMPUsteer_1
//  449     {
//  450         dotx_gyro[i-1] = dotx_gyro[i];
??ReadMPUsteer_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable5_13
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable5_13
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  451         doty_gyro[i-1] = doty_gyro[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable5_14
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable5_14
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  452         dotz_gyro[i-1] = dotz_gyro[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable5_15
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable5_15
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  453     }
        ADDS     R0,R0,#+1
??ReadMPUsteer_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??ReadMPUsteer_2
//  454     dotx_gyro[2] = Dot_gyro_x0;
        LDR.W    R0,??DataTable5_13
        LDR.W    R1,??DataTable5_8
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+8]
//  455     doty_gyro[2] = Dot_gyro_y0;
        LDR.W    R0,??DataTable5_14
        LDR.W    R1,??DataTable5_10
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+8]
//  456     dotz_gyro[2] = Dot_gyro_z0;
        LDR.W    R0,??DataTable5_15
        LDR.W    R1,??DataTable5_12
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+8]
//  457 
//  458     Dot_xgyro0 = (dotx_gyro[2] * 0.5  + dotx_gyro[1] * 0.3  + dotx_gyro[0] * 0.2)  / 57.3 ;
        LDR.W    R0,??DataTable5_13
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_16  ;; 0x3fe00000
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_13
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable5_17  ;; 0x3fd33333
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_13
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable5_18  ;; 0x9999999a
        LDR.W    R3,??DataTable5_19  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable5_20  ;; 0x404ca666
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable5_21
        STR      R0,[R1, #+0]
//  459     Dot_ygyro0 = (doty_gyro[2] * 0.5  + doty_gyro[1] * 0.3  + doty_gyro[0] * 0.2)  / 57.3 ;
        LDR.W    R0,??DataTable5_14
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_16  ;; 0x3fe00000
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_14
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable5_17  ;; 0x3fd33333
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable5_18  ;; 0x9999999a
        LDR.W    R3,??DataTable5_19  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable5_20  ;; 0x404ca666
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable5_22
        STR      R0,[R1, #+0]
//  460     Dot_zgyro0 = (dotz_gyro[2] * 0.5  + dotz_gyro[1] * 0.3  + dotz_gyro[0] * 0.2)  / 57.3 ;
        LDR.W    R0,??DataTable5_15
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_16  ;; 0x3fe00000
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_15
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable5_17  ;; 0x3fd33333
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_15
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable5_18  ;; 0x9999999a
        LDR.W    R3,??DataTable5_19  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable5_20  ;; 0x404ca666
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable5_23
        STR      R0,[R1, #+0]
//  461 
//  462     Angle_gyrox0 += Dot_gyro_x0 * T / 1000 ;
        LDR.W    R0,??DataTable5_24
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable5_24
        STR      R0,[R1, #+0]
//  463     Angle_gyroy0 += Dot_gyro_y0 * T / 1000 ;
        LDR.W    R0,??DataTable5_25
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_10
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable5_25
        STR      R0,[R1, #+0]
//  464     Angle_gyroz0 += Dot_gyro_z0 * T / 1000 ;
        LDR.W    R0,??DataTable7
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable5_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable7
        STR      R0,[R1, #+0]
//  465 
//  466     //////////////////////////ÐÞÕý0µã£¬¶ÁCOUNTER´ÎÈ»ºóÈ¡Æ½¾ù////////////////////////////
//  467     if(Time_counter == COUNTER)
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BNE.N    ??ReadMPUsteer_3
//  468     {
//  469         Revise_gyroX = Angle_gyrox0 / COUNTER ;
        LDR.W    R0,??DataTable5_24
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable5_5
        STR      R0,[R1, #+0]
//  470         Revise_gyroY = Angle_gyroy0 / COUNTER ;
        LDR.W    R0,??DataTable5_25
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable5_9
        STR      R0,[R1, #+0]
//  471         Revise_gyroZ = Angle_gyroz0 / COUNTER ;
        LDR.W    R0,??DataTable7
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable5_11
        STR      R0,[R1, #+0]
//  472         Angle_gyrox0 = 0;
        LDR.W    R0,??DataTable5_24
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  473         Angle_gyroy0 = 0;
        LDR.W    R0,??DataTable5_25
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  474         Angle_gyroz0 = 0;
        LDR.W    R0,??DataTable7
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  475     }
//  476 }
??ReadMPUsteer_3:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_gyroX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_gyroY:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_gyroZ:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??dotx_gyro:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??doty_gyro:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??dotz_gyro:
        DS8 12
//  477 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  478 void ReadMPU3205()
//  479 {
ReadMPU3205:
        PUSH     {R3-R7,LR}
//  480     //float temp_dotgyrox, temp_dotgyroy, temp_dotgyroz;
//  481     static float Revise_gyroX = 0, Revise_gyroY = 0, Revise_gyroZ = 0;
//  482     int16 gyrox, gyroy, gyroz;
//  483     static float dotx_gyro[3] = {0}, doty_gyro[3] = {0}, dotz_gyro[3] = {0};
//  484     //  static float sum_gyrox = 0, sum_gyroy = 0, sum_gyroz = 0;
//  485     //   float gx, gy, gz;
//  486 
//  487     while(hw_iic_readn(1, MPU3205_Addr, GX_H, BUF, 6));
??ReadMPU3205_0:
        MOVS     R0,#+6
        STR      R0,[SP, #+0]
        LDR.W    R3,??DataTable5_3
        MOVS     R2,#+29
        MOVS     R1,#+208
        MOVS     R0,#+1
        BL       hw_iic_readn
        CMP      R0,#+0
        BNE.N    ??ReadMPU3205_0
//  488 
//  489     gyrox = (BUF[0] << 8) + BUF[1] ;
        LDR.W    R0,??DataTable5_3
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+8
        LDR.W    R1,??DataTable5_3
        LDRB     R1,[R1, #+1]
        ADDS     R0,R0,R1
//  490     gyroy = (BUF[2] << 8) + BUF[3] ;
        LDR.W    R1,??DataTable5_3
        LDRB     R1,[R1, #+2]
        LSLS     R1,R1,#+8
        LDR.W    R2,??DataTable5_3
        LDRB     R2,[R2, #+3]
        ADDS     R7,R1,R2
//  491     gyroz = (BUF[4] << 8) + BUF[5] ;
        LDR.W    R1,??DataTable5_3
        LDRB     R1,[R1, #+4]
        LSLS     R1,R1,#+8
        LDR.W    R2,??DataTable5_3
        LDRB     R2,[R2, #+5]
        ADDS     R6,R1,R2
//  492 
//  493 
//  494     //gyrox = get_mid(xgyro[0],xgyro[1],xgyro[2]);
//  495     //gyroy = get_mid(ygyro[0],ygyro[1],ygyro[2]);
//  496     //gyroz = get_mid(zgyro[0],zgyro[1],zgyro[2]);
//  497 
//  498     Dot_gyro_x = (float)gyrox  / 14.375 - Revise_gyroX / T * 1000;
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_4  ;; 0x402cc000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_3
        STR      R0,[R1, #+0]
//  499     Dot_gyro_y = (float)gyroy  / 14.375 - Revise_gyroY / T * 1000;
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        MOVS     R0,R7
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_4  ;; 0x402cc000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable7_2
        STR      R0,[R1, #+0]
//  500     Dot_gyro_z = (float)gyroz  / 14.375 - Revise_gyroZ / T * 1000;
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_4  ;; 0x402cc000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable7_4
        STR      R0,[R1, #+0]
//  501 
//  502     for(uint8 i = 1; i < 3; i++)
        MOVS     R0,#+1
        B.N      ??ReadMPU3205_1
//  503     {
//  504         dotx_gyro[i-1] = dotx_gyro[i];
??ReadMPU3205_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable7_5
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable7_5
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  505         doty_gyro[i-1] = doty_gyro[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable7_6
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable7_6
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  506         dotz_gyro[i-1] = dotz_gyro[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable7_7
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable7_7
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  507     }
        ADDS     R0,R0,#+1
??ReadMPU3205_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BCC.N    ??ReadMPU3205_2
//  508     dotx_gyro[2] = Dot_gyro_x;
        LDR.W    R0,??DataTable7_5
        LDR.W    R1,??DataTable6_3
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+8]
//  509     doty_gyro[2] = Dot_gyro_y;
        LDR.W    R0,??DataTable7_6
        LDR.W    R1,??DataTable7_2
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+8]
//  510     dotz_gyro[2] = Dot_gyro_z;
        LDR.W    R0,??DataTable7_7
        LDR.W    R1,??DataTable7_4
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+8]
//  511     //temp_dotgyrox = Dot_gyro_x  / 57.3;
//  512     //temp_dotgyroy = -Dot_gyro_y / 57.3;
//  513     //temp_dotgyroz = Dot_gyro_z /  57.3;
//  514     Dot_xgyro = (dotx_gyro[2] * 0.5  + dotx_gyro[1] * 0.3  + dotx_gyro[0] * 0.2)  / 57.3 ;
        LDR.W    R0,??DataTable7_5
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_16  ;; 0x3fe00000
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_5
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable5_17  ;; 0x3fd33333
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable5_18  ;; 0x9999999a
        LDR.W    R3,??DataTable5_19  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable5_20  ;; 0x404ca666
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable8
        STR      R0,[R1, #+0]
//  515     Dot_ygyro = (doty_gyro[2] * 0.5  + doty_gyro[1] * 0.3  + doty_gyro[0] * 0.2)  / 57.3 ;
        LDR.W    R0,??DataTable7_6
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_16  ;; 0x3fe00000
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_6
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable5_17  ;; 0x3fd33333
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable5_18  ;; 0x9999999a
        LDR.W    R3,??DataTable5_19  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable5_20  ;; 0x404ca666
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable8_1
        STR      R0,[R1, #+0]
//  516     Dot_zgyro = (dotz_gyro[2] * 0.5  + dotz_gyro[1] * 0.3  + dotz_gyro[0] * 0.2)  / 57.3 ;
        LDR.W    R0,??DataTable7_7
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_16  ;; 0x3fe00000
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_7
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable5_17  ;; 0x3fd33333
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable5_18  ;; 0x9999999a
        LDR.W    R3,??DataTable5_19  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable5_20  ;; 0x404ca666
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable8_2
        STR      R0,[R1, #+0]
//  517     //Dot_xgyro = Dot_gyro_x / 57.3;
//  518     //Dot_ygyro = -Dot_gyro_y / 57.3;
//  519     //Dot_zgyro = Dot_gyro_z / 57.3;
//  520 
//  521     Angle_gyrox += Dot_gyro_x * T / 1000 ;
        LDR.W    R0,??DataTable8_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable8_3
        STR      R0,[R1, #+0]
//  522     Angle_gyroy += Dot_gyro_y * T / 1000 ;
        LDR.W    R0,??DataTable8_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable8_4
        STR      R0,[R1, #+0]
//  523     Angle_gyroz += Dot_gyro_z * T / 1000 ;
        LDR.W    R0,??DataTable8_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_6  ;; 0x40040000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable5_7  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable8_5
        STR      R0,[R1, #+0]
//  524 
//  525     //////////////////////////ÐÞÕý0µã£¬¶ÁCOUNTER´ÎÈ»ºóÈ¡Æ½¾ù////////////////////////////
//  526     if(Time_counter == COUNTER)
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BNE.N    ??ReadMPU3205_3
//  527     {
//  528         Revise_gyroX = Angle_gyrox / COUNTER ;
        LDR.W    R0,??DataTable8_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
//  529         Revise_gyroY = Angle_gyroy / COUNTER ;
        LDR.W    R0,??DataTable8_4
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable7_1
        STR      R0,[R1, #+0]
//  530         Revise_gyroZ = Angle_gyroz / COUNTER ;
        LDR.W    R0,??DataTable8_5
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable7_3
        STR      R0,[R1, #+0]
//  531         Angle_gyrox = 0;
        LDR.W    R0,??DataTable8_3
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  532         Angle_gyroy = 0;
        LDR.W    R0,??DataTable8_4
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  533         Angle_gyroz = 0;
        LDR.W    R0,??DataTable8_5
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  534     }
//  535 }
??ReadMPU3205_3:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x4006b004

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_gyroX_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_gyroY_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_gyroZ_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??dotx_gyro_1:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??doty_gyro_1:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??dotz_gyro_1:
        DS8 12
//  536 
//  537 
//  538 /**********************************************º¯Êý¶¨Òå*****************************************************
//  539 * º¯ÊýÃû³Æ: void InitBMA180(void)
//  540 * ÊäÈë²ÎÊý: void
//  541 * ·µ»Ø²ÎÊý: void
//  542 * ¹¦    ÄÜ: ³õÊ¼»¯BMA180
//  543 * ×÷    Õß: by Yuson
//  544 * ÈÕ    ÆÚ: 2012-6-2
//  545 ************************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  546 void InitBMA180(void)
//  547 {
InitBMA180:
        PUSH     {R7,LR}
//  548     uint8 temp;
//  549     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  550     while(hw_iic_read1(1, BMA180, ChipID, &temp));
??InitBMA180_0:
        ADD      R3,SP,#+0
        MOVS     R2,#+0
        MOVS     R1,#+128
        MOVS     R0,#+1
        BL       hw_iic_read1
        CMP      R0,#+0
        BNE.N    ??InitBMA180_0
//  551     while(temp != 0x03);
??InitBMA180_1:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+3
        BNE.N    ??InitBMA180_1
//  552     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  553     while(hw_iic_write1(1, BMA180, Ctrl_reg0, 0x10));	//ee-w 1
??InitBMA180_2:
        MOVS     R3,#+16
        MOVS     R2,#+13
        MOVS     R1,#+128
        MOVS     R0,#+1
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitBMA180_2
//  554     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  555     while(hw_iic_read1(1, BMA180, BW_TCS, &temp));
??InitBMA180_3:
        ADD      R3,SP,#+0
        MOVS     R2,#+32
        MOVS     R1,#+128
        MOVS     R0,#+1
        BL       hw_iic_read1
        CMP      R0,#+0
        BNE.N    ??InitBMA180_3
//  556     temp &= 0x0f;
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xF
        STRB     R0,[SP, #+0]
//  557     temp |= 1 << 4;
        LDRB     R0,[SP, #+0]
        ORRS     R0,R0,#0x10
        STRB     R0,[SP, #+0]
//  558     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  559     while(hw_iic_write1(1, BMA180, BW_TCS, temp));
??InitBMA180_4:
        LDRB     R3,[SP, #+0]
        MOVS     R2,#+32
        MOVS     R1,#+128
        MOVS     R0,#+1
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitBMA180_4
//  560     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  561     while(hw_iic_read1(1, BMA180, TCO_Z, &temp));
??InitBMA180_5:
        ADD      R3,SP,#+0
        MOVS     R2,#+48
        MOVS     R1,#+128
        MOVS     R0,#+1
        BL       hw_iic_read1
        CMP      R0,#+0
        BNE.N    ??InitBMA180_5
//  562     temp &= 0xfc;
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xFC
        STRB     R0,[SP, #+0]
//  563     temp |= 0;
        LDRB     R0,[SP, #+0]
        STRB     R0,[SP, #+0]
//  564     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  565     while(hw_iic_write1(1, BMA180, TCO_Z, temp));
??InitBMA180_6:
        LDRB     R3,[SP, #+0]
        MOVS     R2,#+48
        MOVS     R1,#+128
        MOVS     R0,#+1
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitBMA180_6
//  566     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  567     while(hw_iic_read1(1, BMA180, Offset_lsb1, &temp));
??InitBMA180_7:
        ADD      R3,SP,#+0
        MOVS     R2,#+53
        MOVS     R1,#+128
        MOVS     R0,#+1
        BL       hw_iic_read1
        CMP      R0,#+0
        BNE.N    ??InitBMA180_7
//  568     temp &= 0xf1;
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xF1
        STRB     R0,[SP, #+0]
//  569     temp |= 0x02 << 1;//+-2g 0.25mg/lsb
        LDRB     R0,[SP, #+0]
        ORRS     R0,R0,#0x4
        STRB     R0,[SP, #+0]
//  570     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  571     while(hw_iic_write1(1, BMA180, Offset_lsb1, temp));
??InitBMA180_8:
        LDRB     R3,[SP, #+0]
        MOVS     R2,#+53
        MOVS     R1,#+128
        MOVS     R0,#+1
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitBMA180_8
//  572     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  573 }
        POP      {R0,PC}          ;; return
//  574 
//  575 
//  576 /**********************************************º¯Êý¶¨Òå*****************************************************
//  577 * º¯ÊýÃû³Æ: void ReadBMA180(void)
//  578 * ÊäÈë²ÎÊý: void
//  579 * ·µ»Ø²ÎÊý: void
//  580 * ¹¦    ÄÜ: ¶ÁÈ¡BMA180µÄÊý¾Ý
//  581 * ×÷    Õß: by Yuson
//  582 * ÈÕ    ÆÚ: 2012-6-2
//  583 ************************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  584 void ReadBMA180(void)
//  585 {
ReadBMA180:
        PUSH     {R3-R7,LR}
//  586 #define count  20
//  587     static float xacc[count] = {0}, yacc[count] = {0}, zacc[count] = {0};
//  588     int16 Xdat, Ydat, Zdat;
//  589     static float Revise_accX = 0, Revise_accY = 0, Revise_accZ = 0;
//  590     static float sum_accx = 0, sum_accy = 0, sum_accz = 0;
//  591 
//  592     while(hw_iic_readn(1, BMA180, DATAX0, BUF, 6));
??ReadBMA180_0:
        MOVS     R0,#+6
        STR      R0,[SP, #+0]
        LDR.N    R3,??DataTable5_3
        MOVS     R2,#+2
        MOVS     R1,#+128
        MOVS     R0,#+1
        BL       hw_iic_readn
        CMP      R0,#+0
        BNE.N    ??ReadBMA180_0
//  593     Xdat = BUF[1] << 8 | BUF[0];
        LDR.N    R0,??DataTable5_3
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+0]
        ORRS     R4,R1,R0, LSL #+8
//  594     Ydat = BUF[3] << 8 | BUF[2];
        LDR.N    R0,??DataTable5_3
        LDRB     R0,[R0, #+3]
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+2]
        ORRS     R5,R1,R0, LSL #+8
//  595     Zdat = BUF[5] << 8 | BUF[4];
        LDR.N    R0,??DataTable5_3
        LDRB     R0,[R0, #+5]
        LDR.N    R1,??DataTable5_3
        LDRB     R1,[R1, #+4]
        ORRS     R6,R1,R0, LSL #+8
//  596 
//  597     if(Time_counter <= COUNTER)
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BHI.N    ??ReadBMA180_1
//  598     {
//  599         sum_accx += Xdat;
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R0,R4
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable8_6
        STR      R0,[R1, #+0]
//  600         sum_accy += Ydat;
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R0,R5
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable8_7
        STR      R0,[R1, #+0]
//  601         sum_accz += Zdat;
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable8_8
        STR      R0,[R1, #+0]
//  602     }
//  603     if(Time_counter == COUNTER)
??ReadBMA180_1:
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BNE.N    ??ReadBMA180_2
//  604     {
//  605         Revise_accX = sum_accx / COUNTER;
        LDR.W    R0,??DataTable8_6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable8_9
        STR      R0,[R1, #+0]
//  606         Revise_accY = sum_accy / COUNTER;
        LDR.W    R0,??DataTable8_7
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable8_10
        STR      R0,[R1, #+0]
//  607         Revise_accZ = sum_accz / COUNTER;
        LDR.W    R0,??DataTable8_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable8_11
        STR      R0,[R1, #+0]
//  608         Angle_accx = 0;
        LDR.W    R0,??DataTable8_12
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  609         Angle_accy = 0;
        LDR.W    R0,??DataTable8_13
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  610         Angle_accz = 0;
        LDR.W    R0,??DataTable8_14
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  611     }
//  612     if(Time_counter > COUNTER)
??ReadBMA180_2:
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BLS.W    ??ReadBMA180_3
//  613     {
//  614         for(uint8 i = 1; i < count; i++)
        MOVS     R0,#+1
        B.N      ??ReadBMA180_4
//  615         {
//  616             xacc[i-1] = xacc[i];
??ReadBMA180_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable8_15
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable8_15
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  617             yacc[i-1] = yacc[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable8_16
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable8_16
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  618             zacc[i-1] = zacc[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable8_17
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable8_17
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  619         }
        ADDS     R0,R0,#+1
??ReadBMA180_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+20
        BCC.N    ??ReadBMA180_5
//  620 
//  621         xacc[count-1] = Xdat;
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R0,R4
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_15
        STR      R0,[R1, #+76]
//  622         yacc[count-1] = Ydat;
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R0,R5
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_16
        STR      R0,[R1, #+76]
//  623         zacc[count-1] = Zdat;
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_17
        STR      R0,[R1, #+76]
//  624 
//  625         float xdata = 0, ydata = 0, zdata = 0;
        MOVS     R6,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
//  626         for(uint8 i = 0; i < count; i++)
        MOVS     R7,#+0
        B.N      ??ReadBMA180_6
//  627         {
//  628             xdata += xacc[i] / (float)count;
??ReadBMA180_7:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR.W    R0,??DataTable8_15
        LDR      R0,[R0, R7, LSL #+2]
        LDR.W    R1,??DataTable8_18  ;; 0x41a00000
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
//  629             ydata += yacc[i] / (float)count;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR.W    R0,??DataTable8_16
        LDR      R0,[R0, R7, LSL #+2]
        LDR.W    R1,??DataTable8_18  ;; 0x41a00000
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  630             zdata += zacc[i] / (float)count;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR.W    R0,??DataTable8_17
        LDR      R0,[R0, R7, LSL #+2]
        LDR.W    R1,??DataTable8_18  ;; 0x41a00000
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  631         }
        ADDS     R7,R7,#+1
??ReadBMA180_6:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+20
        BCC.N    ??ReadBMA180_7
//  632 
//  633         Dot_xacc = (xdata - Revise_accX) * 0.244 / 4000.0;
        MOVS     R0,R6
        LDR.W    R1,??DataTable8_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable8_19  ;; 0x5a1cac08
        LDR.W    R3,??DataTable8_20  ;; 0x3fcf3b64
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable8_21  ;; 0x40af4000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable8_22
        STR      R0,[R1, #+0]
//  634         //if(Dot_xacc > 0 ) Dot_xacc /= 1.025;
//  635         //else Dot_xacc /= 0.945;
//  636         Dot_yacc = (ydata - Revise_accY) * 0.244 / 4000.0;
        MOVS     R0,R4
        LDR.W    R1,??DataTable8_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable8_19  ;; 0x5a1cac08
        LDR.W    R3,??DataTable8_20  ;; 0x3fcf3b64
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable8_21  ;; 0x40af4000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable8_23
        STR      R0,[R1, #+0]
//  637         //if(Dot_yacc > 0)Dot_yacc /= 0.982;
//  638         Dot_zacc = (zdata - (Revise_accZ - 16393)) * 0.244 / 4000.0;
        LDR.W    R0,??DataTable8_11
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable8_24  ;; 0xc6801200
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable8_19  ;; 0x5a1cac08
        LDR.W    R3,??DataTable8_20  ;; 0x3fcf3b64
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable8_21  ;; 0x40af4000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable8_25
        STR      R0,[R1, #+0]
//  639     }
//  640 }
??ReadBMA180_3:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x5f3759df

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x4006b007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x40a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     BUF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x402cc000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     ??Revise_gyroX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     Dot_gyro_x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     ??Revise_gyroY

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     Dot_gyro_y0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     ??Revise_gyroZ

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     Dot_gyro_z0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     ??dotx_gyro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     ??doty_gyro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     ??dotz_gyro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     0x3fe00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     0x3fd33333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_19:
        DC32     0x3fc99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_20:
        DC32     0x404ca666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_21:
        DC32     Dot_xgyro0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_22:
        DC32     Dot_ygyro0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_23:
        DC32     Dot_zgyro0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_24:
        DC32     Angle_gyrox0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_25:
        DC32     Angle_gyroy0

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??xacc:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??yacc:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??zacc:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_accX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_accY:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_accZ:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??sum_accx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??sum_accy:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??sum_accz:
        DS8 4
//  641 
//  642 /**********************************************º¯Êý¶¨Òå*****************************************************
//  643 * º¯ÊýÃû³Æ: void InitBMAsteer(void)
//  644 * ÊäÈë²ÎÊý: void
//  645 * ·µ»Ø²ÎÊý: void
//  646 * ¹¦    ÄÜ: ³õÊ¼»¯BMA180
//  647 * ×÷    Õß: by Hins
//  648 * ÈÕ    ÆÚ: 2015-3-5
//  649 ************************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  650 void InitBMAsteer(void)
//  651 {
InitBMAsteer:
        PUSH     {R7,LR}
//  652     uint8 temp;
//  653     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  654     while(hw_iic_read1(0, BMA180, ChipID, &temp));
??InitBMAsteer_0:
        ADD      R3,SP,#+0
        MOVS     R2,#+0
        MOVS     R1,#+128
        MOVS     R0,#+0
        BL       hw_iic_read1
        CMP      R0,#+0
        BNE.N    ??InitBMAsteer_0
//  655     while(temp != 0x03);
??InitBMAsteer_1:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+3
        BNE.N    ??InitBMAsteer_1
//  656     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  657     while(hw_iic_write1(0, BMA180, Ctrl_reg0, 0x10));	//ee-w 1
??InitBMAsteer_2:
        MOVS     R3,#+16
        MOVS     R2,#+13
        MOVS     R1,#+128
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitBMAsteer_2
//  658     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  659     while(hw_iic_read1(0, BMA180, BW_TCS, &temp));
??InitBMAsteer_3:
        ADD      R3,SP,#+0
        MOVS     R2,#+32
        MOVS     R1,#+128
        MOVS     R0,#+0
        BL       hw_iic_read1
        CMP      R0,#+0
        BNE.N    ??InitBMAsteer_3
//  660     temp &= 0x0f;
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xF
        STRB     R0,[SP, #+0]
//  661     temp |= 1 << 4;
        LDRB     R0,[SP, #+0]
        ORRS     R0,R0,#0x10
        STRB     R0,[SP, #+0]
//  662     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  663     while(hw_iic_write1(0, BMA180, BW_TCS, temp));
??InitBMAsteer_4:
        LDRB     R3,[SP, #+0]
        MOVS     R2,#+32
        MOVS     R1,#+128
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitBMAsteer_4
//  664     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  665     while(hw_iic_read1(0, BMA180, TCO_Z, &temp));
??InitBMAsteer_5:
        ADD      R3,SP,#+0
        MOVS     R2,#+48
        MOVS     R1,#+128
        MOVS     R0,#+0
        BL       hw_iic_read1
        CMP      R0,#+0
        BNE.N    ??InitBMAsteer_5
//  666     temp &= 0xfc;
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xFC
        STRB     R0,[SP, #+0]
//  667     temp |= 0;
        LDRB     R0,[SP, #+0]
        STRB     R0,[SP, #+0]
//  668     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  669     while(hw_iic_write1(0, BMA180, TCO_Z, temp));
??InitBMAsteer_6:
        LDRB     R3,[SP, #+0]
        MOVS     R2,#+48
        MOVS     R1,#+128
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitBMAsteer_6
//  670     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  671     while(hw_iic_read1(0, BMA180, Offset_lsb1, &temp));
??InitBMAsteer_7:
        ADD      R3,SP,#+0
        MOVS     R2,#+53
        MOVS     R1,#+128
        MOVS     R0,#+0
        BL       hw_iic_read1
        CMP      R0,#+0
        BNE.N    ??InitBMAsteer_7
//  672     temp &= 0xf1;
        LDRB     R0,[SP, #+0]
        ANDS     R0,R0,#0xF1
        STRB     R0,[SP, #+0]
//  673     temp |= 0x02 << 1;//+-2g 0.25mg/lsb
        LDRB     R0,[SP, #+0]
        ORRS     R0,R0,#0x4
        STRB     R0,[SP, #+0]
//  674     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  675     while(hw_iic_write1(0, BMA180, Offset_lsb1, temp));
??InitBMAsteer_8:
        LDRB     R3,[SP, #+0]
        MOVS     R2,#+53
        MOVS     R1,#+128
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??InitBMAsteer_8
//  676     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  677 }
        POP      {R0,PC}          ;; return
//  678 
//  679 
//  680 /**********************************************º¯Êý¶¨Òå*****************************************************
//  681 * º¯ÊýÃû³Æ: void ReadBMAsteer(void)
//  682 * ÊäÈë²ÎÊý: void
//  683 * ·µ»Ø²ÎÊý: void
//  684 * ¹¦    ÄÜ: ¶ÁÈ¡BMA180µÄÊý¾Ý
//  685 * ×÷    Õß: by Hins
//  686 * ÈÕ    ÆÚ: 2015-3-5
//  687 ************************************************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  688 void ReadBMAsteer(void)
//  689 {
ReadBMAsteer:
        PUSH     {R3-R7,LR}
//  690 #define count  20
//  691     static float xacc[count] = {0}, yacc[count] = {0}, zacc[count] = {0};
//  692     int16 Xdat, Ydat, Zdat;
//  693     static float Revise_accX = 0, Revise_accY = 0, Revise_accZ = 0;
//  694     static float sum_accx = 0, sum_accy = 0, sum_accz = 0;
//  695 
//  696     while(hw_iic_readn(0, BMA180, DATAX0, BUF, 6));
??ReadBMAsteer_0:
        MOVS     R0,#+6
        STR      R0,[SP, #+0]
        LDR.W    R3,??DataTable8_26
        MOVS     R2,#+2
        MOVS     R1,#+128
        MOVS     R0,#+0
        BL       hw_iic_readn
        CMP      R0,#+0
        BNE.N    ??ReadBMAsteer_0
//  697     Xdat = BUF[1] << 8 | BUF[0];
        LDR.W    R0,??DataTable8_26
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable8_26
        LDRB     R1,[R1, #+0]
        ORRS     R4,R1,R0, LSL #+8
//  698     Ydat = BUF[3] << 8 | BUF[2];
        LDR.W    R0,??DataTable8_26
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable8_26
        LDRB     R1,[R1, #+2]
        ORRS     R5,R1,R0, LSL #+8
//  699     Zdat = BUF[5] << 8 | BUF[4];
        LDR.W    R0,??DataTable8_26
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable8_26
        LDRB     R1,[R1, #+4]
        ORRS     R6,R1,R0, LSL #+8
//  700 
//  701     if(Time_counter <= COUNTER)
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BHI.N    ??ReadBMAsteer_1
//  702     {
//  703         sum_accx += Xdat;
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R0,R4
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_27
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable8_27
        STR      R0,[R1, #+0]
//  704         sum_accy += Ydat;
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R0,R5
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_28
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable8_28
        STR      R0,[R1, #+0]
//  705         sum_accz += Zdat;
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_29
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable8_29
        STR      R0,[R1, #+0]
//  706     }
//  707     if(Time_counter == COUNTER)
??ReadBMAsteer_1:
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BNE.N    ??ReadBMAsteer_2
//  708     {
//  709         Revise_accX = sum_accx / COUNTER;
        LDR.W    R0,??DataTable8_27
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable8_30
        STR      R0,[R1, #+0]
//  710         Revise_accY = sum_accy / COUNTER;
        LDR.W    R0,??DataTable8_28
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable8_31
        STR      R0,[R1, #+0]
//  711         Revise_accZ = sum_accz / COUNTER;
        LDR.W    R0,??DataTable8_29
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_1  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable8_32
        STR      R0,[R1, #+0]
//  712         Angle_accx0 = 0;
        LDR.W    R0,??DataTable8_33
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  713         Angle_accy0 = 0;
        LDR.W    R0,??DataTable8_34
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  714         Angle_accz0 = 0;
        LDR.W    R0,??DataTable8_35
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  715     }
//  716     if(Time_counter > COUNTER)
??ReadBMAsteer_2:
        LDR.N    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BLS.W    ??ReadBMAsteer_3
//  717     {
//  718         for(uint8 i = 1; i < count; i++)
        MOVS     R0,#+1
        B.N      ??ReadBMAsteer_4
//  719         {
//  720             xacc[i-1] = xacc[i];
??ReadBMAsteer_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable8_36
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable8_36
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  721             yacc[i-1] = yacc[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable8_37
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable8_37
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  722             zacc[i-1] = zacc[i];
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable8_38
        ADDS     R1,R1,R0, LSL #+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R2,??DataTable8_38
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, #-4]
//  723         }
        ADDS     R0,R0,#+1
??ReadBMAsteer_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+20
        BCC.N    ??ReadBMAsteer_5
//  724 
//  725         xacc[count-1] = Xdat;
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        MOVS     R0,R4
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_36
        STR      R0,[R1, #+76]
//  726         yacc[count-1] = Ydat;
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R0,R5
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_37
        STR      R0,[R1, #+76]
//  727         zacc[count-1] = Zdat;
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable8_38
        STR      R0,[R1, #+76]
//  728 
//  729         float xdata = 0, ydata = 0, zdata = 0;
        MOVS     R6,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
//  730         for(uint8 i = 0; i < count; i++)
        MOVS     R7,#+0
        B.N      ??ReadBMAsteer_6
//  731         {
//  732             xdata += xacc[i] / (float)count;
??ReadBMAsteer_7:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR.N    R0,??DataTable8_36
        LDR      R0,[R0, R7, LSL #+2]
        LDR.N    R1,??DataTable8_18  ;; 0x41a00000
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
//  733             ydata += yacc[i] / (float)count;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR.N    R0,??DataTable8_37
        LDR      R0,[R0, R7, LSL #+2]
        LDR.N    R1,??DataTable8_18  ;; 0x41a00000
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  734             zdata += zacc[i] / (float)count;
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDR.N    R0,??DataTable8_38
        LDR      R0,[R0, R7, LSL #+2]
        LDR.N    R1,??DataTable8_18  ;; 0x41a00000
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  735         }
        ADDS     R7,R7,#+1
??ReadBMAsteer_6:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+20
        BCC.N    ??ReadBMAsteer_7
//  736 
//  737         Dot_xacc0 = (xdata - Revise_accX) * 0.244 / 4000.0;
        MOVS     R0,R6
        LDR.N    R1,??DataTable8_30
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable8_19  ;; 0x5a1cac08
        LDR.N    R3,??DataTable8_20  ;; 0x3fcf3b64
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable8_21  ;; 0x40af4000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable8_39
        STR      R0,[R1, #+0]
//  738         //if(Dot_xacc > 0 ) Dot_xacc /= 1.025;
//  739         //else Dot_xacc /= 0.945;
//  740         Dot_yacc0 = (ydata - Revise_accY) * 0.244 / 4000.0;
        MOVS     R0,R4
        LDR.N    R1,??DataTable8_31
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable8_19  ;; 0x5a1cac08
        LDR.N    R3,??DataTable8_20  ;; 0x3fcf3b64
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable8_21  ;; 0x40af4000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable8_40
        STR      R0,[R1, #+0]
//  741         //if(Dot_yacc > 0)Dot_yacc /= 0.982;
//  742         Dot_zacc0 = (zdata - (Revise_accZ - 16393)) * 0.244 / 4000.0;
        LDR.N    R0,??DataTable8_32
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable8_24  ;; 0xc6801200
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable8_19  ;; 0x5a1cac08
        LDR.N    R3,??DataTable8_20  ;; 0x3fcf3b64
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable8_21  ;; 0x40af4000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable8_41
        STR      R0,[R1, #+0]
//  743     }
//  744 }
??ReadBMAsteer_3:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     Time_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x447a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     ??Revise_gyroX_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     Dot_gyro_x

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??xacc_1:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??yacc_1:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??zacc_1:
        DS8 80

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_accX_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_accY_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_accZ_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??sum_accx_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??sum_accy_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??sum_accz_1:
        DS8 4
//  745 
//  746 
//  747 
//  748 //************³õÊ¼»¯L3G4200D*********************************
//  749 //void Init_L3G4200D(void)
//  750 //{
//  751 //    Delay_ms(1);
//  752 //    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG1, 0x0f));
//  753 //    Delay_ms(1);
//  754 //    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG2, 0x00));
//  755 //    Delay_ms(1);
//  756 //    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG3, 0x08));
//  757 //    Delay_ms(1);
//  758 //    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG4, 0x00));	//+-250dps
//  759 //    Delay_ms(1);
//  760 //    while(hw_iic_write1(0, L3G4200_Addr, CTRL_REG5, 0x00));
//  761 //    Delay_ms(1);
//  762 //}
//  763 
//  764 //******¶ÁÈ¡ÍÓÂÝÒÇL3G4200DÊý¾Ý****************************************
//  765 //void read_L3G4200D(void)
//  766 //{
//  767 //    //char txtbuf[22];
//  768 //    float temp_dotgyrox, temp_dotgyroy, temp_dotgyroz;
//  769 //    static float Revise_gyroX = 0, Revise_gyroY = 0, Revise_gyroZ = 0;
//  770 //    while(hw_iic_readn(0, L3G4200_Addr, OUT_X_L, BUF, 6));
//  771 //
//  772 //    T_X =	(BUF[1] << 8) | BUF[0];
//  773 //    T_Y =	-((BUF[3] << 8) | BUF[2]);
//  774 //    T_Z =	(BUF[5] << 8) | BUF[4];
//  775 //
//  776 //    Dot_gyro_x = (float)T_X * 8.75 / 1000 - Revise_gyroX / T * 1000;
//  777 //    Dot_gyro_y = (float)T_Y * 8.75 / 1000 - Revise_gyroY / T * 1000;
//  778 //    Dot_gyro_z = (float)T_Z * 8.75 / 1000 - Revise_gyroZ / T * 1000;
//  779 //
//  780 //    temp_dotgyrox = Dot_gyro_x  / 57.3;
//  781 //    temp_dotgyroy = -Dot_gyro_y / 57.3;
//  782 //    temp_dotgyroz = Dot_gyro_z /  57.3;
//  783 //    Dot_xgyro = (temp_dotgyrox + Dot_xgyro) / 2.0;
//  784 //    Dot_ygyro = (temp_dotgyroy + Dot_ygyro) / 2.0;
//  785 //    Dot_zgyro = (temp_dotgyroz + Dot_zgyro) / 2.0;
//  786 //    // Angle_gyrox = GyroIntegral(Angle_gyrox,Dot_gyro_x );
//  787 //    // Angle_gyroy = GyroIntegral(Angle_gyroy,Dot_gyro_y );
//  788 //    // Angle_gyroz = GyroIntegral(Angle_gyroz,Dot_gyro_z );
//  789 //
//  790 //    Angle_gyrox += Dot_gyro_x * T / 1000 ;
//  791 //    Angle_gyroy += Dot_gyro_y * T / 1000 ;
//  792 //    Angle_gyroz += Dot_gyro_z * T / 1000 ;
//  793 //
//  794 //    //////////////////////////ÐÞÕý0µã£¬¶ÁCOUNTER´ÎÈ»ºóÈ¡Æ½¾ù////////////////////////////
//  795 //    if(Time_counter == COUNTER)
//  796 //    {
//  797 //        Revise_gyroX = Angle_gyrox / COUNTER ;
//  798 //        Revise_gyroY = Angle_gyroy / COUNTER ;
//  799 //        Revise_gyroZ = Angle_gyroz / COUNTER ;
//  800 //        Angle_gyrox = 0;
//  801 //        Angle_gyroy = 0;
//  802 //        Angle_gyroz = 0;
//  803 //    }
//  804 //}
//  805 //***************************
//  806 
//  807 //void  Init_ADXL345(void)
//  808 //{
//  809 //    Delay_ms(1);
//  810 //    // while(hw_iic_write1(0,ADXL345_Addr,0x31,0x0B));   //²âÁ¿·¶Î§,Õý¸º16g£¬13Î»Ä£Ê½ 1000 2g
//  811 //    while(hw_iic_write1(0, ADXL345_Addr, 0x31, 0x08)); //²âÁ¿·¶Î§,Õý¸º2g£¬13Î»Ä£Ê½ 1000 2g
//  812 //    Delay_ms(1);
//  813 //    while(hw_iic_write1(0, ADXL345_Addr, 0x2C, 0x08)); //ËÙÂÊÉè¶¨Îª100hz ²Î¿¼pdf13Ò³
//  814 //    Delay_ms(1);
//  815 //    while(hw_iic_write1(0, ADXL345_Addr, 0x2D, 0x08)); //Ñ¡ÔñµçÔ´Ä£Ê½   ²Î¿¼pdf24Ò³
//  816 //    Delay_ms(1);
//  817 //    while(hw_iic_write1(0, ADXL345_Addr, 0x2E, 0x80)); //Ê¹ÄÜ DATA_READY ÖÐ¶Ï
//  818 //    Delay_ms(1);
//  819 //    while(hw_iic_write1(0, ADXL345_Addr, 0x1E, 0x00)); //X Æ«ÒÆÁ¿ ¸ù¾Ý²âÊÔ´«¸ÐÆ÷µÄ×´Ì¬Ð´Èëpdf29Ò³
//  820 //    Delay_ms(1);
//  821 //    while(hw_iic_write1(0, ADXL345_Addr, 0x1F, 0x00)); //Y Æ«ÒÆÁ¿ ¸ù¾Ý²âÊÔ´«¸ÐÆ÷µÄ×´Ì¬Ð´Èëpdf29Ò³
//  822 //    Delay_ms(1);
//  823 //    while(hw_iic_write1(0, ADXL345_Addr, 0x20, 0x00)); //Z Æ«ÒÆÁ¿ ¸ù¾Ý²âÊÔ´«¸ÐÆ÷µÄ×´Ì¬Ð´Èëpdf29Ò³
//  824 //    Delay_ms(1);
//  825 //}
//  826 //
//  827 //void read_ADXL345(void)
//  828 //{
//  829 //    // char txtbuf[22];
//  830 //    float X0 = 0, Y0 = 0, Z0 = 0;
//  831 //    static float Revise_accX = 0, Revise_accY = 0, Revise_accZ = 0;
//  832 //    static float sum_accx = 0, sum_accy = 0, sum_accz = 0;
//  833 //    static float sum_dotx = 0, sum_doty = 0, sum_dotz = 0;
//  834 //    static float Revise_dotX = 0, Revise_dotY = 0, Revise_dotZ = 0;
//  835 //    //int high = 0;
//  836 //
//  837 //    while(hw_iic_readn(0, ADXL345_Addr, 0x32, BUF, 6));
//  838 //    A_X = (BUF[1] << 8) + BUF[0]; //ºÏ³ÉÊý¾Ý
//  839 //    A_Y = (BUF[3] << 8) + BUF[2]; //ºÏ³ÉÊý¾Ý
//  840 //    A_Z = (BUF[5] << 8) + BUF[4]; //ºÏ³ÉÊý¾Ý
//  841 //
//  842 //    Dot_xacc = (float)A_X * 3.9 / 1000 - Revise_dotX;//
//  843 //    Dot_yacc = (float)A_Y * 3.9 / 1000  - Revise_dotY; //
//  844 //    Dot_zacc = (float)A_Z * 3.9 / 1000;
//  845 //
//  846 //
//  847 //    X0 = (float)A_X * 0.49;
//  848 //    Y0 = (float)A_Y * 0.49;
//  849 //    Z0 = -(float)A_Z * 0.49;
//  850 //
//  851 //
//  852 //    //Roll = (float)((atan2(K,Q)*180)/3.14159265 + 90);   //XÖá½Ç¶ÈÖµ ¹ö×ª½Ç
//  853 //    //Pitch = (float)((atan2(K,R)*180)/3.14159265 + 90);  //YÖá½Ç¶ÈÖµ ¸©Ñö½Ç
//  854 //    //Yaw = (float)((atan2(R,Q)*180)/3.14159265 + 90);  //ZÖá½Ç¶¼Öµ Æ«º½½Ç Ë³Ê±Õë+
//  855 //    Angle_accx = atan2(X0, SquareRootFloat(Y0 * Y0 + Z0 * Z0)) * 57.3 - Revise_accX;
//  856 //    Angle_accy = atan2(Y0, SquareRootFloat(X0 * X0 + Z0 * Z0)) * 57.3 - Revise_accY;
//  857 //    Angle_accz = -(atan2(Z0, SquareRootFloat(X0 * X0 + Y0 * Y0)) * 57.3 + 90 + Revise_accZ);
//  858 //    //////////////////////////ÐÞÕý0µã£¬¶ÁCOUNTER´ÎÈ»ºóÈ¡Æ½¾ù////////////////////////////
//  859 //    if(Time_counter <= COUNTER)
//  860 //    {
//  861 //        sum_accx += Angle_accx;
//  862 //        sum_accy += Angle_accy;
//  863 //        sum_accz += Angle_accz;
//  864 //
//  865 //        sum_dotx += Dot_xacc;
//  866 //        sum_doty += Dot_yacc;
//  867 //        sum_dotz += Dot_zacc;
//  868 //    }
//  869 //    if(Time_counter == COUNTER)
//  870 //    {
//  871 //        Revise_accX = sum_accx / COUNTER;
//  872 //        Revise_accY = sum_accy / COUNTER;
//  873 //        Revise_accZ = sum_accz / COUNTER;
//  874 //
//  875 //        Revise_dotX = sum_dotx / COUNTER;
//  876 //        Revise_dotY = sum_doty / COUNTER;
//  877 //        Revise_dotZ = sum_dotz / COUNTER;
//  878 //
//  879 //        Angle_accx = 0;
//  880 //        Angle_accy = 0;
//  881 //        Angle_accz = 0;
//  882 //    }
//  883 //}
//  884 
//  885 
//  886 //void GyroRead(void)
//  887 //{
//  888 //    static float x[3] = {0};
//  889 //    static float y[3] = {0};
//  890 //    static float z[3] = {0};
//  891 //    x[0] = x[1];
//  892 //    x[1] = x[2];
//  893 //    x[2] = Dot_gyro_x;
//  894 //    y[0] = y[1];
//  895 //    y[1] = y[2];
//  896 //    y[2] = Dot_gyro_y;
//  897 //    z[0] = z[1];
//  898 //    z[1] = z[2];
//  899 //    z[2] = Dot_gyro_z;
//  900 //
//  901 //
//  902 //    dot_GyroRol = (x[0] + x[1] + x[2]) / 3.0;
//  903 //    dot_GyroPit = (y[0] + y[1] + y[2]) / 3.0;
//  904 //    dot_GyroYaw = (z[0] + z[1] + z[2]) / 3.0;
//  905 //
//  906 //    //Middle value filter
//  907 //    //ÖÐÖµÂË²¨
//  908 //    GyroRolBuf[WARP(GyroRolIdx)] = dot_GyroRol;
//  909 //    GyroPitBuf[WARP(GyroPitIdx)] = dot_GyroPit;
//  910 //    GyroYawBuf[WARP(GyroYawIdx)] = dot_GyroYaw;
//  911 //
//  912 //    dot_GyroRol = Filter(GyroRolBuf);
//  913 //    dot_GyroPit = Filter(GyroPitBuf);
//  914 //    dot_GyroYaw = Filter(GyroYawBuf);
//  915 //    //    Dot_xgyro = dot_GyroRol;
//  916 //    //    Dot_ygyro = dot_GyroPit;
//  917 //    //    Dot_zgyro = dot_GyroYaw;
//  918 //    //GyroRol += dot_GyroRol * T / 1000 ;
//  919 //    //GyroPit += dot_GyroPit * T / 1000 ;
//  920 //    //GyroYaw += dot_GyroYaw * T / 1000 ;
//  921 //}
//  922 
//  923 //###############################################
//  924 //
//  925 //   Soft filter
//  926 //   Èí¼þÂË²¨Æ÷
//  927 //

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  928 float Filter(float *value)
//  929 {
Filter:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
//  930 #if 0		   //ÖÐÖµÂË²¨
//  931     bool swap;
//  932     uchar i;
//  933     do
//  934     {
//  935         swap = 0;
//  936         for(i = 1; i < FILTERNUM; i++)
//  937         {
//  938             if(value[i-1] > value[i])
//  939             {
//  940                 int t = value[i-1];
//  941                 value[i-1] = value[i];
//  942                 value[i] = t;
//  943                 swap = 1;
//  944             }
//  945         }
//  946     }
//  947     while(swap);
//  948 
//  949     return value[FILTERNUM/2];
//  950 #else	   //»¬¶¯´°¿ÚÂË²¨
//  951     uint8 i;
//  952     int vs = 0;
        MOVS     R0,#+0
//  953     for(i = 0; i < FILTERNUM; i++)
        MOVS     R5,#+0
        B.N      ??Filter_0
//  954     {
//  955         vs += value[i];
??Filter_1:
        BL       __aeabi_i2f
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR      R1,[R4, R5, LSL #+2]
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
//  956     }
        ADDS     R5,R5,#+1
??Filter_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+4
        BCC.N    ??Filter_1
//  957     return vs / FILTERNUM;
        MOVS     R1,#+4
        SDIV     R0,R0,R1
        BL       __aeabi_i2f
        POP      {R4,R5,PC}       ;; return
//  958 #endif
//  959 }
//  960 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  961 int get_mid(int a, int b, int c)
//  962 {
//  963     int x = 0;
get_mid:
        MOVS     R3,#+0
//  964     if(a > b)
        CMP      R1,R0
        BGE.N    ??get_mid_0
//  965     {
//  966         x = b;
        MOVS     R3,R1
//  967         b = a;
        MOVS     R1,R0
//  968         a = x;
        MOVS     R0,R3
//  969     }
//  970     if(b > c)
??get_mid_0:
        CMP      R2,R1
        BGE.N    ??get_mid_1
//  971     {
//  972         x = c;
        MOVS     R3,R2
//  973         c = b;
        MOVS     R2,R1
//  974         b = x;
        MOVS     R1,R3
//  975     }
//  976     if(a > b)
??get_mid_1:
        CMP      R1,R0
        BGE.N    ??get_mid_2
//  977     {
//  978         x = b;
        MOVS     R3,R1
//  979         b = a;
        MOVS     R1,R0
//  980         a = x;
        MOVS     R0,R3
//  981     }
//  982     return b ;
??get_mid_2:
        MOVS     R0,R1
        BX       LR               ;; return
//  983 }
//  984 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  985 void ReadANDS3080()
//  986 {
ReadANDS3080:
        PUSH     {R4-R6,LR}
//  987     uint8 temp = 0;
        MOVS     R6,#+0
//  988     double temp0 = 0;
        MOVS     R4,#+0
        MOVS     R5,#+0
//  989     //static double sumX = 0;
//  990     //static double sumY = 0;
//  991     DeltX = 0;
        LDR.N    R0,??DataTable8_42
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  992     DeltY = 0;
        LDR.N    R0,??DataTable8_43
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  993     if(High <= (BaseHeight + 10))
        LDR.N    R0,??DataTable8_44
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable8_45
        LDR      R1,[R1, #+0]
        BL       __aeabi_cfrcmple
        BHI.N    ??ReadANDS3080_0
//  994     {
//  995         WriteByte(0x12, 0x00); //Motion clear
        MOVS     R1,#+0
        MOVS     R0,#+18
        BL       WriteByte
        B.N      ??ReadANDS3080_1
//  996     }
//  997     else
//  998     {
//  999         temp = ReadByte(0x02);
??ReadANDS3080_0:
        MOVS     R0,#+2
        BL       ReadByte
        MOVS     R6,R0
// 1000         if((temp & 0X80) != 0)
        LSLS     R0,R6,#+24
        BPL.N    ??ReadANDS3080_1
// 1001         {
// 1002            
// 1003             DeltY = ReadByte(0x04);
        MOVS     R0,#+4
        BL       ReadByte
        LDR.N    R1,??DataTable8_43
        STRB     R0,[R1, #+0]
// 1004             DeltX = ReadByte(0x03);
        MOVS     R0,#+3
        BL       ReadByte
        LDR.N    R1,??DataTable8_42
        STRB     R0,[R1, #+0]
// 1005             //s = ReadByte(0x05);
// 1006             temp0 = DeltX;
        LDR.N    R0,??DataTable8_42
        LDRSB    R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
// 1007             temp0 = temp0 * High * 0.3 / 58.2;
        LDR.N    R0,??DataTable8_45
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable8_46  ;; 0x3fd33333
        BL       __aeabi_dmul
        LDR.N    R2,??DataTable8_47  ;; 0x9999999a
        LDR.N    R3,??DataTable8_48  ;; 0x404d1999
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
// 1008            // sumX += temp0;
// 1009            // SumDeltX = sumX -  High * tan(Angle_X / 57.3);
// 1010             SumDeltX += temp0;
        LDR.N    R2,??DataTable8_49
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        LDR.N    R2,??DataTable8_49
        STRD     R0,R1,[R2, #+0]
// 1011             
// 1012             temp0 = DeltY;
        LDR.N    R0,??DataTable8_43
        LDRSB    R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
// 1013             temp0 = temp0 * High * 0.3 / 58.2;
        LDR.N    R0,??DataTable8_45
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable8_46  ;; 0x3fd33333
        BL       __aeabi_dmul
        LDR.N    R2,??DataTable8_47  ;; 0x9999999a
        LDR.N    R3,??DataTable8_48  ;; 0x404d1999
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
// 1014             //sumY += temp0;
// 1015            // SumDeltY = sumY -  High * tan(Angle_Y / 57.3);
// 1016             SumDeltY += temp0;
        LDR.N    R2,??DataTable8_50
        LDRD     R0,R1,[R2, #+0]
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        LDR.N    R2,??DataTable8_50
        STRD     R0,R1,[R2, #+0]
// 1017         }
// 1018     }
// 1019 }
??ReadANDS3080_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     Angle_gyroz0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     ??Revise_gyroY_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     Dot_gyro_y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     ??Revise_gyroZ_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     Dot_gyro_z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     ??dotx_gyro_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     ??doty_gyro_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     ??dotz_gyro_1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// 1020 void writeDataToMemory(float xpos,float ypos ,float high)
// 1021 {   
writeDataToMemory:
        PUSH     {R4-R7,LR}
        MOVS     R6,R0
        MOVS     R4,R1
        MOVS     R7,R2
// 1022     const uint8 interval = 8; //sampling interval
        MOVS     R5,#+8
// 1023     static float count1 = 0;
// 1024    
// 1025     if (count1 * T < 4000.0)count1++; // discard the first four seconds datas
        LDR.N    R0,??DataTable8_51
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable8_52  ;; 0x40040000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable8_21  ;; 0x40af4000
        BL       __aeabi_cdcmple
        BCS.N    ??writeDataToMemory_0
        LDR.N    R0,??DataTable8_51
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable8_51
        STR      R0,[R1, #+0]
        B.N      ??writeDataToMemory_1
// 1026     else
// 1027     {
// 1028         if(Time_counter % interval == 0 && dataLencounter < DataLength )
??writeDataToMemory_0:
        LDR.N    R0,??DataTable8_53
        LDR      R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UDIV     R1,R0,R5
        MLS      R0,R5,R1,R0
        CMP      R0,#+0
        BNE.N    ??writeDataToMemory_1
        LDR.N    R0,??DataTable8_54
        LDR      R0,[R0, #+0]
        MOVW     R1,#+6000
        CMP      R0,R1
        BGE.N    ??writeDataToMemory_1
// 1029         {
// 1030        
// 1031            dataLencounter++;
        LDR.N    R0,??DataTable8_54
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable8_54
        STR      R0,[R1, #+0]
// 1032             *px = xpos;
        LDR.N    R0,??DataTable8_55
        LDR      R0,[R0, #+0]
        STR      R6,[R0, #+0]
// 1033             px++;
        LDR.N    R0,??DataTable8_55
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+4
        LDR.N    R1,??DataTable8_55
        STR      R0,[R1, #+0]
// 1034             
// 1035             *py = ypos;
        LDR.N    R0,??DataTable8_56
        LDR      R0,[R0, #+0]
        STR      R4,[R0, #+0]
// 1036             py++;
        LDR.N    R0,??DataTable8_56
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+4
        LDR.N    R1,??DataTable8_56
        STR      R0,[R1, #+0]
// 1037             
// 1038             *pz = high;
        LDR.N    R0,??DataTable8_57
        LDR      R0,[R0, #+0]
        STR      R7,[R0, #+0]
// 1039             pz++;
        LDR.N    R0,??DataTable8_57
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+4
        LDR.N    R1,??DataTable8_57
        STR      R0,[R1, #+0]
// 1040         }
// 1041 
// 1042     }
// 1043 }
??writeDataToMemory_1:
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     Dot_xgyro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     Dot_ygyro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     Dot_zgyro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     Angle_gyrox

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     Angle_gyroy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     Angle_gyroz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     ??sum_accx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     ??sum_accy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     ??sum_accz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     ??Revise_accX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     ??Revise_accY

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     ??Revise_accZ

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     Angle_accx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     Angle_accy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_14:
        DC32     Angle_accz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_15:
        DC32     ??xacc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_16:
        DC32     ??yacc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_17:
        DC32     ??zacc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_18:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_19:
        DC32     0x5a1cac08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_20:
        DC32     0x3fcf3b64

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_21:
        DC32     0x40af4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_22:
        DC32     Dot_xacc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_23:
        DC32     Dot_yacc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_24:
        DC32     0xc6801200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_25:
        DC32     Dot_zacc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_26:
        DC32     BUF

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_27:
        DC32     ??sum_accx_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_28:
        DC32     ??sum_accy_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_29:
        DC32     ??sum_accz_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_30:
        DC32     ??Revise_accX_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_31:
        DC32     ??Revise_accY_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_32:
        DC32     ??Revise_accZ_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_33:
        DC32     Angle_accx0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_34:
        DC32     Angle_accy0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_35:
        DC32     Angle_accz0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_36:
        DC32     ??xacc_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_37:
        DC32     ??yacc_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_38:
        DC32     ??zacc_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_39:
        DC32     Dot_xacc0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_40:
        DC32     Dot_yacc0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_41:
        DC32     Dot_zacc0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_42:
        DC32     DeltX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_43:
        DC32     DeltY

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_44:
        DC32     BaseHeight

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_45:
        DC32     `High`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_46:
        DC32     0x3fd33333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_47:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_48:
        DC32     0x404d1999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_49:
        DC32     SumDeltX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_50:
        DC32     SumDeltY

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_51:
        DC32     ??count1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_52:
        DC32     0x40040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_53:
        DC32     Time_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_54:
        DC32     dataLencounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_55:
        DC32     px

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_56:
        DC32     py

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_57:
        DC32     pz

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??count1:
        DS8 4

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 1044 /*************½áÊø***************/
// 
//   964 bytes in section .bss
// 5 206 bytes in section .text
// 
// 5 206 bytes of CODE memory
//   964 bytes of DATA memory
//
//Errors: none
//Warnings: none
