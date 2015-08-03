///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:13 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\Component_C\control.c               /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\Component_C\control.c" -D IAR -D   /
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
//                    28IIC\bin\Ram\List\control.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME control

        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN set_pwm

        PUBLIC Quadrotor_pid

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\Component_C\control.c
//    1 #include "control.h"
//    2 #include "ftm.h"
//    3 
//    4 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    5 void Quadrotor_pid(float angle_X,float angle_Y,float angle_Z,int height )
//    6 {float U1,U2,U3,U4,W1,W2,W3,W4;
Quadrotor_pid:
        PUSH     {R1-R11,LR}
        MOV      R10,R0
        MOV      R9,R1
        MOV      R11,R2
//    7  int16 w1=0,w2=0,w3=0,w4=0;
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
//    8  
//    9  U1 = -K1 * height;               //´¹Ö±¿ØÖÆ
        MVNS     R0,#+4
        MUL      R0,R0,R3
        BL       __aeabi_i2f
        MOV      R8,R0
//   10  U2 = -K2 * angle_Y;         //¹ö×ª¿ØÖÆ
        LDR.N    R0,??Quadrotor_pid_0  ;; 0xc0a00000
        MOV      R1,R9
        BL       __aeabi_fmul
        MOV      R9,R0
//   11  U3 = -K3 * angle_X;         //¸©Ñö¿ØÖÆ
        LDR.N    R0,??Quadrotor_pid_0  ;; 0xc0a00000
        MOV      R1,R10
        BL       __aeabi_fmul
        MOV      R10,R0
//   12  U4 = -K4 * angle_Z;         //Æ«º½¿ØÖÆ 
        LDR.N    R0,??Quadrotor_pid_0  ;; 0xc0a00000
        MOV      R1,R11
        BL       __aeabi_fmul
        MOV      R11,R0
//   13  
//   14  W1 = U1/4 - U3/2 - U4/4;
        MOV      R0,R8
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
        MOV      R0,R10
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        MOV      R0,R11
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+8]
//   15  W2 = U1/4 - U2/2 + U4/4;
        MOV      R0,R8
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
        MOV      R0,R9
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,[SP, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
        MOV      R0,R11
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        STR      R0,[SP, #+4]
//   16  W3 = U1/4 + U3/2 - U4/4;
        MOV      R0,R8
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
        MOV      R0,R10
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        LDR      R1,[SP, #+0]
        BL       __aeabi_fadd
        MOV      R10,R0
        MOV      R0,R11
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOV      R0,R10
        BL       __aeabi_fsub
        MOV      R10,R0
//   17  W4 = U1/4 + U2/2 + U4/4;
        MOV      R0,R8
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOV      R8,R0
        MOV      R0,R9
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOV      R1,R8
        BL       __aeabi_fadd
        MOV      R8,R0
        MOV      R0,R11
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOV      R1,R8
        BL       __aeabi_fadd
        MOV      R8,R0
//   18  
//   19  w1 = 1000 + (int)W1;
        LDR      R0,[SP, #+8]
        BL       __aeabi_f2iz
        ADDW     R0,R0,#+1000
        MOVS     R4,R0
//   20  if(w1 < 1000)      w1 = 1000;
        MOV      R0,#+1000
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        CMP      R4,R0
        BGE.N    ??Quadrotor_pid_1
        MOV      R4,#+1000
        B.N      ??Quadrotor_pid_2
//   21  else if(w1 > 1200) w1 = 1200;
??Quadrotor_pid_1:
        MOVW     R0,#+1201
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        CMP      R4,R0
        BLT.N    ??Quadrotor_pid_2
        MOV      R4,#+1200
//   22  
//   23  w2 = 1000 + (int)W2;
??Quadrotor_pid_2:
        LDR      R0,[SP, #+4]
        BL       __aeabi_f2iz
        ADDW     R5,R0,#+1000
//   24  if(w2 < 1000)      w2 = 1000;
        MOV      R0,#+1000
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BGE.N    ??Quadrotor_pid_3
        MOV      R5,#+1000
        B.N      ??Quadrotor_pid_4
//   25  else if(w2 > 1200) w2 = 1200;
??Quadrotor_pid_3:
        MOVW     R0,#+1201
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,R0
        BLT.N    ??Quadrotor_pid_4
        MOV      R5,#+1200
//   26  
//   27  w3 = 1000 + (int)W3;
??Quadrotor_pid_4:
        MOV      R0,R10
        BL       __aeabi_f2iz
        ADDW     R6,R0,#+1000
//   28  if(w3 < 1000)      w3 = 1000;
        MOV      R0,#+1000
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        CMP      R6,R0
        BGE.N    ??Quadrotor_pid_5
        MOV      R6,#+1000
        B.N      ??Quadrotor_pid_6
//   29  else if(w3 > 1200) w3 = 1200;
??Quadrotor_pid_5:
        MOVW     R0,#+1201
        SXTH     R6,R6            ;; SignExt  R6,R6,#+16,#+16
        CMP      R6,R0
        BLT.N    ??Quadrotor_pid_6
        MOV      R6,#+1200
//   30  
//   31  w4 = 1000 + (int)W4;
??Quadrotor_pid_6:
        MOV      R0,R8
        BL       __aeabi_f2iz
        ADDW     R7,R0,#+1000
//   32  if(w4 < 1000)      w4 = 1000;
        MOV      R0,#+1000
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        CMP      R7,R0
        BGE.N    ??Quadrotor_pid_7
        MOV      R7,#+1000
        B.N      ??Quadrotor_pid_8
//   33  else if(w4 > 1200) w4 = 1200;
??Quadrotor_pid_7:
        MOVW     R0,#+1201
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        CMP      R7,R0
        BLT.N    ??Quadrotor_pid_8
        MOV      R7,#+1200
//   34 
//   35  
//   36  
//   37  set_pwm(w1,w2,w3,w4);
??Quadrotor_pid_8:
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       set_pwm
//   38  
//   39 }
        POP      {R0-R2,R4-R11,PC}  ;; return
        DATA
??Quadrotor_pid_0:
        DC32     0xc0a00000

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
// 
// 452 bytes in section .text
// 
// 452 bytes of CODE memory
//
//Errors: none
//Warnings: none
