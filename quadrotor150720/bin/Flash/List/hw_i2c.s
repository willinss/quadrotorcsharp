///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:13 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\hw_i2c.c              /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\hw_i2c.c" -D IAR -D  /
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
//                    (¸ÄI2C)\bin\Flash\List\hw_i2c.s                         /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME hw_i2c

        #define SHT_PROGBITS 0x1

        PUBLIC hw_i2c_get_base_address
        PUBLIC hw_i2c_init
        PUBLIC hw_iic_read1
        PUBLIC hw_iic_readn
        PUBLIC hw_iic_write1
        PUBLIC hw_iic_writen
        PUBLIC hw_send_signal
        PUBLIC hw_wait

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\hw_i2c.c
//    1 //============================================================================
//    2 //ÎÄ¼þÃû³Æ£ºhw_i2c.h  
//    3 //¹¦ÄÜ¸ÅÒª£ºuart¹¹¼þÍ·ÎÄ¼þ
//    4 //°æÈ¨ËùÓÐ£ºËÕÖÝ´óÑ§·ÉË¼¿¨¶ûÇ¶ÈëÊ½ÖÐÐÄ(sumcu.suda.edu.cn)
//    5 //°æ±¾¸üÐÂ£º2011-11-17     V1.0       stone    ±àÐ´ÁËK60µÄi2cÇý¶¯
//    6 //============================================================================
//    7 
//    8 #ifndef __I2C_H__
//    9 #define __I2C_H__
//   10 	
//   11 #include "common.h"
//   12 #include "hw_i2c.h"
//   13 
//   14 
//   15 //============================================================================
//   16 //º¯ÊýÃû³Æ£ºhw_i2c_init                                                        
//   17 //¹¦ÄÜ¸ÅÒª£º³õÊ¼»¯IICXÄ£¿é¡£                                                
//   18 //²ÎÊýËµÃ÷£ºMoudleNum:Ä£¿éºÅ                                                         
//   19 //º¯Êý·µ»Ø£ºÎÞ                                                                  
//   20 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void hw_i2c_init(int MoudleNum)
//   22 {
hw_i2c_init:
        PUSH     {R7,LR}
//   23 	//»ñÈ¡i2cÄ£¿é»ùÖ·
//   24 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        BL       hw_i2c_get_base_address
//   25 	
//   26 	if(num == I2C0)
        LDR.W    R1,??DataTable2  ;; 0x40066000
        CMP      R0,R1
        BNE.N    ??hw_i2c_init_0
//   27 	{
//   28 		//´ò¿ªI2C0Ä£¿éÊ±ÖÓ
//   29 		SIM_SCGC4 |= SIM_SCGC4_I2C0_MASK; 
        LDR.W    R0,??DataTable2_1  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.W    R1,??DataTable2_1  ;; 0x40048034
        STR      R0,[R1, #+0]
//   30 		//ÅäÖÃÒý½Å¸´ÓÃÎªI2C0¹¦ÄÜ
//   31 		//I2C0 SCLÊ¹ÓÃPTB0
//   32 		//I2C0 SDAÊ¹ÓÃPTb1
//   33 		PORTB_PCR0 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_2  ;; 0x4004a000
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   34 		PORTB_PCR1 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_3  ;; 0x4004a004
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   35 		//ÉèÖÃ MULT ºÍ ICR   
//   36 		//Ð¾Æ¬ÊÖ²áÍÆ¼öÉèÖÃ100KÒÔ¼õÐ¡MCU¸ºÔØ
//   37 		//k60µÄMCU×ÜÏßÆµÂÊÎª48M£¬ÔÚ×ÜÏßÉÏ·ÖÆµ
//   38 		I2C0_F  = 0x19;  //300k  
        LDR.W    R0,??DataTable2_4  ;; 0x40066001
        MOVS     R1,#+25
        STRB     R1,[R0, #+0]
//   39 		//Ê¹ÄÜI2C0£¬²»·¢ËÍÓ¦´ðÐÅºÅ
//   40 		I2C0_C1 = I2C_C1_IICEN_MASK | I2C_C1_TXAK_MASK;      
        LDR.W    R0,??DataTable2_5  ;; 0x40066002
        MOVS     R1,#+136
        STRB     R1,[R0, #+0]
        B.N      ??hw_i2c_init_1
//   41 	}
//   42 	else
//   43 	{
//   44 		//´ò¿ªI2C1Ä£¿éÊ±ÖÓ
//   45 		SIM_SCGC4 |= SIM_SCGC4_I2C1_MASK; 
??hw_i2c_init_0:
        LDR.N    R0,??DataTable2_1  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable2_1  ;; 0x40048034
        STR      R0,[R1, #+0]
//   46 		//ÅäÖÃÒý½Å¸´ÓÃÎªI2C1¹¦ÄÜ
//   47 		//I2C1 SCLÊ¹ÓÃPTC10
//   48 		//I2C1 SDAÊ¹ÓÃPTC11
//   49 		PORTC_PCR10 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_6  ;; 0x4004b028
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   50 		PORTC_PCR11 = PORT_PCR_MUX(2);
        LDR.N    R0,??DataTable2_7  ;; 0x4004b02c
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   51 		//ÉèÖÃ MULT ºÍ ICR   
//   52 		//Ð¾Æ¬ÊÖ²áÍÆ¼öÉèÖÃ100KÒÔ¼õÐ¡MCU¸ºÔØ
//   53 		//k60µÄMCU×ÜÏßÆµÂÊÎª48M£¬ÔÚ×ÜÏßÉÏ·ÖÆµ
//   54 		I2C1_F  = 0x19;   //300k 1d = 160 1B = 128 375K  19 = 96  500K
        LDR.N    R0,??DataTable2_8  ;; 0x40067001
        MOVS     R1,#+25
        STRB     R1,[R0, #+0]
//   55 		//Ê¹ÄÜI2C1£¬²»·¢ËÍÓ¦´ðÐÅºÅ
//   56 		I2C1_C1 = I2C_C1_IICEN_MASK | I2C_C1_TXAK_MASK;      
        LDR.N    R0,??DataTable2_9  ;; 0x40067002
        MOVS     R1,#+136
        STRB     R1,[R0, #+0]
//   57 	}
//   58 }
??hw_i2c_init_1:
        POP      {R0,PC}          ;; return
//   59 
//   60 //============================================================================
//   61 //º¯ÊýÃû³Æ£ºhw_send_signal                                                        
//   62 //¹¦ÄÜ¸ÅÒª£º¸ù¾ÝÐèÒª²úÉú¿ªÊ¼»òÍ£Ö¹ÐÅºÅ   ¡£                                                
//   63 //²ÎÊýËµÃ÷£º         MoudleNum:Ä£¿éºÅ       
//   64 //          Signal: 'S'(Start),²úÉú¿ªÊ¼ÐÅºÅ      'O'(Over),  ²úÉúÍ£Ö¹ÐÅºÅ               
//   65 //º¯Êý·µ»Ø£ºÎÞ                                                                  
//   66 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 void hw_send_signal(uint8 Signal,int MoudleNum)
//   68 {
hw_send_signal:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R1
//   69 	//»ñÈ¡i2cÄ£¿é»ùÖ·
//   70 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        BL       hw_i2c_get_base_address
//   71 	
//   72 	if(num == I2C0)//Ä£¿é0
        LDR.N    R1,??DataTable2  ;; 0x40066000
        CMP      R0,R1
        BNE.N    ??hw_send_signal_0
//   73 	{
//   74 		if (Signal == 'S')    
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+83
        BNE.N    ??hw_send_signal_1
//   75 		{
//   76 		  i2c0_Start(); //Ö÷»úÄ£Ê½Ñ¡ÔñÎ»MSTÓÉ0±äÎª1,¿ÉÒÔ²úÉú¿ªÊ¼ÐÅºÅ  
        LDR.N    R0,??DataTable2_5  ;; 0x40066002
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2_5  ;; 0x40066002
        STRB     R0,[R1, #+0]
        B.N      ??hw_send_signal_2
//   77 		}
//   78 		else if (Signal == 'O')
??hw_send_signal_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+79
        BNE.N    ??hw_send_signal_2
//   79 		{
//   80 		  i2c0_Stop();//Ö÷»úÄ£Ê½Ñ¡ÔñÎ»MSTÓÉ1±äÎª0,¿ÉÒÔ²úÉúÍ£Ö¹ÐÅºÅ
        LDR.N    R0,??DataTable2_5  ;; 0x40066002
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable2_5  ;; 0x40066002
        STRB     R0,[R1, #+0]
        B.N      ??hw_send_signal_2
//   81 		}
//   82 	}
//   83 	else if(num == I2C1)//Ä£¿é1
??hw_send_signal_0:
        LDR.N    R1,??DataTable2_10  ;; 0x40067000
        CMP      R0,R1
        BNE.N    ??hw_send_signal_2
//   84 	{
//   85 		if (Signal == 'S')    
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+83
        BNE.N    ??hw_send_signal_3
//   86 		{
//   87 		  i2c1_Start(); //Ö÷»úÄ£Ê½Ñ¡ÔñÎ»MSTÓÉ0±äÎª1,¿ÉÒÔ²úÉú¿ªÊ¼ÐÅºÅ  
        LDR.N    R0,??DataTable2_9  ;; 0x40067002
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable2_9  ;; 0x40067002
        STRB     R0,[R1, #+0]
        B.N      ??hw_send_signal_2
//   88 		}
//   89 		else if (Signal == 'O')
??hw_send_signal_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+79
        BNE.N    ??hw_send_signal_2
//   90 		{
//   91 		  i2c1_Stop();//Ö÷»úÄ£Ê½Ñ¡ÔñÎ»MSTÓÉ1±äÎª0,¿ÉÒÔ²úÉúÍ£Ö¹ÐÅºÅ
        LDR.N    R0,??DataTable2_9  ;; 0x40067002
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable2_9  ;; 0x40067002
        STRB     R0,[R1, #+0]
//   92 		}
//   93 	}
//   94 	        
//   95                                               
//   96       
//   97 }
??hw_send_signal_2:
        POP      {R4,PC}          ;; return
//   98 
//   99 
//  100 
//  101 //============================================================================
//  102 //º¯ÊýÃû³Æ£ºhw_wait                                                        
//  103 //¹¦ÄÜ¸ÅÒª£º ÔÚÊ±ÏÞÄÚ,Ñ­»·¼ì²â½ÓÊÕÓ¦´ð±êÖ¾Î»,»ò´«ËÍÍê³É±êÖ¾Î»,ÅÐ¶ÏMCU         
//  104 //          ÊÇ·ñ½ÓÊÕµ½Ó¦´ðÐÅºÅ»òÒ»¸ö×Ö½ÚÊÇ·ñÒÑÔÚ×ÜÏßÉÏ´«ËÍÍê±Ï                                            
//  105 //²ÎÊýËµÃ÷£º         MoudleNum:Ä£¿éºÅ       
//  106 //             x:x = 'A'(Ack),µÈ´ýÓ¦´ð;x = 'T'(Transmission),µÈ´ýÒ»¸ö×Ö½Ú        
//  107 //                 Êý¾Ý´«ÊäÍê³É                   
//  108 //º¯Êý·µ»Ø£º0:ÊÕµ½Ó¦´ðÐÅºÅ»òÒ»¸ö×Ö½Ú´«ËÍÍê±Ï;
//  109 //         1:Î´ÊÕµ½Ó¦´ðÐÅºÅ»òÒ»¸ö ×Ö½ÚÃ»´«ËÍÍê                                                                                                                            
//  110 //============================================================================
//  111 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 uint8 hw_wait(uint8 x,int MoudleNum)
//  113 
//  114 {
hw_wait:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R1
//  115     uint16 ErrTime, i;
//  116     I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        BL       hw_i2c_get_base_address
//  117     ErrTime = 255*10;            //¶¨Òå²éÑ¯³¬Ê±Ê±ÏÞ
        MOVW     R1,#+2550
//  118     
//  119     
//  120     //»ñÈ¡i2cÄ£¿é»ùÖ·
//  121     
//  122     
//  123 	for (i = 0;i < ErrTime;i++)
        MOVS     R2,#+0
        B.N      ??hw_wait_0
??hw_wait_1:
        ADDS     R2,R2,#+1
??hw_wait_0:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R2,R1
        BCS.N    ??hw_wait_2
//  124 	{
//  125 		if (x == 'A')           //µÈ´ýÓ¦´ðÐÅºÅ
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+65
        BNE.N    ??hw_wait_3
//  126 		{
//  127 			  if(( I2C_S_REG(num)  & I2C_S_RXAK_MASK)==0)
        LDRB     R3,[R0, #+3]
        LSLS     R3,R3,#+31
        BMI.N    ??hw_wait_1
//  128 				 return 0;      //´«ËÍÍêÒ»¸ö×Ö½Úºó,ÊÕµ½ÁË´Ó»úµÄÓ¦´ðÐÅºÅ               
        MOVS     R0,#+0
        B.N      ??hw_wait_4
//  129 		}
//  130 		else if (x == 'T')      //µÈ´ý´«ËÍÍê³ÉÒ»¸ö×Ö½ÚÐÅºÅ
??hw_wait_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+84
        BNE.N    ??hw_wait_1
//  131 		{
//  132 			if ((I2C_S_REG(num) & I2C_S_IICIF_MASK) != 0)    
        LDRB     R3,[R0, #+3]
        LSLS     R3,R3,#+30
        BPL.N    ??hw_wait_1
//  133 			{
//  134 				(I2C_S_REG(num) |=(0 | I2C_S_IICIF_MASK));  //ÇåIICIF±êÖ¾Î»
        LDRB     R1,[R0, #+3]
        ORRS     R1,R1,#0x2
        STRB     R1,[R0, #+3]
//  135 				return 0;       //³É¹¦·¢ËÍÍêÒ»¸ö×Ö½Ú
        MOVS     R0,#+0
        B.N      ??hw_wait_4
//  136 			}       
//  137 		}
//  138 	}
//  139 	if (i >= ErrTime)
??hw_wait_2:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R2,R1
        BCC.N    ??hw_wait_5
//  140 		return 1;               //³¬Ê±,Ã»ÓÐÊÕµ½Ó¦´ðÐÅºÅ»ò·¢ËÍÍêÒ»¸ö×Ö½Ú   	
        MOVS     R0,#+1
        B.N      ??hw_wait_4
//  141 }
??hw_wait_5:
??hw_wait_4:
        POP      {R4,PC}          ;; return
//  142 
//  143 
//  144 //============================================================================
//  145 //º¯ÊýÃû³Æ£ºhw_iic_read1                                                        
//  146 //¹¦ÄÜ¸ÅÒª£º´Ó´Ó»ú¶Á1¸ö×Ö½ÚÊý¾Ý                                            
//  147 //²ÎÊýËµÃ÷£º  MoudleNum:Ä£¿éºÅ       
//  148 //          DeviceAddr:Éè±¸µØÖ·    
//  149 //          AccessAddr:·ÃÎÊµØÖ·
//  150 //          Data:´ø»ØÊÕµ½µÄÒ»¸ö×Ö½ÚÊý¾Ý  
//  151 //º¯Êý·µ»Ø£ºÎª0,³É¹¦¶ÁÒ»¸ö×Ö½Ú;Îª1,¶ÁÒ»¸ö×Ö½ÚÊ§°Ü  
//  152 //º¯ÊýËµÃ÷: ÄÚ²¿µ÷ÓÃ hw_send_signal,hw_wait  
//  153 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  154 uint8 hw_iic_read1(int MoudleNum,uint8 DeviceAddr, uint8 AccessAddr, uint8 *Data)
//  155 {      
hw_iic_read1:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R8,R2
        MOVS     R6,R3
//  156       
//  157 	//»ñÈ¡i2cÄ£¿é»ùÖ·
//  158 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        MOVS     R0,R4
        BL       hw_i2c_get_base_address
        MOVS     R7,R0
//  159 	
//  160 	I2C_C1_REG(num)     |= 0x10;           //TX = 1,MCUÉèÖÃÎª·¢ËÍÄ£Ê½
        LDRB     R0,[R7, #+2]
        ORRS     R0,R0,#0x10
        STRB     R0,[R7, #+2]
//  161 	hw_send_signal('S',MoudleNum);               //·¢ËÍ¿ªÊ¼ÐÅºÅ 
        MOVS     R1,R4
        MOVS     R0,#+83
        BL       hw_send_signal
//  162 	I2C_D_REG(num)  = DeviceAddr & 0xfe;   //·¢ËÍÉè±¸µØÖ·,²¢Í¨Öª´Ó»ú½ÓÊÕÊý¾Ý
        ANDS     R0,R5,#0xFE
        STRB     R0,[R7, #+4]
//  163 	 
//  164 	if (hw_wait('T',MoudleNum))                  //µÈ´ýÒ»¸ö×Ö½ÚÊý¾Ý´«ËÍÍê³É  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_0
//  165 	{      
//  166 
//  167 		return 1;                         //Ã»ÓÐ´«ËÍ³É¹¦,¶ÁÒ»¸ö×Ö½ÚÊ§°Ü   
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  168 	}
//  169 	if (hw_wait('A',MoudleNum))                 //µÈ´ý´Ó»úÓ¦´ðÐÅºÅ 
??hw_iic_read1_0:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_2
//  170 	{
//  171 
//  172 		return 1;                         //Ã»ÓÐµÈµ½Ó¦´ðÐÅºÅ,¶ÁÒ»¸ö×Ö½ÚÊ§°Ü 
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  173 	}
//  174 	I2C_D_REG(num)  = AccessAddr;        //·¢ËÍ·ÃÎÊµØÖ·    
??hw_iic_read1_2:
        STRB     R8,[R7, #+4]
//  175 	if (hw_wait('T',MoudleNum))                //µÈ´ýÒ»¸ö×Ö½ÚÊý¾Ý´«ËÍÍê³É 
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_3
//  176 	{
//  177 	 
//  178 		return 1;                        //Ã»ÓÐ´«ËÍ³É¹¦,¶ÁÒ»¸ö×Ö½ÚÊ§°Ü
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  179 	}
//  180 	if (hw_wait('A',MoudleNum))                //µÈ´ý´Ó»úÓ¦´ðÐÅºÅ   
??hw_iic_read1_3:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_4
//  181 	{
//  182 	  
//  183 		return 1;                        //Ã»ÓÐµÈµ½Ó¦´ðÐÅºÅ,¶ÁÒ»¸ö×Ö½ÚÊ§°Ü  
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  184 	}
//  185 	I2C_C1_REG(num) |= 0x04;//µ±MCUÔÚÖ÷»úÄ£ Ê½ÏÂ£¬Ïò¸ÃÎ»Ð´1½«²úÉúÒ»¸öÖØÐÂ¿ªÊ¼ÐÅºÅ  
??hw_iic_read1_4:
        LDRB     R0,[R7, #+2]
        ORRS     R0,R0,#0x4
        STRB     R0,[R7, #+2]
//  186 	I2C_D_REG(num) = DeviceAddr | 0x01; //Í¨Öª´Ó»ú¸ÄÎª·¢ËÍÊý¾Ý    
        ORRS     R0,R5,#0x1
        STRB     R0,[R7, #+4]
//  187 	if (hw_wait('T',MoudleNum))               //µÈ´ýÒ»¸ö×Ö½ÚÊý¾Ý´«ËÍÍê³É  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_5
//  188 	{
//  189 	 
//  190 		return 1;                       //Ã»ÓÐ´«ËÍ³É¹¦,¶ÁÒ»¸ö×Ö½ÚÊ§°Ü 
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  191 	}
//  192 	if (hw_wait('A',MoudleNum))               //µÈ´ý´Ó»úÓ¦´ðÐÅºÅ  
??hw_iic_read1_5:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_6
//  193 	{
//  194 	 
//  195 		return 1;                      //Ã»ÓÐµÈµ½Ó¦´ðÐÅºÅ,¶ÁÒ»¸ö×Ö½ÚÊ§°Ü
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  196 	}
//  197 	I2C_C1_REG(num) &= 0xef;           //TX = 0,MCUÉèÖÃÎª½ÓÊÕÄ£Ê½    
??hw_iic_read1_6:
        LDRB     R0,[R7, #+2]
        ANDS     R0,R0,#0xEF
        STRB     R0,[R7, #+2]
//  198 	*Data = I2C_D_REG(num);            //¶Á³öIIC1D,×¼±¸½ÓÊÕÊý¾Ý   
        LDRB     R0,[R7, #+4]
        STRB     R0,[R6, #+0]
//  199 	if (hw_wait('T',MoudleNum))              //µÈ´ýÒ»¸ö×Ö½ÚÊý¾Ý´«ËÍÍê³É  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_7
//  200 	{  
//  201 	 
//  202 		return 1;                      //Ã»ÓÐ´«ËÍ³É¹¦,¶ÁÒ»¸ö×Ö½ÚÊ§°Ü  
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  203 	}
//  204 	hw_send_signal('O',MoudleNum);           //·¢ËÍÍ£Ö¹ÐÅºÅ    
??hw_iic_read1_7:
        MOVS     R1,R4
        MOVS     R0,#+79
        BL       hw_send_signal
//  205 	*Data = I2C_D_REG(num);            //¶Á³ö½ÓÊÕµ½µÄÒ»¸öÊý¾Ý    
        LDRB     R0,[R7, #+4]
        STRB     R0,[R6, #+0]
//  206 	
//  207 	return 0;                          //ÕýÈ·½ÓÊÕµ½Ò»¸ö×Ö½ÚÊý¾Ý
        MOVS     R0,#+0
??hw_iic_read1_1:
        POP      {R4-R8,PC}       ;; return
//  208 	
//  209 }
//  210 
//  211 //============================================================================
//  212 //º¯ÊýÃû³Æ£ºhw_iic_write1                                                        
//  213 //¹¦ÄÜ¸ÅÒª£ºÏò´Ó»úÐ´1¸ö×Ö½ÚÊý¾Ý                                           
//  214 //²ÎÊýËµÃ÷£º  MoudleNum:Ä£¿éºÅ       
//  215 //          DeviceAddr:Éè±¸µØÖ·    
//  216 //          AccessAddr:·ÃÎÊµØÖ·
//  217 //          Data:Òª·¢¸ø´Ó»úµÄ1¸ö×Ö½ÚÊý¾Ý  
//  218 //º¯Êý·µ»Ø£ºÎª0,³É¹¦Ð´Ò»¸ö×Ö½Ú;Îª1,Ð´Ò»¸ö×Ö½ÚÊ§°Ü 
//  219 //º¯ÊýËµÃ÷: ÄÚ²¿µ÷ÓÃ hw_send_signal,hw_wait  
//  220 //============================================================================
//  221 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  222 uint8 hw_iic_write1(int MoudleNum,uint8 DeviceAddr, uint8 AccessAddr, uint8 Data)
//  223 {
hw_iic_write1:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  224 	//»ñÈ¡i2cÄ£¿é»ùÖ·
//  225 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        MOVS     R0,R4
        BL       hw_i2c_get_base_address
        MOV      R8,R0
//  226 	
//  227 	I2C_C1_REG(num) |= 0x10;             //TX = 1,MCUÉèÖÃÎª·¢ËÍÄ£Ê½
        LDRB     R0,[R8, #+2]
        ORRS     R0,R0,#0x10
        STRB     R0,[R8, #+2]
//  228     hw_send_signal('S',MoudleNum);             //·¢ËÍ¿ªÊ¼ÐÅºÅ
        MOVS     R1,R4
        MOVS     R0,#+83
        BL       hw_send_signal
//  229     I2C_D_REG(num) = DeviceAddr & 0xfe;  //·¢ËÍÉè±¸µØÖ·,²¢Í¨Öª´Ó»ú½ÓÊÕÊý¾Ý
        ANDS     R0,R5,#0xFE
        STRB     R0,[R8, #+4]
//  230     if (hw_wait('T',MoudleNum))                //µÈ´ýÒ»¸ö×Ö½ÚÊý¾Ý´«ËÍÍê³É
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_0
//  231         return 1;                        //Ã»ÓÐ´«ËÍ³É¹¦,Ð´Ò»¸ö×Ö½ÚÊ§°Ü
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  232     if (hw_wait('A',MoudleNum))               //µÈ´ý´Ó»úÓ¦´ðÐÅºÅ
??hw_iic_write1_0:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_2
//  233         return 1;                       //Ã»ÓÐµÈµ½Ó¦´ðÐÅºÅ,Ð´Ò»¸ö×Ö½ÚÊ§°Ü   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  234     I2C_D_REG(num) = AccessAddr;         //·¢ËÍ·ÃÎÊµØÖ·
??hw_iic_write1_2:
        STRB     R6,[R8, #+4]
//  235     if (hw_wait('T',MoudleNum))               //µÈ´ýÒ»¸ö×Ö½ÚÊý¾Ý´«ËÍÍê³É
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_3
//  236         return 1;                       //Ã»ÓÐ´«ËÍ³É¹¦,Ð´Ò»¸ö×Ö½ÚÊ§°Ü
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  237     if (hw_wait('A',MoudleNum))               //µÈ´ý´Ó»úÓ¦´ðÐÅºÅ
??hw_iic_write1_3:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_4
//  238         return 1;                      //Ã»ÓÐµÈµ½Ó¦´ðÐÅºÅ,Ð´Ò»¸ö×Ö½ÚÊ§°Ü   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  239     I2C_D_REG(num) = Data;             //Ð´Êý¾Ý
??hw_iic_write1_4:
        STRB     R7,[R8, #+4]
//  240     if (hw_wait('T',MoudleNum))              //µÈ´ýÒ»¸ö×Ö½ÚÊý¾Ý´«ËÍÍê³É
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_5
//  241         return 1;                      //Ã»ÓÐ´«ËÍ³É¹¦,Ð´Ò»¸ö×Ö½ÚÊ§°Ü
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  242     if (hw_wait('A',MoudleNum))              //µÈ´ý´Ó»úÓ¦´ðÐÅºÅ
??hw_iic_write1_5:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_6
//  243         return 1;                      //Ã»ÓÐµÈµ½Ó¦´ðÐÅºÅ,Ð´Ò»¸ö×Ö½ÚÊ§°Ü   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  244     hw_send_signal('O',MoudleNum);           //·¢ËÍÍ£Ö¹ÐÅºÅ
??hw_iic_write1_6:
        MOVS     R1,R4
        MOVS     R0,#+79
        BL       hw_send_signal
//  245     return 0;
        MOVS     R0,#+0
??hw_iic_write1_1:
        POP      {R4-R8,PC}       ;; return
//  246 }
//  247 
//  248 
//  249 //============================================================================
//  250 //º¯ÊýÃû³Æ£ºhw_iic_readn                                                        
//  251 //¹¦ÄÜ¸ÅÒª£º ´Ó´Ó»ú¶ÁN¸ö×Ö½ÚÊý¾Ý                                             
//  252 //²ÎÊýËµÃ÷£º  MoudleNum:Ä£¿éºÅ       
//  253 //          DeviceAddr:Éè±¸µØÖ·    
//  254 //          AccessAddr:·ÃÎÊµØÖ·
//  255 //          Data:¶Á³öÊý¾ÝµÄ»º³åÇø
//  256 //          N:´Ó´Ó»ú¶ÁµÄ×Ö½Ú¸öÊý 
//  257 //º¯Êý·µ»Ø£º Îª0,³É¹¦¶ÁN¸ö×Ö½Ú;Îª1,¶ÁN¸ö×Ö½ÚÊ§°Ü  
//  258 //º¯ÊýËµÃ÷: ÄÚ²¿µ÷ÓÃhw_iic_read1  
//  259 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  260 uint8 hw_iic_readn(int MoudleNum,uint8 DeviceAddr, uint8 AccessAddr, uint8 Data[], uint8 N)
//  261 {
hw_iic_readn:
        PUSH     {R3-R9,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
//  262     uint16 i, j;
//  263     for (i = 0;i < N;i++)
        MOVS     R9,#+0
        LDR      R4,[SP, #+32]
        B.N      ??hw_iic_readn_0
??hw_iic_readn_1:
        ADDS     R9,R9,#+1
??hw_iic_readn_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R9,R0
        BCS.N    ??hw_iic_readn_2
//  264     {
//  265         for(j = 0;j <15*40 ;j++); //×îÐ¡ÑÓÊ±(·¢ËÍµÄÃ¿¸ö×Ö½ÚÖ®¼äÒªÓÐÊ±¼ä¼ä¸ô)
        MOVS     R0,#+0
        B.N      ??hw_iic_readn_3
??hw_iic_readn_4:
        ADDS     R0,R0,#+1
??hw_iic_readn_3:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+600
        BCC.N    ??hw_iic_readn_4
//  266         if (hw_iic_read1(MoudleNum,DeviceAddr, AccessAddr + i, &Data[i]))  
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADDS     R3,R9,R8
        ADDS     R2,R9,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        BL       hw_iic_read1
        CMP      R0,#+0
        BEQ.N    ??hw_iic_readn_1
//  267             return 1;             //ÆäÖÐÒ»¸ö×Ö½ÚÃ»ÓÐ½ÓÊÕµ½,·µ»ØÊ§°Ü±êÖ¾:1
        MOVS     R0,#+1
        B.N      ??hw_iic_readn_5
//  268     }
//  269     if (i >= N)
??hw_iic_readn_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R9,R4
        BCC.N    ??hw_iic_readn_6
//  270         return 0;                 //³É¹¦½ÓÊÕN¸öÊý¾Ý,·µ»Ø³É¹¦±êÖ¾:0
        MOVS     R0,#+0
        B.N      ??hw_iic_readn_5
//  271 }
??hw_iic_readn_6:
??hw_iic_readn_5:
        POP      {R1,R4-R9,PC}    ;; return
//  272 
//  273 
//  274 //============================================================================
//  275 //º¯ÊýÃû³Æ£ºhw_iic_writen                                                        
//  276 //¹¦ÄÜ¸ÅÒª£º Ïò´Ó»úÐ´N¸ö×Ö½ÚÊý¾Ý                                              
//  277 //²ÎÊýËµÃ÷£º  MoudleNum:Ä£¿éºÅ       
//  278 //          DeviceAddr:Éè±¸µØÖ·    
//  279 //          AccessAddr:·ÃÎÊµØÖ·
//  280 //          Data:ÒªÐ´ÈëµÄÊý¾Ý  
//  281 //          N:´Ó´Ó»ú¶ÁµÄ×Ö½Ú¸öÊý 
//  282 //º¯Êý·µ»Ø£º Îª0,³É¹¦Ð´N¸ö×Ö½Ú;Îª1,Ð´N¸ö×Ö½ÚÊ§°Ü
//  283 //º¯ÊýËµÃ÷: ÄÚ²¿µ÷ÓÃhw_iic_write1   
//  284 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  285 uint8 hw_iic_writen(int MoudleNum,uint8 DeviceAddr, uint8 AccessAddr,uint8 Data[], uint8 N)
//  286 {
hw_iic_writen:
        PUSH     {R3-R9,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
//  287     uint16 i, j;
//  288     for (i = 0;i < N;i++)
        MOVS     R9,#+0
        LDR      R4,[SP, #+32]
        B.N      ??hw_iic_writen_0
??hw_iic_writen_1:
        ADDS     R9,R9,#+1
??hw_iic_writen_0:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R9,R0
        BCS.N    ??hw_iic_writen_2
//  289     {
//  290         for(j = 0;j < 15*40;j++); //×îÐ¡ÑÓÊ±(·¢ËÍµÄÃ¿¸ö×Ö½ÚÖ®¼äÒªÓÐÊ±¼ä¼ä¸ô)
        MOVS     R0,#+0
        B.N      ??hw_iic_writen_3
??hw_iic_writen_4:
        ADDS     R0,R0,#+1
??hw_iic_writen_3:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+600
        BCC.N    ??hw_iic_writen_4
//  291         if (hw_iic_write1(MoudleNum,DeviceAddr, AccessAddr + i, Data[i]))
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDRB     R3,[R9, R8]
        ADDS     R2,R9,R7
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        BL       hw_iic_write1
        CMP      R0,#+0
        BEQ.N    ??hw_iic_writen_1
//  292             return 1;            //ÆäÖÐÒ»¸ö×Ö½ÚÃ»ÓÐ·¢ËÍ³öÈ¥,·µ»ØÊ§°Ü±êÖ¾:1
        MOVS     R0,#+1
        B.N      ??hw_iic_writen_5
//  293     }
//  294     if (i >= N)
??hw_iic_writen_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R9,R4
        BCC.N    ??hw_iic_writen_6
//  295         return 0;                //³É¹¦·¢ËÍN¸öÊý¾Ý,·µ»Ø³É¹¦±êÖ¾:0
        MOVS     R0,#+0
        B.N      ??hw_iic_writen_5
//  296 }
??hw_iic_writen_6:
??hw_iic_writen_5:
        POP      {R1,R4-R9,PC}    ;; return
//  297 //============================================================================
//  298 //º¯ÊýÃû³Æ£ºhw_i2c_get_base_address                                                        
//  299 //¹¦ÄÜ¸ÅÒª£º»ñÈ¡i2cÄ£¿éµÄ»ùÖ·                                                
//  300 //²ÎÊýËµÃ÷£ºi2cNO:i2cÄ£¿éºÅ      
//  301 //º¯Êý·µ»Ø£ºi2cÄ£¿éµÄ»ùÖ·Öµ                                                                  
//  302 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  303 I2C_MemMapPtr hw_i2c_get_base_address(int i2cNO)
//  304 {
//  305 	switch(i2cNO)
hw_i2c_get_base_address:
        CMP      R0,#+0
        BEQ.N    ??hw_i2c_get_base_address_0
        CMP      R0,#+1
        BEQ.N    ??hw_i2c_get_base_address_1
        B.N      ??hw_i2c_get_base_address_2
//  306 	{
//  307 	case 0:
//  308 		return I2C0_BASE_PTR;
??hw_i2c_get_base_address_0:
        LDR.N    R0,??DataTable2  ;; 0x40066000
        B.N      ??hw_i2c_get_base_address_3
//  309 		break;
//  310 	case 1:
//  311 		return I2C1_BASE_PTR;
??hw_i2c_get_base_address_1:
        LDR.N    R0,??DataTable2_10  ;; 0x40067000
        B.N      ??hw_i2c_get_base_address_3
//  312 		break;
//  313 	
//  314 	}
//  315 }
??hw_i2c_get_base_address_2:
??hw_i2c_get_base_address_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40066000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x4004a004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x40066001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x40066002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x4004b028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4004b02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x40067001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x40067002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x40067000

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  316 #endif 
// 
// 936 bytes in section .text
// 
// 936 bytes of CODE memory
//
//Errors: none
//Warnings: 4
