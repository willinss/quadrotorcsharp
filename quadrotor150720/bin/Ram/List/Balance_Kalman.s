///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:13 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\Component_C\Balance_Kalman.c        /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\Component_C\Balance_Kalman.c" -D   /
//                    IAR -D TWR_K60N512 -lCN "C:\Documents and               /
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
//                    28IIC\bin\Ram\List\Balance_Kalman.s                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Balance_Kalman

        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_ui2f

        PUBLIC C_0
        PUBLIC C_01
        PUBLIC E
        PUBLIC E1
        PUBLIC K_0
        PUBLIC K_01
        PUBLIC K_1
        PUBLIC K_11
        PUBLIC Kalman_Filter
        PUBLIC Kalman_Filter1
        PUBLIC P
        PUBLIC `P1`
        PUBLIC PCt_0
        PUBLIC PCt_01
        PUBLIC PCt_1
        PUBLIC PCt_11
        PUBLIC Pdot
        PUBLIC Pdot1
        PUBLIC Q_angle
        PUBLIC Q_angle1
        PUBLIC Q_gyro
        PUBLIC Q_gyro1
        PUBLIC R_angle
        PUBLIC R_angle1
        PUBLIC angle
        PUBLIC angle1
        PUBLIC angle_dot
        PUBLIC angle_dot1
        PUBLIC angle_err
        PUBLIC angle_err1
        PUBLIC dt
        PUBLIC dt1
        PUBLIC q_bias
        PUBLIC q_bias1
        PUBLIC t_0
        PUBLIC t_01
        PUBLIC t_1
        PUBLIC t_11

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\Component_C\Balance_Kalman.c
//    1 #include "pit.h"
//    2 #include "Balance_Kalman.h"
//    3 //*
//    4 //-------------------------------------------------------
//    5 //Kalman滤波，8MHz的处理时间约1.8ms；
//    6 //-------------------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 float angle, angle_dot; 		//外部需要引用的变量
angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
angle_dot:
        DS8 4
//    8 //-------------------------------------------------------

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    9 float Q_angle=0.001, Q_gyro=0.003, R_angle=0.5, dt = 0.02;
Q_angle:
        DATA
        DC32 3A83126FH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Q_gyro:
        DATA
        DC32 3B449BA6H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
R_angle:
        DATA
        DC32 3F000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
dt:
        DATA
        DC32 3CA3D70AH
//   10 			//注意：dt的取值为kalman滤波器采样时间;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   11 float P[2][2] = {
P:
        DATA
        DC32 3F800000H, 0H, 0H, 3F800000H
//   12 							{ 1, 0 },
//   13 							{ 0, 1 }
//   14 						};
//   15 	

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 float Pdot[4] ={0,0,0,0};
Pdot:
        DS8 16
//   17 
//   18 const char C_0 = 1;
//   19 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 float q_bias, angle_err, PCt_0, PCt_1, E, K_0, K_1, t_0, t_1;
q_bias:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
angle_err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
PCt_0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
PCt_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
E:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
K_0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
K_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
t_0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
t_1:
        DS8 4
//   21 //-------------------------------------------------------
//   22 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   23 float Kalman_Filter(float angle_m,float gyro_m)			//gyro_m:gyro_measure
//   24 {
Kalman_Filter:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   25 	angle+=(gyro_m-q_bias) * dt;//先验估计
        MOVS     R0,R5
        LDR.W    R1,??DataTable3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//   26 	
//   27 	Pdot[0]=Q_angle - P[0][1] - P[1][0];// Pk-' 先验估计误差协方差的微分
        LDR.W    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_5
        STR      R0,[R1, #+0]
//   28 	Pdot[1]=- P[1][1];
        LDR.W    R0,??DataTable3_5
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+12]
        EORS     R1,R1,#0x80000000
        STR      R1,[R0, #+4]
//   29 	Pdot[2]=- P[1][1];
        LDR.W    R0,??DataTable3_5
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+12]
        EORS     R1,R1,#0x80000000
        STR      R1,[R0, #+8]
//   30 	Pdot[3]=Q_gyro;
        LDR.W    R0,??DataTable3_5
        LDR.W    R1,??DataTable3_6
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+12]
//   31 	
//   32 	P[0][0] += Pdot[0] * dt;// Pk- 先验估计误差协方差微分的积分 = 先验估计误差协方差
        LDR.W    R0,??DataTable3_5
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_4
        STR      R0,[R1, #+0]
//   33 	P[0][1] += Pdot[1] * dt;
        LDR.W    R0,??DataTable3_5
        LDR      R1,[R0, #+4]
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_4
        STR      R0,[R1, #+4]
//   34 	P[1][0] += Pdot[2] * dt;
        LDR.W    R0,??DataTable3_5
        LDR      R1,[R0, #+8]
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_4
        STR      R0,[R1, #+8]
//   35 	P[1][1] += Pdot[3] * dt;
        LDR.W    R0,??DataTable3_5
        LDR      R1,[R0, #+12]
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+12]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_4
        STR      R0,[R1, #+12]
//   36 	
//   37 	
//   38 	angle_err = angle_m - angle;//zk-先验估计
        MOVS     R0,R4
        LDR.W    R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_7
        STR      R0,[R1, #+0]
//   39 	
//   40 	
//   41 	PCt_0 = C_0 * P[0][0];
        ADR.W    R0,C_0
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_8
        STR      R0,[R1, #+0]
//   42 	PCt_1 = C_0 * P[1][0];
        ADR.W    R0,C_0
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable3_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_9
        STR      R0,[R1, #+0]
//   43 	
//   44 	E = R_angle + C_0 * PCt_0;
        ADR.W    R0,C_0
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_10
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_11
        STR      R0,[R1, #+0]
//   45 	
//   46 	K_0 = PCt_0 / E;//Kk
        LDR.W    R0,??DataTable3_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable3_12
        STR      R0,[R1, #+0]
//   47 	K_1 = PCt_1 / E;
        LDR.N    R0,??DataTable3_9
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+0]
//   48 	
//   49 	t_0 = PCt_0;
        LDR.N    R0,??DataTable3_14
        LDR.N    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   50 	t_1 = C_0 * P[0][1];
        ADR.W    R0,C_0
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable3_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_15
        STR      R0,[R1, #+0]
//   51 
//   52 	P[0][0] -= K_0 * t_0;//后验估计误差协方差
        LDR.N    R0,??DataTable3_12
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+0]
//   53 	P[0][1] -= K_0 * t_1;
        LDR.N    R0,??DataTable3_12
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_15
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_4
        LDR      R0,[R0, #+4]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+4]
//   54 	P[1][0] -= K_1 * t_0;
        LDR.N    R0,??DataTable3_13
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_4
        LDR      R0,[R0, #+8]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+8]
//   55 	P[1][1] -= K_1 * t_1;
        LDR.N    R0,??DataTable3_13
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_15
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_4
        LDR      R0,[R0, #+12]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+12]
//   56 	
//   57 	
//   58 	angle	+= K_0 * angle_err;//后验估计
        LDR.N    R0,??DataTable3_12
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//   59 	q_bias	+= K_1 * angle_err;//后验估计
        LDR.N    R0,??DataTable3_13
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//   60 	angle_dot = gyro_m-q_bias;//输出值（后验估计）的微分 = 角速度
        MOVS     R0,R5
        LDR.N    R1,??DataTable3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_16
        STR      R0,[R1, #+0]
//   61         return angle;
        LDR.N    R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        POP      {R4,R5,PC}       ;; return
//   62 }
//   63 
//   64 
//   65 
//   66 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   67 float angle1, angle_dot1; 		//外部需要引用的变量
angle1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
angle_dot1:
        DS8 4
//   68 //-------------------------------------------------------

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   69 float Q_angle1=0.001, Q_gyro1=0.003, R_angle1=0.5, dt1 = 0.02;
Q_angle1:
        DATA
        DC32 3A83126FH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
Q_gyro1:
        DATA
        DC32 3B449BA6H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
R_angle1:
        DATA
        DC32 3F000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
dt1:
        DATA
        DC32 3CA3D70AH
//   70 			//注意：dt的取值为kalman滤波器采样时间;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   71 float P1[2][2] = {
`P1`:
        DATA
        DC32 3F800000H, 0H, 0H, 3F800000H
//   72 							{ 1, 0 },
//   73 							{ 0, 1 }
//   74 						};
//   75 	

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   76 float Pdot1[4] ={0,0,0,0};
Pdot1:
        DS8 16
//   77 
//   78 const char C_01 = 1;
//   79 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   80 float q_bias1, angle_err1, PCt_01, PCt_11, E1, K_01, K_11, t_01, t_11;
q_bias1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
angle_err1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
PCt_01:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
PCt_11:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
E1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
K_01:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
K_11:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
t_01:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
t_11:
        DS8 4
//   81 //-------------------------------------------------------
//   82 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   83 float Kalman_Filter1(float angle_m1,float gyro_m1)			//gyro_m:gyro_measure
//   84 {
Kalman_Filter1:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   85 	angle1+=(gyro_m1-q_bias1) * dt1;//先验估计
        MOVS     R0,R5
        LDR.N    R1,??DataTable3_17
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_18
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_19
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_19
        STR      R0,[R1, #+0]
//   86 	
//   87 	Pdot1[0]=Q_angle1 - P1[0][1] - P1[1][0];// Pk-' 先验估计误差协方差的微分
        LDR.N    R0,??DataTable3_20
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_22
        STR      R0,[R1, #+0]
//   88 	Pdot1[1]=- P1[1][1];
        LDR.N    R0,??DataTable3_22
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+12]
        EORS     R1,R1,#0x80000000
        STR      R1,[R0, #+4]
//   89 	Pdot1[2]=- P1[1][1];
        LDR.N    R0,??DataTable3_22
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+12]
        EORS     R1,R1,#0x80000000
        STR      R1,[R0, #+8]
//   90 	Pdot1[3]=Q_gyro1;
        LDR.N    R0,??DataTable3_22
        LDR.N    R1,??DataTable3_23
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+12]
//   91 	
//   92 	P1[0][0] += Pdot1[0] * dt1;// Pk- 先验估计误差协方差微分的积分 = 先验估计误差协方差
        LDR.N    R0,??DataTable3_22
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_21
        STR      R0,[R1, #+0]
//   93 	P1[0][1] += Pdot1[1] * dt1;
        LDR.N    R0,??DataTable3_22
        LDR      R1,[R0, #+4]
        LDR.N    R0,??DataTable3_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+4]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_21
        STR      R0,[R1, #+4]
//   94 	P1[1][0] += Pdot1[2] * dt1;
        LDR.N    R0,??DataTable3_22
        LDR      R1,[R0, #+8]
        LDR.N    R0,??DataTable3_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+8]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_21
        STR      R0,[R1, #+8]
//   95 	P1[1][1] += Pdot1[3] * dt1;
        LDR.N    R0,??DataTable3_22
        LDR      R1,[R0, #+12]
        LDR.N    R0,??DataTable3_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+12]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_21
        STR      R0,[R1, #+12]
//   96 	
//   97 	
//   98 	angle_err1 = angle_m1 - angle1;//zk-先验估计
        MOVS     R0,R4
        LDR.N    R1,??DataTable3_19
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_24
        STR      R0,[R1, #+0]
//   99 	
//  100 	
//  101 	PCt_01 = C_01 * P1[0][0];
        ADR.W    R0,C_01
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_25
        STR      R0,[R1, #+0]
//  102 	PCt_11 = C_01 * P1[1][0];
        ADR.W    R0,C_01
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+8]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_26
        STR      R0,[R1, #+0]
//  103 	
//  104 	E1 = R_angle1 + C_01 * PCt_01;
        ADR.W    R0,C_01
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable3_25
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_27
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_28
        STR      R0,[R1, #+0]
//  105 	
//  106 	K_01 = PCt_01 / E1;//Kk
        LDR.N    R0,??DataTable3_25
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_28
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable3_29
        STR      R0,[R1, #+0]
//  107 	K_11 = PCt_11 / E1;
        LDR.N    R0,??DataTable3_26
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_28
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable3_30
        STR      R0,[R1, #+0]
//  108 	
//  109 	t_01 = PCt_01;
        LDR.N    R0,??DataTable3_31
        LDR.N    R1,??DataTable3_25
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  110 	t_11 = C_01 * P1[0][1];
        ADR.W    R0,C_01
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable3_21
        LDR      R1,[R1, #+4]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_32
        STR      R0,[R1, #+0]
//  111 
//  112 	P1[0][0] -= K_01 * t_01;//后验估计误差协方差
        LDR.N    R0,??DataTable3_29
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_21
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_21
        STR      R0,[R1, #+0]
//  113 	P1[0][1] -= K_01 * t_11;
        LDR.N    R0,??DataTable3_29
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_32
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_21
        LDR      R0,[R0, #+4]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_21
        STR      R0,[R1, #+4]
//  114 	P1[1][0] -= K_11 * t_01;
        LDR.N    R0,??DataTable3_30
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_31
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_21
        LDR      R0,[R0, #+8]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_21
        STR      R0,[R1, #+8]
//  115 	P1[1][1] -= K_11 * t_11;
        LDR.N    R0,??DataTable3_30
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_32
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.N    R0,??DataTable3_21
        LDR      R0,[R0, #+12]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_21
        STR      R0,[R1, #+12]
//  116 	
//  117 	
//  118 	angle1	+= K_01 * angle_err1;//后验估计
        LDR.N    R0,??DataTable3_29
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_24
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_19
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_19
        STR      R0,[R1, #+0]
//  119 	q_bias1	+= K_11 * angle_err1;//后验估计
        LDR.N    R0,??DataTable3_30
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_24
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_17
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_17
        STR      R0,[R1, #+0]
//  120 	angle_dot1 = gyro_m1-q_bias1;//输出值（后验估计）的微分 = 角速度
        MOVS     R0,R5
        LDR.N    R1,??DataTable3_17
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_33
        STR      R0,[R1, #+0]
//  121         return angle1;
        LDR.N    R0,??DataTable3_19
        LDR      R0,[R0, #+0]
        POP      {R4,R5,PC}       ;; return
//  122 }

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3:
        DC32     q_bias

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_1:
        DC32     dt

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_2:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_3:
        DC32     Q_angle

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_4:
        DC32     P

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_5:
        DC32     Pdot

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_6:
        DC32     Q_gyro

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_7:
        DC32     angle_err

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_8:
        DC32     PCt_0

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_9:
        DC32     PCt_1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_10:
        DC32     R_angle

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_11:
        DC32     E

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_12:
        DC32     K_0

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_13:
        DC32     K_1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_14:
        DC32     t_0

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_15:
        DC32     t_1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_16:
        DC32     angle_dot

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_17:
        DC32     q_bias1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_18:
        DC32     dt1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_19:
        DC32     angle1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_20:
        DC32     Q_angle1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_21:
        DC32     `P1`

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_22:
        DC32     Pdot1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_23:
        DC32     Q_gyro1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_24:
        DC32     angle_err1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_25:
        DC32     PCt_01

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_26:
        DC32     PCt_11

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_27:
        DC32     R_angle1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_28:
        DC32     E1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_29:
        DC32     K_01

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_30:
        DC32     K_11

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_31:
        DC32     t_01

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_32:
        DC32     t_11

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_33:
        DC32     angle_dot1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
C_0:
        ; Initializer data, 1 bytes
        DC8 1

        SECTION `.text`:CODE:NOROOT(2)
        DATA
C_01:
        ; Initializer data, 1 bytes
        DC8 1

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
// 
//   120 bytes in section .bss
//    64 bytes in section .data
// 1 242 bytes in section .text
// 
// 1 242 bytes of CODE memory
//   184 bytes of DATA memory
//
//Errors: none
//Warnings: none
