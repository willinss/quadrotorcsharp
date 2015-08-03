///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:16 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Project_Settings\Startup_Code\start.c       /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Project_Settings\Startup_Code\start.c" -D  /
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
//                    (¸ÄI2C)\bin\Flash\List\start.s                          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME start

        #define SHT_PROGBITS 0x1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0
        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        EXTERN __VECTOR_RAM
        EXTERN __VECTOR_TABLE
        EXTERN main
        EXTERN sysinit
        EXTERN wdog_disable
        EXTERN write_vtor

        PUBLIC common_startup
        PUBLIC start

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Project_Settings\Startup_Code\start.c
//    1 //-------------------------------------------------------------------------*
//    2 // ÎÄ¼þÃû:start.c                                                          *
//    3 // Ëµ  Ã÷: CPUÆô¶¯ºó½øÐÐÏµÍ³ÅäÖÃ                                           *
//    4 //-------------------------------------------------------------------------*
//    5 
//    6 //Í·ÎÄ¼þ
//    7 #include "common.h"
//    8 #include "wdog.h"
//    9 #include "sysinit.h"
//   10 
//   11 #pragma section = ".data"
//   12 #pragma section = ".data_init"
//   13 #pragma section = ".bss"
//   14 #pragma section = "CodeRelocate"
//   15 #pragma section = "CodeRelocateRam" 
//   16 
//   17 //ÄÚ²¿º¯ÊýÉùÃ÷
//   18 //-------------------------------------------------------------------------*
//   19 //º¯ÊýÃû: common_startup                                                   *
//   20 //¹¦  ÄÜ: ¸´ÖÆÖÐ¶ÏÏòÁ¿±íµ½RAMÖÐ                                            * 
//   21 //²Î  Êý: ÎÞ								   *	
//   22 //Ëµ  Ã÷: ½«ROMÖÐµÄ³õÊ¼»¯Êý¾Ý¿½±´µ½RAMÖÐ                                   *
//   23 //-------------------------------------------------------------------------*
//   24 void common_startup(void);
//   25 
//   26 //-------------------------------------------------------------------------*
//   27 //º¯ÊýÃû: start                                                            *
//   28 //¹¦  ÄÜ: ÏµÍ³Æô¶¯                                                         * 
//   29 //²Î  Êý: ÎÞ								   *	
//   30 //Ëµ  Ã÷: ÎÞ                                                               *
//   31 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void start(void)
//   33 {
start:
        PUSH     {R7,LR}
//   34     //¹Ø±Õ¿´ÃÅ¹·
//   35     wdog_disable();		
        BL       wdog_disable
//   36     //¸´ÖÆÖÐ¶ÏÏòÁ¿±íµ½RAMÖÐ
//   37     common_startup();	
        BL       common_startup
//   38     //ÏµÍ³ÉèÖÃ
//   39     sysinit();			
        BL       sysinit
//   40     //½øÈëÖ÷º¯Êý
//   41     main();				
        BL       main
//   42 }
        POP      {R0,PC}          ;; return
//   43 
//   44 
//   45 //-------------------------------------------------------------------------*
//   46 //º¯ÊýÃû: common_startup                                                   *
//   47 //¹¦  ÄÜ: ¸´ÖÆÖÐ¶ÏÏòÁ¿±íµ½RAMÖÐ                                            * 
//   48 //²Î  Êý: ÎÞ								   *	
//   49 //Ëµ  Ã÷: ½«ROMÖÐµÄ³õÊ¼»¯Êý¾Ý¿½±´µ½RAMÖÐ                                   *
//   50 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   51 void common_startup(void)
//   52 {
common_startup:
        PUSH     {R7,LR}
//   53     /* Declare a counter we'll use in all of the copy loops */
//   54     uint32 n;
//   55  
//   56  
//   57     /* Addresses for VECTOR_TABLE and VECTOR_RAM come from the linker file */  
//   58     extern uint32 __VECTOR_TABLE[];
//   59     extern uint32 __VECTOR_RAM[];
//   60 
//   61     /* Copy the vector table to RAM */
//   62     if (__VECTOR_RAM != __VECTOR_TABLE)
        LDR.N    R0,??DataTable0
        LDR.N    R1,??DataTable0_1
        CMP      R0,R1
        BEQ.N    ??common_startup_0
//   63     {
//   64         for (n = 0; n < 0x410; n++)
        MOVS     R0,#+0
        B.N      ??common_startup_1
//   65             __VECTOR_RAM[n] = __VECTOR_TABLE[n];
??common_startup_2:
        LDR.N    R1,??DataTable0
        LDR.N    R2,??DataTable0_1
        LDR      R2,[R2, R0, LSL #+2]
        STR      R2,[R1, R0, LSL #+2]
        ADDS     R0,R0,#+1
??common_startup_1:
        CMP      R0,#+1040
        BCC.N    ??common_startup_2
//   66     }
//   67     /* Point the VTOR to the new copy of the vector table */
//   68     write_vtor((uint32)__VECTOR_RAM);    
??common_startup_0:
        LDR.N    R0,??DataTable0
        BL       write_vtor
//   69     
//   70     /* Get the addresses for the .data section (initialized data section) */
//   71     uint8* data_ram = __section_begin(".data");
        LDR.N    R1,??DataTable0_2
//   72     uint8* data_rom = __section_begin(".data_init");
        LDR.N    R2,??DataTable0_3
//   73     uint8* data_rom_end = __section_end(".data_init");
        LDR.N    R0,??DataTable0_4
//   74     
//   75     /* Copy initialized data from ROM to RAM */
//   76     n = data_rom_end - data_rom;
        SUBS     R0,R0,R2
        B.N      ??common_startup_3
//   77     while (n--)
//   78       *data_ram++ = *data_rom++;
??common_startup_4:
        LDRB     R3,[R2, #+0]
        STRB     R3,[R1, #+0]
        ADDS     R2,R2,#+1
        ADDS     R1,R1,#+1
??common_startup_3:
        MOVS     R3,R0
        SUBS     R0,R3,#+1
        CMP      R3,#+0
        BNE.N    ??common_startup_4
//   79  
//   80  
//   81     /* Get the addresses for the .bss section (zero-initialized data) */
//   82     uint8* bss_start = __section_begin(".bss");
        LDR.N    R1,??DataTable0_5
//   83     uint8* bss_end = __section_end(".bss");
        LDR.N    R0,??DataTable0_6
//   84     
//   85     /* Clear the zero-initialized data section */
//   86     n = bss_end - bss_start;
        SUBS     R0,R0,R1
        B.N      ??common_startup_5
//   87     while(n--)
//   88       *bss_start++ = 0;    
??common_startup_6:
        MOVS     R2,#+0
        STRB     R2,[R1, #+0]
        ADDS     R1,R1,#+1
??common_startup_5:
        MOVS     R2,R0
        SUBS     R0,R2,#+1
        CMP      R2,#+0
        BNE.N    ??common_startup_6
//   89     
//   90     /* Get addresses for any code sections that need to be copied from ROM to RAM.
//   91      * The IAR tools have a predefined keyword that can be used to mark individual
//   92      * functions for execution from RAM. Add "__ramfunc" before the return type in
//   93      * the function prototype for any routines you need to execute from RAM instead 
//   94      * of ROM. ex: __ramfunc void foo(void);
//   95      */
//   96     uint8* code_relocate_ram = __section_begin("CodeRelocateRam");
        LDR.N    R1,??DataTable0_7
//   97     uint8* code_relocate = __section_begin("CodeRelocate");
        LDR.N    R2,??DataTable0_8
//   98     uint8* code_relocate_end = __section_end("CodeRelocate");
        LDR.N    R0,??DataTable0_9
//   99     
//  100     /* Copy functions from ROM to RAM */
//  101     n = code_relocate_end - code_relocate;
        SUBS     R0,R0,R2
        B.N      ??common_startup_7
//  102     while (n--)
//  103       *code_relocate_ram++ = *code_relocate++;
??common_startup_8:
        LDRB     R3,[R2, #+0]
        STRB     R3,[R1, #+0]
        ADDS     R2,R2,#+1
        ADDS     R1,R1,#+1
??common_startup_7:
        MOVS     R3,R0
        SUBS     R0,R3,#+1
        CMP      R3,#+0
        BNE.N    ??common_startup_8
//  104 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     __VECTOR_RAM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     __VECTOR_TABLE

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     SFB(`.data`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     SFB(`.data_init`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_4:
        DC32     SFE(`.data_init`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_5:
        DC32     SFB(`.bss`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_6:
        DC32     SFE(`.bss`)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_7:
        DC32     SFB(CodeRelocateRam)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_8:
        DC32     SFB(CodeRelocate)

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_9:
        DC32     SFE(CodeRelocate)

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.data_init`:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocate:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION CodeRelocateRam:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 176 bytes in section .text
// 
// 176 bytes of CODE memory
//
//Errors: none
//Warnings: none
