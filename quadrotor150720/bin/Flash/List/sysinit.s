///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:16 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Frame_C\sysinit.c                 /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Frame_C\sysinit.c" -D IAR -D     /
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
//                    (¸ÄI2C)\bin\Flash\List\sysinit.s                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME sysinit

        #define SHT_PROGBITS 0x1
        #define SHF_WRITE 0x1
        #define SHF_EXECINSTR 0x4

        PUBLIC core_clk_khz
        PUBLIC core_clk_mhz
        PUBLIC fb_clk_init
        PUBLIC periph_clk_khz
        PUBLIC pll_init
        PUBLIC set_sys_dividers
        PUBLIC sysinit
        PUBLIC trace_clk_init

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Frame_C\sysinit.c
//    1 //-------------------------------------------------------------------------*
//    2 // ÎÄ¼þÃû:sysinit.c                                                        *
//    3 // Ëµ  Ã÷: ÏµÍ³ÅäÖÃÎÄ¼þ                                                    *
//    4 //-------------------------------------------------------------------------*
//    5 
//    6 #include "sysinit.h"	//Í·ÎÄ¼þ
//    7 
//    8 //È«¾Ö±äÁ¿ÉùÃ÷

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 int core_clk_khz;
core_clk_khz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 int core_clk_mhz;
core_clk_mhz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 int periph_clk_khz;
periph_clk_khz:
        DS8 4
//   12 
//   13 //-------------------------------------------------------------------------*
//   14 //º¯ÊýÃû: sysinit                                                          *
//   15 //¹¦  ÄÜ: ÏµÍ³ÉèÖÃ                                                         * 
//   16 //²Î  Êý: ÎÞ						  	           *	
//   17 //·µ  »Ø: ÎÞ                                                               *
//   18 //Ëµ  Ã÷: ÎÞ                                                               *
//   19 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   20 void sysinit (void)
//   21 {
sysinit:
        PUSH     {R7,LR}
//   22     //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//   23     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//   24                               | SIM_SCGC5_PORTB_MASK
//   25                               | SIM_SCGC5_PORTC_MASK
//   26                               | SIM_SCGC5_PORTD_MASK
//   27                               | SIM_SCGC5_PORTE_MASK );
        LDR.N    R0,??DataTable3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable3  ;; 0x40048038
        STR      R0,[R1, #+0]
//   28 
//   29     //¿ªÆôÏµÍ³Ê±ÖÓ
//   30     core_clk_mhz = pll_init(CORE_CLK_MHZ, REF_CLK);
        MOVS     R1,#+3
        MOVS     R0,#+2
        BL       pll_init
        LDR.N    R1,??DataTable3_1
        STR      R0,[R1, #+0]
//   31     //Í¨¹ýpll_initº¯ÊýµÄ·µ»ØÖµÀ´¼ÆËãÄÚºËÊ±ÖÓºÍÍâÉèÊ±ÖÓ
//   32     core_clk_khz = core_clk_mhz * 1000;
        LDR.N    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//   33     periph_clk_khz = core_clk_khz / (((SIM_CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> 24)+ 1);
        LDR.N    R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_3  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+24,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+0]
//   34     //Ê¹ÄÜ¸ú×ÙÊ±ÖÓ£¬ÓÃÓÚµ÷ÊÔ
//   35     trace_clk_init();	
        BL       trace_clk_init
//   36     //FlexBusÊ±ÖÓ³õÊ¼»¯
//   37     fb_clk_init();
        BL       fb_clk_init
//   38 
//   39 }
        POP      {R0,PC}          ;; return
//   40 
//   41 //-------------------------------------------------------------------------*
//   42 //º¯ÊýÃû: trace_clk_init                                                   *
//   43 //¹¦  ÄÜ: ¸ú×ÙÊ±ÖÓ³õÊ¼»¯                                                   * 
//   44 //²Î  Êý: ÎÞ							  	   *	
//   45 //·µ  »Ø: ÎÞ                                                               *
//   46 //Ëµ  Ã÷: ÓÃÓÚµ÷ÊÔ                                                         *
//   47 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   48 void trace_clk_init(void)
//   49 {
//   50     //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//   51     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
trace_clk_init:
        LDR.N    R0,??DataTable3_5  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable3_5  ;; 0x40048004
        STR      R0,[R1, #+0]
//   52     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//   53     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));
        LDR.N    R0,??DataTable3_6  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//   54 }
        BX       LR               ;; return
//   55 
//   56 //-------------------------------------------------------------------------*
//   57 //º¯ÊýÃû: fb_clk_init                                                      *
//   58 //¹¦  ÄÜ: FlexBusÊ±ÖÓ³õÊ¼»¯                                                * 
//   59 //²Î  Êý: ÎÞ								   *	
//   60 //·µ  »Ø: ÎÞ                                                               *
//   61 //Ëµ  Ã÷:                                                                  *
//   62 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   63 void fb_clk_init(void)
//   64 {
//   65     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//   66     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
fb_clk_init:
        LDR.N    R0,??DataTable3_7  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable3_7  ;; 0x40048040
        STR      R0,[R1, #+0]
//   67     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//   68     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable3_8  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//   69 }
        BX       LR               ;; return
//   70 
//   71 //-------------------------------------------------------------------------*
//   72 //º¯ÊýÃû: pll_init                                                         *
//   73 //¹¦  ÄÜ: pll³õÊ¼»¯                                                        * 
//   74 //²Î  Êý: clk_option:Ê±ÖÓÑ¡Ïî						   * 
//   75 //		  crystal_val:Ê±ÖÓÖµ                                       *	
//   76 //·µ  »Ø: Ê±ÖÓÆµÂÊÖµ                                                       *
//   77 //Ëµ  Ã÷:                                                                  *
//   78 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   79 unsigned char pll_init(unsigned char clk_option, unsigned char crystal_val)
//   80 {
pll_init:
        PUSH     {R7,LR}
        MOVS     R2,R1
//   81     unsigned char pll_freq;
//   82     
//   83     if (clk_option > 3) {return 0;}   //Èç¹ûÃ»ÓÐÑ¡Ôñ¿ÉÓÃµÄÑ¡ÏîÔò·µ»Ø0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BCC.N    ??pll_init_0
        MOVS     R0,#+0
        B.N      ??pll_init_1
//   84     if (crystal_val > 15) {return 1;} // Èç¹ûÈç¹û¿ÉÓÃµÄ¾§ÌåÑ¡Ïî²»¿ÉÓÃÔò·µ»Ø1
??pll_init_0:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+16
        BCC.N    ??pll_init_2
        MOVS     R0,#+1
        B.N      ??pll_init_1
//   85     
//   86     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//   87     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//   88     #if (defined(K60_CLK) || defined(ASB817))
//   89              MCG_C2 = 0;
??pll_init_2:
        LDR.N    R2,??DataTable3_9  ;; 0x40064001
        MOVS     R3,#+0
        STRB     R3,[R2, #+0]
//   90     #else
//   91              //Ê¹ÄÜÍâ²¿¾§Õñ
//   92              MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//   93     #endif
//   94     
//   95     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//   96     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R2,??DataTable3_10  ;; 0x40048034
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x10000000
        LDR.N    R3,??DataTable3_10  ;; 0x40048034
        STR      R2,[R3, #+0]
//   97     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R2,??DataTable3_11  ;; 0x4007c008
        LDRB     R2,[R2, #+0]
        ORRS     R2,R2,#0x80
        LDR.N    R3,??DataTable3_11  ;; 0x4007c008
        STRB     R2,[R3, #+0]
//   98     
//   99     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  100     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R2,??DataTable3_12  ;; 0x40064000
        MOVS     R3,#+152
        STRB     R3,[R2, #+0]
//  101     
//  102     //µÈ´ý¾§ÕñÎÈ¶¨	
//  103     #if (!defined(K60_CLK) && !defined(ASB817))
//  104     while (!(MCG_S & MCG_S_OSCINIT_MASK)){};  
//  105     #endif
//  106     
//  107     //µÈ´ý²Î¿¼Ê±ÖÓ×´Ì¬Î»ÇåÁã
//  108     while (MCG_S & MCG_S_IREFST_MASK){}; 
??pll_init_3:
        LDR.N    R2,??DataTable3_13  ;; 0x40064006
        LDRB     R2,[R2, #+0]
        LSLS     R2,R2,#+27
        BMI.N    ??pll_init_3
//  109     //µÈ´ýÊ±ÖÓ×´Ì¬Î»ÏÔÊ¾Ê±ÖÓÔ´À´×ÔÍâ²¿²Î¿¼Ê±ÖÓ
//  110     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}; 
??pll_init_4:
        LDR.N    R2,??DataTable3_13  ;; 0x40064006
        LDRB     R2,[R2, #+0]
        UBFX     R2,R2,#+2,#+2
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+2
        BNE.N    ??pll_init_4
//  111     
//  112     //½øÈëFBEÄ£Ê½
//  113     #if (defined(K60_CLK))
//  114     MCG_C5 = MCG_C5_PRDIV(0x18);
        LDR.N    R2,??DataTable3_14  ;; 0x40064004
        MOVS     R3,#+24
        STRB     R3,[R2, #+0]
//  115     #else
//  116     
//  117     //ÅäÖÃPLL·ÖÆµÆ÷À´Æ¥ÅäËùÓÃµÄ¾§Õñ
//  118     MCG_C5 = MCG_C5_PRDIV(crystal_val); 
//  119     #endif
//  120     
//  121     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  122     MCG_C6 = 0x0;
        LDR.N    R2,??DataTable3_15  ;; 0x40064005
        MOVS     R3,#+0
        STRB     R3,[R2, #+0]
//  123     //Ñ¡ÔñPLL VCO·ÖÆµÆ÷£¬ÏµÍ³Ê±ÖÓ·ÖÆµÆ÷È¡¾öÓÚÊ±ÖÓÑ¡Ïî
//  124     switch (clk_option) {
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??pll_init_5
        CMP      R0,#+2
        BEQ.N    ??pll_init_6
        BCC.N    ??pll_init_7
        CMP      R0,#+3
        BEQ.N    ??pll_init_8
        B.N      ??pll_init_9
//  125     case 0:
//  126       //ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  127       //MCG=PLL, core = MCG, bus = MCG, FlexBus = MCG, Flash clock= MCG/2
//  128       set_sys_dividers(0,0,0,1);
??pll_init_5:
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       set_sys_dividers
//  129       //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª50MHz, LOLIE=0, PLLS=1, CME=0, VDIV=1
//  130       MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(1); //VDIV = 1 (x25)
        LDR.N    R0,??DataTable3_15  ;; 0x40064005
        MOVS     R1,#+65
        STRB     R1,[R0, #+0]
//  131       pll_freq = 50;
        MOVS     R1,#+50
//  132       break;
        B.N      ??pll_init_9
//  133     case 1:
//  134       //ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  135       //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  136       set_sys_dividers(0,1,1,3);
??pll_init_7:
        MOVS     R3,#+3
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       set_sys_dividers
//  137       //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  138       MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(26); //VDIV = 26 (x50)
        LDR.N    R0,??DataTable3_15  ;; 0x40064005
        MOVS     R1,#+90
        STRB     R1,[R0, #+0]
//  139       pll_freq = 100;
        MOVS     R1,#+100
//  140       break;
        B.N      ??pll_init_9
//  141     case 2:
//  142       //ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  143       //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  144       set_sys_dividers(0,1,1,3);
??pll_init_6:
        MOVS     R3,#+3
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       set_sys_dividers
//  145       //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª96MHz, LOLIE=0, PLLS=1, CME=0, VDIV=24
//  146       MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(24); //VDIV = 24 (x48)
        LDR.N    R0,??DataTable3_15  ;; 0x40064005
        MOVS     R1,#+88
        STRB     R1,[R0, #+0]
//  147       pll_freq = 96;
        MOVS     R1,#+96
//  148       break;
        B.N      ??pll_init_9
//  149     case 3:
//  150       //ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  151       //MCG=PLL, core = MCG, bus = MCG, FlexBus = MCG, Flash clock= MCG/2
//  152       set_sys_dividers(0,0,0,1);
??pll_init_8:
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       set_sys_dividers
//  153       //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª48MHz, LOLIE=0, PLLS=1, CME=0, VDIV=0
//  154       MCG_C6 = MCG_C6_PLLS_MASK; //VDIV = 0 (x24)
        LDR.N    R0,??DataTable3_15  ;; 0x40064005
        MOVS     R1,#+64
        STRB     R1,[R0, #+0]
//  155       pll_freq = 48;
        MOVS     R1,#+48
//  156       break;
//  157     }
//  158     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set
??pll_init_9:
        LDR.N    R0,??DataTable3_13  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pll_init_9
//  159     
//  160     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set
??pll_init_10:
        LDR.N    R0,??DataTable3_13  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pll_init_10
//  161     
//  162     //½øÈëPBEÄ£Ê½
//  163     
//  164     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  165     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  166     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable3_12  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R2,??DataTable3_12  ;; 0x40064000
        STRB     R0,[R2, #+0]
//  167     
//  168     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  169     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pll_init_11:
        LDR.N    R0,??DataTable3_13  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pll_init_11
//  170     
//  171     //¿ªÊ¼½øÈëPEEÄ£Ê½
//  172     
//  173     return pll_freq;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
??pll_init_1:
        POP      {R1,PC}          ;; return
//  174 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     core_clk_mhz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     core_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x40049018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x40048040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x4007c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     0x40064005
//  175 
//  176 //-------------------------------------------------------------------------*
//  177 //º¯ÊýÃû: set_sys_dividers                                                 *
//  178 //¹¦  ÄÜ: ÉèÖÃÏµÏµÍ³·ÖÆµÆ÷                                                 * 
//  179 //²Î  Êý: Ô¤·ÖÆµÖµ   							   *	
//  180 //·µ  »Ø: ÎÞ                                                               *
//  181 //Ëµ  Ã÷: ´Ëº¯Êý±ØÐë·ÅÔÚRAMÀïÖ´ÐÐ£¬·ñÔò»á²úÉú´íÎóe2448¡£µ±FLASHÊ±ÖÓ·ÖÆµ¸Ä±ä* 
//  182 //        Ê±£¬±ØÐë½ûÖ¹FLASHµÄÔ¤È¡¹¦ÄÜ¡£ÔÚÊ±ÖÓ·ÖÆµ¸Ä±äÖ®ºó£¬±ØÐëÑÓÊ±Ò»Ð¡¶ÎÊ±*
//  183 //	 ¼ä²Å¿ÉÒÔ´ÓÐÂÊ¹ÄÜÔ¤È¡¹¦ÄÜ¡£                                        * 
//  184 //-------------------------------------------------------------------------*

        SECTION `.textrw`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, SHF_WRITE | SHF_EXECINSTR
        THUMB
//  185 __ramfunc void set_sys_dividers(uint32 outdiv1, uint32 outdiv2, uint32 outdiv3, uint32 outdiv4)
//  186 {
set_sys_dividers:
        PUSH     {R4-R6}
//  187     uint32 temp_reg;
//  188     uint8 i;
//  189     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  190     temp_reg = FMC_PFAPR;
        LDR.N    R4,??set_sys_dividers_0  ;; 0x4001f000
        LDR      R4,[R4, #+0]
//  191     
//  192     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  193     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  194                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  195                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;
        LDR.N    R5,??set_sys_dividers_0  ;; 0x4001f000
        LDR      R5,[R5, #+0]
        ORRS     R5,R5,#0xFF0000
        LDR.N    R6,??set_sys_dividers_0  ;; 0x4001f000
        STR      R5,[R6, #+0]
//  196     
//  197     //¸øÊ±ÖÓ·ÖÆµÆ÷ÉèÖÃÆÚÍûÖµ  
//  198     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(outdiv1) | SIM_CLKDIV1_OUTDIV2(outdiv2) 
//  199                       | SIM_CLKDIV1_OUTDIV3(outdiv3) | SIM_CLKDIV1_OUTDIV4(outdiv4);
        LSLS     R1,R1,#+24
        ANDS     R1,R1,#0xF000000
        ORRS     R0,R1,R0, LSL #+28
        LSLS     R1,R2,#+20
        ANDS     R1,R1,#0xF00000
        ORRS     R0,R1,R0
        LSLS     R1,R3,#+16
        ANDS     R1,R1,#0xF0000
        ORRS     R0,R1,R0
        LDR.N    R1,??set_sys_dividers_0+0x4  ;; 0x40048044
        STR      R0,[R1, #+0]
//  200     
//  201     //µÈ´ý·ÖÆµÆ÷¸Ä±ä
//  202     for (i = 0 ; i < outdiv4 ; i++)
        MOVS     R0,#+0
        B.N      ??set_sys_dividers_1
??set_sys_dividers_2:
        ADDS     R0,R0,#+1
??set_sys_dividers_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R3
        BCC.N    ??set_sys_dividers_2
//  203     {}
//  204     
//  205     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  206     FMC_PFAPR = temp_reg; 
        LDR.N    R0,??set_sys_dividers_0  ;; 0x4001f000
        STR      R4,[R0, #+0]
//  207     
//  208     return;
        POP      {R4-R6}
        BX       LR               ;; return
        DATA
??set_sys_dividers_0:
        DC32     0x4001f000
        DC32     0x40048044
//  209 }

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  210 
//  211 
//  212 
//  213 
//  214 
//  215 
// 
//  12 bytes in section .bss
// 426 bytes in section .text
//  76 bytes in section .textrw
// 
// 502 bytes of CODE memory
//  12 bytes of DATA memory
//
//Errors: none
//Warnings: none
