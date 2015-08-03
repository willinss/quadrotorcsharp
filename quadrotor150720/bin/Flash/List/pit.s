///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:15 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\pit.c                 /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\pit.c" -D IAR -D     /
//                    TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quadrotor15 /
//                    0720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\bin\Flash\List\" -lB          /
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
//                    (¸ÄI2C)\bin\Flash\List\pit.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME pit

        #define SHT_PROGBITS 0x1

        EXTERN disable_irq
        EXTERN enable_irq

        PUBLIC disable_pit_interrupt
        PUBLIC enable_pit_interrupt
        PUBLIC hw_pit_init

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\pit.c
//    1 
//    2 #include "pit.h"
//    3 //==========================================================================
//    4 //º¯ÊýÃû³Æ: hw_pit_init                                                         
//    5 //º¯Êý·µ»Ø: ÎÞ                                          
//    6 //²ÎÊýËµÃ÷: pitno:±íÊ¾pitÍ¨µÀºÅ¡£  
//    7 //			timeout:±íÊ¾¶¨Ê±Òç³ö¿ªÊ¼µÝ¼õµÄÖµ          
//    8 //¹¦ÄÜ¸ÅÒª: ÉèÖÃÏà¹Ø¼Ä´æÆ÷µÄÖµ        
//    9 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   10     void hw_pit_init(uint8 pitno,uint32 timeout)
//   11     { 
//   12       SIM_SCGC6|=SIM_SCGC6_PIT_MASK;              //Ê¹ÄÜPITÊ±ÖÓ
hw_pit_init:
        LDR.N    R2,??DataTable2  ;; 0x4004803c
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x800000
        LDR.N    R3,??DataTable2  ;; 0x4004803c
        STR      R2,[R3, #+0]
//   13       PIT_MCR&=~(PIT_MCR_MDIS_MASK);              //µ÷ÊÔÄ£Ê½ÏÂ½ûÖ¹
        LDR.N    R2,??DataTable2_1  ;; 0x40037000
        LDR      R2,[R2, #+0]
        BICS     R2,R2,#0x2
        LDR.N    R3,??DataTable2_1  ;; 0x40037000
        STR      R2,[R3, #+0]
//   14       PIT_MCR|=PIT_MCR_FRZ_MASK;                  //Ê¹ÄÜPITÄ£¿éÊ±ÖÓ
        LDR.N    R2,??DataTable2_1  ;; 0x40037000
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x1
        LDR.N    R3,??DataTable2_1  ;; 0x40037000
        STR      R2,[R3, #+0]
//   15       PIT_LDVAL(pitno)=timeout;                   //ÉèÖÃÖÜÆÚ
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+4
        LDR.N    R3,??DataTable2_2  ;; 0x40037100
        STR      R1,[R2, R3]
//   16       PIT_TCTRL(pitno)|=PIT_TCTRL_TEN_MASK;       //Ê¹ÄÜpitÄ£¿éÔËÐÐ
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_2  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        ORRS     R1,R1,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_2  ;; 0x40037100
        ADDS     R2,R2,R0, LSL #+4
        STR      R1,[R2, #+8]
//   17       PIT_TCTRL(pitno)&=~(PIT_TCTRL_TIE_MASK);    //¹ØpitÖÐ¶Ï
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_2  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        BICS     R1,R1,#0x2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_2  ;; 0x40037100
        ADDS     R0,R2,R0, LSL #+4
        STR      R1,[R0, #+8]
//   18     }
        BX       LR               ;; return
//   19     
//   20 //==========================================================================
//   21 //º¯ÊýÃû: enable_pit_interrupt                                                     
//   22 //º¯Êý·µ»Ø: ÎÞ                                              
//   23 //²ÎÊýËµÃ÷: pitno: ±íÊ¾pitÍ¨µÀºÅ      
//   24 //¹¦ÄÜ¸ÅÒª: ¿ª½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï                                                      
//   25 
//   26                                                
//   27 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28     void enable_pit_interrupt(uint8 pitno)
//   29     {
enable_pit_interrupt:
        PUSH     {R7,LR}
//   30       PIT_TCTRL(pitno)|=(PIT_TCTRL_TIE_MASK); //¿ªpitÖÐ¶Ï
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_2  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        ORRS     R1,R1,#0x2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_2  ;; 0x40037100
        ADDS     R2,R2,R0, LSL #+4
        STR      R1,[R2, #+8]
//   31       switch(pitno)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??enable_pit_interrupt_0
        CMP      R0,#+2
        BEQ.N    ??enable_pit_interrupt_1
        BCC.N    ??enable_pit_interrupt_2
        CMP      R0,#+3
        BEQ.N    ??enable_pit_interrupt_3
        B.N      ??enable_pit_interrupt_4
//   32       {
//   33       case 0:
//   34         enable_irq(68);			      //¿ª½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
??enable_pit_interrupt_0:
        MOVS     R0,#+68
        BL       enable_irq
//   35         break;
        B.N      ??enable_pit_interrupt_4
//   36       case 1:
//   37         enable_irq(69);			      //¿ª½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
??enable_pit_interrupt_2:
        MOVS     R0,#+69
        BL       enable_irq
//   38         break;
        B.N      ??enable_pit_interrupt_4
//   39       case 2:
//   40         enable_irq(70);			      //¿ª½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
??enable_pit_interrupt_1:
        MOVS     R0,#+70
        BL       enable_irq
//   41         break;
        B.N      ??enable_pit_interrupt_4
//   42       case 3:
//   43         enable_irq(71);			      //¿ª½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
??enable_pit_interrupt_3:
        MOVS     R0,#+71
        BL       enable_irq
//   44         break;
//   45       }
//   46     }
??enable_pit_interrupt_4:
        POP      {R0,PC}          ;; return
//   47 
//   48 //==========================================================================
//   49 //º¯ÊýÃû: disable_pit_interrupt                                                     
//   50 //º¯Êý·µ»Ø: ÎÞ                                              
//   51 //²ÎÊýËµÃ÷: pitno: ±íÊ¾pitÍ¨µÀºÅ      
//   52 //¹¦ÄÜ¸ÅÒª: ¿ª½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï                                                      
//   53 
//   54                                                
//   55 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   56     void disable_pit_interrupt(uint8 pitno)
//   57     {
disable_pit_interrupt:
        PUSH     {R7,LR}
//   58       PIT_TCTRL(pitno)&=~(PIT_TCTRL_TIE_MASK);//¹ØpitÖÐ¶Ï
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_2  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        BICS     R1,R1,#0x2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_2  ;; 0x40037100
        ADDS     R2,R2,R0, LSL #+4
        STR      R1,[R2, #+8]
//   59       switch(pitno)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disable_pit_interrupt_0
        CMP      R0,#+2
        BEQ.N    ??disable_pit_interrupt_1
        BCC.N    ??disable_pit_interrupt_2
        CMP      R0,#+3
        BEQ.N    ??disable_pit_interrupt_3
        B.N      ??disable_pit_interrupt_4
//   60       {
//   61       case 0:
//   62         disable_irq(68);	              //¹Ø½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
??disable_pit_interrupt_0:
        MOVS     R0,#+68
        BL       disable_irq
//   63         break;
        B.N      ??disable_pit_interrupt_4
//   64       case 1:
//   65         disable_irq(69);		      //¹Ø½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
??disable_pit_interrupt_2:
        MOVS     R0,#+69
        BL       disable_irq
//   66         break;
        B.N      ??disable_pit_interrupt_4
//   67       case 2:
//   68         disable_irq(70);		      //¹Ø½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
??disable_pit_interrupt_1:
        MOVS     R0,#+70
        BL       disable_irq
//   69         break;
        B.N      ??disable_pit_interrupt_4
//   70       case 3:
//   71         disable_irq(71);		      //¹Ø½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
??disable_pit_interrupt_3:
        MOVS     R0,#+71
        BL       disable_irq
//   72         break;
//   73       }
//   74     }
??disable_pit_interrupt_4:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40037000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40037100

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
// 258 bytes in section .text
// 
// 258 bytes of CODE memory
//
//Errors: none
//Warnings: none
