///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:17 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720����������С�� /
//                    (��I2C)\src\Sources\C\Component_C\wdog.c                /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\src\Sources\C\Component_C\wdog.c" -D IAR -D    /
//                    TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quadrotor15 /
//                    0720����������С��(��I2C)\bin\Flash\List\" -lB          /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\bin\Flash\List\" -o                            /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\bin\Flash\Obj\" --no_cse --no_unroll           /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "E:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.4\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\src\Sources\H\" -I                             /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\src\Sources\H\Component_H\" -I                 /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\src\Sources\H\Frame_H\" -Ol --use_c++_inline   /
//    List file    =  C:\Users\Thinkpad\Desktop\quadrotor150720����������С�� /
//                    (��I2C)\bin\Flash\List\wdog.s                           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME wdog

        #define SHT_PROGBITS 0x1

        PUBLIC wdog_disable
        PUBLIC wdog_unlock

// C:\Users\Thinkpad\Desktop\quadrotor150720����������С��(��I2C)\src\Sources\C\Component_C\wdog.c
//    1 //-------------------------------------------------------------------------*
//    2 // �ļ���: wdog.c                                                          *
//    3 // ˵  ��: ���Ź����������ļ�                                              *
//    4 //-------------------------------------------------------------------------*
//    5 
//    6 #include "wdog.h"	//����wdog.hͷ�ļ�
//    7        
//    8 //-------------------------------------------------------------------------*
//    9 //������: wdog_disable                                                     *
//   10 //��  ��: �رտ��Ź�ģ��                                                   * 
//   11 //��  ��: ��			  					   *	
//   12 //��  ��: ��                                                               *
//   13 //˵  ��: ��                                                               *
//   14 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   15 void wdog_disable(void)
//   16 {
wdog_disable:
        PUSH     {R7,LR}
//   17     //�����Ź�ģ��������Ա�д�Ĵ���
//   18     wdog_unlock();
        BL       wdog_unlock
//   19     //�رտ��Ź�
//   20     WDOG_STCTRLH &= ~WDOG_STCTRLH_WDOGEN_MASK;
        LDR.N    R0,??DataTable1  ;; 0x40052000
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+65534
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable1  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   21 }
        POP      {R0,PC}          ;; return
//   22 
//   23 //-------------------------------------------------------------------------*
//   24 //������: wdog_unlock                                                      *
//   25 //��  ��: ���Ź�����                                                       * 
//   26 //��  ��: ��							           *	
//   27 //��  ��: ��                                                               *
//   28 //˵  ��: ��                                                               *
//   29 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   30 void wdog_unlock(void)
//   31 {
//   32     /* ע��: ��Ҫ�������Դ˳���!!! �����������CPU��λ*/
//   33     //�����ж�
//   34     DisableInterrupts;		
wdog_unlock:
        CPSID i
//   35     //д�����Ĵ���
//   36     WDOG_UNLOCK = 0xC520;	
        LDR.N    R0,??DataTable1_1  ;; 0x4005200e
        MOVW     R1,#+50464
        STRH     R1,[R0, #+0]
//   37     //��ɽ���
//   38     WDOG_UNLOCK = 0xD928;	
        LDR.N    R0,??DataTable1_1  ;; 0x4005200e
        MOVW     R1,#+55592
        STRH     R1,[R0, #+0]
//   39     //�����ж�
//   40     EnableInterrupts;		
        CPSIE i
//   41 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x4005200e

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
// 52 bytes in section .text
// 
// 52 bytes of CODE memory
//
//Errors: none
//Warnings: none
