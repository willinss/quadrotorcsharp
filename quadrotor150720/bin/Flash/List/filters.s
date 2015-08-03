///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:10 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\filters.c             /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\filters.c" -D IAR    /
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
//                    (¸ÄI2C)\bin\Flash\List\filters.s                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME filters

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_fadd
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub

        PUBLIC Acc_filters
        PUBLIC alpha
        PUBLIC filterb
        PUBLIC filterx
        PUBLIC g_point

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\filters.c
//    1 #include "filters.h"
//    2   

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//    3   const float alpha = 0.98;
alpha:
        DATA
        DC32 3F7AE148H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4   int g_point = 0;
g_point:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5   float filterx[N];
filterx:
        DS8 320
//    6   /*const float filterb[N] = {0.0005,0.0003,-0.0001,-0.0005,-0.0008,-0.0011,-0.0011,-0.0008,-0.0001,0.0009
//    7   ,0.0019,0.0027,0.0029,0.0023,0.0008,-0.0015,-0.0040,-0.0060,-0.0068,-0.0059
//    8   ,-0.0029,0.0018,0.0071,0.0117,0.0142,0.0131,0.0081,-0.0007,-0.0116,-0.0221
//    9   ,-0.0293,-0.0302,-0.0224,-0.0050,0.0212,0.0535,0.0880,0.1198,0.1443,0.1576
//   10   ,0.1576,0.1443,0.1198,0.0880,0.0535,0.0212,-0.0050,-0.0224,-0.0302,-0.0293
//   11   ,-0.0221,-0.0116,-0.0007,0.0081,0.0131,0.0142,0.0117,0.0071,0.0018,-0.0029
//   12   ,-0.0059,-0.0068,-0.0060,-0.0040,-0.0015,0.0008,0.0023,0.0029,0.0027,0.0019
//   13   ,0.0009,-0.0001,-0.0008,-0.0011,-0.0011,-0.0008,-0.0005,-0.0001,0.0003,0.0005};
//   14   */

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   15   const float filterb[N] = {-0.0016,   -0.0019,   -0.0021,   -0.0022,   -0.0021,   -0.0016,   -0.0015,   -0.0013,   -0.0012,   -0.0011,   -0.0010,   -0.0009,   -0.0004,   -0.0004,   -0.0003,   -0.0004,   -0.0005,   -0.0007,   -0.0008,   -0.0007,   -0.0007,   -0.0010,   -0.0006,   -0.0006,   -0.0008,   -0.0008,   -0.0008,   -0.0010,   -0.0009,   -0.0011,   -0.0009,   -0.0008,   -0.0010,   -0.0008,   -0.0005,   -0.0002,   -0.0002,   -0.0000,   -0.0002,   -0.0001,   -0.0002,   -0.0001,   -0.0001,    0.0000,    0.0001,    0.0005,    0.0008,    0.0008,    0.0005,    0.0005,    0.0002,    0.0004,    0.0007,    0.0007,    0.0007,    0.0008,    0.0009,    0.0008,    0.0008,    0.0011,    0.0011,    0.0011,    0.0010,    0.0007,    0.0008,    0.0009,    0.0009,    0.0012,    0.0014,    0.0012,    0.0011,    0.0009,    0.0008,    0.0010,    0.0010,    0.0010,    0.0010,    0.0008,    0.0006,    0.0009};
filterb:
        DATA
        DC32 0BAD1B717H, 0BAF9096CH, 0BB09A027H, 0BB102DE0H, 0BB09A027H
        DC32 0BAD1B717H, 0BAC49BA6H, 0BAAA64C3H, 0BA9D4952H, 0BA902DE0H
        DC32 0BA83126FH, 0BA6BEDFAH, 0B9D1B717H, 0B9D1B717H, 0B99D4952H
        DC32 0B9D1B717H, 0BA03126FH, 0BA378034H, 0BA51B717H, 0BA378034H
        DC32 0BA378034H, 0BA83126FH, 0BA1D4952H, 0BA1D4952H, 0BA51B717H
        DC32 0BA51B717H, 0BA51B717H, 0BA83126FH, 0BA6BEDFAH, 0BA902DE0H
        DC32 0BA6BEDFAH, 0BA51B717H, 0BA83126FH, 0BA51B717H, 0BA03126FH
        DC32 0B951B717H, 0B951B717H, 80000000H, 0B951B717H, 0B8D1B717H
        DC32 0B951B717H, 0B8D1B717H, 0B8D1B717H, 0H, 38D1B717H, 3A03126FH
        DC32 3A51B717H, 3A51B717H, 3A03126FH, 3A03126FH, 3951B717H, 39D1B717H
        DC32 3A378034H, 3A378034H, 3A378034H, 3A51B717H, 3A6BEDFAH, 3A51B717H
        DC32 3A51B717H, 3A902DE0H, 3A902DE0H, 3A902DE0H, 3A83126FH, 3A378034H
        DC32 3A51B717H, 3A6BEDFAH, 3A6BEDFAH, 3A9D4952H, 3AB78034H, 3A9D4952H
        DC32 3A902DE0H, 3A6BEDFAH, 3A51B717H, 3A83126FH, 3A83126FH, 3A83126FH
        DC32 3A83126FH, 3A51B717H, 3A1D4952H, 3A6BEDFAH
//   16   //const float filterb[N] = {-0.0010,   -0.0013,   -0.0016,   -0.0018,   -0.0019,   -0.0019,   -0.0018,   -0.0017,   -0.0014,   -0.0012,   -0.0009,   -0.0007,   -0.0006,   -0.0005,   -0.0004,   -0.0005,   -0.0005,   -0.0006,   -0.0006,   -0.0007,   -0.0007,   -0.0007,   -0.0008,   -0.0008,   -0.0008,   -0.0008,   -0.0009,   -0.0009,   -0.0009,   -0.0009,   -0.0009,   -0.0009,   -0.0008,   -0.0007,   -0.0006,   -0.0005,   -0.0004,   -0.0003,   -0.0002,   -0.0001,   -0.0001,    0.0000,    0.0001,    0.0002,    0.0002,    0.0003,    0.0004,    0.0004,    0.0005,    0.0005,    0.0005,    0.0006,    0.0006,    0.0006,    0.0007,    0.0007,    0.0008,    0.0008,    0.0009,    0.0009,    0.0010,    0.0010,    0.0010,    0.0010,    0.0010,    0.0010,    0.0010,    0.0010,    0.0010,    0.0011,    0.0011,    0.0011,    0.0011,    0.0011,    0.0010,    0.0010,    0.0009,    0.0008,    0.0007,    0.0005};

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   17   float Acc_filters(float xin)
//   18 {
Acc_filters:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
//   19     static float sx = 0;
//   20     float xout = 0;
        MOVS     R4,#+0
//   21     sx = alpha*sx + (1 - alpha) * xin;
        LDR.N    R0,??Acc_filters_0
        LDR      R1,[R0, #+0]
        LDR.N    R0,??Acc_filters_0+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R6,R0
        MOVS     R0,#+1065353216
        LDR.N    R1,??Acc_filters_0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,R5
        BL       __aeabi_fmul
        MOVS     R1,R6
        BL       __aeabi_fadd
        LDR.N    R1,??Acc_filters_0+0x4
        STR      R0,[R1, #+0]
//   22    //sx = xin;
//   23     if(N - 1 > g_point)
        LDR.N    R0,??Acc_filters_0+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+79
        BGE.N    ??Acc_filters_1
//   24     {
//   25         filterx[g_point] = sx;
        LDR.N    R0,??Acc_filters_0+0x8
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Acc_filters_0+0xC
        LDR.N    R2,??Acc_filters_0+0x4
        LDR      R2,[R2, #+0]
        STR      R2,[R1, R0, LSL #+2]
//   26         g_point ++;
        LDR.N    R0,??Acc_filters_0+0x8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??Acc_filters_0+0x8
        STR      R0,[R1, #+0]
//   27     }
//   28     else 
//   29     {
//   30         int i =1;
//   31         for(i = 0; i < 79; i++)
//   32         {
//   33             filterx[i] = filterx[i+1];
//   34         }
//   35         i = 79;
//   36         filterx[i] = sx;
//   37         
//   38         for(i = 0; i < 80; i ++)
//   39         {
//   40             xout += filterb[i]*filterx[i];
//   41         }
//   42         return xout;
//   43     }
//   44     return xin;
        MOVS     R0,R5
        B.N      ??Acc_filters_2
??Acc_filters_1:
        MOVS     R5,#+1
        MOVS     R0,#+0
        MOVS     R5,R0
        B.N      ??Acc_filters_3
??Acc_filters_4:
        LDR.N    R0,??Acc_filters_0+0xC
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+4]
        LDR.N    R1,??Acc_filters_0+0xC
        STR      R0,[R1, R5, LSL #+2]
        ADDS     R5,R5,#+1
??Acc_filters_3:
        CMP      R5,#+79
        BLT.N    ??Acc_filters_4
        MOVS     R5,#+79
        LDR.N    R0,??Acc_filters_0+0xC
        LDR.N    R1,??Acc_filters_0+0x4
        LDR      R1,[R1, #+0]
        STR      R1,[R0, R5, LSL #+2]
        MOVS     R5,#+0
        B.N      ??Acc_filters_5
??Acc_filters_6:
        LDR.N    R0,??Acc_filters_0+0x10
        LDR      R0,[R0, R5, LSL #+2]
        LDR.N    R1,??Acc_filters_0+0xC
        LDR      R1,[R1, R5, LSL #+2]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        ADDS     R5,R5,#+1
??Acc_filters_5:
        CMP      R5,#+80
        BLT.N    ??Acc_filters_6
        MOVS     R0,R4
??Acc_filters_2:
        POP      {R4-R6,PC}       ;; return
        Nop      
        DATA
??Acc_filters_0:
        DC32     alpha
        DC32     ??sx
        DC32     g_point
        DC32     filterx
        DC32     filterb
//   45 }

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??sx:
        DS8 4

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 328 bytes in section .bss
// 324 bytes in section .rodata
// 184 bytes in section .text
// 
// 184 bytes of CODE  memory
// 324 bytes of CONST memory
// 328 bytes of DATA  memory
//
//Errors: none
//Warnings: none
