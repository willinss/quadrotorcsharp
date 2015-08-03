///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:04 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\MahonyAHRS.c          /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\MahonyAHRS.c" -D     /
//                    IAR -D TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quad /
//                    rotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\bin\Flash\List\" -lB   /
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
//                    (¸ÄI2C)\bin\Flash\List\MahonyAHRS.s                     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME MahonyAHRS

        #define SHT_PROGBITS 0x1

        EXTERN Q_x
        EXTERN Q_x1
        EXTERN Q_y
        EXTERN Q_y1
        EXTERN Q_z
        EXTERN Q_z1
        EXTERN __aeabi_cfcmpeq
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN asin
        EXTERN atan2
        EXTERN sqrt

        PUBLIC Angle_X
        PUBLIC Angle_X0
        PUBLIC Angle_Y
        PUBLIC Angle_Y0
        PUBLIC Angle_Z
        PUBLIC Angle_Z0
        PUBLIC MahonyAHRSupdate
        PUBLIC MahonyAHRSupdateIMU
        PUBLIC MahonyAHRSupdateIMU1
        PUBLIC integralFBx
        PUBLIC integralFBx1
        PUBLIC integralFBy
        PUBLIC integralFBy1
        PUBLIC integralFBz
        PUBLIC integralFBz1
        PUBLIC invSqrt
        PUBLIC q0
        PUBLIC q01
        PUBLIC q1
        PUBLIC q11
        PUBLIC q2
        PUBLIC q21
        PUBLIC q3
        PUBLIC q31
        PUBLIC twoKi
        PUBLIC twoKi1
        PUBLIC twoKp
        PUBLIC twoKp1

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\MahonyAHRS.c
//    1 //=====================================================================================================
//    2 // MahonyAHRS.c
//    3 //=====================================================================================================
//    4 //
//    5 // Madgwick's implementation of Mayhony's AHRS algorithm.
//    6 // See: http://www.x-io.co.uk/node/8#open_source_ahrs_and_imu_algorithms
//    7 //
//    8 // Date			Author			Notes
//    9 // 29/09/2011	SOH Madgwick    Initial release
//   10 // 02/10/2011	SOH Madgwick	Optimised for reduced CPU load
//   11 //
//   12 //=====================================================================================================
//   13 
//   14 //---------------------------------------------------------------------------------------------------
//   15 // Header files
//   16 
//   17 #include "MahonyAHRS.h"
//   18 //#include "MadgwickAHRS.h"
//   19 #include <math.h>
//   20 #include "get_data.h"
//   21 //---------------------------------------------------------------------------------------------------
//   22 // Definitions
//   23 
//   24 #define sampleFreq	 400.0f			// sample frequency in Hz
//   25 #define twoKpDef	(2.0f * 0.2f)	// 2 * proportional gain
//   26 #define twoKiDef	(1.0f * 0.000f)	// 2 * integral gain
//   27 
//   28 //---------------------------------------------------------------------------------------------------
//   29 // Variable definitions
//   30 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   31 float twoKp = twoKpDef;											// 2 * proportional gain (Kp)
twoKp:
        DATA
        DC32 3ECCCCCDH

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 float twoKi = twoKiDef;
twoKi:
        DS8 4
//   33 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   34 float twoKp1 = twoKpDef;											// 2 * proportional gain (Kp)
twoKp1:
        DATA
        DC32 3ECCCCCDH

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 float twoKi1 = twoKiDef;
twoKi1:
        DS8 4
//   36 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   37 float q01 = 1.0f, q11 = 0.0f, q21 = 0.0f, q31 = 0.0f;	
q01:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
q11:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
q21:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
q31:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   38 float q0 = 1.0f, q1 = 0.0f, q2 = 0.0f, q3 = 0.0f;					// quaternion of sensor frame relative to auxiliary frame
q0:
        DATA
        DC32 3F800000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
q1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
q2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
q3:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39 float integralFBx = 0.0f,  integralFBy = 0.0f, integralFBz = 0.0f;	// integral error terms scaled by Ki
integralFBx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
integralFBy:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
integralFBz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   40 float integralFBx1 = 0.0f,  integralFBy1 = 0.0f, integralFBz1 = 0.0f;	
integralFBx1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
integralFBy1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
integralFBz1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 float Angle_X = 0.0f, Angle_Y = 0, Angle_Z = 0;
Angle_X:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_Y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_Z:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   42 float Angle_X0 = 0.0f, Angle_Y0 = 0, Angle_Z0 = 0;
Angle_X0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_Y0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_Z0:
        DS8 4
//   43 //---------------------------------------------------------------------------------------------------
//   44 // Function declarations
//   45 
//   46 float invSqrt(float x);
//   47 
//   48 //====================================================================================================
//   49 // Functions
//   50 
//   51 //---------------------------------------------------------------------------------------------------
//   52 // AHRS algorithm update
//   53 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   54 void MahonyAHRSupdate(float gx, float gy, float gz, float ax, float ay, float az, float mx, float my, float mz)
//   55 {
MahonyAHRSupdate:
        PUSH     {R3-R11,LR}
        SUB      SP,SP,#+64
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        LDR      R0,[SP, #+104]
        STR      R0,[SP, #+104]
        LDR      R10,[SP, #+108]
        LDR      R7,[SP, #+112]
        LDR      R8,[SP, #+116]
        LDR      R9,[SP, #+120]
//   56     float recipNorm;
//   57     float q0q0, q0q1, q0q2, q0q3, q1q1, q1q2, q1q3, q2q2, q2q3, q3q3;
//   58     float hx, hy, bx, bz;
//   59     float halfvx, halfvy, halfvz, halfwx, halfwy, halfwz;
//   60     float halfex, halfey, halfez;
//   61     float qa, qb, qc;
//   62 
//   63     // Use IMU algorithm if magnetometer measurement invalid (avoids NaN in magnetometer normalisation)
//   64     if((mx == 0.0f) && (my == 0.0f) && (mz == 0.0f))
        MOVS     R0,R7
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??MahonyAHRSupdate_0
        MOV      R0,R8
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??MahonyAHRSupdate_0
        MOV      R0,R9
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??MahonyAHRSupdate_0
//   65     {
//   66         MahonyAHRSupdateIMU(gx, gy, gz, ax, ay, az);
        STR      R10,[SP, #+4]
        LDR      R0,[SP, #+104]
        STR      R0,[SP, #+0]
        LDR      R3,[SP, #+64]
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R4
        BL       MahonyAHRSupdateIMU
//   67         return;
        B.N      ??MahonyAHRSupdate_1
//   68     }
//   69 
//   70     // Compute feedback only if accelerometer measurement valid (avoids NaN in accelerometer normalisation)
//   71     if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f)))
??MahonyAHRSupdate_0:
        LDR      R0,[SP, #+64]
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??MahonyAHRSupdate_2
        LDR      R0,[SP, #+104]
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??MahonyAHRSupdate_2
        MOV      R0,R10
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BEQ.W    ??MahonyAHRSupdate_3
//   72     {
//   73 
//   74         // Normalise accelerometer measurement
//   75         recipNorm = invSqrt(ax * ax + ay * ay + az * az);
??MahonyAHRSupdate_2:
        LDR      R1,[SP, #+64]
        LDR      R0,[SP, #+64]
        BL       __aeabi_fmul
        MOV      R11,R0
        LDR      R1,[SP, #+104]
        LDR      R0,[SP, #+104]
        BL       __aeabi_fmul
        MOV      R1,R11
        BL       __aeabi_fadd
        MOV      R11,R0
        MOV      R0,R10
        MOV      R1,R10
        BL       __aeabi_fmul
        MOV      R1,R11
        BL       __aeabi_fadd
        BL       invSqrt
        MOV      R11,R0
//   76         ax *= recipNorm;
        LDR      R0,[SP, #+64]
        MOV      R1,R11
        BL       __aeabi_fmul
        STR      R0,[SP, #+64]
//   77         ay *= recipNorm;
        LDR      R0,[SP, #+104]
        MOV      R1,R11
        BL       __aeabi_fmul
        STR      R0,[SP, #+104]
//   78         az *= recipNorm;
        MOV      R0,R10
        MOV      R1,R11
        BL       __aeabi_fmul
        MOV      R10,R0
//   79 
//   80         // Normalise magnetometer measurement
//   81         recipNorm = invSqrt(mx * mx + my * my + mz * mz);
        MOVS     R0,R7
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOV      R11,R0
        MOV      R0,R8
        MOV      R1,R8
        BL       __aeabi_fmul
        MOV      R1,R11
        BL       __aeabi_fadd
        MOV      R11,R0
        MOV      R0,R9
        MOV      R1,R9
        BL       __aeabi_fmul
        MOV      R1,R11
        BL       __aeabi_fadd
        BL       invSqrt
        MOV      R11,R0
//   82         mx *= recipNorm;
        MOVS     R0,R7
        MOV      R1,R11
        BL       __aeabi_fmul
        MOVS     R7,R0
//   83         my *= recipNorm;
        MOV      R0,R8
        MOV      R1,R11
        BL       __aeabi_fmul
        MOV      R8,R0
//   84         mz *= recipNorm;
        MOV      R0,R9
        MOV      R1,R11
        BL       __aeabi_fmul
        MOV      R9,R0
//   85 
//   86         // Auxiliary variables to avoid repeated arithmetic
//   87         q0q0 = q0 * q0;
        LDR.W    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+60]
//   88         q0q1 = q0 * q1;
        LDR.W    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+20]
//   89         q0q2 = q0 * q2;
        LDR.W    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+8]
//   90         q0q3 = q0 * q3;
        LDR.W    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+36]
//   91         q1q1 = q1 * q1;
        LDR.W    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+32]
//   92         q1q2 = q1 * q2;
        LDR.W    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+28]
//   93         q1q3 = q1 * q3;
        LDR.W    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+4]
//   94         q2q2 = q2 * q2;
        LDR.W    R0,??DataTable1_2
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+16]
//   95         q2q3 = q2 * q3;
        LDR.W    R0,??DataTable1_2
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        STR      R0,[SP, #+12]
//   96         q3q3 = q3 * q3;
        LDR.W    R0,??DataTable1_3
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOV      R11,R0
//   97 
//   98         // Reference direction of Earth's magnetic field
//   99         hx = 2.0f * (mx * (0.5f - q2q2 - q3q3) + my * (q1q2 - q0q3) + mz * (q1q3 + q0q2));
        MOVS     R0,#+1056964608
        LDR      R1,[SP, #+16]
        BL       __aeabi_fsub
        MOV      R1,R11
        BL       __aeabi_fsub
        MOVS     R1,R7
        BL       __aeabi_fmul
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+28]
        LDR      R1,[SP, #+36]
        BL       __aeabi_fsub
        MOV      R1,R8
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        STR      R0,[SP, #+0]
        LDR      R1,[SP, #+4]
        LDR      R0,[SP, #+8]
        BL       __aeabi_fadd
        MOV      R1,R9
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fmul
        STR      R0,[SP, #+44]
//  100         hy = 2.0f * (mx * (q1q2 + q0q3) + my * (0.5f - q1q1 - q3q3) + mz * (q2q3 - q0q1));
        LDR      R1,[SP, #+28]
        LDR      R0,[SP, #+36]
        BL       __aeabi_fadd
        MOVS     R1,R7
        BL       __aeabi_fmul
        STR      R0,[SP, #+0]
        MOVS     R0,#+1056964608
        LDR      R1,[SP, #+32]
        BL       __aeabi_fsub
        MOV      R1,R11
        BL       __aeabi_fsub
        MOV      R1,R8
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+12]
        LDR      R1,[SP, #+20]
        BL       __aeabi_fsub
        MOV      R1,R9
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fmul
        STR      R0,[SP, #+40]
//  101         bx = sqrt(hx * hx + hy * hy);
        LDR      R1,[SP, #+44]
        LDR      R0,[SP, #+44]
        BL       __aeabi_fmul
        STR      R0,[SP, #+0]
        LDR      R1,[SP, #+40]
        LDR      R0,[SP, #+40]
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        BL       sqrt
        BL       __aeabi_d2f
        STR      R0,[SP, #+24]
//  102         bz = 2.0f * (mx * (q1q3 - q0q2) + my * (q2q3 + q0q1) + mz * (0.5f - q1q1 - q2q2));
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+8]
        BL       __aeabi_fsub
        MOVS     R1,R7
        BL       __aeabi_fmul
        STR      R0,[SP, #+0]
        LDR      R1,[SP, #+12]
        LDR      R0,[SP, #+20]
        BL       __aeabi_fadd
        MOV      R1,R8
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        STR      R0,[SP, #+0]
        MOVS     R0,#+1056964608
        LDR      R1,[SP, #+32]
        BL       __aeabi_fsub
        LDR      R1,[SP, #+16]
        BL       __aeabi_fsub
        MOV      R1,R9
        BL       __aeabi_fmul
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fmul
        STR      R0,[SP, #+0]
//  103 
//  104         // Estimated direction of gravity and magnetic field
//  105         halfvx = q1q3 - q0q2;
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+8]
        BL       __aeabi_fsub
        STR      R0,[SP, #+56]
//  106         halfvy = q0q1 + q2q3;
        LDR      R1,[SP, #+20]
        LDR      R0,[SP, #+12]
        BL       __aeabi_fadd
        STR      R0,[SP, #+52]
//  107         halfvz = q0q0 - 0.5f + q3q3;
        LDR      R1,[SP, #+60]
        MOVS     R0,#-1090519040
        BL       __aeabi_fadd
        MOV      R1,R11
        BL       __aeabi_fadd
        STR      R0,[SP, #+48]
//  108         halfwx = bx * (0.5f - q2q2 - q3q3) + bz * (q1q3 - q0q2);
        MOVS     R0,#+1056964608
        LDR      R1,[SP, #+16]
        BL       __aeabi_fsub
        MOV      R1,R11
        BL       __aeabi_fsub
        LDR      R1,[SP, #+24]
        BL       __aeabi_fmul
        MOV      R11,R0
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+8]
        BL       __aeabi_fsub
        LDR      R1,[SP, #+0]
        BL       __aeabi_fmul
        MOV      R1,R11
        BL       __aeabi_fadd
        STR      R0,[SP, #+44]
//  109         halfwy = bx * (q1q2 - q0q3) + bz * (q0q1 + q2q3);
        LDR      R0,[SP, #+28]
        LDR      R1,[SP, #+36]
        BL       __aeabi_fsub
        LDR      R1,[SP, #+24]
        BL       __aeabi_fmul
        MOV      R11,R0
        LDR      R1,[SP, #+20]
        LDR      R0,[SP, #+12]
        BL       __aeabi_fadd
        LDR      R1,[SP, #+0]
        BL       __aeabi_fmul
        MOV      R1,R11
        BL       __aeabi_fadd
        STR      R0,[SP, #+40]
//  110         halfwz = bx * (q0q2 + q1q3) + bz * (0.5f - q1q1 - q2q2);
        LDR      R1,[SP, #+8]
        LDR      R0,[SP, #+4]
        BL       __aeabi_fadd
        LDR      R1,[SP, #+24]
        BL       __aeabi_fmul
        MOV      R11,R0
        MOVS     R0,#+1056964608
        LDR      R1,[SP, #+32]
        BL       __aeabi_fsub
        LDR      R1,[SP, #+16]
        BL       __aeabi_fsub
        LDR      R1,[SP, #+0]
        BL       __aeabi_fmul
        MOV      R1,R11
        BL       __aeabi_fadd
        MOV      R11,R0
//  111 
//  112         // Error is sum of cross product between estimated direction and measured direction of field vectors
//  113         halfex = (ay * halfvz - az * halfvy) + (my * halfwz - mz * halfwy);
        LDR      R1,[SP, #+104]
        LDR      R0,[SP, #+48]
        BL       __aeabi_fmul
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+52]
        MOV      R1,R10
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+4]
        MOV      R0,R8
        MOV      R1,R11
        BL       __aeabi_fmul
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+40]
        MOV      R1,R9
        BL       __aeabi_fmul
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fsub
        LDR      R1,[SP, #+4]
        BL       __aeabi_fadd
        STR      R0,[SP, #+0]
//  114         halfey = (az * halfvx - ax * halfvz) + (mz * halfwx - mx * halfwz);
        LDR      R0,[SP, #+56]
        MOV      R1,R10
        BL       __aeabi_fmul
        MOV      R10,R0
        LDR      R1,[SP, #+64]
        LDR      R0,[SP, #+48]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
        LDR      R0,[SP, #+44]
        MOV      R1,R9
        BL       __aeabi_fmul
        MOV      R9,R0
        MOVS     R0,R7
        MOV      R1,R11
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R9
        BL       __aeabi_fsub
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R9,R0
//  115         halfez = (ax * halfvy - ay * halfvx) + (mx * halfwy - my * halfwx);
        LDR      R1,[SP, #+64]
        LDR      R0,[SP, #+52]
        BL       __aeabi_fmul
        MOV      R10,R0
        LDR      R1,[SP, #+104]
        LDR      R0,[SP, #+56]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
        LDR      R0,[SP, #+40]
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,[SP, #+44]
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        MOV      R1,R10
        BL       __aeabi_fadd
        MOVS     R7,R0
//  116 
//  117         // Compute and apply integral feedback if enabled
//  118         if(twoKi > 0.0f)
        LDR.W    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??MahonyAHRSupdate_4
//  119         {
//  120             integralFBx += twoKi * halfex * (1.0f / sampleFreq);	// integral error scaled by Ki
        LDR.W    R0,??DataTable1_4
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_5  ;; 0x3b23d70a
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_6
        STR      R0,[R1, #+0]
//  121             integralFBy += twoKi * halfey * (1.0f / sampleFreq);
        LDR.W    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        MOV      R1,R9
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_5  ;; 0x3b23d70a
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_7
        STR      R0,[R1, #+0]
//  122             integralFBz += twoKi * halfez * (1.0f / sampleFreq);
        LDR.W    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        MOVS     R1,R7
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_5  ;; 0x3b23d70a
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  123             gx += integralFBx;	// apply integral feedback
        LDR.W    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  124             gy += integralFBy;
        LDR.W    R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  125             gz += integralFBz;
        LDR.W    R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
        B.N      ??MahonyAHRSupdate_5
//  126         }
//  127         else
//  128         {
//  129             integralFBx = 0.0f;	// prevent integral windup
??MahonyAHRSupdate_4:
        LDR.W    R0,??DataTable1_6
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  130             integralFBy = 0.0f;
        LDR.W    R0,??DataTable1_7
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  131             integralFBz = 0.0f;
        LDR.W    R0,??DataTable1_8
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  132         }
//  133 
//  134         // Apply proportional feedback
//  135         gx += twoKp * halfex;
??MahonyAHRSupdate_5:
        LDR.W    R0,??DataTable2
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  136         gy += twoKp * halfey;
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
        MOV      R1,R9
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  137         gz += twoKp * halfez;
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
//  138     }
//  139 
//  140     // Integrate rate of change of quaternion
//  141     gx *= (0.5f * (1.0f / sampleFreq));		// pre-multiply common factors
??MahonyAHRSupdate_3:
        LDR.W    R0,??DataTable3  ;; 0x3aa3d70a
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
//  142     gy *= (0.5f * (1.0f / sampleFreq));
        LDR.W    R0,??DataTable3  ;; 0x3aa3d70a
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R5,R0
//  143     gz *= (0.5f * (1.0f / sampleFreq));
        LDR.W    R0,??DataTable3  ;; 0x3aa3d70a
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R6,R0
//  144     qa = q0;
        LDR.W    R0,??DataTable1
        LDR      R7,[R0, #+0]
//  145     qb = q1;
        LDR.W    R0,??DataTable1_1
        LDR      R8,[R0, #+0]
//  146     qc = q2;
        LDR.W    R0,??DataTable1_2
        LDR      R9,[R0, #+0]
//  147     q0 += (-qb * gx - qc * gy - q3 * gz);
        MOV      R0,R8
        EORS     R0,R0,#0x80000000
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R9
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1
        STR      R0,[R1, #+0]
//  148     q1 += (qa * gx + qc * gz - q3 * gy);
        MOVS     R0,R7
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R9
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R10,R0
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable1_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  149     q2 += (qa * gy - qb * gz + q3 * gx);
        MOVS     R0,R7
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R8
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  150     q3 += (qa * gz + qb * gy - qc * gx);
        MOVS     R0,R7
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R6,R0
        MOV      R0,R8
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R5,R0
        MOV      R0,R9
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable1_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  151 
//  152     // Normalise quaternion
//  153     recipNorm = invSqrt(q0 * q0 + q1 * q1 + q2 * q2 + q3 * q3);
        LDR.W    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.W    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.W    R0,??DataTable1_2
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.W    R0,??DataTable1_3
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       invSqrt
        MOV      R11,R0
//  154     q0 *= recipNorm;
        LDR.W    R0,??DataTable1
        LDR      R0,[R0, #+0]
        MOV      R1,R11
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1
        STR      R0,[R1, #+0]
//  155     q1 *= recipNorm;
        LDR.W    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        MOV      R1,R11
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  156     q2 *= recipNorm;
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        MOV      R1,R11
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  157     q3 *= recipNorm;
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOV      R1,R11
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  158 }
??MahonyAHRSupdate_1:
        ADD      SP,SP,#+68
        POP      {R4-R11,PC}      ;; return
//  159 
//  160 //---------------------------------------------------------------------------------------------------
//  161 // IMU algorithm update
//  162 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  163 void MahonyAHRSupdateIMU(float gx, float gy, float gz, float ax, float ay, float az)
//  164 {
MahonyAHRSupdateIMU:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+48]
        LDR      R9,[SP, #+52]
//  165     float recipNorm;
//  166     float halfvx, halfvy, halfvz;
//  167     float halfex, halfey, halfez;
//  168     float qa, qb, qc;
//  169     float r1, r2, r3, r4, r5;
//  170     // Compute feedback only if accelerometer measurement valid (avoids NaN in accelerometer normalisation)
//  171     if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f)))
        MOVS     R0,R7
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??MahonyAHRSupdateIMU_0
        MOV      R0,R8
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??MahonyAHRSupdateIMU_0
        MOV      R0,R9
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BEQ.W    ??MahonyAHRSupdateIMU_1
//  172     {
//  173 
//  174         // Normalise accelerometer measurement
//  175         recipNorm = invSqrt(ax * ax + ay * ay + az * az);
??MahonyAHRSupdateIMU_0:
        MOVS     R0,R7
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R8
        MOV      R1,R8
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R10,R0
        MOV      R0,R9
        MOV      R1,R9
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        BL       invSqrt
        MOV      R10,R0
//  176         ax *= recipNorm;
        MOVS     R0,R7
        MOV      R1,R10
        BL       __aeabi_fmul
        MOVS     R7,R0
//  177         ay *= recipNorm;
        MOV      R0,R8
        MOV      R1,R10
        BL       __aeabi_fmul
        MOV      R8,R0
//  178         az *= recipNorm;
        MOV      R0,R9
        MOV      R1,R10
        BL       __aeabi_fmul
        MOV      R9,R0
//  179 
//  180         // Estimated direction of gravity and vector perpendicular to magnetic flux
//  181         halfvx = q1 * q3 - q0 * q2;
        LDR.W    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOV      R10,R0
        LDR.W    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        STR      R0,[SP, #+4]
//  182         halfvy = q0 * q1 + q2 * q3;
        LDR.W    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOV      R10,R0
        LDR.W    R0,??DataTable1_2
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        STR      R0,[SP, #+0]
//  183         halfvz = q0 * q0 - 0.5f + q3 * q3;
        LDR.W    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,#-1090519040
        BL       __aeabi_fadd
        MOV      R10,R0
        LDR.W    R0,??DataTable1_3
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R11,R0
//  184 
//  185         // Error is sum of cross product between estimated and measured direction of gravity
//  186         halfex = (ay * halfvz - az * halfvy);
        MOV      R0,R8
        MOV      R1,R11
        BL       __aeabi_fmul
        MOV      R10,R0
        LDR      R0,[SP, #+0]
        MOV      R1,R9
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
//  187         halfey = (az * halfvx - ax * halfvz);
        LDR      R0,[SP, #+4]
        MOV      R1,R9
        BL       __aeabi_fmul
        MOV      R9,R0
        MOVS     R0,R7
        MOV      R1,R11
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R9
        BL       __aeabi_fsub
        MOV      R9,R0
//  188         halfez = (ax * halfvy - ay * halfvx);
        LDR      R0,[SP, #+0]
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,[SP, #+4]
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        MOVS     R7,R0
//  189 
//  190         // Compute and apply integral feedback if enabled
//  191         if(twoKi > 0.0f)
        LDR.W    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??MahonyAHRSupdateIMU_2
//  192         {
//  193             integralFBx += twoKi * halfex * (1.0f / sampleFreq);	// integral error scaled by Ki
        LDR.W    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_5  ;; 0x3b23d70a
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_6
        STR      R0,[R1, #+0]
//  194             integralFBy += twoKi * halfey * (1.0f / sampleFreq);
        LDR.W    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        MOV      R1,R9
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_5  ;; 0x3b23d70a
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_7
        STR      R0,[R1, #+0]
//  195             integralFBz += twoKi * halfez * (1.0f / sampleFreq);
        LDR.W    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        MOVS     R1,R7
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_5  ;; 0x3b23d70a
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable1_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable1_8
        STR      R0,[R1, #+0]
//  196             gx += integralFBx;	// apply integral feedback
        LDR.W    R0,??DataTable1_6
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  197             gy += integralFBy;
        LDR.W    R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  198             gz += integralFBz;
        LDR.W    R0,??DataTable1_8
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
        B.N      ??MahonyAHRSupdateIMU_3
//  199         }
//  200         else
//  201         {
//  202             integralFBx = 0.0f;	// prevent integral windup
??MahonyAHRSupdateIMU_2:
        LDR.W    R0,??DataTable1_6
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  203             integralFBy = 0.0f;
        LDR.W    R0,??DataTable1_7
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  204             integralFBz = 0.0f;
        LDR.W    R0,??DataTable1_8
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  205         }
//  206 
//  207         // Apply proportional feedback
//  208         gx += twoKp * halfex;
??MahonyAHRSupdateIMU_3:
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  209         gy += twoKp * halfey;
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
        MOV      R1,R9
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  210         gz += twoKp * halfez;
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
//  211     }
//  212 
//  213     // Integrate rate of change of quaternion
//  214     gx *= (0.5f * (1.0f / sampleFreq));		// pre-multiply common factors
??MahonyAHRSupdateIMU_1:
        LDR.W    R0,??DataTable3  ;; 0x3aa3d70a
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
//  215     gy *= (0.5f * (1.0f / sampleFreq));
        LDR.W    R0,??DataTable3  ;; 0x3aa3d70a
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R5,R0
//  216     gz *= (0.5f * (1.0f / sampleFreq));
        LDR.W    R0,??DataTable3  ;; 0x3aa3d70a
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R6,R0
//  217     qa = q0;
        LDR.N    R0,??DataTable1
        LDR      R7,[R0, #+0]
//  218     qb = q1;
        LDR.N    R0,??DataTable1_1
        LDR      R8,[R0, #+0]
//  219     qc = q2;
        LDR.N    R0,??DataTable1_2
        LDR      R9,[R0, #+0]
//  220     q0 += (-qb * gx - qc * gy - q3 * gz);
        MOV      R0,R8
        EORS     R0,R0,#0x80000000
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R9
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1
        STR      R0,[R1, #+0]
//  221     q1 += (qa * gx + qc * gz - q3 * gy);
        MOVS     R0,R7
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R9
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R10,R0
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable1_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  222     q2 += (qa * gy - qb * gz + q3 * gx);
        MOVS     R0,R7
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R8
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  223     q3 += (qa * gz + qb * gy - qc * gx);
        MOVS     R0,R7
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R6,R0
        MOV      R0,R8
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R5,R0
        MOV      R0,R9
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable1_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  224 
//  225     // Normalise quaternion
//  226     recipNorm = invSqrt(q0 * q0 + q1 * q1 + q2 * q2 + q3 * q3);
        LDR.N    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.N    R0,??DataTable1_2
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.N    R0,??DataTable1_3
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       invSqrt
        MOV      R10,R0
//  227     q0 *= recipNorm;
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1
        STR      R0,[R1, #+0]
//  228     q1 *= recipNorm;
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
//  229     q2 *= recipNorm;
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1_2
        STR      R0,[R1, #+0]
//  230     q3 *= recipNorm;
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+0]
//  231     
//  232         
//  233         r1 = 2 * q0 * q0 - 1 + 2 * q1 * q1;
        LDR.N    R0,??DataTable1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_1  ;; 0xbf800000
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.N    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  234         r2 = 2 * (q1 * q2 - q0 * q3);
        LDR.N    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R1,#+1073741824
        BL       __aeabi_fmul
        MOVS     R6,R0
//  235         r3 = 2 * (q1 * q3 + q0 * q2);
        LDR.N    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_2
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fmul
        MOVS     R7,R0
//  236         r4 = 2 * (q2 * q3 - q0 * q1);
        LDR.N    R0,??DataTable1_2
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??DataTable1
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R1,#+1073741824
        BL       __aeabi_fmul
        MOVS     R5,R0
//  237         r5 = 2 * q0 * q0 - 1 + 2 * q3 * q3;
        LDR.N    R0,??DataTable1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_1  ;; 0xbf800000
        BL       __aeabi_fadd
        MOV      R8,R0
        LDR.N    R0,??DataTable1_3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOV      R1,R8
        BL       __aeabi_fadd
//  238         Q_x =   -atan2(r4, r5) * 57.3;
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
        EORS     R1,R1,#0x80000000
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable3_2  ;; 0x404ca666
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable3_3
        STR      R0,[R1, #+0]
//  239         Q_z  =  -atan2(r2, r1) * 57.3;
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
        EORS     R1,R1,#0x80000000
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable3_2  ;; 0x404ca666
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable3_4
        STR      R0,[R1, #+0]
//  240         Q_y = -asin(-2 * q1 * q3 + 2 * q0 * q2) * 57.3;
        LDR.N    R0,??DataTable1_1
        LDR      R1,[R0, #+0]
        MOVS     R0,#-1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??DataTable1
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable1_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        BL       asin
        EORS     R1,R1,#0x80000000
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable3_2  ;; 0x404ca666
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable3_5
        STR      R0,[R1, #+0]
//  241 
//  242             
//  243 }
        POP      {R0-R2,R4-R11,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     q0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     q1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     q2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     q3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     twoKi

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x3b23d70a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     integralFBx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     integralFBy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     integralFBz
//  244 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  245 void MahonyAHRSupdateIMU1(float gx, float gy, float gz, float ax, float ay, float az)
//  246 {
MahonyAHRSupdateIMU1:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+48]
        LDR      R9,[SP, #+52]
//  247     float recipNorm;
//  248     float halfvx, halfvy, halfvz;
//  249     float halfex, halfey, halfez;
//  250     float qa, qb, qc;
//  251     float r1, r2, r3, r4, r5;
//  252     // Compute feedback only if accelerometer measurement valid (avoids NaN in accelerometer normalisation)
//  253     if(!((ax == 0.0f) && (ay == 0.0f) && (az == 0.0f)))
        MOVS     R0,R7
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??MahonyAHRSupdateIMU1_0
        MOV      R0,R8
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BNE.N    ??MahonyAHRSupdateIMU1_0
        MOV      R0,R9
        MOVS     R1,#+0
        BL       __aeabi_cfcmpeq
        BEQ.W    ??MahonyAHRSupdateIMU1_1
//  254     {
//  255 
//  256         // Normalise accelerometer measurement
//  257         recipNorm = invSqrt(ax * ax + ay * ay + az * az);
??MahonyAHRSupdateIMU1_0:
        MOVS     R0,R7
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R8
        MOV      R1,R8
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R10,R0
        MOV      R0,R9
        MOV      R1,R9
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        BL       invSqrt
        MOV      R10,R0
//  258         ax *= recipNorm;
        MOVS     R0,R7
        MOV      R1,R10
        BL       __aeabi_fmul
        MOVS     R7,R0
//  259         ay *= recipNorm;
        MOV      R0,R8
        MOV      R1,R10
        BL       __aeabi_fmul
        MOV      R8,R0
//  260         az *= recipNorm;
        MOV      R0,R9
        MOV      R1,R10
        BL       __aeabi_fmul
        MOV      R9,R0
//  261 
//  262         // Estimated direction of gravity and vector perpendicular to magnetic flux
//  263         halfvx = q11 * q31 - q01 * q21;
        LDR.W    R0,??DataTable3_6
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOV      R10,R0
        LDR.W    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        STR      R0,[SP, #+4]
//  264         halfvy = q01 * q11 + q21 * q31;
        LDR.W    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOV      R10,R0
        LDR.W    R0,??DataTable3_9
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        STR      R0,[SP, #+0]
//  265         halfvz = q01 * q01 - 0.5f + q31 * q31;
        LDR.W    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,#-1090519040
        BL       __aeabi_fadd
        MOV      R10,R0
        LDR.W    R0,??DataTable3_7
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R11,R0
//  266 
//  267         // Error is sum of cross product between estimated and measured direction of gravity
//  268         halfex = (ay * halfvz - az * halfvy);
        MOV      R0,R8
        MOV      R1,R11
        BL       __aeabi_fmul
        MOV      R10,R0
        LDR      R0,[SP, #+0]
        MOV      R1,R9
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
//  269         halfey = (az * halfvx - ax * halfvz);
        LDR      R0,[SP, #+4]
        MOV      R1,R9
        BL       __aeabi_fmul
        MOV      R9,R0
        MOVS     R0,R7
        MOV      R1,R11
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R9
        BL       __aeabi_fsub
        MOV      R9,R0
//  270         halfez = (ax * halfvy - ay * halfvx);
        LDR      R0,[SP, #+0]
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOVS     R7,R0
        LDR      R0,[SP, #+4]
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fsub
        MOVS     R7,R0
//  271 
//  272         // Compute and apply integral feedback if enabled
//  273         if(twoKi1 > 0.0f)
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??MahonyAHRSupdateIMU1_2
//  274         {
//  275             integralFBx1 += twoKi1 * halfex * (1.0f / sampleFreq);	// integral error scaled by Ki
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_11  ;; 0x3b23d70a
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_12
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_12
        STR      R0,[R1, #+0]
//  276             integralFBy1 += twoKi1 * halfey * (1.0f / sampleFreq);
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        MOV      R1,R9
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_11  ;; 0x3b23d70a
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_13
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_13
        STR      R0,[R1, #+0]
//  277             integralFBz1 += twoKi1 * halfez * (1.0f / sampleFreq);
        LDR.W    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        MOVS     R1,R7
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_11  ;; 0x3b23d70a
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable3_14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_14
        STR      R0,[R1, #+0]
//  278             gx += integralFBx1;	// apply integral feedback
        LDR.W    R0,??DataTable3_12
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  279             gy += integralFBy1;
        LDR.W    R0,??DataTable3_13
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  280             gz += integralFBz1;
        LDR.W    R0,??DataTable3_14
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
        B.N      ??MahonyAHRSupdateIMU1_3
//  281         }
//  282         else
//  283         {
//  284             integralFBx1 = 0.0f;	// prevent integral windup
??MahonyAHRSupdateIMU1_2:
        LDR.W    R0,??DataTable3_12
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  285             integralFBy1 = 0.0f;
        LDR.W    R0,??DataTable3_13
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  286             integralFBz1 = 0.0f;
        LDR.W    R0,??DataTable3_14
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  287         }
//  288 
//  289         // Apply proportional feedback
//  290         gx += twoKp1 * halfex;
??MahonyAHRSupdateIMU1_3:
        LDR.W    R0,??DataTable3_15
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  291         gy += twoKp1 * halfey;
        LDR.W    R0,??DataTable3_15
        LDR      R0,[R0, #+0]
        MOV      R1,R9
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
//  292         gz += twoKp1 * halfez;
        LDR.W    R0,??DataTable3_15
        LDR      R0,[R0, #+0]
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R6,R0
//  293     }
//  294 
//  295     // Integrate rate of change of quaternion
//  296     gx *= (0.5f * (1.0f / sampleFreq));		// pre-multiply common factors
??MahonyAHRSupdateIMU1_1:
        LDR.N    R0,??DataTable3  ;; 0x3aa3d70a
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
//  297     gy *= (0.5f * (1.0f / sampleFreq));
        LDR.N    R0,??DataTable3  ;; 0x3aa3d70a
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R5,R0
//  298     gz *= (0.5f * (1.0f / sampleFreq));
        LDR.N    R0,??DataTable3  ;; 0x3aa3d70a
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R6,R0
//  299     qa = q01;
        LDR.N    R0,??DataTable3_8
        LDR      R7,[R0, #+0]
//  300     qb = q11;
        LDR.N    R0,??DataTable3_6
        LDR      R8,[R0, #+0]
//  301     qc = q21;
        LDR.N    R0,??DataTable3_9
        LDR      R9,[R0, #+0]
//  302     q01 += (-qb * gx - qc * gy - q31 * gz);
        MOV      R0,R8
        EORS     R0,R0,#0x80000000
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R9
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_8
        STR      R0,[R1, #+0]
//  303     q11 += (qa * gx + qc * gz - q31 * gy);
        MOVS     R0,R7
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R9
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        MOV      R10,R0
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+0]
//  304     q21 += (qa * gy - qb * gz + q31 * gx);
        MOVS     R0,R7
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOV      R10,R0
        MOV      R0,R8
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOV      R1,R10
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_9
        STR      R0,[R1, #+0]
//  305     q31 += (qa * gz + qb * gy - qc * gx);
        MOVS     R0,R7
        MOVS     R1,R6
        BL       __aeabi_fmul
        MOVS     R6,R0
        MOV      R0,R8
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R5,R0
        MOV      R0,R9
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable3_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+0]
//  306 
//  307     // Normalise quaternion
//  308     recipNorm = invSqrt(q01 * q01 + q11 * q11 + q21 * q21 + q31 * q31);
        LDR.N    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_6
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_9
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_7
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       invSqrt
        MOV      R10,R0
//  309     q01 *= recipNorm;
        LDR.N    R0,??DataTable3_8
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_8
        STR      R0,[R1, #+0]
//  310     q11 *= recipNorm;
        LDR.N    R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+0]
//  311     q21 *= recipNorm;
        LDR.N    R0,??DataTable3_9
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_9
        STR      R0,[R1, #+0]
//  312     q31 *= recipNorm;
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        MOV      R1,R10
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+0]
//  313     
//  314         
//  315         r1 = 2 * q01 * q01 - 1 + 2 * q11 * q11;
        LDR.N    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_1  ;; 0xbf800000
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_6
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  316         r2 = 2 * (q11 * q21 - q01 * q31);
        LDR.N    R0,??DataTable3_6
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R1,#+1073741824
        BL       __aeabi_fmul
        MOVS     R6,R0
//  317         r3 = 2 * (q11 * q31 + q01 * q21);
        LDR.N    R0,??DataTable3_6
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fmul
        MOVS     R7,R0
//  318         r4 = 2 * (q21 * q31 - q01 * q11);
        LDR.N    R0,??DataTable3_9
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_7
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R1,#+1073741824
        BL       __aeabi_fmul
        MOVS     R5,R0
//  319         r5 = 2 * q01 * q01 - 1 + 2 * q31 * q31;
        LDR.N    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_1  ;; 0xbf800000
        BL       __aeabi_fadd
        MOV      R8,R0
        LDR.N    R0,??DataTable3_7
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOV      R1,R8
        BL       __aeabi_fadd
//  320         Q_y1 =   -atan2(r4, r5) ;
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
        EORS     R1,R1,#0x80000000
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable3_16
        STR      R0,[R1, #+0]
//  321         Q_z1 =  atan2(r2, r1) ;
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
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable3_17
        STR      R0,[R1, #+0]
//  322         Q_x1 = asin(-2 * q11 * q31 + 2 * q01 * q21) ;
        LDR.N    R0,??DataTable3_6
        LDR      R1,[R0, #+0]
        MOVS     R0,#-1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_7
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??DataTable3_8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1073741824
        BL       __aeabi_fmul
        LDR.N    R1,??DataTable3_9
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        BL       asin
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable3_18
        STR      R0,[R1, #+0]
//  323 
//  324             
//  325 }
        POP      {R0-R2,R4-R11,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     twoKp
//  326 
//  327 //---------------------------------------------------------------------------------------------------
//  328 // Fast inverse square-root
//  329 // See: http://en.wikipedia.org/wiki/Fast_inverse_square_root
//  330 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  331 float invSqrt(float x)
//  332 {
invSqrt:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  333     float halfx = 0.5f * x;
        MOVS     R0,#+1056964608
        MOVS     R1,R4
        BL       __aeabi_fmul
//  334     float y = x;
//  335     long i = *(long *)&y;
//  336     i = 0x5f3759df - (i >> 1);
        LDR.N    R1,??DataTable3_19  ;; 0x5f3759df
        SUBS     R4,R1,R4, ASR #+1
//  337     y = *(float *)&i;
//  338     y = y * (1.5f - (halfx * y * y));
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,#+1069547520
        BL       __aeabi_fsub
        MOVS     R1,R4
        BL       __aeabi_fmul
        MOVS     R4,R0
//  339     return y;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  340 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x3aa3d70a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x404ca666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     Q_x

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     Q_z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     Q_y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     q11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     q31

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     q01

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     q21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     twoKi1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x3b23d70a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     integralFBx1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     integralFBy1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     integralFBz1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     twoKp1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     Q_y1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     Q_z1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     Q_x1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     0x5f3759df

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  341 
//  342 //====================================================================================================
//  343 // END OF CODE
//  344 //====================================================================================================
// 
//    80 bytes in section .bss
//    16 bytes in section .data
// 4 810 bytes in section .text
// 
// 4 810 bytes of CODE memory
//    96 bytes of DATA memory
//
//Errors: none
//Warnings: 2
