///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:06 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥µ /
//                    (∏ƒI2C)\src\Sources\C\Frame_C\common.c                  /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\src\Sources\C\Frame_C\common.c" -D IAR -D      /
//                    TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quadrotor15 /
//                    0720∑…––∆˜∏˙ÀÊ–°≥µ(∏ƒI2C)\bin\Flash\List\" -lB          /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\bin\Flash\List\" -o                            /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\bin\Flash\Obj\" --no_cse --no_unroll           /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "E:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.4\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\src\Sources\H\" -I                             /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\src\Sources\H\Component_H\" -I                 /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\src\Sources\H\Frame_H\" -Ol --use_c++_inline   /
//    List file    =  C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥µ /
//                    (∏ƒI2C)\bin\Flash\List\common.s                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME common

        #define SHT_PROGBITS 0x1

        PUBLIC disable_irq
        PUBLIC enable_irq
        PUBLIC set_irq_priority
        PUBLIC stop
        PUBLIC wait
        PUBLIC write_vtor

// C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥µ(∏ƒI2C)\src\Sources\C\Frame_C\common.c
//    1 //-------------------------------------------------------------------------*
//    2 // Œƒº˛√˚: common.h (Õ®”√Õ∑Œƒº˛)                                           *
//    3 // Àµ  √˜:                                                                 *
//    4 //-------------------------------------------------------------------------*
//    5 
//    6 #include "common.h"
//    7 
//    8 //-------------------------------------------------------------------------*
//    9 //∫Ø ˝√˚: stop                                                             *
//   10 //π¶  ƒ‹: …Ë÷√CPUŒ™STOPƒ£ Ω                                                * 
//   11 //≤Œ   ˝: Œﬁ								   *	
//   12 //∑µ  ªÿ: Œﬁ                                                               *
//   13 //Àµ  √˜: Œﬁ                                                               *
//   14 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   15 void stop (void)
//   16 {
//   17     //÷√ŒªSLEEPDEEP¿¥ πƒ‹STOPƒ£ Ω
//   18     SCB_SCR |= SCB_SCR_SLEEPDEEP_MASK;	
stop:
        LDR.N    R0,??DataTable4  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable4  ;; 0xe000ed10
        STR      R0,[R1, #+0]
//   19     //Ω¯»ÎSTOPƒ£ Ω
//   20     asm("WFI");
        WFI
//   21 }
        BX       LR               ;; return
//   22 
//   23 //-------------------------------------------------------------------------*
//   24 //∫Ø ˝√˚: wait                                                             *
//   25 //π¶  ƒ‹: …Ë÷√CPUŒ™WAITƒ£ Ω                                                * 
//   26 //≤Œ   ˝: Œﬁ								   *	
//   27 //∑µ  ªÿ: Œﬁ                                                               *
//   28 //Àµ  √˜: Œﬁ                                                               *
//   29 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   30 void wait (void)
//   31 {
//   32     //«ÂSLEEPDEEPŒª¿¥»∑∂®Ω¯»ÎWAITƒ£ Ω
//   33     SCB_SCR &= ~SCB_SCR_SLEEPDEEP_MASK;	
wait:
        LDR.N    R0,??DataTable4  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable4  ;; 0xe000ed10
        STR      R0,[R1, #+0]
//   34     //Ω¯»ÎWAITƒ£ Ω
//   35     asm("WFI");
        WFI
//   36 }
        BX       LR               ;; return
//   37 
//   38 //-------------------------------------------------------------------------*
//   39 //∫Ø ˝√˚: write_vtor                                                       *
//   40 //π¶  ƒ‹: ∏¸∏ƒ÷–∂œœÚ¡ø±Ì∆´“∆ºƒ¥Ê∆˜µƒ÷µ                                     * 
//   41 //≤Œ   ˝: “™∏¸∏ƒµƒ÷µ    						   *	
//   42 //∑µ  ªÿ: Œﬁ                                                               *
//   43 //Àµ  √˜: Œﬁ                                                               *
//   44 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   45 void write_vtor (int vtor)
//   46 {
//   47     //–¥–¬÷µ
//   48     SCB_VTOR = vtor;	
write_vtor:
        LDR.N    R1,??DataTable4_1  ;; 0xe000ed08
        STR      R0,[R1, #+0]
//   49 }
        BX       LR               ;; return
//   50 
//   51 //-------------------------------------------------------------------------*
//   52 //∫Ø ˝√˚: enable_irq                                                       *
//   53 //π¶  ƒ‹:  πƒ‹irq÷–∂œ                                                      * 
//   54 //≤Œ   ˝: irq:irq∫≈       						   *	
//   55 //∑µ  ªÿ: Œﬁ                                                               *
//   56 //Àµ  √˜: irq∫≈≤ª «÷–∂œœÚ¡ø∫≈                                              *
//   57 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   58 void enable_irq (int irq)
//   59 {
//   60     int div;
//   61 
//   62     //»∑∂®irq∫≈Œ™”––ßµƒirq∫≈
//   63     if (irq > 91)	irq=91;
enable_irq:
        CMP      R0,#+92
        BLT.N    ??enable_irq_0
        MOVS     R0,#+91
//   64     
//   65     //»∑∂®∂‘”¶µƒNVICISER
//   66     div = irq/32;
??enable_irq_0:
        MOVS     R1,#+32
        SDIV     R1,R0,R1
//   67     
//   68     switch (div)
        CMP      R1,#+0
        BEQ.N    ??enable_irq_1
        CMP      R1,#+2
        BEQ.N    ??enable_irq_2
        BCC.N    ??enable_irq_3
        B.N      ??enable_irq_4
//   69     {
//   70     	case 0x0:
//   71               NVICICPR0 = 1 << (irq%32);
??enable_irq_1:
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        LSLS     R1,R1,R3
        LDR.N    R2,??DataTable4_2  ;; 0xe000e280
        STR      R1,[R2, #+0]
//   72               NVICISER0 = 1 << (irq%32);
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        LSLS     R0,R1,R3
        LDR.N    R1,??DataTable4_3  ;; 0xe000e100
        STR      R0,[R1, #+0]
//   73               break;
        B.N      ??enable_irq_4
//   74     	case 0x1:
//   75               NVICICPR1 = 1 << (irq%32);
??enable_irq_3:
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        LSLS     R1,R1,R3
        LDR.N    R2,??DataTable4_4  ;; 0xe000e284
        STR      R1,[R2, #+0]
//   76               NVICISER1 = 1 << (irq%32);
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        LSLS     R0,R1,R3
        LDR.N    R1,??DataTable4_5  ;; 0xe000e104
        STR      R0,[R1, #+0]
//   77               break;
        B.N      ??enable_irq_4
//   78     	case 0x2:
//   79               NVICICPR2 = 1 << (irq%32);
??enable_irq_2:
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        LSLS     R1,R1,R3
        LDR.N    R2,??DataTable4_6  ;; 0xe000e288
        STR      R1,[R2, #+0]
//   80               NVICISER2 = 1 << (irq%32);
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        LSLS     R0,R1,R3
        LDR.N    R1,??DataTable4_7  ;; 0xe000e108
        STR      R0,[R1, #+0]
//   81               break;
//   82     }              
//   83 }
??enable_irq_4:
        BX       LR               ;; return
//   84 
//   85 //-------------------------------------------------------------------------*
//   86 //∫Ø ˝√˚: disable_irq                                                      *
//   87 //π¶  ƒ‹: Ω˚÷πirq÷–∂œ                                                      * 
//   88 //≤Œ   ˝: irq:irq∫≈       						   *	
//   89 //∑µ  ªÿ: Œﬁ                                                               *
//   90 //Àµ  √˜: irq∫≈≤ª «÷–∂œœÚ¡ø∫≈                                              *
//   91 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   92 void disable_irq (int irq)
//   93 {
//   94     int div;
//   95     
//   96     //»∑∂®irq∫≈Œ™”––ßµƒirq∫≈
//   97     if (irq > 91)	irq=91;
disable_irq:
        CMP      R0,#+92
        BLT.N    ??disable_irq_0
        MOVS     R0,#+91
//   98     
//   99     //»∑∂®∂‘”¶µƒNVICISER
//  100     div = irq/32;
??disable_irq_0:
        MOVS     R1,#+32
        SDIV     R1,R0,R1
//  101     
//  102     switch (div)
        CMP      R1,#+0
        BEQ.N    ??disable_irq_1
        CMP      R1,#+2
        BEQ.N    ??disable_irq_2
        BCC.N    ??disable_irq_3
        B.N      ??disable_irq_4
//  103     {
//  104     	case 0x0:
//  105                NVICICER0 = 1 << (irq%32);
??disable_irq_1:
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        LSLS     R0,R1,R3
        LDR.N    R1,??DataTable4_8  ;; 0xe000e180
        STR      R0,[R1, #+0]
//  106               break;
        B.N      ??disable_irq_4
//  107     	case 0x1:
//  108               NVICICER1 = 1 << (irq%32);
??disable_irq_3:
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        LSLS     R0,R1,R3
        LDR.N    R1,??DataTable4_9  ;; 0xe000e184
        STR      R0,[R1, #+0]
//  109               break;
        B.N      ??disable_irq_4
//  110     	case 0x2:
//  111               NVICICER2 = 1 << (irq%32);
??disable_irq_2:
        MOVS     R1,#+1
        MOVS     R2,#+32
        SDIV     R3,R0,R2
        MLS      R3,R3,R2,R0
        LSLS     R0,R1,R3
        LDR.N    R1,??DataTable4_10  ;; 0xe000e188
        STR      R0,[R1, #+0]
//  112               break;
//  113     }              
//  114 }
??disable_irq_4:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0xe000ed10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0xe000ed08

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0xe000e280

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0xe000e284

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0xe000e104

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0xe000e288

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0xe000e108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0xe000e184

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0xe000e188
//  115  
//  116 //-------------------------------------------------------------------------*
//  117 //∫Ø ˝√˚: set_irq_priority                                                 *
//  118 //π¶  ƒ‹: …Ë÷√irq÷–∂œ∫Õ”≈œ»º∂                                              * 
//  119 //≤Œ   ˝: irq:irq∫≈         						   *	
//  120 //        prio:”≈œ»º∂						           *	
//  121 //∑µ  ªÿ: Œﬁ                                                               *
//  122 //Àµ  √˜: irq∫≈≤ª «÷–∂œœÚ¡ø∫≈                                              *
//  123 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  124 void set_irq_priority (int irq, int prio)
//  125 {
//  126     uint8 *prio_reg;
//  127 
//  128     //»∑∂®irq∫≈∫Õ”≈œ»º∂”––ß
//  129     if (irq > 91)	irq=91;
set_irq_priority:
        CMP      R0,#+92
        BLT.N    ??set_irq_priority_0
        MOVS     R0,#+91
//  130     if (prio > 15)	prio=15;
??set_irq_priority_0:
        CMP      R1,#+16
        BLT.N    ??set_irq_priority_1
        MOVS     R1,#+15
//  131 
//  132     //»∑∂®∂‘”¶µƒNVICISER
//  133     prio_reg = (uint8 *)(((uint32)&NVICIP0) + irq);
??set_irq_priority_1:
        ADD      R0,R0,#-536870912
        ADDS     R0,R0,#+58368
//  134     //…Ë÷√”≈œ»º∂
//  135     *prio_reg = ( (prio&0xF) << (8 - ARM_INTERRUPT_LEVEL_BITS) );             
        LSLS     R1,R1,#+4
        STRB     R1,[R0, #+0]
//  136 }
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  137 
// 
// 342 bytes in section .text
// 
// 342 bytes of CODE memory
//
//Errors: none
//Warnings: none
