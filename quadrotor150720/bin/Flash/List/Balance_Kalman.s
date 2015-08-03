///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:02 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\Balance_Kalman.c      /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\Balance_Kalman.c"    /
//                    -D IAR -D TWR_K60N512 -lCN                              /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\bin\Flash\List\" -lB                           /
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
//                    (¸ÄI2C)\bin\Flash\List\Balance_Kalman.s                 /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME Balance_Kalman

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_cfcmpeq
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_ui2f
        EXTERN calloc
        EXTERN fabs
        EXTERN free

        PUBLIC C_0
        PUBLIC C_01
        PUBLIC E
        PUBLIC E1
        PUBLIC K1
        PUBLIC K2
        PUBLIC K3
        PUBLIC K4
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
        PUBLIC P_a1
        PUBLIC P_a2
        PUBLIC P_a3
        PUBLIC P_a4
        PUBLIC P_b1
        PUBLIC P_b2
        PUBLIC P_b3
        PUBLIC P_b4
        PUBLIC Pdot
        PUBLIC Pdot1
        PUBLIC Q1
        PUBLIC Q2
        PUBLIC Q3
        PUBLIC Q4
        PUBLIC Q_angle
        PUBLIC Q_angle1
        PUBLIC Q_gyro
        PUBLIC Q_gyro1
        PUBLIC `R1`
        PUBLIC `R2`
        PUBLIC `R3`
        PUBLIC `R4`
        PUBLIC R_angle
        PUBLIC R_angle1
        PUBLIC X_a1
        PUBLIC X_a2
        PUBLIC X_a3
        PUBLIC X_a4
        PUBLIC X_b1
        PUBLIC X_b2
        PUBLIC X_b3
        PUBLIC X_b4
        PUBLIC angle
        PUBLIC angle1
        PUBLIC angle_dot
        PUBLIC angle_dot1
        PUBLIC angle_err
        PUBLIC angle_err1
        PUBLIC dt
        PUBLIC dt1
        PUBLIC kalman_filter1
        PUBLIC kalman_filter2
        PUBLIC kalman_filter3
        PUBLIC kalman_filter4
        PUBLIC kalman_update
        PUBLIC matrix_inversion
        PUBLIC matrix_multiply
        PUBLIC matrix_subtraction
        PUBLIC matrix_transpose
        PUBLIC q_bias
        PUBLIC q_bias1
        PUBLIC t_0
        PUBLIC t_01
        PUBLIC t_1
        PUBLIC t_11

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\Balance_Kalman.c
//    1 #include "pit.h"
//    2 #include "Balance_Kalman.h"
//    3 //*
//    4 //-------------------------------------------------------
//    5 //KalmanÂË²¨£¬8MHzµÄ´¦ÀíÊ±¼äÔ¼1.8ms£»
//    6 //-------------------------------------------------------

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 float angle, angle_dot; 		//Íâ²¿ÐèÒªÒýÓÃµÄ±äÁ¿
angle:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
angle_dot:
        DS8 4
//    8 //-------------------------------------------------------

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    9 float Q_angle=0.001, Q_gyro=0.003, R_angle=0.5, dt = 0.01;
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
        DC32 3C23D70AH
//   10 /*R_angle =0.025 
//   11 Q_angle =0.073
//   12 Q_gyro  =0.00008
//   13 dt=0.05
//   14 */			//×¢Òâ£ºdtµÄÈ¡ÖµÎªkalmanÂË²¨Æ÷²ÉÑùÊ±¼ä;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   15 float P[2][2] = {
P:
        DATA
        DC32 3F800000H, 0H, 0H, 3F800000H
//   16 							{ 1, 0 },
//   17 							{ 0, 1 }
//   18 						};
//   19 	

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 float Pdot[4] ={0,0,0,0};
Pdot:
        DS8 16
//   21 

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
//   22 const char C_0 = 1;
C_0:
        DATA
        DC8 1
//   23 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 float q_bias, angle_err, PCt_0, PCt_1, E, K_0, K_1, t_0, t_1;
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
//   25 //-------------------------------------------------------
//   26 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   27 float Kalman_Filter(float angle_m,float gyro_m)			//gyro_m:gyro_measure
//   28 {
Kalman_Filter:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   29 	angle+=(gyro_m-q_bias) * dt;//ÏÈÑé¹À¼Æ
        MOVS     R0,R5
        LDR.W    R1,??DataTable6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
//   30 	
//   31 	Pdot[0]=Q_angle - P[0][1] - P[1][0];// Pk-' ÏÈÑé¹À¼ÆÎó²îÐ­·½²îµÄÎ¢·Ö
        LDR.W    R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_5
        STR      R0,[R1, #+0]
//   32 	Pdot[1]=- P[1][1];
        LDR.W    R0,??DataTable6_5
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+12]
        EORS     R1,R1,#0x80000000
        STR      R1,[R0, #+4]
//   33 	Pdot[2]=- P[1][1];
        LDR.W    R0,??DataTable6_5
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+12]
        EORS     R1,R1,#0x80000000
        STR      R1,[R0, #+8]
//   34 	Pdot[3]=Q_gyro;
        LDR.W    R0,??DataTable6_5
        LDR.W    R1,??DataTable6_6
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+12]
//   35 	
//   36 	P[0][0] += Pdot[0] * dt;// Pk- ÏÈÑé¹À¼ÆÎó²îÐ­·½²îÎ¢·ÖµÄ»ý·Ö = ÏÈÑé¹À¼ÆÎó²îÐ­·½²î
        LDR.W    R0,??DataTable6_5
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_4
        STR      R0,[R1, #+0]
//   37 	P[0][1] += Pdot[1] * dt;
        LDR.W    R0,??DataTable6_5
        LDR      R1,[R0, #+4]
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_4
        STR      R0,[R1, #+4]
//   38 	P[1][0] += Pdot[2] * dt;
        LDR.W    R0,??DataTable6_5
        LDR      R1,[R0, #+8]
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_4
        STR      R0,[R1, #+8]
//   39 	P[1][1] += Pdot[3] * dt;
        LDR.W    R0,??DataTable6_5
        LDR      R1,[R0, #+12]
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+12]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_4
        STR      R0,[R1, #+12]
//   40 	
//   41 	
//   42 	angle_err = angle_m - angle;//zk-ÏÈÑé¹À¼Æ
        MOVS     R0,R4
        LDR.W    R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_7
        STR      R0,[R1, #+0]
//   43 	
//   44 	
//   45 	PCt_0 = C_0 * P[0][0];
        LDR.W    R0,??DataTable6_8
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_9
        STR      R0,[R1, #+0]
//   46 	PCt_1 = C_0 * P[1][0];
        LDR.W    R0,??DataTable6_8
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+8]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_10
        STR      R0,[R1, #+0]
//   47 	
//   48 	E = R_angle + C_0 * PCt_0;
        LDR.W    R0,??DataTable6_8
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_11
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_12
        STR      R0,[R1, #+0]
//   49 	
//   50 	K_0 = PCt_0 / E;//Kk
        LDR.W    R0,??DataTable6_9
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable6_13
        STR      R0,[R1, #+0]
//   51 	K_1 = PCt_1 / E;
        LDR.W    R0,??DataTable6_10
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable6_14
        STR      R0,[R1, #+0]
//   52 	
//   53 	t_0 = PCt_0;
        LDR.W    R0,??DataTable6_15
        LDR.W    R1,??DataTable6_9
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   54 	t_1 = C_0 * P[0][1];
        LDR.W    R0,??DataTable6_8
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_4
        LDR      R1,[R1, #+4]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_16
        STR      R0,[R1, #+0]
//   55 
//   56 	P[0][0] -= K_0 * t_0;//ºóÑé¹À¼ÆÎó²îÐ­·½²î
        LDR.W    R0,??DataTable6_13
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_15
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_4
        STR      R0,[R1, #+0]
//   57 	P[0][1] -= K_0 * t_1;
        LDR.W    R0,??DataTable6_13
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_16
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_4
        LDR      R0,[R0, #+4]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_4
        STR      R0,[R1, #+4]
//   58 	P[1][0] -= K_1 * t_0;
        LDR.W    R0,??DataTable6_14
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_15
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_4
        LDR      R0,[R0, #+8]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_4
        STR      R0,[R1, #+8]
//   59 	P[1][1] -= K_1 * t_1;
        LDR.W    R0,??DataTable6_14
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_16
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_4
        LDR      R0,[R0, #+12]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_4
        STR      R0,[R1, #+12]
//   60 	
//   61 	
//   62 	angle	+= K_0 * angle_err;//ºóÑé¹À¼Æ
        LDR.W    R0,??DataTable6_13
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
//   63 	q_bias	+= K_1 * angle_err;//ºóÑé¹À¼Æ
        LDR.W    R0,??DataTable6_14
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6
        STR      R0,[R1, #+0]
//   64 	angle_dot = gyro_m-q_bias;//Êä³öÖµ£¨ºóÑé¹À¼Æ£©µÄÎ¢·Ö = ½ÇËÙ¶È
        MOVS     R0,R5
        LDR.W    R1,??DataTable6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_17
        STR      R0,[R1, #+0]
//   65         return angle;
        LDR.W    R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        POP      {R4,R5,PC}       ;; return
//   66 }
//   67 
//   68 
//   69 
//   70 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   71 float angle1, angle_dot1; 		//Íâ²¿ÐèÒªÒýÓÃµÄ±äÁ¿
angle1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
angle_dot1:
        DS8 4
//   72 //-------------------------------------------------------

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   73 float Q_angle1=0.001, Q_gyro1=0.003, R_angle1=0.5, dt1 = 0.01;
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
        DC32 3C23D70AH
//   74 			//×¢Òâ£ºdtµÄÈ¡ÖµÎªkalmanÂË²¨Æ÷²ÉÑùÊ±¼ä;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   75 float P1[2][2] = {
`P1`:
        DATA
        DC32 3F800000H, 0H, 0H, 3F800000H
//   76 							{ 1, 0 },
//   77 							{ 0, 1 }
//   78 						};
//   79 	

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   80 float Pdot1[4] ={0,0,0,0};
Pdot1:
        DS8 16
//   81 

        SECTION `.rodata`:CONST:REORDER:NOROOT(0)
//   82 const char C_01 = 1;
C_01:
        DATA
        DC8 1
//   83 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   84 float q_bias1, angle_err1, PCt_01, PCt_11, E1, K_01, K_11, t_01, t_11;
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
//   85 //-------------------------------------------------------
//   86 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   87 float Kalman_Filter1(float angle_m1,float gyro_m1)			//gyro_m:gyro_measure
//   88 {
Kalman_Filter1:
        PUSH     {R4,R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   89 	angle1+=(gyro_m1-q_bias1) * dt1;//ÏÈÑé¹À¼Æ
        MOVS     R0,R5
        LDR.W    R1,??DataTable6_18
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_19
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_20
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_20
        STR      R0,[R1, #+0]
//   90 	
//   91 	Pdot1[0]=Q_angle1 - P1[0][1] - P1[1][0];// Pk-' ÏÈÑé¹À¼ÆÎó²îÐ­·½²îµÄÎ¢·Ö
        LDR.W    R0,??DataTable6_21
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+8]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_23
        STR      R0,[R1, #+0]
//   92 	Pdot1[1]=- P1[1][1];
        LDR.W    R0,??DataTable6_23
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+12]
        EORS     R1,R1,#0x80000000
        STR      R1,[R0, #+4]
//   93 	Pdot1[2]=- P1[1][1];
        LDR.W    R0,??DataTable6_23
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+12]
        EORS     R1,R1,#0x80000000
        STR      R1,[R0, #+8]
//   94 	Pdot1[3]=Q_gyro1;
        LDR.W    R0,??DataTable6_23
        LDR.W    R1,??DataTable6_24
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+12]
//   95 	
//   96 	P1[0][0] += Pdot1[0] * dt1;// Pk- ÏÈÑé¹À¼ÆÎó²îÐ­·½²îÎ¢·ÖµÄ»ý·Ö = ÏÈÑé¹À¼ÆÎó²îÐ­·½²î
        LDR.W    R0,??DataTable6_23
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_19
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_22
        STR      R0,[R1, #+0]
//   97 	P1[0][1] += Pdot1[1] * dt1;
        LDR.W    R0,??DataTable6_23
        LDR      R1,[R0, #+4]
        LDR.W    R0,??DataTable6_19
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+4]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_22
        STR      R0,[R1, #+4]
//   98 	P1[1][0] += Pdot1[2] * dt1;
        LDR.W    R0,??DataTable6_23
        LDR      R1,[R0, #+8]
        LDR.W    R0,??DataTable6_19
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+8]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_22
        STR      R0,[R1, #+8]
//   99 	P1[1][1] += Pdot1[3] * dt1;
        LDR.W    R0,??DataTable6_23
        LDR      R1,[R0, #+12]
        LDR.W    R0,??DataTable6_19
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+12]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_22
        STR      R0,[R1, #+12]
//  100 	
//  101 	
//  102 	angle_err1 = angle_m1 - angle1;//zk-ÏÈÑé¹À¼Æ
        MOVS     R0,R4
        LDR.W    R1,??DataTable6_20
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_25
        STR      R0,[R1, #+0]
//  103 	
//  104 	
//  105 	PCt_01 = C_01 * P1[0][0];
        LDR.W    R0,??DataTable6_26
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_27
        STR      R0,[R1, #+0]
//  106 	PCt_11 = C_01 * P1[1][0];
        LDR.W    R0,??DataTable6_26
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+8]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_28
        STR      R0,[R1, #+0]
//  107 	
//  108 	E1 = R_angle1 + C_01 * PCt_01;
        LDR.W    R0,??DataTable6_26
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_27
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_29
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_30
        STR      R0,[R1, #+0]
//  109 	
//  110 	K_01 = PCt_01 / E1;//Kk
        LDR.W    R0,??DataTable6_27
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_30
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable6_31
        STR      R0,[R1, #+0]
//  111 	K_11 = PCt_11 / E1;
        LDR.W    R0,??DataTable6_28
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_30
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable6_32
        STR      R0,[R1, #+0]
//  112 	
//  113 	t_01 = PCt_01;
        LDR.W    R0,??DataTable6_33
        LDR.W    R1,??DataTable6_27
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  114 	t_11 = C_01 * P1[0][1];
        LDR.W    R0,??DataTable6_26
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_22
        LDR      R1,[R1, #+4]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_34
        STR      R0,[R1, #+0]
//  115 
//  116 	P1[0][0] -= K_01 * t_01;//ºóÑé¹À¼ÆÎó²îÐ­·½²î
        LDR.W    R0,??DataTable6_31
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_33
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_22
        LDR      R0,[R0, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_22
        STR      R0,[R1, #+0]
//  117 	P1[0][1] -= K_01 * t_11;
        LDR.W    R0,??DataTable6_31
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_34
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_22
        LDR      R0,[R0, #+4]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_22
        STR      R0,[R1, #+4]
//  118 	P1[1][0] -= K_11 * t_01;
        LDR.W    R0,??DataTable6_32
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_33
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_22
        LDR      R0,[R0, #+8]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_22
        STR      R0,[R1, #+8]
//  119 	P1[1][1] -= K_11 * t_11;
        LDR.W    R0,??DataTable6_32
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_34
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_22
        LDR      R0,[R0, #+12]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_22
        STR      R0,[R1, #+12]
//  120 	
//  121 	
//  122 	angle1	+= K_01 * angle_err1;//ºóÑé¹À¼Æ
        LDR.W    R0,??DataTable6_31
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_20
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_20
        STR      R0,[R1, #+0]
//  123 	q_bias1	+= K_11 * angle_err1;//ºóÑé¹À¼Æ
        LDR.W    R0,??DataTable6_32
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_25
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_18
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_18
        STR      R0,[R1, #+0]
//  124 	angle_dot1 = gyro_m1-q_bias1;//Êä³öÖµ£¨ºóÑé¹À¼Æ£©µÄÎ¢·Ö = ½ÇËÙ¶È
        MOVS     R0,R5
        LDR.W    R1,??DataTable6_18
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_35
        STR      R0,[R1, #+0]
//  125         return angle1;
        LDR.W    R0,??DataTable6_20
        LDR      R0,[R0, #+0]
        POP      {R4,R5,PC}       ;; return
//  126 }
//  127 
//  128 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  129 float X_b1 = 0 ;   //ÏÈÑé×´Ì¬¹À¼Æ
X_b1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  130 float X_a1 = 0 ;   //ºóÑé×´Ì¬¹À¼Æ
X_a1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  131 float P_b1 = 0 ;   //ÏÈÑé¹À¼ÆÎó²îµÄÐ­·½²î
P_b1:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  132 float P_a1 = 1 ;   //ºóÑé¹À¼ÆÎó²îµÄÐ­·½²î
P_a1:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  133 float K1   = 0 ;   //²ÐÓàµÄÔöÒæ/»ìºÏÒòÊý
K1:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  134 float Q1   = 0.05; //¹ý³Ì¼¤ÀøÔëÉùÐ­·½²î  
Q1:
        DATA
        DC32 3D4CCCCDH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  135 float R1   = 1; //¹Û²âÔëÉùÐ­·½²î
`R1`:
        DATA
        DC32 3F800000H
//  136 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  137 float X_b2 = 0 ;   //ÏÈÑé×´Ì¬¹À¼Æ
X_b2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  138 float X_a2 = 0 ;   //ºóÑé×´Ì¬¹À¼Æ
X_a2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  139 float P_b2 = 0 ;   //ÏÈÑé¹À¼ÆÎó²îµÄÐ­·½²î
P_b2:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  140 float P_a2 = 1 ;   //ºóÑé¹À¼ÆÎó²îµÄÐ­·½²î
P_a2:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  141 float K2   = 0 ;   //²ÐÓàµÄÔöÒæ/»ìºÏÒòÊý
K2:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  142 float Q2   = 0.1; //¹ý³Ì¼¤ÀøÔëÉùÐ­·½²î  
Q2:
        DATA
        DC32 3DCCCCCDH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  143 float R2   = 0.9; //¹Û²âÔëÉùÐ­·½²î
`R2`:
        DATA
        DC32 3F666666H
//  144 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  145 float X_b3 = 0 ;   //ÏÈÑé×´Ì¬¹À¼Æ
X_b3:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  146 float X_a3 = 0 ;   //ºóÑé×´Ì¬¹À¼Æ
X_a3:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  147 float P_b3 = 0 ;   //ÏÈÑé¹À¼ÆÎó²îµÄÐ­·½²î
P_b3:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  148 float P_a3 = 1 ;   //ºóÑé¹À¼ÆÎó²îµÄÐ­·½²î
P_a3:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  149 float K3   = 0 ;   //²ÐÓàµÄÔöÒæ/»ìºÏÒòÊý
K3:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  150 float Q3   = 0.1; //¹ý³Ì¼¤ÀøÔëÉùÐ­·½²î  
Q3:
        DATA
        DC32 3DCCCCCDH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  151 float R3   = 0.9; //¹Û²âÔëÉùÐ­·½²î
`R3`:
        DATA
        DC32 3F666666H
//  152 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  153 float X_b4 = 0 ;   //ÏÈÑé×´Ì¬¹À¼Æ
X_b4:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  154 float X_a4 = 0 ;   //ºóÑé×´Ì¬¹À¼Æ
X_a4:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  155 float P_b4 = 0 ;   //ÏÈÑé¹À¼ÆÎó²îµÄÐ­·½²î
P_b4:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  156 float P_a4 = 1 ;   //ºóÑé¹À¼ÆÎó²îµÄÐ­·½²î
P_a4:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  157 float K4   = 0 ;   //²ÐÓàµÄÔöÒæ/»ìºÏÒòÊý
K4:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  158 float Q4   = 0.1; //¹ý³Ì¼¤ÀøÔëÉùÐ­·½²î  
Q4:
        DATA
        DC32 3DCCCCCDH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  159 float R4   = 0.9; //¹Û²âÔëÉùÐ­·½²î
`R4`:
        DATA
        DC32 3F666666H
//  160 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  161 float kalman_filter1(float Z1)
//  162 { X_b1 = X_a1 ;
kalman_filter1:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable6_36
        LDR.W    R1,??DataTable6_37
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  163   P_b1 = P_a1 + Q1 ;
        LDR.W    R0,??DataTable6_38
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_39
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_40
        STR      R0,[R1, #+0]
//  164   K1   = P_b1  / (P_b1 + R1) ;
        LDR.W    R0,??DataTable6_40
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_41
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_40
        LDR      R0,[R0, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable6_42
        STR      R0,[R1, #+0]
//  165   X_a1 = X_b1 + K1 * (Z1 - X_b1) ;
        MOVS     R0,R4
        LDR.W    R1,??DataTable6_36
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_42
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_36
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_37
        STR      R0,[R1, #+0]
//  166   P_a1 = (1 - K1) * P_b1 ;
        MOVS     R0,#+1065353216
        LDR.W    R1,??DataTable6_42
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_40
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_38
        STR      R0,[R1, #+0]
//  167   return X_a1 ;
        LDR.W    R0,??DataTable6_37
        LDR      R0,[R0, #+0]
        POP      {R4,PC}          ;; return
//  168 }        

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  169 float kalman_filter2(float Z2)
//  170 { X_b2 = X_a2 ;
kalman_filter2:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable6_43
        LDR.W    R1,??DataTable6_44
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  171   P_b2 = P_a2 + Q2 ;
        LDR.W    R0,??DataTable6_45
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_46
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_47
        STR      R0,[R1, #+0]
//  172   K2  =  P_b2  / (P_b2 + R2) ;
        LDR.W    R0,??DataTable6_47
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_48
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_47
        LDR      R0,[R0, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable6_49
        STR      R0,[R1, #+0]
//  173   X_a2 = X_b2 + K2 * (Z2 - X_b2) ;
        MOVS     R0,R4
        LDR.W    R1,??DataTable6_43
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_49
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_43
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_44
        STR      R0,[R1, #+0]
//  174   P_a2 = (1 - K2) * P_b2 ;
        MOVS     R0,#+1065353216
        LDR.W    R1,??DataTable6_49
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_47
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_45
        STR      R0,[R1, #+0]
//  175   return X_a2 ;
        LDR.W    R0,??DataTable6_44
        LDR      R0,[R0, #+0]
        POP      {R4,PC}          ;; return
//  176 }        

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  177 float kalman_filter3(float Z3)
//  178 { X_b3 = X_a3 ;
kalman_filter3:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable6_50
        LDR.W    R1,??DataTable6_51
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  179   P_b3 = P_a3 + Q3 ;
        LDR.W    R0,??DataTable6_52
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_53
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_54
        STR      R0,[R1, #+0]
//  180   K3   = P_b3  / (P_b3 + R3) ;
        LDR.W    R0,??DataTable6_54
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_55
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_54
        LDR      R0,[R0, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable6_56
        STR      R0,[R1, #+0]
//  181   X_a3 = X_b3 + K3 * (Z3 - X_b3) ;
        MOVS     R0,R4
        LDR.W    R1,??DataTable6_50
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_56
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_50
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_51
        STR      R0,[R1, #+0]
//  182   P_a3 = (1 - K3) * P_b3 ;
        MOVS     R0,#+1065353216
        LDR.W    R1,??DataTable6_56
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_54
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_52
        STR      R0,[R1, #+0]
//  183   return X_a3 ;
        LDR.W    R0,??DataTable6_51
        LDR      R0,[R0, #+0]
        POP      {R4,PC}          ;; return
//  184 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  185 float kalman_filter4(float Z4)
//  186 { X_b4 = X_a4 ;
kalman_filter4:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable6_57
        LDR.W    R1,??DataTable6_58
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  187   P_b4 = P_a4 + Q4 ;
        LDR.W    R0,??DataTable6_59
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_60
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_61
        STR      R0,[R1, #+0]
//  188   K4   = P_b4  / (P_b4 + R4) ;
        LDR.W    R0,??DataTable6_61
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable6_62
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R1,R0
        LDR.W    R0,??DataTable6_61
        LDR      R0,[R0, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable6_63
        STR      R0,[R1, #+0]
//  189   X_a4 = X_b4 + K4 * (Z4 - X_b4) ;
        MOVS     R0,R4
        LDR.W    R1,??DataTable6_57
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_63
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_57
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable6_58
        STR      R0,[R1, #+0]
//  190   P_a4 = (1 - K4) * P_b4 ;
        MOVS     R0,#+1065353216
        LDR.W    R1,??DataTable6_63
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable6_61
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable6_59
        STR      R0,[R1, #+0]
//  191   return X_a4 ;
        LDR.W    R0,??DataTable6_58
        LDR      R0,[R0, #+0]
        POP      {R4,PC}          ;; return
//  192 }
//  193 
//  194 //////////////////////////////////////////////////////////////////////////////////////////////////////

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  195 void matrix_multiply(float* A, float* B, int m, int p, int n, float* C)
//  196 {
matrix_multiply:
        PUSH     {R0,R2,R4-R11,LR}
        MOVS     R4,R1
        MOVS     R5,R3
//  197 
//  198     int i, j, k; 
//  199     for (i=0;i<m;i++) 
        MOVS     R8,#+0
        LDR      R6,[SP, #+44]
        LDR      R7,[SP, #+48]
        B.N      ??matrix_multiply_0
??matrix_multiply_1:
        ADDS     R8,R8,#+1
??matrix_multiply_0:
        LDR      R0,[SP, #+4]
        CMP      R8,R0
        BGE.N    ??matrix_multiply_2
//  200         for(j=0;j<n;j++) 
        MOVS     R9,#+0
        B.N      ??matrix_multiply_3
//  201         { 
//  202           C[n*i+j]=0; 
//  203           for (k=0;k<p;k++) 
//  204             C[n*i+j]= C[n*i+j]+A[p*i+k]*B[n*k+j]; 
??matrix_multiply_4:
        MLA      R11,R8,R6,R9
        MLA      R0,R8,R5,R10
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, R0, LSL #+2]
        MLA      R0,R10,R6,R9
        LDR      R0,[R4, R0, LSL #+2]
        BL       __aeabi_fmul
        MLA      R1,R8,R6,R9
        LDR      R1,[R7, R1, LSL #+2]
        BL       __aeabi_fadd
        STR      R0,[R7, R11, LSL #+2]
        ADDS     R10,R10,#+1
??matrix_multiply_5:
        CMP      R10,R5
        BLT.N    ??matrix_multiply_4
        ADDS     R9,R9,#+1
??matrix_multiply_3:
        CMP      R9,R6
        BGE.N    ??matrix_multiply_1
        MLA      R0,R8,R6,R9
        MOVS     R1,#+0
        STR      R1,[R7, R0, LSL #+2]
        MOVS     R10,#+0
        B.N      ??matrix_multiply_5
//  205         } 
//  206 } 
??matrix_multiply_2:
        POP      {R0,R1,R4-R11,PC}  ;; return
//  207 
//  208 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  209 static void matrix_addition(float* A, float* B, int m, int n, float* C) 
//  210 
//  211 { 
matrix_addition:
        PUSH     {R4-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  212 
//  213     int i, j; 
//  214     for (i=0;i<m;i++) 
        MOVS     R8,#+0
        LDR      R9,[SP, #+36]
        B.N      ??matrix_addition_0
//  215         for(j=0;j<n;j++) 
//  216             C[n*i+j]=A[n*i+j]+B[n*i+j]; 
??matrix_addition_1:
        MLA      R11,R8,R7,R10
        MLA      R0,R8,R7,R10
        LDR      R0,[R4, R0, LSL #+2]
        MLA      R1,R8,R7,R10
        LDR      R1,[R5, R1, LSL #+2]
        BL       __aeabi_fadd
        STR      R0,[R9, R11, LSL #+2]
        ADDS     R10,R10,#+1
??matrix_addition_2:
        CMP      R10,R7
        BLT.N    ??matrix_addition_1
        ADDS     R8,R8,#+1
??matrix_addition_0:
        CMP      R8,R6
        BGE.N    ??matrix_addition_3
        MOVS     R10,#+0
        B.N      ??matrix_addition_2
//  217 } 
??matrix_addition_3:
        POP      {R4-R11,PC}      ;; return
//  218 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  219 void matrix_subtraction(float* A, float* B, int m, int n, float* C) 
//  220 {
matrix_subtraction:
        PUSH     {R4-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  221     int i, j; 
//  222     for (i=0;i<m;i++) 
        MOVS     R8,#+0
        LDR      R9,[SP, #+36]
        B.N      ??matrix_subtraction_0
//  223         for(j=0;j<n;j++) 
//  224             C[n*i+j]=A[n*i+j]-B[n*i+j]; 
??matrix_subtraction_1:
        MLA      R11,R8,R7,R10
        MLA      R0,R8,R7,R10
        LDR      R0,[R4, R0, LSL #+2]
        MLA      R1,R8,R7,R10
        LDR      R1,[R5, R1, LSL #+2]
        BL       __aeabi_fsub
        STR      R0,[R9, R11, LSL #+2]
        ADDS     R10,R10,#+1
??matrix_subtraction_2:
        CMP      R10,R7
        BLT.N    ??matrix_subtraction_1
        ADDS     R8,R8,#+1
??matrix_subtraction_0:
        CMP      R8,R6
        BGE.N    ??matrix_subtraction_3
        MOVS     R10,#+0
        B.N      ??matrix_subtraction_2
//  225 } 
??matrix_subtraction_3:
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  226 void matrix_transpose(float* A, int m, int n, float* C) 
//  227 {     
matrix_transpose:
        PUSH     {R4-R7}
//  228      int i, j; 
//  229     for (i=0;i<m;i++) 
        MOVS     R4,#+0
        B.N      ??matrix_transpose_0
//  230         for(j=0;j<n;j++) 
//  231             C[m*j+i]=A[n*i+j]; 
??matrix_transpose_1:
        MLA      R6,R5,R1,R4
        MLA      R7,R4,R2,R5
        LDR      R7,[R0, R7, LSL #+2]
        STR      R7,[R3, R6, LSL #+2]
        ADDS     R5,R5,#+1
??matrix_transpose_2:
        CMP      R5,R2
        BLT.N    ??matrix_transpose_1
        ADDS     R4,R4,#+1
??matrix_transpose_0:
        CMP      R4,R1
        BGE.N    ??matrix_transpose_3
        MOVS     R5,#+0
        B.N      ??matrix_transpose_2
//  232 }
??matrix_transpose_3:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  233 int matrix_inversion(float* A, int n, float* AInverse) 
//  234 { 
matrix_inversion:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  235     int i, j, iPass, imx, icol, irow; 
//  236     float det, temp, pivot, factor; 
//  237     float* ac = (float*)calloc(n*n, sizeof(float)); 
        MOVS     R1,#+4
        MUL      R0,R5,R5
        BL       calloc
        STR      R0,[SP, #+4]
//  238     det = 1; 
        MOVS     R11,#+1065353216
//  239     for (i = 0; i < n; i++) 
        MOVS     R0,#+0
        B.N      ??matrix_inversion_0
//  240     { 
//  241         for (j = 0; j < n; j++) 
//  242         { 
//  243             AInverse[n*i+j] = 0; 
??matrix_inversion_1:
        MLA      R2,R0,R5,R1
        MOVS     R3,#+0
        STR      R3,[R6, R2, LSL #+2]
//  244             ac[n*i+j] = A[n*i+j]; 
        MLA      R2,R0,R5,R1
        LDR      R3,[SP, #+4]
        MLA      R12,R0,R5,R1
        LDR      R12,[R4, R12, LSL #+2]
        STR      R12,[R3, R2, LSL #+2]
//  245         } 
        ADDS     R1,R1,#+1
??matrix_inversion_2:
        CMP      R1,R5
        BLT.N    ??matrix_inversion_1
//  246         AInverse[n*i+i] = 1; 
        MLA      R1,R0,R5,R0
        MOVS     R2,#+1065353216
        STR      R2,[R6, R1, LSL #+2]
        ADDS     R0,R0,#+1
??matrix_inversion_0:
        CMP      R0,R5
        BGE.N    ??matrix_inversion_3
        MOVS     R1,#+0
        B.N      ??matrix_inversion_2
//  247     } 
//  248 
//  249 
//  250     for (iPass = 0; iPass < n; iPass++) 
??matrix_inversion_3:
        MOVS     R8,#+0
        B.N      ??matrix_inversion_4
??matrix_inversion_5:
        ADDS     R8,R8,#+1
??matrix_inversion_4:
        CMP      R8,R5
        BGE.W    ??matrix_inversion_6
//  251     { 
//  252         imx = iPass; 
        STR      R8,[SP, #+0]
//  253         for (irow = iPass; irow < n; irow++) 
        MOV      R9,R8
        B.N      ??matrix_inversion_7
//  254         { 
//  255             if (fabs(A[n*irow+iPass]) > fabs(A[n*imx+iPass])) imx = irow; 
??matrix_inversion_8:
        LDR      R0,[SP, #+0]
        MLA      R0,R0,R5,R8
        LDR      R0,[R4, R0, LSL #+2]
        BL       __aeabi_f2d
        BL       fabs
        MOV      R10,R0
        MLA      R0,R9,R5,R8
        LDR      R0,[R4, R0, LSL #+2]
        BL       __aeabi_f2d
        BL       fabs
        CMP      R10,R0
        BGE.N    ??matrix_inversion_9
        STR      R9,[SP, #+0]
//  256         } 
??matrix_inversion_9:
        ADDS     R9,R9,#+1
??matrix_inversion_7:
        CMP      R9,R5
        BLT.N    ??matrix_inversion_8
//  257 
//  258 
//  259         if (imx != iPass) 
        LDR      R0,[SP, #+0]
        CMP      R0,R8
        BEQ.N    ??matrix_inversion_10
//  260         { 
//  261             for (icol = 0; icol < n; icol++) 
        MOVS     R10,#+0
        B.N      ??matrix_inversion_11
//  262             { 
//  263                 temp = AInverse[n*iPass+icol]; 
??matrix_inversion_12:
        MLA      R0,R8,R5,R10
        LDR      R0,[R6, R0, LSL #+2]
//  264                 AInverse[n*iPass+icol] = AInverse[n*imx+icol]; 
        MLA      R1,R8,R5,R10
        LDR      R2,[SP, #+0]
        MLA      R2,R2,R5,R10
        LDR      R2,[R6, R2, LSL #+2]
        STR      R2,[R6, R1, LSL #+2]
//  265                 AInverse[n*imx+icol] = temp; 
        LDR      R1,[SP, #+0]
        MLA      R1,R1,R5,R10
        STR      R0,[R6, R1, LSL #+2]
//  266                 if (icol >= iPass) 
        CMP      R10,R8
        BLT.N    ??matrix_inversion_13
//  267                 { 
//  268                     temp = A[n*iPass+icol]; 
        MLA      R0,R8,R5,R10
        LDR      R0,[R4, R0, LSL #+2]
//  269                     A[n*iPass+icol] = A[n*imx+icol]; 
        MLA      R1,R8,R5,R10
        LDR      R2,[SP, #+0]
        MLA      R2,R2,R5,R10
        LDR      R2,[R4, R2, LSL #+2]
        STR      R2,[R4, R1, LSL #+2]
//  270                     A[n*imx+icol] = temp; 
        LDR      R1,[SP, #+0]
        MLA      R1,R1,R5,R10
        STR      R0,[R4, R1, LSL #+2]
//  271                 } 
//  272             } 
??matrix_inversion_13:
        ADDS     R10,R10,#+1
??matrix_inversion_11:
        CMP      R10,R5
        BLT.N    ??matrix_inversion_12
//  273         } 
//  274 
//  275         pivot = A[n*iPass+iPass]; 
??matrix_inversion_10:
        MLA      R0,R8,R5,R8
        LDR      R9,[R4, R0, LSL #+2]
//  276         det = det * pivot; 
        MOV      R0,R11
        MOV      R1,R9
        BL       __aeabi_fmul
        MOV      R11,R0
//  277         if (det == 0) 
        MOV      R0,R11
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??matrix_inversion_14
//  278         { 
//  279             free(ac); 
        LDR      R0,[SP, #+4]
        BL       free
//  280             return 0; 
        MOVS     R0,#+0
        B.N      ??matrix_inversion_15
//  281         } 
//  282 
//  283         for (icol = 0; icol < n; icol++) 
??matrix_inversion_14:
        MOVS     R10,#+0
        B.N      ??matrix_inversion_16
//  284         { 
//  285 
//  286             AInverse[n*iPass+icol] = AInverse[n*iPass+icol] / pivot; 
??matrix_inversion_17:
        MLA      R0,R8,R5,R10
        STR      R0,[SP, #+0]
        MLA      R0,R8,R5,R10
        LDR      R0,[R6, R0, LSL #+2]
        MOV      R1,R9
        BL       __aeabi_fdiv
        LDR      R1,[SP, #+0]
        STR      R0,[R6, R1, LSL #+2]
//  287             if (icol >= iPass) A[n*iPass+icol] = A[n*iPass+icol] / pivot; 
        CMP      R10,R8
        BLT.N    ??matrix_inversion_18
        MLA      R0,R8,R5,R10
        STR      R0,[SP, #+0]
        MLA      R0,R8,R5,R10
        LDR      R0,[R4, R0, LSL #+2]
        MOV      R1,R9
        BL       __aeabi_fdiv
        LDR      R1,[SP, #+0]
        STR      R0,[R4, R1, LSL #+2]
//  288         } 
??matrix_inversion_18:
        ADDS     R10,R10,#+1
??matrix_inversion_16:
        CMP      R10,R5
        BLT.N    ??matrix_inversion_17
//  289 
//  290         for (irow = 0; irow < n; irow++) 
        MOVS     R9,#+0
        B.N      ??matrix_inversion_19
//  291         { 
//  292 
//  293             if (irow != iPass) factor = A[n*irow+iPass]; 
//  294             for (icol = 0; icol < n; icol++) 
//  295             { 
//  296                 if (irow != iPass) 
??matrix_inversion_20:
        CMP      R9,R8
        BEQ.N    ??matrix_inversion_21
//  297                 { 
//  298                     AInverse[n*irow+icol] -= factor * AInverse[n*iPass+icol]; 
        MLA      R0,R9,R5,R10
        STR      R0,[SP, #+0]
        MLA      R0,R8,R5,R10
        LDR      R0,[R6, R0, LSL #+2]
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOVS     R1,R0
        MLA      R0,R9,R5,R10
        LDR      R0,[R6, R0, LSL #+2]
        BL       __aeabi_fsub
        LDR      R1,[SP, #+0]
        STR      R0,[R6, R1, LSL #+2]
//  299                     A[n*irow+icol] -= factor * A[n*iPass+icol]; 
        MLA      R0,R9,R5,R10
        STR      R0,[SP, #+0]
        MLA      R0,R8,R5,R10
        LDR      R0,[R4, R0, LSL #+2]
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOVS     R1,R0
        MLA      R0,R9,R5,R10
        LDR      R0,[R4, R0, LSL #+2]
        BL       __aeabi_fsub
        LDR      R1,[SP, #+0]
        STR      R0,[R4, R1, LSL #+2]
//  300                 } 
//  301             } 
??matrix_inversion_21:
        ADDS     R10,R10,#+1
??matrix_inversion_22:
        CMP      R10,R5
        BLT.N    ??matrix_inversion_20
        ADDS     R9,R9,#+1
??matrix_inversion_19:
        CMP      R9,R5
        BGE.W    ??matrix_inversion_5
        CMP      R9,R8
        BEQ.N    ??matrix_inversion_23
        MLA      R0,R9,R5,R8
        LDR      R7,[R4, R0, LSL #+2]
??matrix_inversion_23:
        MOVS     R10,#+0
        B.N      ??matrix_inversion_22
//  302         } 
//  303     } 
//  304 
//  305     free(ac); 
??matrix_inversion_6:
        LDR      R0,[SP, #+4]
        BL       free
//  306     return 1; 
        MOVS     R0,#+1
??matrix_inversion_15:
        POP      {R1-R11,PC}      ;; return
//  307 } 
//  308 
//  309 
//  310 
//  311 
//  312 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  313 float kalman_update(float gyroscope_rate, float accelerometer_angle) 
//  314 { 
kalman_update:
        PUSH     {LR}
        SUB      SP,SP,#+212
//  315 
//  316    static  float A[2][2] = {{1.0, -0.019968}, {0.0, 1.0}}; 
//  317    static  float B[2][1] = {{0.019968}, {0.0}}; 
//  318   static   float C[1][2] = {{1.0, 0.0}}; 
//  319   static   float Sz[1][1] = {{17.2}}; 
//  320   static   float Sw[2][2] = {{0.005, 0.005}, {0.005, 0.005}}; 
//  321 
//  322 
//  323    static   float xhat[2][1] = {{0.0}, {0.0}}; 
//  324    static   float P[2][2] = {{0.005, 0.005}, {0.005, 0.005}}; 
//  325 
//  326 
//  327     float u[1][1];        
//  328     float y[1][1];         
//  329 
//  330     float AP[2][2];            
//  331     float CT[2][1];         
//  332     float APCT[2][1];         
//  333     float CP[1][2];  
//  334     float CPCT[1][1];   
//  335     float CPCTSz[1][1];   
//  336     float CPCTSzInv[1][1]; 
//  337     float K[2][1];   
//  338     float Cxhat[1][1];   
//  339     float yCxhat[1][1];      
//  340     float KyCxhat[2][1];  
//  341     float Axhat[2][1];      
//  342     float Bu[2][1];  
//  343     float AxhatBu[2][1];  
//  344     float AT[2][2];   
//  345     float APAT[2][2];       
//  346     float APATSw[2][2];         
//  347     float KC[2][2];          
//  348     float KCP[2][2];        
//  349     float KCPAT[2][2];     
//  350 
//  351 
//  352     u[0][0] = gyroscope_rate; 
        STR      R0,[SP, #+32]
//  353     y[0][0] = accelerometer_angle; 
        STR      R1,[SP, #+28]
//  354 
//  355 
//  356 
//  357     matrix_multiply((float*) A, (float*) xhat, 2, 2, 1, (float*) Axhat); 
        ADD      R0,SP,#+68
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+2
        LDR.N    R1,??DataTable6_64
        LDR.N    R0,??DataTable6_65
        BL       matrix_multiply
//  358     matrix_multiply((float*) B, (float*) u, 2, 1, 1, (float*) Bu); 
        ADD      R0,SP,#+60
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        ADD      R1,SP,#+32
        LDR.N    R0,??DataTable6_66
        BL       matrix_multiply
//  359     matrix_addition((float*) Axhat, (float*) Bu, 2, 1, (float*) AxhatBu); 
        ADD      R0,SP,#+52
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        ADD      R1,SP,#+60
        ADD      R0,SP,#+68
        BL       matrix_addition
//  360 
//  361 
//  362 
//  363 
//  364     matrix_multiply((float*) C, (float*) xhat, 1, 2, 1, (float*) Cxhat); 
        ADD      R0,SP,#+12
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+1
        LDR.N    R1,??DataTable6_64
        LDR.N    R0,??DataTable6_67
        BL       matrix_multiply
//  365     matrix_subtraction((float*) y, (float*) Cxhat, 1, 1, (float*) yCxhat); 
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+1
        ADD      R1,SP,#+12
        ADD      R0,SP,#+28
        BL       matrix_subtraction
//  366 
//  367  
//  368     matrix_transpose((float*) C, 1, 2, (float*) CT); 
        ADD      R3,SP,#+44
        MOVS     R2,#+2
        MOVS     R1,#+1
        LDR.N    R0,??DataTable6_67
        BL       matrix_transpose
//  369     matrix_multiply((float*) C, (float*) P, 1, 2, 2, (float*) CP); 
        ADD      R0,SP,#+84
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+1
        LDR.N    R1,??DataTable6_68
        LDR.N    R0,??DataTable6_67
        BL       matrix_multiply
//  370     matrix_multiply((float*) CP, (float*) CT, 1, 2, 1, (float*) CPCT); 
        ADD      R0,SP,#+24
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+1
        ADD      R1,SP,#+44
        ADD      R0,SP,#+84
        BL       matrix_multiply
//  371     matrix_addition((float*) CPCT, (float*) Sz, 1, 1, (float*) CPCTSz); 
        ADD      R0,SP,#+20
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+1
        LDR.N    R1,??DataTable6_69
        ADD      R0,SP,#+24
        BL       matrix_addition
//  372 
//  373     matrix_multiply((float*) A, (float*) P, 2, 2, 2, (float*) AP); 
        ADD      R0,SP,#+116
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+2
        LDR.N    R1,??DataTable6_68
        LDR.N    R0,??DataTable6_65
        BL       matrix_multiply
//  374     matrix_multiply((float*) AP, (float*) CT, 2, 2, 1, (float*) APCT); 
        ADD      R0,SP,#+92
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+2
        ADD      R1,SP,#+44
        ADD      R0,SP,#+116
        BL       matrix_multiply
//  375     matrix_inversion((float*) CPCTSz, 1, (float*) CPCTSzInv); 
        ADD      R2,SP,#+16
        MOVS     R1,#+1
        ADD      R0,SP,#+20
        BL       matrix_inversion
//  376     matrix_multiply((float*) APCT, (float*) CPCTSzInv, 2, 1, 1, (float*) K); 
        ADD      R0,SP,#+36
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        ADD      R1,SP,#+16
        ADD      R0,SP,#+92
        BL       matrix_multiply
//  377 
//  378 
//  379     matrix_multiply((float*) K, (float*) yCxhat, 2, 1, 1, (float*) KyCxhat); 
        ADD      R0,SP,#+76
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        ADD      R1,SP,#+8
        ADD      R0,SP,#+36
        BL       matrix_multiply
//  380     matrix_addition((float*) AxhatBu, (float*) KyCxhat, 2, 1, (float*) xhat); 
        LDR.N    R0,??DataTable6_64
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        ADD      R1,SP,#+76
        ADD      R0,SP,#+52
        BL       matrix_addition
//  381 
//  382     matrix_transpose((float*) A, 2, 2, (float*) AT); 
        ADD      R3,SP,#+100
        MOVS     R2,#+2
        MOVS     R1,#+2
        LDR.N    R0,??DataTable6_65
        BL       matrix_transpose
//  383     matrix_multiply((float*) AP, (float*) AT, 2, 2, 2, (float*) APAT); 
        ADD      R0,SP,#+196
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+2
        ADD      R1,SP,#+100
        ADD      R0,SP,#+116
        BL       matrix_multiply
//  384     matrix_addition((float*) APAT, (float*) Sw, 2, 2, (float*) APATSw); 
        ADD      R0,SP,#+180
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+2
        LDR.N    R1,??DataTable6_70
        ADD      R0,SP,#+196
        BL       matrix_addition
//  385     matrix_multiply((float*) K, (float*) C, 2, 1, 2, (float*) KC); 
        ADD      R0,SP,#+164
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+2
        LDR.N    R1,??DataTable6_67
        ADD      R0,SP,#+36
        BL       matrix_multiply
//  386     matrix_multiply((float*) KC, (float*) P, 2, 2, 2, (float*) KCP); 
        ADD      R0,SP,#+148
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+2
        LDR.N    R1,??DataTable6_68
        ADD      R0,SP,#+164
        BL       matrix_multiply
//  387     matrix_multiply((float*) KCP, (float*) AT, 2, 2, 2, (float*) KCPAT); 
        ADD      R0,SP,#+132
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+2
        ADD      R1,SP,#+100
        ADD      R0,SP,#+148
        BL       matrix_multiply
//  388     matrix_subtraction((float*) APATSw, (float*) KCPAT, 2, 2, (float*) P); 
        LDR.N    R0,??DataTable6_68
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        MOVS     R2,#+2
        ADD      R1,SP,#+132
        ADD      R0,SP,#+180
        BL       matrix_subtraction
//  389 
//  390 
//  391     return xhat[0][0]; 
        LDR.N    R0,??DataTable6_64
        LDR      R0,[R0, #+0]
        ADD      SP,SP,#+212
        POP      {PC}             ;; return
//  392 } 

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     q_bias

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     dt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     Q_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     Pdot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     Q_gyro

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     angle_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     C_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     PCt_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     PCt_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     R_angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     E

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     K_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     K_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     t_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     t_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     angle_dot

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     q_bias1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     dt1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_20:
        DC32     angle1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_21:
        DC32     Q_angle1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_22:
        DC32     `P1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_23:
        DC32     Pdot1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_24:
        DC32     Q_gyro1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_25:
        DC32     angle_err1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_26:
        DC32     C_01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_27:
        DC32     PCt_01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_28:
        DC32     PCt_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_29:
        DC32     R_angle1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_30:
        DC32     E1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_31:
        DC32     K_01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_32:
        DC32     K_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_33:
        DC32     t_01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_34:
        DC32     t_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_35:
        DC32     angle_dot1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_36:
        DC32     X_b1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_37:
        DC32     X_a1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_38:
        DC32     P_a1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_39:
        DC32     Q1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_40:
        DC32     P_b1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_41:
        DC32     `R1`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_42:
        DC32     K1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_43:
        DC32     X_b2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_44:
        DC32     X_a2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_45:
        DC32     P_a2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_46:
        DC32     Q2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_47:
        DC32     P_b2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_48:
        DC32     `R2`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_49:
        DC32     K2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_50:
        DC32     X_b3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_51:
        DC32     X_a3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_52:
        DC32     P_a3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_53:
        DC32     Q3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_54:
        DC32     P_b3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_55:
        DC32     `R3`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_56:
        DC32     K3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_57:
        DC32     X_b4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_58:
        DC32     X_a4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_59:
        DC32     P_a4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_60:
        DC32     Q4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_61:
        DC32     P_b4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_62:
        DC32     `R4`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_63:
        DC32     K4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_64:
        DC32     ??xhat

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_65:
        DC32     ??A

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_66:
        DC32     ??B

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_67:
        DC32     ??C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_68:
        DC32     ??P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_69:
        DC32     ??Sz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_70:
        DC32     ??Sw

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??A:
        DATA
        DC32 3F800000H, 0BCA393EEH, 0H, 3F800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??B:
        DATA
        DC32 3CA393EEH, 0H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??C:
        DATA
        DC32 3F800000H, 0H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??Sz:
        DATA
        DC32 4189999AH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??Sw:
        DATA
        DC32 3BA3D70AH, 3BA3D70AH, 3BA3D70AH, 3BA3D70AH

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??xhat:
        DS8 8

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??P:
        DATA
        DC32 3BA3D70AH, 3BA3D70AH, 3BA3D70AH, 3BA3D70AH

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//   192 bytes in section .bss
//   180 bytes in section .data
//     2 bytes in section .rodata
// 3 418 bytes in section .text
// 
// 3 418 bytes of CODE  memory
//     2 bytes of CONST memory
//   372 bytes of DATA  memory
//
//Errors: none
//Warnings: 4
