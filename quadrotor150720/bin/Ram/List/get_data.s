///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:14 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\Component_C\get_data.c              /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\Component_C\get_data.c" -D IAR -D  /
//                    TWR_K60N512 -lCN "C:\Documents and                      /
//                    Settings\Administrator\iar\Myproject\428IIC\bin\Ram\Lis /
//                    t\" -lB "C:\Documents and Settings\Administrator\iar\My /
//                    project\428IIC\bin\Ram\List\" -o "C:\Documents and      /
//                    Settings\Administrator\iar\Myproject\428IIC\bin\Ram\Obj /
//                    \" --no_cse --no_unroll --no_inline --no_code_motion    /
//                    --no_tbaa --no_clustering --no_scheduling --debug       /
//                    --endian=little --cpu=Cortex-M4 -e --fpu=None           /
//                    --dlib_config "D:\IAR Systems\Embedded Workbench        /
//                    6.0\arm\INC\c\DLib_Config_Normal.h" -I "C:\Documents    /
//                    and Settings\Administrator\iar\Myproject\428IIC\src\Sou /
//                    rces\H\" -I "C:\Documents and                           /
//                    Settings\Administrator\iar\Myproject\428IIC\src\Sources /
//                    \H\Component_H\" -I "C:\Documents and                   /
//                    Settings\Administrator\iar\Myproject\428IIC\src\Sources /
//                    \H\Frame_H\" -Ol --use_c++_inline                       /
//    List file    =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\bin\Ram\List\get_data.s                           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME get_data

        EXTERN Delayms
        EXTERN Time_counter
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2uiz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN atan2
        EXTERN hw_gpio_set
        EXTERN hw_iic_read1
        EXTERN hw_iic_readn
        EXTERN hw_iic_write1

        PUBLIC A_X
        PUBLIC A_Y
        PUBLIC A_Z
        PUBLIC Angle_accx
        PUBLIC Angle_accy
        PUBLIC Angle_accz
        PUBLIC Angle_gyrox
        PUBLIC Angle_gyroy
        PUBLIC Angle_gyroz
        PUBLIC BUF
        PUBLIC Delay_Nms
        PUBLIC Dot_gyro_x
        PUBLIC Dot_gyro_y
        PUBLIC Dot_gyro_z
        PUBLIC Init_ADXL345
        PUBLIC Init_L3G4200D
        PUBLIC SquareRootFloat
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
        PUBLIC bmp085ReadPressure
        PUBLIC bmp085ReadTemp
        PUBLIC data_xyz
        PUBLIC mb
        PUBLIC mc
        PUBLIC md
        PUBLIC pressure
        PUBLIC putstr
        PUBLIC read_ADXL345
        PUBLIC read_BMP085
        PUBLIC read_L3G4200D
        PUBLIC temperature
        PUBLIC test
        PUBLIC uart_putchar

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\Component_C\get_data.c
//    1 #include  <math.h>    //Keil library  
//    2 #include "get_data.h"
//    3 #include  "hw_i2c.h"
//    4 #include  "uart.h"
//    5 #include  "stdio.h"
//    6 #include  "pit.h"
//    7 #include "Balance_Kalman.h"
//    8 #include "isr.h"
//    9 #include "hw_gpio.h"
//   10 
//   11 #define   OSS 0	 //	BMP085使用
//   12 
//   13 //定义器件在IIC总线中的从地址,根据ALT  ADDRESS地址引脚不同修改
//   14 #define	HMC5883L_Addr   0x3C	//磁场传感器器件地址
//   15 #define	ADXL345_Addr    0xA6	//加速度传感器器件地址
//   16 #define	BMP085_Addr     0xee	//气压传感器器件地址
//   17 #define	L3G4200_Addr    0xD2	//陀螺仪传感器器件地址
//   18 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 unsigned char BUF[6];                         //接收数据缓存区
BUF:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   20 char  test=0; 
test:
        DS8 1
//   21 //int   x,y;
//   22 //float angle;

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   23 short A_X,A_Y,A_Z;
A_X:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
A_Y:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
A_Z:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   24 short T_X,T_Y,T_Z;
T_X:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
T_Y:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
T_Z:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 short data_xyz[3];
data_xyz:
        DS8 8
//   26 //float Roll,Pitch,Q,T,K;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 float Angle_accx = 0,Angle_accy = 0,Angle_accz = 0;
Angle_accx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_accy:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_accz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 float Dot_gyro_x = 0,Dot_gyro_y = 0,Dot_gyro_z = 0;
Dot_gyro_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_gyro_y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Dot_gyro_z:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 float Angle_gyrox = 0,Angle_gyroy = 0,Angle_gyroz = 0;
Angle_gyrox:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_gyroy:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_gyroz:
        DS8 4
//   30 //***BMP085使用

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   31 short ac1;
ac1:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   32 short ac2; 
ac2:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   33 short ac3; 
ac3:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   34 unsigned short ac4;
ac4:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   35 unsigned short ac5;
ac5:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   36 unsigned short ac6;
ac6:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   37 short b1; 
b1:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   38 short b2;
b2:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   39 short mb;
mb:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   40 short mc;
mc:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   41 short md;
md:
        DS8 2
//   42 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   43 long  temperature;
temperature:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   44 long  pressure;
pressure:
        DS8 4
//   45 
//   46 /********卡马克方法求算术平方根*********/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   47 float SquareRootFloat(float number)
//   48 { 
SquareRootFloat:
        PUSH     {R4-R7,LR}
        MOVS     R4,R0
//   49   long i;    
//   50   float x, y;    
//   51   const float f = 1.5F;    
        MOVS     R7,#+1069547520
//   52   x = number * 0.5F;    
        MOVS     R0,#+1056964608
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R6,R0
//   53   y  = number;    
        MOVS     R5,R4
//   54   i  = * ( long * ) &y;    
//   55   i  = 0x5f3759df - ( i >> 1 );        //注意这一行    
        LDR.W    R0,??DataTable4  ;; 0x5f3759df
        SUBS     R5,R0,R5, ASR #+1
//   56   y  = * ( float * ) &i;    
//   57   y  = y * ( f - ( x * y * y ) );    
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
//   58   y  = y * ( f - ( x * y * y ) );    
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
//   59   return number * y;
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_fmul
        POP      {R4-R7,PC}       ;; return
//   60 }
//   61 //============================================================================
//   62 //函数名称：Delay_Nms                                                        
//   63 //功能概要：延时ms。                                                
//   64 //参数说明：N为延时的时间单位ms                                                         
//   65 //函数返回：无                                                                  
//   66 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 void Delay_Nms(float N)
//   68 {uint32 i = 24000;
Delay_Nms:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVW     R0,#+24000
//   69  i = i * N;
        BL       __aeabi_ui2f
        MOVS     R1,R4
        BL       __aeabi_fmul
        BL       __aeabi_f2uiz
        B.N      ??Delay_Nms_0
//   70  while(i>0)i--;
??Delay_Nms_1:
        SUBS     R0,R0,#+1
??Delay_Nms_0:
        CMP      R0,#+0
        BNE.N    ??Delay_Nms_1
//   71 }
        POP      {R4,PC}          ;; return
//   72 ////////////////////////////////////////////////////////////////////////////////

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   73 void uart_putchar(unsigned char data)
//   74 {
//   75     while(!(UART1_S1&UART_S1_TDRE_MASK));//等待发送缓冲区空
uart_putchar:
??uart_putchar_0:
        LDR.W    R1,??DataTable4_1  ;; 0x4006b004
        LDRB     R1,[R1, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??uart_putchar_0
//   76     UART1_D=data; 
        LDR.W    R1,??DataTable4_2  ;; 0x4006b007
        STRB     R0,[R1, #+0]
//   77 }
        BX       LR               ;; return
//   78 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   79 void putstr(char ch[])
//   80 {
putstr:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   81 	unsigned char ptr=0;
        MOVS     R5,#+0
        B.N      ??putstr_0
//   82 	while(ch[ptr])
//   83 	{
//   84 	  uart_putchar((unsigned char)ch[ptr++]);
??putstr_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R4]
        BL       uart_putchar
        ADDS     R5,R5,#+1
//   85     }   
??putstr_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R4]
        CMP      R0,#+0
        BNE.N    ??putstr_1
//   86 }
        POP      {R0,R4,R5,PC}    ;; return
//   87 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   88 long bmp085ReadTemp(void)
//   89 {       uint8  temp_ut_l=0,temp_ut_h=0;
bmp085ReadTemp:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//   90         uint16 temp_ut;
//   91           
//   92 	hw_iic_write1(0,BMP085_Addr,0xF4,0x2E);
        MOVS     R3,#+46
        MOVS     R2,#+244
        MOVS     R1,#+238
        MOVS     R0,#+0
        BL       hw_iic_write1
//   93 	Delayms(5);	// max time is 4.5ms
        MOVS     R0,#+5
        BL       Delayms
//   94         hw_iic_read1(0,BMP085_Addr,0xF6,&temp_ut_h);
        ADD      R3,SP,#+0
        MOVS     R2,#+246
        MOVS     R1,#+238
        MOVS     R0,#+0
        BL       hw_iic_read1
//   95 	hw_iic_read1(0,BMP085_Addr,0xF6,&temp_ut_l);
        ADD      R3,SP,#+1
        MOVS     R2,#+246
        MOVS     R1,#+238
        MOVS     R0,#+0
        BL       hw_iic_read1
//   96         temp_ut = temp_ut_h ;	
        LDRB     R0,[SP, #+0]
//   97         temp_ut = (temp_ut<<8) | temp_ut_l ;		
        LDRB     R1,[SP, #+1]
        ORRS     R0,R1,R0, LSL #+8
//   98 	return  temp_ut ;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,PC}          ;; return
//   99 }
//  100 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  101 long bmp085ReadPressure(void)
//  102 {
bmp085ReadPressure:
        PUSH     {R7,LR}
//  103 	uint8  pressure_l,pressure_h;
//  104         uint32 pressure;
//  105 	hw_iic_write1(0,BMP085_Addr,0xF4,0x34);
        MOVS     R3,#+52
        MOVS     R2,#+244
        MOVS     R1,#+238
        MOVS     R0,#+0
        BL       hw_iic_write1
//  106 	Delayms(5);	// max time is 4.5ms
        MOVS     R0,#+5
        BL       Delayms
//  107 	hw_iic_read1(0,BMP085_Addr,0xF6,&pressure_h);
        ADD      R3,SP,#+0
        MOVS     R2,#+246
        MOVS     R1,#+238
        MOVS     R0,#+0
        BL       hw_iic_read1
//  108         hw_iic_read1(0,BMP085_Addr,0xF6,&pressure_l);
        ADD      R3,SP,#+1
        MOVS     R2,#+246
        MOVS     R1,#+238
        MOVS     R0,#+0
        BL       hw_iic_read1
//  109 	pressure = pressure_h;
        LDRB     R0,[SP, #+0]
//  110         pressure = (pressure<<8)| pressure_l;		
        LDRB     R1,[SP, #+1]
        ORRS     R0,R1,R0, LSL #+8
//  111 	pressure &= 0x0000FFFF;	
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
//  112 	return pressure;	
        POP      {R1,PC}          ;; return
//  113 }
//  114 
//  115 
//  116 /*
//  117 void read_hmc5883l(void)
//  118 {
//  119        hw_iic_write1(0,HMC5883L_Addr,0x00,0x14);   //
//  120        hw_iic_write1(0,HMC5883L_Addr,0x02,0x00);   //
//  121   	   Delayms(10);
//  122 
//  123        BUF[1]=hw_iic_read1(0,HMC5883L_Addr,0x03);//OUT_X_L_A
//  124        BUF[2]=hw_iic_read1(HMC5883L_Addr,0x04);//OUT_X_H_A
//  125 
//  126        BUF[3]=hw_iic_read1(HMC5883L_Addr,0x07);//OUT_Y_L_A
//  127        BUF[4]=hw_iic_read1(HMC5883L_Addr,0x08);//OUT_Y_H_A
//  128 
//  129        x=(BUF[1] << 8) | BUF[2]; //Combine MSB and LSB of X Data output register
//  130        y=(BUF[3] << 8) | BUF[4]; //Combine MSB and LSB of Z Data output register
//  131 
//  132        if(x>0x7fff)x-=0xffff;	  
//  133        if(y>0x7fff)y-=0xffff;	  
//  134        angle= atan2(y,x) * (180 / 3.14159265) + 180; // angle in degrees
//  135 }
//  136 */
//  137 //****************************************
//  138 
//  139 //*****************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  140 void read_BMP085(void)
//  141 {
read_BMP085:
        PUSH     {R4,LR}
//  142 
//  143    	long ut;
//  144 	long up;
//  145 	long x1, x2, b5, b6, x3, b3, p;
//  146 	unsigned long b4, b7;
//  147 
//  148 	ut = bmp085ReadTemp();	   // 读取温度
        BL       bmp085ReadTemp
        MOVS     R4,R0
//  149 //	ut = bmp085ReadTemp();	   // 读取温度
//  150 	up = bmp085ReadPressure();  // 读取压强
        BL       bmp085ReadPressure
//  151 //	up = bmp085ReadPressure();  // 读取压强
//  152 	x1 = ((long)ut - ac6) * ac5 >> 15;
        LDR.W    R1,??DataTable4_3
        LDRH     R1,[R1, #+0]
        SUBS     R1,R4,R1
        LDR.W    R2,??DataTable4_4
        LDRH     R2,[R2, #+0]
        MULS     R1,R2,R1
        ASRS     R1,R1,#+15
//  153 	x2 = ((long) mc << 11) / (x1 + md);
        LDR.W    R2,??DataTable4_5
        LDRSH    R2,[R2, #+0]
        LSLS     R2,R2,#+11
        LDR.W    R3,??DataTable4_6
        LDRSH    R3,[R3, #+0]
        SXTAH    R3,R1,R3
        SDIV     R4,R2,R3
//  154 	b5 = x1 + x2;
        ADDS     R1,R4,R1
//  155 	temperature = (b5 + 8) >> 4;
        ADDS     R2,R1,#+8
        ASRS     R2,R2,#+4
        LDR.W    R3,??DataTable4_7
        STR      R2,[R3, #+0]
//  156 	
//  157 	 //****************
//  158 
//  159 	b6 = b5 - 4000;
        SUBS     R2,R1,#+4000
//  160 	x1 = (b2 * (b6 * b6 >> 12)) >> 11;
        LDR.W    R1,??DataTable4_8
        LDRSH    R1,[R1, #+0]
        MUL      R3,R2,R2
        ASRS     R3,R3,#+12
        MULS     R1,R3,R1
        ASRS     R1,R1,#+11
//  161 	x2 = ac2 * b6 >> 11;
        LDR.W    R3,??DataTable4_9
        LDRSH    R3,[R3, #+0]
        MULS     R3,R2,R3
        ASRS     R4,R3,#+11
//  162 	x3 = x1 + x2;
        ADDS     R1,R4,R1
//  163 	b3 = (((long)ac1 * 4 + x3) + 2)/4;
        LDR.W    R3,??DataTable4_10
        LDRSH    R3,[R3, #+0]
        ADDS     R1,R1,R3, LSL #+2
        ADDS     R1,R1,#+2
        MOVS     R3,#+4
        SDIV     R3,R1,R3
//  164 	x1 = ac3 * b6 >> 13;
        LDR.W    R1,??DataTable4_11
        LDRSH    R1,[R1, #+0]
        MULS     R1,R2,R1
        ASRS     R1,R1,#+13
//  165 	x2 = (b1 * (b6 * b6 >> 12)) >> 16;
        LDR.W    R4,??DataTable4_12
        LDRSH    R4,[R4, #+0]
        MULS     R2,R2,R2
        ASRS     R2,R2,#+12
        MUL      R2,R2,R4
        ASRS     R4,R2,#+16
//  166 	x3 = ((x1 + x2) + 2) >> 2;
        ADDS     R1,R4,R1
        ADDS     R1,R1,#+2
        ASRS     R1,R1,#+2
//  167 	b4 = (ac4 * (unsigned long) (x3 + 32768)) >> 15;
        LDR.W    R2,??DataTable4_13
        LDRH     R2,[R2, #+0]
        ADDS     R1,R1,#+32768
        MUL      R1,R1,R2
        LSRS     R1,R1,#+15
//  168 	b7 = ((unsigned long) up - b3) * (50000 >> OSS);
        SUBS     R0,R0,R3
        MOVW     R2,#+50000
        MULS     R0,R2,R0
//  169 	if( b7 < 0x80000000)
        CMN      R0,#-2147483648
        BCS.N    ??read_BMP085_0
//  170 	     p = (b7 * 2) / b4 ;
        LSLS     R0,R0,#+1
        UDIV     R0,R0,R1
        B.N      ??read_BMP085_1
//  171            else  
//  172 		    p = (b7 / b4) * 2;
??read_BMP085_0:
        UDIV     R0,R0,R1
        LSLS     R0,R0,#+1
//  173 	x1 = (p >> 8) * (p >> 8);
??read_BMP085_1:
        ASRS     R1,R0,#+8
        ASRS     R2,R0,#+8
        MULS     R1,R2,R1
//  174 	x1 = (x1 * 3038) >> 16;
        MOVW     R2,#+3038
        MULS     R1,R2,R1
        ASRS     R1,R1,#+16
//  175 	x2 = (-7357 * p) >> 16;
        LDR.W    R2,??DataTable4_14  ;; 0xffffe343
        MUL      R2,R2,R0
        ASRS     R4,R2,#+16
//  176 	pressure = p + ((x1 + x2 + 3791) >> 4);
        ADDS     R1,R4,R1
        ADDW     R1,R1,#+3791
        ADDS     R0,R0,R1, ASR #+4
        LDR.W    R1,??DataTable4_15
        STR      R0,[R1, #+0]
//  177 }
        POP      {R4,PC}          ;; return
//  178 
//  179 //****************************
//  180 /* 
//  181 void  Init_BMP085(void)
//  182 {
//  183 	ac1 = hw_iic_read1(BMP085_Addr,0xAA);
//  184 	ac1 = (ac1<<8)|hw_iic_read1(BMP085_Addr,0xAB);
//  185 
//  186   ac2 = hw_iic_read1(BMP085_Addr,0xAC);
//  187 	ac2 = (ac2<<8)| hw_iic_read1(BMP085_Addr,0xAD);
//  188 
//  189 	ac3 = hw_iic_read1(BMP085_Addr,0xAE);
//  190 	ac3 = (ac3<<8)| hw_iic_read1(BMP085_Addr,0xAF);
//  191 
//  192 	ac4 = hw_iic_read1(BMP085_Addr,0xB0);
//  193 	ac4 = (ac4<<8)| hw_iic_read1(BMP085_Addr,0xB1);
//  194 
//  195 	ac5 = hw_iic_read1(BMP085_Addr,0xB2);
//  196 	ac5 = (ac5<<8)| hw_iic_read1(BMP085_Addr,0xB3);
//  197 
//  198 	ac6 = hw_iic_read1(BMP085_Addr,0xB4);
//  199 	ac6 = (ac6<<8)| hw_iic_read1(BMP085_Addr,0xB5);
//  200 
//  201 	b1 = hw_iic_read1(BMP085_Addr,0xB6);
//  202 	b1 = (b1<<8)| hw_iic_read1(BMP085_Addr,0xB7);
//  203 
//  204 	b2 = hw_iic_read1(BMP085_Addr,0xB8);
//  205 	b2 = (b2<<8)| hw_iic_read1(BMP085_Addr,0xB9);
//  206 
//  207 	mb = hw_iic_read1(BMP085_Addr,0xBA);
//  208 	mb = (mb<<8)| hw_iic_read1(BMP085_Addr,0xBB);
//  209 
//  210 	mc = hw_iic_read1(BMP085_Addr,0xBC);
//  211 	mc = (mc<<8)| hw_iic_read1(BMP085_Addr,0xBD);
//  212 
//  213 	md = hw_iic_read1(BMP085_Addr,0xBE);
//  214 	md = (md<<8)| hw_iic_read1(BMP085_Addr,0xBF);
//  215 
//  216 }
//  217 */
//  218 //****************************
//  219 /*
//  220 void  Init_HMC5883L()
//  221 {
//  222    hw_iic_write1(HMC5883L_Addr,0x00,0x14);   //
//  223    hw_iic_write1(HMC5883L_Addr,0x02,0x00);   //
//  224 }
//  225 */
//  226 //*****************************************
//  227 
//  228  //************初始化L3G4200D*********************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  229 void Init_L3G4200D(void)
//  230 {
Init_L3G4200D:
        PUSH     {R7,LR}
//  231 	while(hw_iic_write1(0,L3G4200_Addr,CTRL_REG1, 0x0f));
??Init_L3G4200D_0:
        MOVS     R3,#+15
        MOVS     R2,#+32
        MOVS     R1,#+210
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_L3G4200D_0
//  232 	while(hw_iic_write1(0,L3G4200_Addr,CTRL_REG2, 0x00));
??Init_L3G4200D_1:
        MOVS     R3,#+0
        MOVS     R2,#+33
        MOVS     R1,#+210
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_L3G4200D_1
//  233 	while(hw_iic_write1(0,L3G4200_Addr,CTRL_REG3, 0x08));
??Init_L3G4200D_2:
        MOVS     R3,#+8
        MOVS     R2,#+34
        MOVS     R1,#+210
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_L3G4200D_2
//  234 	while(hw_iic_write1(0,L3G4200_Addr,CTRL_REG4, 0x00));	//+-250dps
??Init_L3G4200D_3:
        MOVS     R3,#+0
        MOVS     R2,#+35
        MOVS     R1,#+210
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_L3G4200D_3
//  235 	while(hw_iic_write1(0,L3G4200_Addr,CTRL_REG5, 0x00));
??Init_L3G4200D_4:
        MOVS     R3,#+0
        MOVS     R2,#+36
        MOVS     R1,#+210
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_L3G4200D_4
//  236 }	
        POP      {R0,PC}          ;; return
//  237 //******读取陀螺仪L3G4200D数据****************************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  238 void read_L3G4200D(void)
//  239 { char txtbuf[22]; 
read_L3G4200D:
        PUSH     {R3-R5,LR}
//  240 
//  241   static float Revise_gyroX = 0,Revise_gyroY = 0,Revise_gyroZ = 0;
//  242   while(hw_iic_readn(0,L3G4200_Addr, OUT_X_L, BUF, 6));
??read_L3G4200D_0:
        MOVS     R0,#+6
        STR      R0,[SP, #+0]
        LDR.W    R3,??DataTable4_16
        MOVS     R2,#+40
        MOVS     R1,#+210
        MOVS     R0,#+0
        BL       hw_iic_readn
        CMP      R0,#+0
        BNE.N    ??read_L3G4200D_0
//  243 
//  244    T_X=	(BUF[1]<<8)|BUF[0];
        LDR.W    R0,??DataTable4_16
        LDRB     R0,[R0, #+1]
        LDR.W    R1,??DataTable4_16
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0, LSL #+8
        LDR.W    R1,??DataTable4_17
        STRH     R0,[R1, #+0]
//  245    T_Y=	(BUF[3]<<8)|BUF[2];
        LDR.W    R0,??DataTable4_16
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable4_16
        LDRB     R1,[R1, #+2]
        ORRS     R0,R1,R0, LSL #+8
        LDR.W    R1,??DataTable4_18
        STRH     R0,[R1, #+0]
//  246    T_Z=	(BUF[5]<<8)|BUF[4];
        LDR.W    R0,??DataTable4_16
        LDRB     R0,[R0, #+5]
        LDR.W    R1,??DataTable4_16
        LDRB     R1,[R1, #+4]
        ORRS     R0,R1,R0, LSL #+8
        LDR.W    R1,??DataTable4_19
        STRH     R0,[R1, #+0]
//  247    
//  248    Dot_gyro_x = (float)T_X * 8.75 / 1000 - Revise_gyroX / T * 1000;
        LDR.W    R0,??DataTable4_17
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_20  ;; 0x40218000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_21  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable4_22
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_23  ;; 0x41a00000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable4_25
        STR      R0,[R1, #+0]
//  249    Dot_gyro_y = (float)T_Y * 8.75 / 1000 - Revise_gyroY / T * 1000;
        LDR.W    R0,??DataTable4_18
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_20  ;; 0x40218000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_21  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable4_26
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_23  ;; 0x41a00000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable4_27
        STR      R0,[R1, #+0]
//  250    Dot_gyro_z = (float)T_Z * 8.75 / 1000 - Revise_gyroZ / T * 1000;
        LDR.W    R0,??DataTable4_19
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_20  ;; 0x40218000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_21  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable4_28
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_23  ;; 0x41a00000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable4_29
        STR      R0,[R1, #+0]
//  251    
//  252    Angle_gyrox += Dot_gyro_x * T / 1000 ;
        LDR.W    R0,??DataTable4_25
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_23  ;; 0x41a00000
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable4_30
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable4_30
        STR      R0,[R1, #+0]
//  253    Angle_gyroy += Dot_gyro_y * T / 1000 ;
        LDR.W    R0,??DataTable4_27
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_23  ;; 0x41a00000
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable4_31
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable4_31
        STR      R0,[R1, #+0]
//  254    Angle_gyroz += Dot_gyro_z * T / 1000 ;
        LDR.W    R0,??DataTable4_29
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_23  ;; 0x41a00000
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable4_32
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable4_32
        STR      R0,[R1, #+0]
//  255  
//  256  //////////////////////////修正0点，读1000次然后取平均////////////////////////////     
//  257    if(Time_counter == COUNTER)
        LDR.W    R0,??DataTable4_33
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        CMP      R0,R1
        BNE.N    ??read_L3G4200D_1
//  258       { Revise_gyroX = Angle_gyrox / 1000 ;
        LDR.N    R0,??DataTable4_30
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable4_22
        STR      R0,[R1, #+0]
//  259         Revise_gyroY = Angle_gyroy / 1000 ;
        LDR.N    R0,??DataTable4_31
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable4_26
        STR      R0,[R1, #+0]
//  260         Revise_gyroZ = Angle_gyroz / 1000 ;
        LDR.N    R0,??DataTable4_32
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable4_28
        STR      R0,[R1, #+0]
//  261         Angle_gyrox = 0;  
        LDR.N    R0,??DataTable4_30
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  262         Angle_gyroy = 0;
        LDR.N    R0,??DataTable4_31
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  263         Angle_gyroz = 0;
        LDR.N    R0,??DataTable4_32
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  264       }   
//  265    
//  266    
//  267    
//  268    //Angle_x = -Angle_x;
//  269    //if(T_Y>0){sprintf(txtbuf,"\n %d",T_Y);}
//  270    //else {sprintf(txtbuf,"\n -%d",-T_Y);}  
//  271    //putstr(txtbuf);  
//  272 
//  273 }
??read_L3G4200D_1:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_gyroX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_gyroY:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_gyroZ:
        DS8 4
//  274 //***************************

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  275 void  Init_ADXL345(void)
//  276 {
Init_ADXL345:
        PUSH     {R7,LR}
//  277    while(hw_iic_write1(0,ADXL345_Addr,0x31,0x0B));   //测量范围,正负16g，13位模式
??Init_ADXL345_0:
        MOVS     R3,#+11
        MOVS     R2,#+49
        MOVS     R1,#+166
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_ADXL345_0
//  278    while(hw_iic_write1(0,ADXL345_Addr,0x2C,0x08));   //速率设定为100hz 参考pdf13页
??Init_ADXL345_1:
        MOVS     R3,#+8
        MOVS     R2,#+44
        MOVS     R1,#+166
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_ADXL345_1
//  279    while(hw_iic_write1(0,ADXL345_Addr,0x2D,0x08));   //选择电源模式   参考pdf24页
??Init_ADXL345_2:
        MOVS     R3,#+8
        MOVS     R2,#+45
        MOVS     R1,#+166
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_ADXL345_2
//  280    while(hw_iic_write1(0,ADXL345_Addr,0x2E,0x80));   //使能 DATA_READY 中断
??Init_ADXL345_3:
        MOVS     R3,#+128
        MOVS     R2,#+46
        MOVS     R1,#+166
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_ADXL345_3
//  281    while(hw_iic_write1(0,ADXL345_Addr,0x1E,0xFB));   //X 偏移量 根据测试传感器的状态写入pdf29页
??Init_ADXL345_4:
        MOVS     R3,#+251
        MOVS     R2,#+30
        MOVS     R1,#+166
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_ADXL345_4
//  282    while(hw_iic_write1(0,ADXL345_Addr,0x1F,0x00));   //Y 偏移量 根据测试传感器的状态写入pdf29页
??Init_ADXL345_5:
        MOVS     R3,#+0
        MOVS     R2,#+31
        MOVS     R1,#+166
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_ADXL345_5
//  283    while(hw_iic_write1(0,ADXL345_Addr,0x20,0x05));   //Z 偏移量 根据测试传感器的状态写入pdf29页
??Init_ADXL345_6:
        MOVS     R3,#+5
        MOVS     R2,#+32
        MOVS     R1,#+166
        MOVS     R0,#+0
        BL       hw_iic_write1
        CMP      R0,#+0
        BNE.N    ??Init_ADXL345_6
//  284 }
        POP      {R0,PC}          ;; return
//  285 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  286 void read_ADXL345(void)
//  287 {      char txtbuf[22];
read_ADXL345:
        PUSH     {R3-R9,LR}
//  288        float X0 = 0,Y0 = 0,Z0 = 0;
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
//  289        static float Revise_accX = 0,Revise_accY = 0,Revise_accZ = 0;
//  290        //int high = 0;
//  291        
//  292        while(hw_iic_readn(0,ADXL345_Addr, 0x32, BUF, 6));
??read_ADXL345_0:
        MOVS     R0,#+6
        STR      R0,[SP, #+0]
        LDR.N    R3,??DataTable4_16
        MOVS     R2,#+50
        MOVS     R1,#+166
        MOVS     R0,#+0
        BL       hw_iic_readn
        CMP      R0,#+0
        BNE.N    ??read_ADXL345_0
//  293        A_X=(BUF[1]<<8)+BUF[0];  //合成数据  
        LDR.N    R0,??DataTable4_16
        LDRB     R0,[R0, #+1]
        LSLS     R0,R0,#+8
        LDR.N    R1,??DataTable4_16
        LDRB     R1,[R1, #+0]
        UXTAB    R0,R0,R1
        LDR.N    R1,??DataTable4_34
        STRH     R0,[R1, #+0]
//  294        A_Y=(BUF[3]<<8)+BUF[2];  //合成数据
        LDR.N    R0,??DataTable4_16
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+8
        LDR.N    R1,??DataTable4_16
        LDRB     R1,[R1, #+2]
        UXTAB    R0,R0,R1
        LDR.N    R1,??DataTable4_35
        STRH     R0,[R1, #+0]
//  295        A_Z=(BUF[5]<<8)+BUF[4];  //合成数据
        LDR.N    R0,??DataTable4_16
        LDRB     R0,[R0, #+5]
        LSLS     R0,R0,#+8
        LDR.N    R1,??DataTable4_16
        LDRB     R1,[R1, #+4]
        UXTAB    R0,R0,R1
        LDR.N    R1,??DataTable4_36
        STRH     R0,[R1, #+0]
//  296 
//  297       X0 = (float)A_X*3.9;
        LDR.N    R0,??DataTable4_34
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable4_37  ;; 0x400f3333
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R4,R0
//  298       Y0 = (float)A_Y*3.9;
        LDR.N    R0,??DataTable4_35
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable4_37  ;; 0x400f3333
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R5,R0
//  299       Z0 = -(float)A_Z*3.9;
        LDR.N    R0,??DataTable4_36
        LDRSH    R0,[R0, #+0]
        BL       __aeabi_i2f
        EORS     R0,R0,#0x80000000
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable4_37  ;; 0x400f3333
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R6,R0
//  300 
//  301 
//  302       //Roll = (float)((atan2(K,Q)*180)/3.14159265 + 90);   //X轴角度值 滚转角
//  303      //Pitch = (float)((atan2(K,R)*180)/3.14159265 + 90);  //Y轴角度值 俯仰角
//  304       //Yaw = (float)((atan2(R,Q)*180)/3.14159265 + 90);  //Z轴角都值 偏航角 顺时针+
//  305       Angle_accx = atan2(X0,SquareRootFloat(Y0*Y0 + Z0*Z0))*57.3 - Revise_accX;
        MOVS     R0,R5
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R7,R0
        MOVS     R0,R6
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fadd
        BL       SquareRootFloat
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R8,R2
        MOV      R9,R3
        MOVS     R0,R4
        BL       __aeabi_f2d
        MOV      R2,R8
        MOV      R3,R9
        BL       atan2
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable4_38  ;; 0x404ca666
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        LDR.N    R0,??DataTable4_39
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable4_40
        STR      R0,[R1, #+0]
//  306       Angle_accy = atan2(Y0,SquareRootFloat(X0*X0 + Z0*Z0))*57.3 - Revise_accY;
        MOVS     R0,R4
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R7,R0
        MOVS     R0,R6
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fadd
        BL       SquareRootFloat
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R8,R2
        MOV      R9,R3
        MOVS     R0,R5
        BL       __aeabi_f2d
        MOV      R2,R8
        MOV      R3,R9
        BL       atan2
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable4_38  ;; 0x404ca666
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        LDR.N    R0,??DataTable4_41
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable4_42
        STR      R0,[R1, #+0]
//  307       Angle_accz = -(atan2(Z0,SquareRootFloat(X0*X0+Y0*Y0))*57.3 + 90 - Revise_accZ);
        MOVS     R1,R4
        MOVS     R0,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
        MOVS     R1,R5
        MOVS     R0,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fadd
        BL       SquareRootFloat
        MOVS     R4,R0
        LDR.N    R0,??DataTable4_43
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOV      R8,R0
        MOV      R9,R1
        MOVS     R0,R4
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R4,R2
        MOVS     R5,R3
        MOVS     R0,R6
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       atan2
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable4_38  ;; 0x404ca666
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable4_44  ;; 0x40568000
        BL       __aeabi_dadd
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable4_45
        STR      R0,[R1, #+0]
//  308 //////////////////////////修正0点，读1000次然后取平均////////////////////////////     
//  309       if(Time_counter == COUNTER)
        LDR.N    R0,??DataTable4_33
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        CMP      R0,R1
        BNE.N    ??read_ADXL345_1
//  310       { Revise_accX = Angle_accx / 1000;
        LDR.N    R0,??DataTable4_40
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable4_39
        STR      R0,[R1, #+0]
//  311         Revise_accY = Angle_accy / 1000;
        LDR.N    R0,??DataTable4_42
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable4_41
        STR      R0,[R1, #+0]
//  312         Revise_accZ = Angle_accz / 1000;
        LDR.N    R0,??DataTable4_45
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_24  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable4_43
        STR      R0,[R1, #+0]
//  313         Angle_accx = 0;
        LDR.N    R0,??DataTable4_40
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  314         Angle_accy = 0;
        LDR.N    R0,??DataTable4_42
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  315         Angle_accy = 0;
        LDR.N    R0,??DataTable4_42
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  316         
//  317         hw_gpio_set(PORT_A,15,0);  //数据初始化完成
        MOVS     R2,#+0
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_set
//  318       } 
//  319       /*Acc_X = A_X * 3.9 / 1000 * g;
//  320        Acc_Y = A_Y * 3.9 / 1000 * g;
//  321        Acc_Z = g - A_Z * 3.9 / 1000 * g;
//  322        Vel_X = Acc_X * T / 1000;
//  323        Vel_Y = Acc_Y * T / 1000;
//  324        Vel_Z = Acc_Z * T / 1000;
//  325        Pos_X += Vel_X * T / 1000;
//  326        Pos_Y += Vel_Y * T / 1000;
//  327        Pos_Z += Vel_Z * T / 1000;
//  328        */
//  329        /*       
//  330     if(A_Z>0){sprintf(txtbuf,"\n %d",A_Z);}
//  331     else {sprintf(txtbuf,"\n -%d",-A_Z);}  
//  332     putstr(txtbuf);  
//  333 
//  334  
//  335      if(Pos_Z > 0) //补码求出加速度原始对应数值
//  336 	{	
//  337         high =  Pos_Z * 10000; 
//  338         //wz=((float)(0xffff-wz+1))*10000*3.9*0.896; //扩大一万倍，好取出整数部分
//  339 	// height += (984.6788 - wz) *10000* 0.02 * 0.02 ;
//  340         sprintf(txtbuf,"\n high:%d.%04d",high/10000,high%10000);
//  341 	putstr(txtbuf);  			    
//  342 	}
//  343      else
//  344 	{
//  345         high =  -Pos_Z * 10000;
//  346 	sprintf(txtbuf,"\n high:-%d.%04d",high/10000,high%10000);
//  347 	putstr(txtbuf);    		    
//  348 	 }    
//  349  */
//  350 }
??read_ADXL345_1:
        POP      {R0,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4:
        DC32     0x5f3759df

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_1:
        DC32     0x4006b004

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_2:
        DC32     0x4006b007

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_3:
        DC32     ac6

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_4:
        DC32     ac5

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_5:
        DC32     mc

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_6:
        DC32     md

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_7:
        DC32     temperature

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_8:
        DC32     b2

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_9:
        DC32     ac2

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_10:
        DC32     ac1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_11:
        DC32     ac3

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_12:
        DC32     b1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_13:
        DC32     ac4

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_14:
        DC32     0xffffe343

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_15:
        DC32     pressure

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_16:
        DC32     BUF

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_17:
        DC32     T_X

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_18:
        DC32     T_Y

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_19:
        DC32     T_Z

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_20:
        DC32     0x40218000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_21:
        DC32     0x408f4000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_22:
        DC32     ??Revise_gyroX

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_23:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_24:
        DC32     0x447a0000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_25:
        DC32     Dot_gyro_x

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_26:
        DC32     ??Revise_gyroY

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_27:
        DC32     Dot_gyro_y

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_28:
        DC32     ??Revise_gyroZ

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_29:
        DC32     Dot_gyro_z

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_30:
        DC32     Angle_gyrox

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_31:
        DC32     Angle_gyroy

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_32:
        DC32     Angle_gyroz

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_33:
        DC32     Time_counter

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_34:
        DC32     A_X

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_35:
        DC32     A_Y

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_36:
        DC32     A_Z

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_37:
        DC32     0x400f3333

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_38:
        DC32     0x404ca666

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_39:
        DC32     ??Revise_accX

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_40:
        DC32     Angle_accx

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_41:
        DC32     ??Revise_accY

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_42:
        DC32     Angle_accy

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_43:
        DC32     ??Revise_accZ

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_44:
        DC32     0x40568000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable4_45:
        DC32     Angle_accz

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_accX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_accY:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??Revise_accZ:
        DS8 4

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
//  351  
//  352 /*************结束***************/
// 
//   119 bytes in section .bss
// 2 060 bytes in section .text
// 
// 2 060 bytes of CODE memory
//   119 bytes of DATA memory
//
//Errors: none
//Warnings: 5
