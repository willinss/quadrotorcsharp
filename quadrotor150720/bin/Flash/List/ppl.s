///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:15 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\ppl.c                 /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\ppl.c" -D IAR -D     /
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
//                    (¸ÄI2C)\bin\Flash\List\ppl.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ppl

        #define SHT_PROGBITS 0x1

        PUBLIC pllinit100M
        PUBLIC pllinit125M
        PUBLIC pllinit1375M
        PUBLIC pllinit144M
        PUBLIC pllinit150M
        PUBLIC pllinit168d75M
        PUBLIC pllinit180M
        PUBLIC pllinit207M
        PUBLIC pllinit211M
        PUBLIC pllinit225M
        PUBLIC pllinit60M
        PUBLIC pllinit80M

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\ppl.c
//    1 #include "ppl.h"
//    2 //ËøÏà»·ÆµÂÊÎª50/12*54=225M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    3 void pllinit225M(void)
//    4 {
//    5 	uint32_t temp_reg;
//    6         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//    7     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//    8                               | SIM_SCGC5_PORTB_MASK
//    9                               | SIM_SCGC5_PORTC_MASK
//   10                               | SIM_SCGC5_PORTD_MASK
//   11                               | SIM_SCGC5_PORTE_MASK );
pllinit225M:
        LDR.W    R0,??DataTable8  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.W    R1,??DataTable8  ;; 0x40048038
        STR      R0,[R1, #+0]
//   12     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//   13     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//   14     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   15     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//   16     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//   17     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.W    R0,??DataTable8_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable8_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//   18     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.W    R0,??DataTable8_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable8_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//   19     
//   20     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//   21     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//   22     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//   23     
//   24     //µÈ´ý¾§ÕñÎÈ¶¨	    
//   25     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//   26     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit225M_0:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit225M_0
//   27     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit225M_1:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit225M_1
//   28     
//   29     //½øÈëFBEÄ£Ê½,
//   30     //0x18==25·ÖÆµ=2M,
//   31     //0x08==15·ÖÆµ=3.333M 
//   32     //0x09==16·ÖÆµ=3.125M,
//   33     //0x10==17·ÖÆµ=2.94M 
//   34     //0x11==18·ÖÆµ=2.7778M 
//   35     //0x12==19·ÖÆµ=2.63M,
//   36     //0x13==20·ÖÆµ=2.5M    
//   37     MCG_C5 = MCG_C5_PRDIV(0x0b);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+11
        STRB     R1,[R0, #+0]
//   38     
//   39     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//   40     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   41     
//   42     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//   43     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//   44     
//   45     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//   46     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//   47                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//   48                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//   49     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//   50     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/9
//   51     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//   52                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(8);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        MOVS     R2,#+36175872
        STR      R2,[R1, #+0]
//   53     
//   54     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//   55     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//   56     
//   57     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//   58     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(30);  //VDIV = 31 (x54)
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+94
        STRB     R1,[R0, #+0]
//   59                                                   //VDIV = 26 (x50)
//   60     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit225M_2:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit225M_2
//   61     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit225M_3:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit225M_3
//   62     
//   63     //½øÈëPBEÄ£Ê½    
//   64     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//   65     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//   66     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//   67     
//   68     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//   69     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit225M_4:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit225M_4
//   70     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//   71     
//   72     //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//   73     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//   74     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//   75     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//   76     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//   77     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//   78     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//   79     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//   80 }
        BX       LR               ;; return
//   81 //ËøÏà»·ÆµÂÊÎª50/13*55=211.538462M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   82 void pllinit211M(void)
//   83 {
//   84 	uint32_t temp_reg;
//   85         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//   86     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//   87                               | SIM_SCGC5_PORTB_MASK
//   88                               | SIM_SCGC5_PORTC_MASK
//   89                               | SIM_SCGC5_PORTD_MASK
//   90                               | SIM_SCGC5_PORTE_MASK );
pllinit211M:
        LDR.W    R0,??DataTable8  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.W    R1,??DataTable8  ;; 0x40048038
        STR      R0,[R1, #+0]
//   91     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//   92     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//   93     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   94     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//   95     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//   96     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.W    R0,??DataTable8_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable8_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//   97     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.W    R0,??DataTable8_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable8_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//   98     
//   99     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  100     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  101     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  102     
//  103     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  104     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  105     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit211M_0:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit211M_0
//  106     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit211M_1:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit211M_1
//  107     
//  108     //½øÈëFBEÄ£Ê½,
//  109     //0x18==25·ÖÆµ=2M,
//  110     //0x08==15·ÖÆµ=3.333M 
//  111     //0x09==16·ÖÆµ=3.125M,
//  112     //0x10==17·ÖÆµ=2.94M 
//  113     //0x11==18·ÖÆµ=2.7778M 
//  114     //0x12==19·ÖÆµ=2.63M,
//  115     //0x13==20·ÖÆµ=2.5M    
//  116     MCG_C5 = MCG_C5_PRDIV(0x0C);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+12
        STRB     R1,[R0, #+0]
//  117     
//  118     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  119     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  120     
//  121     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  122     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  123     
//  124     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  125     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  126                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  127                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  128     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  129     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  130     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  131                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  132     
//  133     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  134     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  135     
//  136     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  137     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(30);  //VDIV = 31 (x54)
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+94
        STRB     R1,[R0, #+0]
//  138                                                   //VDIV = 26 (x50)
//  139     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit211M_2:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit211M_2
//  140     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit211M_3:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit211M_3
//  141     
//  142     //½øÈëPBEÄ£Ê½    
//  143     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  144     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  145     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  146     
//  147     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  148     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit211M_4:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit211M_4
//  149     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//  150     
//  151     //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  152     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  153     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  154     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  155     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  156     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  157     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  158     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  159 }
        BX       LR               ;; return
//  160 //ËøÏà»·ÆµÂÊÎª50/13*54=207.7M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  161 void pllinit207M(void)
//  162 {
//  163 	uint32_t temp_reg;
//  164         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  165     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  166                               | SIM_SCGC5_PORTB_MASK
//  167                               | SIM_SCGC5_PORTC_MASK
//  168                               | SIM_SCGC5_PORTD_MASK
//  169                               | SIM_SCGC5_PORTE_MASK );
pllinit207M:
        LDR.W    R0,??DataTable8  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.W    R1,??DataTable8  ;; 0x40048038
        STR      R0,[R1, #+0]
//  170     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  171     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  172     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  173     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  174     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  175     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.W    R0,??DataTable8_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable8_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  176     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.W    R0,??DataTable8_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable8_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  177     
//  178     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  179     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  180     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  181     
//  182     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  183     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  184     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit207M_0:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit207M_0
//  185     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit207M_1:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit207M_1
//  186     
//  187     //½øÈëFBEÄ£Ê½,
//  188     //0x18==25·ÖÆµ=2M,
//  189     //0x08==15·ÖÆµ=3.333M 
//  190     //0x09==16·ÖÆµ=3.125M,
//  191     //0x10==17·ÖÆµ=2.94M 
//  192     //0x11==18·ÖÆµ=2.7778M 
//  193     //0x12==19·ÖÆµ=2.63M,
//  194     //0x13==20·ÖÆµ=2.5M    
//  195     MCG_C5 = MCG_C5_PRDIV(0x0C);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+12
        STRB     R1,[R0, #+0]
//  196     
//  197     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  198     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  199     
//  200     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  201     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  202     
//  203     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  204     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  205                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  206                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  207     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  208     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  209     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  210                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  211     
//  212     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  213     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  214     
//  215     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  216     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(30);  //VDIV = 31 (x54)
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+94
        STRB     R1,[R0, #+0]
//  217                                                   //VDIV = 26 (x50)
//  218     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit207M_2:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit207M_2
//  219     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit207M_3:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit207M_3
//  220     
//  221     //½øÈëPBEÄ£Ê½    
//  222     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  223     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  224     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  225     
//  226     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  227     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit207M_4:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit207M_4
//  228     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//  229     
//  230     //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  231     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  232     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  233     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  234     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  235     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  236     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  237     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  238 }
        BX       LR               ;; return
//  239 //ËøÏà»·ÆµÂÊÎª50/15*54=180M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  240 extern void pllinit180M(void)
//  241 {
//  242 	uint32_t temp_reg;
//  243         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  244     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  245                               | SIM_SCGC5_PORTB_MASK
//  246                               | SIM_SCGC5_PORTC_MASK
//  247                               | SIM_SCGC5_PORTD_MASK
//  248                               | SIM_SCGC5_PORTE_MASK );
pllinit180M:
        LDR.W    R0,??DataTable8  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.W    R1,??DataTable8  ;; 0x40048038
        STR      R0,[R1, #+0]
//  249     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  250     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  251     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  252     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  253     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  254     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.W    R0,??DataTable8_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable8_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  255     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.W    R0,??DataTable8_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable8_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  256     
//  257     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  258     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  259     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  260     
//  261     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  262     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  263     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit180M_0:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit180M_0
//  264     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit180M_1:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit180M_1
//  265     
//  266     //½øÈëFBEÄ£Ê½,
//  267     //0x18==25·ÖÆµ=2M,
//  268     //0x08==15·ÖÆµ=3.333M 
//  269     //0x09==16·ÖÆµ=3.125M,
//  270     //0x10==17·ÖÆµ=2.94M 
//  271     //0x11==18·ÖÆµ=2.7778M 
//  272     //0x12==19·ÖÆµ=2.63M,
//  273     //0x13==20·ÖÆµ=2.5M    
//  274     MCG_C5 = MCG_C5_PRDIV(0x0e);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+14
        STRB     R1,[R0, #+0]
//  275     
//  276     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  277     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  278     
//  279     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  280     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  281     
//  282     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  283     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  284                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  285                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  286     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  287     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  288     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  289                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  290     
//  291     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  292     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  293     
//  294     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  295     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(30);  //VDIV = 31 (x54)
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+94
        STRB     R1,[R0, #+0]
//  296                                                   //VDIV = 26 (x50)
//  297     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit180M_2:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit180M_2
//  298     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit180M_3:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit180M_3
//  299     
//  300     //½øÈëPBEÄ£Ê½    
//  301     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  302     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  303     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  304     
//  305     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  306     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit180M_4:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit180M_4
//  307     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//  308     
//  309     //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  310     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  311     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  312     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  313     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  314     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  315     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  316     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  317 }
        BX       LR               ;; return
//  318 
//  319 //ËøÏà»·ÆµÂÊÎª50/16*54=168.75M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  320 void pllinit168d75M(void)
//  321 {
//  322 	uint32_t temp_reg;
//  323         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  324     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  325                               | SIM_SCGC5_PORTB_MASK
//  326                               | SIM_SCGC5_PORTC_MASK
//  327                               | SIM_SCGC5_PORTD_MASK
//  328                               | SIM_SCGC5_PORTE_MASK );
pllinit168d75M:
        LDR.W    R0,??DataTable8  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.W    R1,??DataTable8  ;; 0x40048038
        STR      R0,[R1, #+0]
//  329     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  330     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  331     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  332     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  333     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  334     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.W    R0,??DataTable8_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable8_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  335     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.W    R0,??DataTable8_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable8_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  336     
//  337     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  338     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  339     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  340     
//  341     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  342     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  343     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit168d75M_0:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit168d75M_0
//  344     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit168d75M_1:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit168d75M_1
//  345     
//  346     //½øÈëFBEÄ£Ê½,
//  347     //0x18==25·ÖÆµ=2M,
//  348     //0x08==15·ÖÆµ=3.333M 
//  349     //0x09==16·ÖÆµ=3.125M,
//  350     //0x10==17·ÖÆµ=2.94M 
//  351     //0x11==18·ÖÆµ=2.7778M 
//  352     //0x12==19·ÖÆµ=2.63M,
//  353     //0x13==20·ÖÆµ=2.5M    
//  354     MCG_C5 = MCG_C5_PRDIV(0x0f);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+15
        STRB     R1,[R0, #+0]
//  355     
//  356     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  357     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  358     
//  359     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  360     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  361     
//  362     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  363     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  364                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  365                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  366     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  367     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  368     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  369                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  370     
//  371     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  372     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  373     
//  374     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  375     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(30);  //VDIV = 31 (x54)
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+94
        STRB     R1,[R0, #+0]
//  376                                                   //VDIV = 26 (x50)
//  377     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit168d75M_2:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit168d75M_2
//  378     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit168d75M_3:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit168d75M_3
//  379     
//  380     //½øÈëPBEÄ£Ê½    
//  381     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  382     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  383     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  384     
//  385     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  386     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit168d75M_4:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit168d75M_4
//  387     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//  388     
//  389     //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  390     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  391     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  392     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  393     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  394     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  395     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  396     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  397 }
        BX       LR               ;; return
//  398 //ËøÏà»·ÆµÂÊÎª50/18*54=150M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  399 void pllinit150M(void)
//  400 {
//  401 	uint32_t temp_reg;
//  402         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  403     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  404                               | SIM_SCGC5_PORTB_MASK
//  405                               | SIM_SCGC5_PORTC_MASK
//  406                               | SIM_SCGC5_PORTD_MASK
//  407                               | SIM_SCGC5_PORTE_MASK );
pllinit150M:
        LDR.W    R0,??DataTable8  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.W    R1,??DataTable8  ;; 0x40048038
        STR      R0,[R1, #+0]
//  408     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  409     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  410     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  411     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  412     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  413     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.W    R0,??DataTable8_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.W    R1,??DataTable8_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  414     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.W    R0,??DataTable8_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable8_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  415     
//  416     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  417     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  418     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  419     
//  420     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  421     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  422     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit150M_0:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit150M_0
//  423     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit150M_1:
        LDR.W    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit150M_1
//  424     
//  425     //½øÈëFBEÄ£Ê½,
//  426     //0x18==25·ÖÆµ=2M,
//  427     //0x11==18·ÖÆµ=2.7778M 
//  428     //0x12==19·ÖÆµ=2.63M,
//  429     //0x13==20·ÖÆµ=2.5M    
//  430     MCG_C5 = MCG_C5_PRDIV(0x11);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+17
        STRB     R1,[R0, #+0]
//  431     
//  432     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  433     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  434     
//  435     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  436     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  437     
//  438     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  439     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  440                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  441                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  442     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  443     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/8
//  444     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  445                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable11_1  ;; 0x1170000
        STR      R2,[R1, #+0]
//  446     
//  447     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  448     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  449     
//  450     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  451     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(30);  //VDIV = 31 (x54)
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+94
        STRB     R1,[R0, #+0]
//  452                                                   //VDIV = 26 (x50)
//  453     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit150M_2:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit150M_2
//  454     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit150M_3:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit150M_3
//  455     
//  456     //½øÈëPBEÄ£Ê½    
//  457     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  458     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  459     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  460     
//  461     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  462     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit150M_4:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit150M_4
//  463     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//  464     
//  465     //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  466     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  467     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  468     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  469     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  470     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  471     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  472     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  473 }
        BX       LR               ;; return
//  474 //ËøÏà»·ÆµÂÊÎª50/19*55=144.7386421M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  475 void pllinit144M(void)
//  476 {
//  477 	uint32_t temp_reg;
//  478         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  479     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  480                               | SIM_SCGC5_PORTB_MASK
//  481                               | SIM_SCGC5_PORTC_MASK
//  482                               | SIM_SCGC5_PORTD_MASK
//  483                               | SIM_SCGC5_PORTE_MASK );
pllinit144M:
        LDR.N    R0,??DataTable8  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable8  ;; 0x40048038
        STR      R0,[R1, #+0]
//  484     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  485     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  486     MCG_C2 = 0;  
        LDR.N    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  487     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  488     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  489     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R0,??DataTable8_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable8_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  490     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R0,??DataTable8_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable8_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  491     
//  492     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  493     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  494     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  495     
//  496     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  497     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  498     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit144M_0:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit144M_0
//  499     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit144M_1:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit144M_1
//  500     
//  501     //½øÈëFBEÄ£Ê½,
//  502     //0x18==25·ÖÆµ=2M,
//  503     //0x11==18·ÖÆµ=2.7778M 
//  504     //0x12==19·ÖÆµ=2.63M,
//  505     //0x13==20·ÖÆµ=2.5M    
//  506     MCG_C5 = MCG_C5_PRDIV(0x12);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+18
        STRB     R1,[R0, #+0]
//  507     
//  508     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  509     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  510     
//  511     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  512     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  513     
//  514     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  515     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  516                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  517                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  518     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  519     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/6
//  520     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  521                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(5);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable11_2  ;; 0x1150000
        STR      R2,[R1, #+0]
//  522     
//  523     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  524     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  525     
//  526     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  527     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(31);  //VDIV = 31 (x55)
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+95
        STRB     R1,[R0, #+0]
//  528                                                   //VDIV = 26 (x50)
//  529     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit144M_2:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit144M_2
//  530     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit144M_3:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit144M_3
//  531     
//  532     //½øÈëPBEÄ£Ê½    
//  533     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  534     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  535     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  536     
//  537     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  538     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit144M_4:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit144M_4
//  539     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//  540     
//  541     //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  542     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  543     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  544     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  545     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  546     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  547     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  548     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  549 }
        BX       LR               ;; return
//  550 //ËøÏà»·ÆµÂÊÎª137.5M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  551 void pllinit1375M(void)
//  552 {
//  553 	uint32_t temp_reg;
//  554         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  555     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  556                               | SIM_SCGC5_PORTB_MASK
//  557                               | SIM_SCGC5_PORTC_MASK
//  558                               | SIM_SCGC5_PORTD_MASK
//  559                               | SIM_SCGC5_PORTE_MASK );
pllinit1375M:
        LDR.N    R0,??DataTable8  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable8  ;; 0x40048038
        STR      R0,[R1, #+0]
//  560     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  561     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  562     MCG_C2 = 0;  
        LDR.N    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  563     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  564     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  565     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R0,??DataTable8_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable8_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  566     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R0,??DataTable8_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable8_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  567     
//  568     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  569     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  570     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  571     
//  572     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  573     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  574     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit1375M_0:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit1375M_0
//  575     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit1375M_1:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit1375M_1
//  576     
//  577     //½øÈëFBEÄ£Ê½,
//  578     //0x18==25·ÖÆµ=2M,
//  579     //0x11==18·ÖÆµ=2.7778M 
//  580     //0x12==19·ÖÆµ=2.63M,
//  581     //0x13==20·ÖÆµ=2.5M    
//  582     MCG_C5 = MCG_C5_PRDIV(0x13);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  583     
//  584     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  585     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  586     
//  587     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  588     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  589     
//  590     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  591     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  592                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  593                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  594     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  595     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/6
//  596     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  597                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(5);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable11_2  ;; 0x1150000
        STR      R2,[R1, #+0]
//  598     
//  599     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  600     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  601     
//  602     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  603     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(31);  //VDIV = 31 (x55)
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+95
        STRB     R1,[R0, #+0]
//  604                                                   //VDIV = 26 (x50)
//  605     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit1375M_2:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit1375M_2
//  606     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit1375M_3:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit1375M_3
//  607     
//  608     //½øÈëPBEÄ£Ê½    
//  609     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  610     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  611     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  612     
//  613     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  614     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit1375M_4:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit1375M_4
//  615     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//  616     
//  617     //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  618     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  619     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  620     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  621     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  622     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  623     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  624     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  625 }
        BX       LR               ;; return
//  626 //ËøÏà»·ÆµÂÊÎª125M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  627 void pllinit125M(void)
//  628 {
//  629 	uint32_t temp_reg;
//  630         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  631     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  632                               | SIM_SCGC5_PORTB_MASK
//  633                               | SIM_SCGC5_PORTC_MASK
//  634                               | SIM_SCGC5_PORTD_MASK
//  635                               | SIM_SCGC5_PORTE_MASK );
pllinit125M:
        LDR.N    R0,??DataTable8  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable8  ;; 0x40048038
        STR      R0,[R1, #+0]
//  636     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  637     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  638     MCG_C2 = 0;  
        LDR.N    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  639     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  640     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  641     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R0,??DataTable8_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable8_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  642     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R0,??DataTable8_3  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable8_3  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  643     
//  644     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  645     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  646     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  647     
//  648     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  649     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  650     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit125M_0:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit125M_0
//  651     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit125M_1:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit125M_1
//  652     
//  653     //½øÈëFBEÄ£Ê½,
//  654     //0x18==25·ÖÆµ=2M,
//  655     //0x11==18·ÖÆµ=2.7778M 
//  656     //0x12==19·ÖÆµ=2.63M,
//  657     //0x13==20·ÖÆµ=2.5M    
//  658     MCG_C5 = MCG_C5_PRDIV(0x13);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  659     
//  660     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  661     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  662     
//  663     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  664     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  665     
//  666     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  667     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  668                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  669                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  670     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  671     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/6
//  672     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  673                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(5);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.N    R2,??DataTable11_2  ;; 0x1150000
        STR      R2,[R1, #+0]
//  674     
//  675     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  676     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  677     
//  678     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  679     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(26);  //VDIV = 31 (x55)
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+90
        STRB     R1,[R0, #+0]
//  680                                                   //VDIV = 26 (x50)
//  681     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit125M_2:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit125M_2
//  682     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit125M_3:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit125M_3
//  683     
//  684     //½øÈëPBEÄ£Ê½    
//  685     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  686     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  687     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  688     
//  689     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  690     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit125M_4:
        LDR.N    R0,??DataTable8_5  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit125M_4
//  691     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1); 
//  692     
//  693         //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  694     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  695     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  696     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  697     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  698     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  699     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  700     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  701 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     0x4007c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     0x4001f000
//  702 
//  703 //ËøÏà»·ÆµÂÊÎª100M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  704 void pllinit100M(void)
//  705 {
//  706 	uint32_t temp_reg;
//  707         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  708     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  709                               | SIM_SCGC5_PORTB_MASK
//  710                               | SIM_SCGC5_PORTC_MASK
//  711                               | SIM_SCGC5_PORTD_MASK
//  712                               | SIM_SCGC5_PORTE_MASK );
pllinit100M:
        LDR.N    R0,??DataTable11_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable11_3  ;; 0x40048038
        STR      R0,[R1, #+0]
//  713     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  714     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  715     MCG_C2 = 0;  
        LDR.N    R0,??DataTable11_4  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  716     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  717     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  718     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R0,??DataTable11_5  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable11_5  ;; 0x40048034
        STR      R0,[R1, #+0]
//  719     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R0,??DataTable11_6  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable11_6  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  720     
//  721     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  722     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  723     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  724     
//  725     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  726     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  727     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit100M_0:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit100M_0
//  728     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit100M_1:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit100M_1
//  729     
//  730     //½øÈëFBEÄ£Ê½,
//  731     //0x18==25·ÖÆµ=2M,
//  732     //0x11==18·ÖÆµ=2.7778M 
//  733     //0x12==19·ÖÆµ=2.63M,
//  734     //0x13==20·ÖÆµ=2.5M    
//  735     MCG_C5 = MCG_C5_PRDIV(0x18);                
        LDR.N    R0,??DataTable11_9  ;; 0x40064004
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  736     
//  737     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  738     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  739     
//  740     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  741     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable11_11  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  742     
//  743     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  744     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  745                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  746                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable11_11  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  747     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  748     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  749     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  750                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(3);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.N    R2,??DataTable11_12  ;; 0x1130000
        STR      R2,[R1, #+0]
//  751     
//  752     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  753     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  754     
//  755     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  756     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(26);  //VDIV = 31 (x55)
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+90
        STRB     R1,[R0, #+0]
//  757                                                   //VDIV = 26 (x50)
//  758     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit100M_2:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit100M_2
//  759     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit100M_3:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit100M_3
//  760     
//  761     //½øÈëPBEÄ£Ê½    
//  762     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  763     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  764     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable11_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  765     
//  766     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  767     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit100M_4:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit100M_4
//  768     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//  769     
//  770         //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  771     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  772     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  773     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  774     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  775     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  776     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  777     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  778 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_2:
        DC32     0x40049018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_3:
        DC32     0x40048040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_4:
        DC32     0x2270000
//  779 
//  780 //ËøÏà»·ÆµÂÊÎª80M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  781 void pllinit80M(void)
//  782 {
//  783 	uint32_t temp_reg;
//  784         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  785     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  786                               | SIM_SCGC5_PORTB_MASK
//  787                               | SIM_SCGC5_PORTC_MASK
//  788                               | SIM_SCGC5_PORTD_MASK
//  789                               | SIM_SCGC5_PORTE_MASK );
pllinit80M:
        LDR.N    R0,??DataTable11_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable11_3  ;; 0x40048038
        STR      R0,[R1, #+0]
//  790     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  791     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  792     MCG_C2 = 0;  
        LDR.N    R0,??DataTable11_4  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  793     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  794     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  795     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R0,??DataTable11_5  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable11_5  ;; 0x40048034
        STR      R0,[R1, #+0]
//  796     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R0,??DataTable11_6  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable11_6  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  797     
//  798     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  799     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  800     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  801     
//  802     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  803     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  804     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit80M_0:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit80M_0
//  805     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit80M_1:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit80M_1
//  806     
//  807     //½øÈëFBEÄ£Ê½,
//  808     //0x18==25·ÖÆµ=2M,
//  809     //0x11==18·ÖÆµ=2.7778M 
//  810     //0x12==19·ÖÆµ=2.63M,
//  811     //0x13==20·ÖÆµ=2.5M    
//  812     MCG_C5 = MCG_C5_PRDIV(0x18);                
        LDR.N    R0,??DataTable11_9  ;; 0x40064004
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  813     
//  814     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  815     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  816     
//  817     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  818     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable11_11  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  819     
//  820     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  821     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  822                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  823                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable11_11  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  824     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  825     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  826     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  827                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(3);       
        LDR.N    R1,??DataTable11_13  ;; 0x40048044
        LDR.N    R2,??DataTable11_12  ;; 0x1130000
        STR      R2,[R1, #+0]
//  828     
//  829     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  830     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  831     
//  832     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  833     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(16);  //VDIV = 31 (x55)
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+80
        STRB     R1,[R0, #+0]
//  834                                                   //VDIV = 26 (x50)
//  835 												  //VDIV = 16 (x40)
//  836     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit80M_2:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit80M_2
//  837     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit80M_3:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit80M_3
//  838     
//  839     //½øÈëPBEÄ£Ê½    
//  840     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  841     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  842     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable11_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  843     
//  844     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  845     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit80M_4:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit80M_4
//  846     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);    
//  847     
//  848         //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  849     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable11_14  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable11_14  ;; 0x40048004
        STR      R0,[R1, #+0]
//  850     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  851     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable11_15  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  852     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  853     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable11_16  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable11_16  ;; 0x40048040
        STR      R0,[R1, #+0]
//  854     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  855     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  856 }
        BX       LR               ;; return
//  857 
//  858 //ËøÏà»·ÆµÂÊÎª60M²âÊÔº¯Êý

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  859 void pllinit60M(void)
//  860 {
//  861 	uint32_t temp_reg;
//  862         //Ê¹ÄÜIO¶Ë¿ÚÊ±ÖÓ    
//  863     SIM_SCGC5 |= (SIM_SCGC5_PORTA_MASK
//  864                               | SIM_SCGC5_PORTB_MASK
//  865                               | SIM_SCGC5_PORTC_MASK
//  866                               | SIM_SCGC5_PORTD_MASK
//  867                               | SIM_SCGC5_PORTE_MASK );
pllinit60M:
        LDR.N    R0,??DataTable11_3  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.N    R1,??DataTable11_3  ;; 0x40048038
        STR      R0,[R1, #+0]
//  868     //ÕâÀï´¦ÔÚÄ¬ÈÏµÄFEIÄ£Ê½
//  869     //Ê×ÏÈÒÆ¶¯µ½FBEÄ£Ê½
//  870     MCG_C2 = 0;  
        LDR.N    R0,??DataTable11_4  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  871     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  872     //³õÊ¼»¯¾§ÕñºóÊÍ·ÅËø¶¨×´Ì¬µÄÕñµ´Æ÷ºÍGPIO
//  873     SIM_SCGC4 |= SIM_SCGC4_LLWU_MASK;
        LDR.N    R0,??DataTable11_5  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10000000
        LDR.N    R1,??DataTable11_5  ;; 0x40048034
        STR      R0,[R1, #+0]
//  874     LLWU_CS |= LLWU_CS_ACKISO_MASK;
        LDR.N    R0,??DataTable11_6  ;; 0x4007c008
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable11_6  ;; 0x4007c008
        STRB     R0,[R1, #+0]
//  875     
//  876     //Ñ¡ÔñÍâ²¿¾§Õñ£¬²Î¿¼·ÖÆµÆ÷£¬ÇåIREFSÀ´Æô¶¯Íâ²¿¾§Õñ
//  877     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  878     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  879     
//  880     //µÈ´ý¾§ÕñÎÈ¶¨	    
//  881     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //µÈ´ýËøÏà»·³õÊ¼»¯½áÊø
//  882     while (MCG_S & MCG_S_IREFST_MASK){}                  //µÈ´ýÊ±ÖÓÇÐ»»µ½Íâ²¿²Î¿¼Ê±ÖÓ
??pllinit60M_0:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BMI.N    ??pllinit60M_0
//  883     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x2){}
??pllinit60M_1:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??pllinit60M_1
//  884     
//  885     //½øÈëFBEÄ£Ê½,
//  886     //0x18==25·ÖÆµ=2M,
//  887     //0x11==18·ÖÆµ=2.7778M 
//  888     //0x12==19·ÖÆµ=2.63M,
//  889     //0x13==20·ÖÆµ=2.5M    
//  890     MCG_C5 = MCG_C5_PRDIV(0x18);                
        LDR.N    R0,??DataTable11_9  ;; 0x40064004
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  891     
//  892     //È·±£MCG_C6´¦ÓÚ¸´Î»×´Ì¬£¬½ûÖ¹LOLIE¡¢PLL¡¢ºÍÊ±ÖÓ¿ØÖÆÆ÷£¬ÇåPLL VCO·ÖÆµÆ÷
//  893     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  894     
//  895     //±£´æFMC_PFAPRµ±Ç°µÄÖµ
//  896     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable11_11  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  897     
//  898     //Í¨¹ýM&PFDÖÃÎ»M0PFDÀ´½ûÖ¹Ô¤È¡¹¦ÄÜ
//  899     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  900                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  901                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable11_11  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  902     ///ÉèÖÃÏµÍ³·ÖÆµÆ÷
//  903     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  904     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  905                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(3);       
        LDR.N    R1,??DataTable11_13  ;; 0x40048044
        LDR.N    R2,??DataTable11_12  ;; 0x1130000
        STR      R2,[R1, #+0]
//  906     
//  907     //´ÓÐÂ´æFMC_PFAPRµÄÔ­Ê¼Öµ
//  908     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  909     
//  910     //ÉèÖÃVCO·ÖÆµÆ÷£¬Ê¹ÄÜPLLÎª100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
//  911     MCG_C6 = MCG_C6_PLLS_MASK | MCG_C6_VDIV(6);  //VDIV = 31 (x55)
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+70
        STRB     R1,[R0, #+0]
//  912                                                   //VDIV = 26 (x50)
//  913 												  //VDIV = 6 (x30)
//  914     while (!(MCG_S & MCG_S_PLLST_MASK)){}; // wait for PLL status bit to set    
??pllinit60M_2:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??pllinit60M_2
//  915     while (!(MCG_S & MCG_S_LOCK_MASK)){}; // Wait for LOCK bit to set    
??pllinit60M_3:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??pllinit60M_3
//  916     
//  917     //½øÈëPBEÄ£Ê½    
//  918     //Í¨¹ýÇåÁãCLKSÎ»À´½øÈëPEEÄ£Ê½
//  919     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  920     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable11_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  921     
//  922     //µÈ´ýÊ±ÖÓ×´Ì¬Î»¸üÐÂ
//  923     while (((MCG_S & MCG_S_CLKST_MASK) >> MCG_S_CLKST_SHIFT) != 0x3){};
??pllinit60M_4:
        LDR.N    R0,??DataTable11_8  ;; 0x40064006
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BNE.N    ??pllinit60M_4
//  924     //SIM_CLKDIV2 |= SIM_CLKDIV2_USBDIV(1);  
//  925     
//  926         //ÉèÖÃ¸ú×ÙÊ±ÖÓÎªÄÚºËÊ±ÖÓ
//  927     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable11_14  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable11_14  ;; 0x40048004
        STR      R0,[R1, #+0]
//  928     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜTRACE_CLKOU¹¦ÄÜ
//  929     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable11_15  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  930     //Ê¹ÄÜFlexBusÄ£¿éÊ±ÖÓ
//  931     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable11_16  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable11_16  ;; 0x40048040
        STR      R0,[R1, #+0]
//  932     //ÔÚPTA6Òý½ÅÉÏÊ¹ÄÜFB_CLKOUT¹¦ÄÜ
//  933     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  934 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0x1170000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0x1150000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     0x4007c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_11:
        DC32     0x4001f000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_12:
        DC32     0x1130000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_13:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_14:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_15:
        DC32     0x40049018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_16:
        DC32     0x40048040

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
// 2 844 bytes in section .text
// 
// 2 844 bytes of CODE memory
//
//Errors: none
//Warnings: none
