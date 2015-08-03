///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:16 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\uart.c                /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\uart.c" -D IAR -D    /
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
//                    (¸ÄI2C)\bin\Flash\List\uart.s                           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME uart

        #define SHT_PROGBITS 0x1

        EXTERN disable_irq
        EXTERN enable_irq

        PUBLIC Asc_send
        PUBLIC Send_Enter
        PUBLIC disableuartreint
        PUBLIC enableuartreint
        PUBLIC uart_init
        PUBLIC uart_re1
        PUBLIC uart_reN
        PUBLIC uart_send1
        PUBLIC uart_sendN

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\uart.c
//    1 //-------------------------------------------------------------------------*
//    2 // ÎÄ¼þÃû: uart.c                                                          *
//    3 // Ëµ  Ã÷: uart¹¹¼þÔ´ÎÄ¼þ                                                  *
//    4 //-------------------------------------------------------------------------*
//    5 
//    6 #include "uart.h"
//    7 
//    8 //-------------------------------------------------------------------------*
//    9 //º¯ÊýÃû: uart_init                                                        *
//   10 //¹¦  ÄÜ: ³õÊ¼»¯uartxÄ£¿é¡£                                                *
//   11 //²Î  Êý: uartch:´®¿ÚºÅ                                                    *
//   12 //        sysclk:ÏµÍ³×ÜÏßÊ±ÖÓ£¬ÒÔMHzÎªµ¥Î»                                 *
//   13 //        baud:²¨ÌØÂÊ£¬Èç9600£¬38400µÈ£¬Ò»°ãÀ´Ëµ£¬ËÙ¶ÈÔ½Âý£¬Í¨ÐÅÔ½ÎÈ       *
//   14 //·µ  »Ø: ÎÞ                                                               *
//   15 //Ëµ  Ã÷:                                                                  *
//   16 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   17 void uart_init (UART_MemMapPtr uartch, uint32 sysclk, uint32 baud)
//   18 {
uart_init:
        PUSH     {R4,R5}
//   19 	register uint16 sbr, brfa;
//   20 	uint8 temp;
//   21 
//   22 	//Ê¹ÄÜÒý½Å
//   23 	if (uartch == UART0_BASE_PTR)
        LDR.W    R3,??DataTable2  ;; 0x4006a000
        CMP      R0,R3
        BNE.N    ??uart_init_0
//   24 	{
//   25 		//ÔÚPTD6ÉÏÊ¹ÄÜUART0_TXD¹¦ÄÜ
//   26 		PORTD_PCR6 = PORT_PCR_MUX(0x3);
        LDR.W    R3,??DataTable2_1  ;; 0x4004c018
        MOV      R4,#+768
        STR      R4,[R3, #+0]
//   27 		//ÔÚPTD7ÉÏÊ¹ÄÜUART0_RXD
//   28 		PORTD_PCR7 = PORT_PCR_MUX(0x3); 
        LDR.W    R3,??DataTable2_2  ;; 0x4004c01c
        MOV      R4,#+768
        STR      R4,[R3, #+0]
        B.N      ??uart_init_1
//   29 	}else if (uartch == UART1_BASE_PTR)
??uart_init_0:
        LDR.W    R3,??DataTable2_3  ;; 0x4006b000
        CMP      R0,R3
        BNE.N    ??uart_init_2
//   30 	{
//   31 		//ÔÚPTC4ÉÏÊ¹ÄÜUART1_TXD¹¦ÄÜ
//   32 		PORTC_PCR4 = PORT_PCR_MUX(0x3); 
        LDR.W    R3,??DataTable2_4  ;; 0x4004b010
        MOV      R4,#+768
        STR      R4,[R3, #+0]
//   33 		
//   34 		//ÔÚPTC3ÉÏÊ¹ÄÜUART1_RXD
//   35 		PORTC_PCR3 = PORT_PCR_MUX(0x3); 
        LDR.W    R3,??DataTable2_5  ;; 0x4004b00c
        MOV      R4,#+768
        STR      R4,[R3, #+0]
        B.N      ??uart_init_1
//   36 	}else if (uartch == UART2_BASE_PTR)
??uart_init_2:
        LDR.W    R3,??DataTable2_6  ;; 0x4006c000
        CMP      R0,R3
        BNE.N    ??uart_init_3
//   37 	{
//   38 		//ÔÚPTD3ÉÏÊ¹ÄÜUART2_TXD¹¦ÄÜ
//   39 		PORTD_PCR3 = PORT_PCR_MUX(0x3); 
        LDR.W    R3,??DataTable2_7  ;; 0x4004c00c
        MOV      R4,#+768
        STR      R4,[R3, #+0]
//   40 		//ÔÚPTD2ÉÏÊ¹ÄÜUART2_RXD
//   41 		PORTD_PCR2 = PORT_PCR_MUX(0x3); 
        LDR.N    R3,??DataTable2_8  ;; 0x4004c008
        MOV      R4,#+768
        STR      R4,[R3, #+0]
        B.N      ??uart_init_1
//   42 	}else if (uartch == UART3_BASE_PTR)
??uart_init_3:
        LDR.N    R3,??DataTable2_9  ;; 0x4006d000
        CMP      R0,R3
        BNE.N    ??uart_init_4
//   43 	{
//   44 		//ÔÚPTC17ÉÏÊ¹ÄÜUART3_TXD¹¦ÄÜ
//   45 		PORTC_PCR17 = PORT_PCR_MUX(0x3); 
        LDR.N    R3,??DataTable2_10  ;; 0x4004b044
        MOV      R4,#+768
        STR      R4,[R3, #+0]
//   46 		//ÔÚPTC16ÉÏÊ¹ÄÜUART3_RXD
//   47 		PORTC_PCR16 = PORT_PCR_MUX(0x3); 
        LDR.N    R3,??DataTable2_11  ;; 0x4004b040
        MOV      R4,#+768
        STR      R4,[R3, #+0]
        B.N      ??uart_init_1
//   48 	}else if (uartch == UART4_BASE_PTR)
??uart_init_4:
        LDR.N    R3,??DataTable2_12  ;; 0x400ea000
        CMP      R0,R3
        BNE.N    ??uart_init_5
//   49 	{
//   50 		//ÔÚPTE24ÉÏÊ¹ÄÜUART4_TXD¹¦ÄÜ
//   51 		PORTE_PCR24 = PORT_PCR_MUX(0x3); 
        LDR.N    R3,??DataTable2_13  ;; 0x4004d060
        MOV      R4,#+768
        STR      R4,[R3, #+0]
//   52 		//ÔÚPTE25ÉÏÊ¹ÄÜUART4_RXD
//   53 		PORTE_PCR25 = PORT_PCR_MUX(0x3); 
        LDR.N    R3,??DataTable2_14  ;; 0x4004d064
        MOV      R4,#+768
        STR      R4,[R3, #+0]
        B.N      ??uart_init_1
//   54 	}else if (uartch == UART5_BASE_PTR)
??uart_init_5:
        LDR.N    R3,??DataTable2_15  ;; 0x400eb000
        CMP      R0,R3
        BNE.N    ??uart_init_1
//   55 	{
//   56 		//ÔÚPTE8ÉÏÊ¹ÄÜUART5_TXD¹¦ÄÜ
//   57 		PORTE_PCR8 = PORT_PCR_MUX(0x3); 
        LDR.N    R3,??DataTable2_16  ;; 0x4004d020
        MOV      R4,#+768
        STR      R4,[R3, #+0]
//   58 		//ÔÚPTE9ÉÏÊ¹ÄÜUART5_RXD
//   59 		PORTE_PCR9 = PORT_PCR_MUX(0x3); 
        LDR.N    R3,??DataTable2_17  ;; 0x4004d024
        MOV      R4,#+768
        STR      R4,[R3, #+0]
//   60 	}
//   61 	 
//   62 	//Ê¹ÄÜ´®¿ÚÊ±ÖÓ    
//   63 	if(uartch == UART0_BASE_PTR)
??uart_init_1:
        LDR.N    R3,??DataTable2  ;; 0x4006a000
        CMP      R0,R3
        BNE.N    ??uart_init_6
//   64 		SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;
        LDR.N    R3,??DataTable2_18  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x400
        LDR.N    R4,??DataTable2_18  ;; 0x40048034
        STR      R3,[R4, #+0]
        B.N      ??uart_init_7
//   65 	else
//   66 		if (uartch == UART1_BASE_PTR)
??uart_init_6:
        LDR.N    R3,??DataTable2_3  ;; 0x4006b000
        CMP      R0,R3
        BNE.N    ??uart_init_8
//   67 			SIM_SCGC4 |= SIM_SCGC4_UART1_MASK;
        LDR.N    R3,??DataTable2_18  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.N    R4,??DataTable2_18  ;; 0x40048034
        STR      R3,[R4, #+0]
        B.N      ??uart_init_7
//   68 		else
//   69 			if (uartch == UART2_BASE_PTR)
??uart_init_8:
        LDR.N    R3,??DataTable2_6  ;; 0x4006c000
        CMP      R0,R3
        BNE.N    ??uart_init_9
//   70 				SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;
        LDR.N    R3,??DataTable2_18  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x1000
        LDR.N    R4,??DataTable2_18  ;; 0x40048034
        STR      R3,[R4, #+0]
        B.N      ??uart_init_7
//   71 			else
//   72 				if(uartch == UART3_BASE_PTR)
??uart_init_9:
        LDR.N    R3,??DataTable2_9  ;; 0x4006d000
        CMP      R0,R3
        BNE.N    ??uart_init_10
//   73 					SIM_SCGC4 |= SIM_SCGC4_UART3_MASK;
        LDR.N    R3,??DataTable2_18  ;; 0x40048034
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x2000
        LDR.N    R4,??DataTable2_18  ;; 0x40048034
        STR      R3,[R4, #+0]
        B.N      ??uart_init_7
//   74 				else
//   75 					if(uartch == UART4_BASE_PTR)
??uart_init_10:
        LDR.N    R3,??DataTable2_12  ;; 0x400ea000
        CMP      R0,R3
        BNE.N    ??uart_init_11
//   76 						SIM_SCGC1 |= SIM_SCGC1_UART4_MASK;
        LDR.N    R3,??DataTable2_19  ;; 0x40048028
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x400
        LDR.N    R4,??DataTable2_19  ;; 0x40048028
        STR      R3,[R4, #+0]
        B.N      ??uart_init_7
//   77 					else
//   78 						SIM_SCGC1 |= SIM_SCGC1_UART5_MASK;
??uart_init_11:
        LDR.N    R3,??DataTable2_19  ;; 0x40048028
        LDR      R3,[R3, #+0]
        ORRS     R3,R3,#0x800
        LDR.N    R4,??DataTable2_19  ;; 0x40048028
        STR      R3,[R4, #+0]
//   79 								
//   80 	//½ûÖ¹·¢ËÍ½ÓÊÜ
//   81 	UART_C2_REG(uartch) &= ~(UART_C2_TE_MASK
//   82 				| UART_C2_RE_MASK );
??uart_init_7:
        LDRB     R3,[R0, #+3]
        ANDS     R3,R3,#0xF3
        STRB     R3,[R0, #+3]
//   83 	
//   84 	//ÅäÖÃ³É8Î»ÎÞÐ£ÑéÄ£Ê½
//   85 	UART_C1_REG(uartch) = 0;
        MOVS     R3,#+0
        STRB     R3,[R0, #+2]
//   86 	
//   87 	//¼ÆËã²¨ÌØÂÊ£¬´®¿Ú0¡¢1Ê¹ÓÃÄÚºËÊ±ÖÓ£¬ÆäËü´®¿ÚÊ¹ÓÃÍâÉèÊ±ÖÓ£¬ÏµÍ³Ê±ÖÓÎª
//   88 	//ÍâÉèÊ±ÖÓµÄ2±¶
//   89 	if ((uartch == UART0_BASE_PTR) | (uartch == UART1_BASE_PTR))//
        LDR.N    R3,??DataTable2  ;; 0x4006a000
        CMP      R0,R3
        BNE.N    ??uart_init_12
        MOVS     R3,#+1
        B.N      ??uart_init_13
??uart_init_12:
        MOVS     R3,#+0
??uart_init_13:
        LDR.N    R4,??DataTable2_3  ;; 0x4006b000
        CMP      R0,R4
        BNE.N    ??uart_init_14
        MOVS     R4,#+1
        B.N      ??uart_init_15
??uart_init_14:
        MOVS     R4,#+0
??uart_init_15:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ORRS     R3,R4,R3
        CMP      R3,#+0
        BEQ.N    ??uart_init_16
//   90 		sysclk+=sysclk;
        ADDS     R1,R1,R1
//   91 	
//   92 	sbr = (uint16)((sysclk*1000)/(baud * 16));
??uart_init_16:
        MOV      R3,#+1000
        MUL      R3,R3,R1
        LSLS     R4,R2,#+4
        UDIV     R3,R3,R4
//   93 	temp = UART_BDH_REG(uartch) & ~(UART_BDH_SBR(0x1F));
        LDRB     R4,[R0, #+0]
        ANDS     R4,R4,#0xE0
//   94 	UART_BDH_REG(uartch) = temp |  UART_BDH_SBR(((sbr & 0x1F00) >> 8));
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LSRS     R5,R3,#+8
        ANDS     R5,R5,#0x1F
        ORRS     R4,R5,R4
        STRB     R4,[R0, #+0]
//   95 	UART_BDL_REG(uartch) = (uint8)(sbr & UART_BDL_SBR_MASK);
        STRB     R3,[R0, #+1]
//   96 	brfa = (((sysclk*32000)/(baud * 16)) - (sbr * 32));
        MOV      R4,#+32000
        MULS     R1,R4,R1
        LSLS     R2,R2,#+4
        UDIV     R1,R1,R2
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        SUBS     R1,R1,R3, LSL #+5
//   97 	temp = UART_C4_REG(uartch) & ~(UART_C4_BRFA(0x1F));
        LDRB     R2,[R0, #+10]
        ANDS     R4,R2,#0xE0
//   98 	UART_C4_REG(uartch) = temp |  UART_C4_BRFA(brfa);    
        ANDS     R1,R1,#0x1F
        ORRS     R1,R1,R4
        STRB     R1,[R0, #+10]
//   99 	
//  100 	//Ê¹ÄÜ·¢ËÍ½ÓÊÜ
//  101 	UART_C2_REG(uartch) |= (UART_C2_TE_MASK
//  102 				| UART_C2_RE_MASK );
        LDRB     R1,[R0, #+3]
        ORRS     R1,R1,#0xC
        STRB     R1,[R0, #+3]
//  103 }
        POP      {R4,R5}
        BX       LR               ;; return
//  104 
//  105 //-------------------------------------------------------------------------*
//  106 //º¯ÊýÃû: uart_re1                                                         *
//  107 //¹¦  ÄÜ: ´®ÐÐ½ÓÊÜ1¸ö×Ö½Ú                                                  *
//  108 //²Î  Êý: uartch: ´®¿ÚºÅ                                                   *
//  109 //         ch:    ½ÓÊÕµ½µÄ×Ö½Ú                                             *
//  110 //·µ  »Ø: ³É¹¦:1;Ê§°Ü:0                                                    *
//  111 //Ëµ  Ã÷:                                                                  *
//  112 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  113 uint8 uart_re1 (UART_MemMapPtr uartch,uint8 *ch)
//  114 {
//  115     uint32 k;
//  116     
//  117     for (k = 0; k < 0xfbbb; k++)//ÓÐÊ±¼äÏÞÖÆ
uart_re1:
        MOVS     R2,#+0
        B.N      ??uart_re1_0
??uart_re1_1:
        ADDS     R2,R2,#+1
??uart_re1_0:
        MOVW     R3,#+64443
        CMP      R2,R3
        BCS.N    ??uart_re1_2
//  118 		if((UART_S1_REG(uartch) & UART_S1_RDRF_MASK)!= 0)//ÅÐ¶Ï½ÓÊÕ»º³åÇøÊÇ·ñÂú
        LDRB     R3,[R0, #+4]
        LSLS     R3,R3,#+26
        BPL.N    ??uart_re1_1
//  119 		{
//  120 			*ch = UART_D_REG(uartch);
        LDRB     R0,[R0, #+7]
        STRB     R0,[R1, #+0]
//  121 			return 1; 			//½ÓÊÜ³É¹¦
        MOVS     R0,#+1
        B.N      ??uart_re1_3
//  122 		} 
//  123 	if(k>=0xfbbb) 
??uart_re1_2:
        MOVW     R0,#+64443
        CMP      R2,R0
        BCC.N    ??uart_re1_4
//  124 	{
//  125 		return 0;			//½ÓÊÜÊ§°Ü
        MOVS     R0,#+0
        B.N      ??uart_re1_3
//  126 	} 
//  127     return 0;
??uart_re1_4:
        MOVS     R0,#+0
??uart_re1_3:
        BX       LR               ;; return
//  128 }
//  129 
//  130 //-------------------------------------------------------------------------*
//  131 //º¯ÊýÃû: uart_send1                                                       *
//  132 //¹¦  ÄÜ: ´®ÐÐ·¢ËÍ1¸ö×Ö½Ú                                                  *
//  133 //²Î  Êý: uartch: ´®¿ÚºÅ                                                   *
//  134 //         ch:    Òª·¢ËÍµÄ×Ö½Ú                                             *
//  135 //·µ  »Ø: ÎÞ                                                               *
//  136 //Ëµ  Ã÷:                                                                  *
//  137 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  138 void uart_send1 (UART_MemMapPtr uartch, uint8 ch)
//  139 {
//  140     //µÈ´ý·¢ËÍ»º³åÇø¿Õ
//  141     while(!(UART_S1_REG(uartch) & UART_S1_TDRE_MASK));
uart_send1:
??uart_send1_0:
        LDRB     R2,[R0, #+4]
        LSLS     R2,R2,#+24
        BPL.N    ??uart_send1_0
//  142     //·¢ËÍÊý¾Ý
//  143     UART_D_REG(uartch) = (uint8)ch;
        STRB     R1,[R0, #+7]
//  144  }
        BX       LR               ;; return
//  145 
//  146 //-------------------------------------------------------------------------*
//  147 //º¯ÊýÃû: uart_reN                                                         *
//  148 //¹¦  ÄÜ: ´®ÐÐ ½ÓÊÕn¸ö×Ö½Ú                                                 *
//  149 //²Î  Êý: uartch: ´®¿ÚºÅ                                                   *
//  150 //        buff: ½ÓÊÕ»º³åÇø                                                 *
//  151 //		  len:½ÓÊÕ³¤¶È                                             *
//  152 //·µ  »Ø: 1:³É¹¦;0:Ê§°Ü                                                    *
//  153 //Ëµ  Ã÷:                                                                  *
//  154 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  155 uint8 uart_reN (UART_MemMapPtr uartch ,uint8* buff,uint16 len)
//  156 {
uart_reN:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  157     uint16 m=0; 
        MOVS     R7,#+0
        B.N      ??uart_reN_0
//  158     while (m < len)
//  159     { 	          
//  160   	    if(0==uart_re1(uartch,&buff[m]))
//  161   	    	return 0;  //½ÓÊÕÊ§°Ü
//  162   	    else m++;
??uart_reN_1:
        ADDS     R7,R7,#+1
??uart_reN_0:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R7,R6
        BCS.N    ??uart_reN_2
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R1,R7,R5
        MOVS     R0,R4
        BL       uart_re1
        CMP      R0,#+0
        BNE.N    ??uart_reN_1
        MOVS     R0,#+0
        B.N      ??uart_reN_3
//  163     } 
//  164     
//  165     return 1;          //½ÓÊÕ³É¹¦
??uart_reN_2:
        MOVS     R0,#+1
??uart_reN_3:
        POP      {R1,R4-R7,PC}    ;; return
//  166     
//  167 }
//  168 
//  169 //-------------------------------------------------------------------------*
//  170 //º¯ÊýÃû: uart_sendN                                                       *
//  171 //¹¦  ÄÜ: ´®ÐÐ ½ÓÊÕn¸ö×Ö½Ú                                                 *
//  172 //²Î  Êý: uartch: ´®¿ÚºÅ                                                   *
//  173 //        buff: ·¢ËÍ»º³åÇø                                                 *
//  174 //		  len:·¢ËÍ³¤¶È                                             *
//  175 //·µ  »Ø: ÎÞ                                                               *
//  176 //Ëµ  Ã÷:                                                                  *
//  177 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  178 void uart_sendN (UART_MemMapPtr uartch ,uint8* buff,uint16 len)
//  179 {
uart_sendN:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  180     int i;
//  181 	for(i=0;i<len;i++)
        MOVS     R7,#+0
        B.N      ??uart_sendN_0
//  182     {
//  183 		uart_send1(uartch,buff[i]);
??uart_sendN_1:
        LDRB     R1,[R7, R5]
        MOVS     R0,R4
        BL       uart_send1
//  184     }
        ADDS     R7,R7,#+1
??uart_sendN_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R7,R6
        BLT.N    ??uart_sendN_1
//  185 }
        POP      {R0,R4-R7,PC}    ;; return
//  186 
//  187 //-------------------------------------------------------------------------*
//  188 //º¯ÊýÃû: enableuartreint                                                  *
//  189 //¹¦  ÄÜ: ¿ª´®¿Ú½ÓÊÕÖÐ¶Ï                                                   *
//  190 //²Î  Êý: uartch: ´®¿ÚºÅ                                                   *
//  191 //        irqno: ¶ÔÓ¦irqºÅ                                                 *
//  192 //·µ  »Ø: ÎÞ                                                               *
//  193 //Ëµ  Ã÷:                                                                  *
//  194 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  195 void enableuartreint(UART_MemMapPtr uartch,uint8 irqno)
//  196 {
enableuartreint:
        PUSH     {R7,LR}
//  197 	UART_C2_REG(uartch)|=UART_C2_RIE_MASK;   //¿ª·ÅUART½ÓÊÕÖÐ¶Ï
        LDRB     R2,[R0, #+3]
        ORRS     R2,R2,#0x20
        STRB     R2,[R0, #+3]
//  198 	enable_irq(irqno);			 //¿ª½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R1
        BL       enable_irq
//  199 }
        POP      {R0,PC}          ;; return
//  200 
//  201 //-------------------------------------------------------------------------*
//  202 //º¯ÊýÃû: disableuartreint                                                 *
//  203 //¹¦  ÄÜ: ¹Ø´®¿Ú½ÓÊÕÖÐ¶Ï                                                   *
//  204 //²Î  Êý: uartch: ´®¿ÚºÅ                                                   *
//  205 //        irqno: ¶ÔÓ¦irqºÅ                                                 *
//  206 //·µ  »Ø: ÎÞ                                                               *
//  207 //Ëµ  Ã÷:                                                                  *
//  208 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  209 void disableuartreint(UART_MemMapPtr uartch,uint8 irqno)
//  210 {
disableuartreint:
        PUSH     {R7,LR}
//  211 	UART_C2_REG(uartch)&=~UART_C2_RIE_MASK;   //½ûÖ¹UART½ÓÊÕÖÐ¶Ï
        LDRB     R2,[R0, #+3]
        ANDS     R2,R2,#0xDF
        STRB     R2,[R0, #+3]
//  212 	disable_irq(irqno);			  //¹Ø½ÓÊÕÒý½ÅµÄIRQÖÐ¶Ï
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R1
        BL       disable_irq
//  213 }
        POP      {R0,PC}          ;; return
//  214 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  215 void Asc_send(uint16 data)
//  216 {uint8 temp[5] = {0},i = 0;
Asc_send:
        PUSH     {R2-R4,LR}
        ADD      R1,SP,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        STM      R1!,{R2,R3}
        SUBS     R1,R1,#+8
        MOVS     R4,#+0
//  217  temp[0] = data / 10000;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVW     R1,#+10000
        SDIV     R1,R0,R1
        STRB     R1,[SP, #+0]
//  218  temp[1] = data / 1000 % 10 ;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R1,#+1000
        SDIV     R1,R0,R1
        MOVS     R2,#+10
        SDIV     R3,R1,R2
        MLS      R1,R2,R3,R1
        STRB     R1,[SP, #+1]
//  219  temp[2] = data / 100 % 10 ;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R1,#+100
        SDIV     R1,R0,R1
        MOVS     R2,#+10
        SDIV     R3,R1,R2
        MLS      R1,R2,R3,R1
        STRB     R1,[SP, #+2]
//  220  temp[3] = data / 10 % 10; 
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R1,#+10
        SDIV     R1,R0,R1
        MOVS     R2,#+10
        SDIV     R3,R1,R2
        MLS      R1,R2,R3,R1
        STRB     R1,[SP, #+3]
//  221  temp[4] = data  % 10;  
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOVS     R1,#+10
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        STRB     R0,[SP, #+4]
//  222  
//  223  for(i=0; i<5; i++)
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??Asc_send_0
//  224   { switch(temp[i])
//  225         { case 0: uart_send1 (UART1, 0x30);continue;
//  226           case 1: uart_send1 (UART1, 0x31);continue;
//  227           case 2: uart_send1 (UART1, 0x32);continue;
//  228           case 3: uart_send1 (UART1, 0x33);continue;
//  229           case 4: uart_send1 (UART1, 0x34);continue;
//  230           case 5: uart_send1 (UART1, 0x35);continue;
//  231           case 6: uart_send1 (UART1, 0x36);continue;
//  232           case 7: uart_send1 (UART1, 0x37);continue;
//  233           case 8: uart_send1 (UART1, 0x38);continue;
//  234           case 9: uart_send1 (UART1, 0x39);continue;
??Asc_send_1:
        MOVS     R1,#+57
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
??Asc_send_2:
        ADDS     R4,R4,#+1
??Asc_send_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+5
        BCS.N    ??Asc_send_3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADD      R0,SP,#+0
        LDRB     R0,[R4, R0]
        CMP      R0,#+0
        BEQ.N    ??Asc_send_4
        CMP      R0,#+2
        BEQ.N    ??Asc_send_5
        BCC.N    ??Asc_send_6
        CMP      R0,#+4
        BEQ.N    ??Asc_send_7
        BCC.N    ??Asc_send_8
        CMP      R0,#+6
        BEQ.N    ??Asc_send_9
        BCC.N    ??Asc_send_10
        CMP      R0,#+8
        BEQ.N    ??Asc_send_11
        BCC.N    ??Asc_send_12
        CMP      R0,#+9
        BEQ.N    ??Asc_send_1
        B.N      ??Asc_send_2
??Asc_send_4:
        MOVS     R1,#+48
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
        B.N      ??Asc_send_2
??Asc_send_6:
        MOVS     R1,#+49
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
        B.N      ??Asc_send_2
??Asc_send_5:
        MOVS     R1,#+50
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
        B.N      ??Asc_send_2
??Asc_send_8:
        MOVS     R1,#+51
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
        B.N      ??Asc_send_2
??Asc_send_7:
        MOVS     R1,#+52
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
        B.N      ??Asc_send_2
??Asc_send_10:
        MOVS     R1,#+53
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
        B.N      ??Asc_send_2
??Asc_send_9:
        MOVS     R1,#+54
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
        B.N      ??Asc_send_2
??Asc_send_12:
        MOVS     R1,#+55
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
        B.N      ??Asc_send_2
??Asc_send_11:
        MOVS     R1,#+56
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
        B.N      ??Asc_send_2
//  235         }
//  236   }
//  237  //uart_send1 (UART1, '\r');
//  238  //uart_send1 (UART1, '\n');
//  239 }
??Asc_send_3:
        POP      {R0,R1,R4,PC}    ;; return
//  240 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  241 void Send_Enter()
//  242 {
Send_Enter:
        PUSH     {R7,LR}
//  243  uart_send1 (UART1, '\r');
        MOVS     R1,#+13
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
//  244  uart_send1 (UART1, '\n');
        MOVS     R1,#+10
        LDR.N    R0,??DataTable2_3  ;; 0x4006b000
        BL       uart_send1
//  245 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x4004c018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x4004c01c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x4006b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x4004b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x4006c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4004c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x4004c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x4004b044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x4004b040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0x400ea000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x4004d060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0x4004d064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     0x400eb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     0x4004d020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     0x4004d024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     0x40048028

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0

        END
//  246 
//  247 
//  248 
//  249 
//  250 
//  251 
//  252 
//  253 
//  254 
//  255 
//  256 
// 
//   8 bytes in section .rodata
// 932 bytes in section .text
// 
// 932 bytes of CODE  memory
//   8 bytes of CONST memory
//
//Errors: none
//Warnings: none
