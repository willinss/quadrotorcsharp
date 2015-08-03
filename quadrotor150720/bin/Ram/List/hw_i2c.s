///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:14 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\Component_C\hw_i2c.c                /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\Component_C\hw_i2c.c" -D IAR -D    /
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
//                    28IIC\bin\Ram\List\hw_i2c.s                             /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME hw_i2c

        PUBLIC hw_i2c_get_base_address
        PUBLIC hw_i2c_init
        PUBLIC hw_iic_read1
        PUBLIC hw_iic_readn
        PUBLIC hw_iic_write1
        PUBLIC hw_iic_writen
        PUBLIC hw_send_signal
        PUBLIC hw_wait

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\Component_C\hw_i2c.c
//    1 //============================================================================
//    2 //�ļ����ƣ�hw_i2c.h  
//    3 //���ܸ�Ҫ��uart����ͷ�ļ�
//    4 //��Ȩ���У����ݴ�ѧ��˼����Ƕ��ʽ����(sumcu.suda.edu.cn)
//    5 //�汾���£�2011-11-17     V1.0       stone    ��д��K60��i2c����
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
//   16 //�������ƣ�hw_i2c_init                                                        
//   17 //���ܸ�Ҫ����ʼ��IICXģ�顣                                                
//   18 //����˵����MoudleNum:ģ���                                                         
//   19 //�������أ���                                                                  
//   20 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void hw_i2c_init(int MoudleNum)
//   22 {
hw_i2c_init:
        PUSH     {R7,LR}
//   23 	//��ȡi2cģ���ַ
//   24 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        BL       hw_i2c_get_base_address
//   25 	
//   26 	if(num == I2C0)
        LDR.W    R1,??DataTable2  ;; 0x40066000
        CMP      R0,R1
        BNE.N    ??hw_i2c_init_0
//   27 	{
//   28 		//��I2C0ģ��ʱ��
//   29 		SIM_SCGC4 |= SIM_SCGC4_I2C0_MASK; 
        LDR.W    R0,??DataTable2_1  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.W    R1,??DataTable2_1  ;; 0x40048034
        STR      R0,[R1, #+0]
//   30 		//�������Ÿ���ΪI2C0����
//   31 		//I2C0 SCLʹ��PTD8
//   32 		//I2C0 SDAʹ��PTD9
//   33 		PORTB_PCR0 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_2  ;; 0x4004a000
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   34 		PORTB_PCR1 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_3  ;; 0x4004a004
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   35 		//���� MULT �� ICR   
//   36 		//оƬ�ֲ��Ƽ�����100K�Լ�СMCU����
//   37 		//k60��MCU����Ƶ��Ϊ48M���������Ϸ�Ƶ
//   38 		I2C0_F  = 0x65;   
        LDR.W    R0,??DataTable2_4  ;; 0x40066001
        MOVS     R1,#+101
        STRB     R1,[R0, #+0]
//   39 		//ʹ��I2C0��������Ӧ���ź�
//   40 		I2C0_C1 = I2C_C1_IICEN_MASK | I2C_C1_TXAK_MASK;      
        LDR.W    R0,??DataTable2_5  ;; 0x40066002
        MOVS     R1,#+136
        STRB     R1,[R0, #+0]
        B.N      ??hw_i2c_init_1
//   41 	}
//   42 	else
//   43 	{
//   44 		//��I2C1ģ��ʱ��
//   45 		SIM_SCGC4 |= SIM_SCGC4_I2C1_MASK; 
??hw_i2c_init_0:
        LDR.W    R0,??DataTable2_1  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable2_1  ;; 0x40048034
        STR      R0,[R1, #+0]
//   46 		//�������Ÿ���ΪI2C1����
//   47 		//I2C1 SCLʹ��PTC10
//   48 		//I2C1 SDAʹ��PTC11
//   49 		PORTC_PCR10 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_6  ;; 0x4004b028
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   50 		PORTC_PCR11 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_7  ;; 0x4004b02c
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   51 		//���� MULT �� ICR   
//   52 		//оƬ�ֲ��Ƽ�����100K�Լ�СMCU����
//   53 		//k60��MCU����Ƶ��Ϊ48M���������Ϸ�Ƶ
//   54 		I2C1_F  = 0x65;   
        LDR.N    R0,??DataTable2_8  ;; 0x40067001
        MOVS     R1,#+101
        STRB     R1,[R0, #+0]
//   55 		//ʹ��I2C1��������Ӧ���ź�
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
//   61 //�������ƣ�hw_send_signal                                                        
//   62 //���ܸ�Ҫ��������Ҫ������ʼ��ֹͣ�ź�   ��                                                
//   63 //����˵����         MoudleNum:ģ���       
//   64 //          Signal: 'S'(Start),������ʼ�ź�      'O'(Over),  ����ֹͣ�ź�               
//   65 //�������أ���                                                                  
//   66 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 void hw_send_signal(uint8 Signal,int MoudleNum)
//   68 {
hw_send_signal:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R1
//   69 	//��ȡi2cģ���ַ
//   70 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        BL       hw_i2c_get_base_address
//   71 	
//   72 	if(num == I2C0)//ģ��0
        LDR.N    R1,??DataTable2  ;; 0x40066000
        CMP      R0,R1
        BNE.N    ??hw_send_signal_0
//   73 	{
//   74 		if (Signal == 'S')    
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+83
        BNE.N    ??hw_send_signal_1
//   75 		{
//   76 		  i2c0_Start(); //����ģʽѡ��λMST��0��Ϊ1,���Բ�����ʼ�ź�  
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
//   80 		  i2c0_Stop();//����ģʽѡ��λMST��1��Ϊ0,���Բ���ֹͣ�ź�
        LDR.N    R0,??DataTable2_5  ;; 0x40066002
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable2_5  ;; 0x40066002
        STRB     R0,[R1, #+0]
        B.N      ??hw_send_signal_2
//   81 		}
//   82 	}
//   83 	else if(num == I2C1)//ģ��1
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
//   87 		  i2c1_Start(); //����ģʽѡ��λMST��0��Ϊ1,���Բ�����ʼ�ź�  
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
//   91 		  i2c1_Stop();//����ģʽѡ��λMST��1��Ϊ0,���Բ���ֹͣ�ź�
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
//  102 //�������ƣ�hw_wait                                                        
//  103 //���ܸ�Ҫ�� ��ʱ����,ѭ��������Ӧ���־λ,������ɱ�־λ,�ж�MCU         
//  104 //          �Ƿ���յ�Ӧ���źŻ�һ���ֽ��Ƿ����������ϴ������                                            
//  105 //����˵����         MoudleNum:ģ���       
//  106 //             x:x = 'A'(Ack),�ȴ�Ӧ��;x = 'T'(Transmission),�ȴ�һ���ֽ�        
//  107 //                 ���ݴ������                   
//  108 //�������أ�0:�յ�Ӧ���źŻ�һ���ֽڴ������;
//  109 //         1:δ�յ�Ӧ���źŻ�һ�� �ֽ�û������                                                                                                                            
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
//  117     ErrTime = 255*10;            //�����ѯ��ʱʱ��
        MOVW     R1,#+2550
//  118     
//  119     
//  120     //��ȡi2cģ���ַ
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
//  125 		if (x == 'A')           //�ȴ�Ӧ���ź�
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+65
        BNE.N    ??hw_wait_3
//  126 		{
//  127 			  if(( I2C_S_REG(num)  & I2C_S_RXAK_MASK)==0)
        LDRB     R3,[R0, #+3]
        LSLS     R3,R3,#+31
        BMI.N    ??hw_wait_1
//  128 				 return 0;      //������һ���ֽں�,�յ��˴ӻ���Ӧ���ź�               
        MOVS     R0,#+0
        B.N      ??hw_wait_4
//  129 		}
//  130 		else if (x == 'T')      //�ȴ��������һ���ֽ��ź�
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
//  134 				(I2C_S_REG(num) |=(0 | I2C_S_IICIF_MASK));  //��IICIF��־λ
        LDRB     R1,[R0, #+3]
        ORRS     R1,R1,#0x2
        STRB     R1,[R0, #+3]
//  135 				return 0;       //�ɹ�������һ���ֽ�
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
//  140 		return 1;               //��ʱ,û���յ�Ӧ���źŻ�����һ���ֽ�   	
        MOVS     R0,#+1
        B.N      ??hw_wait_4
//  141 }
??hw_wait_5:
??hw_wait_4:
        POP      {R4,PC}          ;; return
//  142 
//  143 
//  144 //============================================================================
//  145 //�������ƣ�hw_iic_read1                                                        
//  146 //���ܸ�Ҫ���Ӵӻ���1���ֽ�����                                            
//  147 //����˵����  MoudleNum:ģ���       
//  148 //          DeviceAddr:�豸��ַ    
//  149 //          AccessAddr:���ʵ�ַ
//  150 //          Data:�����յ���һ���ֽ�����  
//  151 //�������أ�Ϊ0,�ɹ���һ���ֽ�;Ϊ1,��һ���ֽ�ʧ��  
//  152 //����˵��: �ڲ����� hw_send_signal,hw_wait  
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
//  157 	//��ȡi2cģ���ַ
//  158 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        MOVS     R0,R4
        BL       hw_i2c_get_base_address
        MOVS     R7,R0
//  159 	
//  160 	I2C_C1_REG(num)     |= 0x10;           //TX = 1,MCU����Ϊ����ģʽ
        LDRB     R0,[R7, #+2]
        ORRS     R0,R0,#0x10
        STRB     R0,[R7, #+2]
//  161 	hw_send_signal('S',MoudleNum);               //���Ϳ�ʼ�ź� 
        MOVS     R1,R4
        MOVS     R0,#+83
        BL       hw_send_signal
//  162 	I2C_D_REG(num)  = DeviceAddr & 0xfe;   //�����豸��ַ,��֪ͨ�ӻ���������
        ANDS     R0,R5,#0xFE
        STRB     R0,[R7, #+4]
//  163 	 
//  164 	if (hw_wait('T',MoudleNum))                  //�ȴ�һ���ֽ����ݴ������  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_0
//  165 	{      
//  166 
//  167 		return 1;                         //û�д��ͳɹ�,��һ���ֽ�ʧ��   
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  168 	}
//  169 	if (hw_wait('A',MoudleNum))                 //�ȴ��ӻ�Ӧ���ź� 
??hw_iic_read1_0:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_2
//  170 	{
//  171 
//  172 		return 1;                         //û�еȵ�Ӧ���ź�,��һ���ֽ�ʧ�� 
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  173 	}
//  174 	I2C_D_REG(num)  = AccessAddr;        //���ͷ��ʵ�ַ    
??hw_iic_read1_2:
        STRB     R8,[R7, #+4]
//  175 	if (hw_wait('T',MoudleNum))                //�ȴ�һ���ֽ����ݴ������ 
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_3
//  176 	{
//  177 	 
//  178 		return 1;                        //û�д��ͳɹ�,��һ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  179 	}
//  180 	if (hw_wait('A',MoudleNum))                //�ȴ��ӻ�Ӧ���ź�   
??hw_iic_read1_3:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_4
//  181 	{
//  182 	  
//  183 		return 1;                        //û�еȵ�Ӧ���ź�,��һ���ֽ�ʧ��  
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  184 	}
//  185 	I2C_C1_REG(num) |= 0x04;//��MCU������ģ ʽ�£����λд1������һ�����¿�ʼ�ź�  
??hw_iic_read1_4:
        LDRB     R0,[R7, #+2]
        ORRS     R0,R0,#0x4
        STRB     R0,[R7, #+2]
//  186 	I2C_D_REG(num) = DeviceAddr | 0x01; //֪ͨ�ӻ���Ϊ��������    
        ORRS     R0,R5,#0x1
        STRB     R0,[R7, #+4]
//  187 	if (hw_wait('T',MoudleNum))               //�ȴ�һ���ֽ����ݴ������  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_5
//  188 	{
//  189 	 
//  190 		return 1;                       //û�д��ͳɹ�,��һ���ֽ�ʧ�� 
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  191 	}
//  192 	if (hw_wait('A',MoudleNum))               //�ȴ��ӻ�Ӧ���ź�  
??hw_iic_read1_5:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_6
//  193 	{
//  194 	 
//  195 		return 1;                      //û�еȵ�Ӧ���ź�,��һ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  196 	}
//  197 	I2C_C1_REG(num) &= 0xef;           //TX = 0,MCU����Ϊ����ģʽ    
??hw_iic_read1_6:
        LDRB     R0,[R7, #+2]
        ANDS     R0,R0,#0xEF
        STRB     R0,[R7, #+2]
//  198 	*Data = I2C_D_REG(num);            //����IIC1D,׼����������   
        LDRB     R0,[R7, #+4]
        STRB     R0,[R6, #+0]
//  199 	if (hw_wait('T',MoudleNum))              //�ȴ�һ���ֽ����ݴ������  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_7
//  200 	{  
//  201 	 
//  202 		return 1;                      //û�д��ͳɹ�,��һ���ֽ�ʧ��  
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  203 	}
//  204 	hw_send_signal('O',MoudleNum);           //����ֹͣ�ź�    
??hw_iic_read1_7:
        MOVS     R1,R4
        MOVS     R0,#+79
        BL       hw_send_signal
//  205 	*Data = I2C_D_REG(num);            //�������յ���һ������    
        LDRB     R0,[R7, #+4]
        STRB     R0,[R6, #+0]
//  206 	
//  207 	return 0;                          //��ȷ���յ�һ���ֽ�����
        MOVS     R0,#+0
??hw_iic_read1_1:
        POP      {R4-R8,PC}       ;; return
//  208 	
//  209 }
//  210 
//  211 //============================================================================
//  212 //�������ƣ�hw_iic_write1                                                        
//  213 //���ܸ�Ҫ����ӻ�д1���ֽ�����                                           
//  214 //����˵����  MoudleNum:ģ���       
//  215 //          DeviceAddr:�豸��ַ    
//  216 //          AccessAddr:���ʵ�ַ
//  217 //          Data:Ҫ�����ӻ���1���ֽ�����  
//  218 //�������أ�Ϊ0,�ɹ�дһ���ֽ�;Ϊ1,дһ���ֽ�ʧ�� 
//  219 //����˵��: �ڲ����� hw_send_signal,hw_wait  
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
//  224 	//��ȡi2cģ���ַ
//  225 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        MOVS     R0,R4
        BL       hw_i2c_get_base_address
        MOV      R8,R0
//  226 	
//  227 	I2C_C1_REG(num) |= 0x10;             //TX = 1,MCU����Ϊ����ģʽ
        LDRB     R0,[R8, #+2]
        ORRS     R0,R0,#0x10
        STRB     R0,[R8, #+2]
//  228     hw_send_signal('S',MoudleNum);             //���Ϳ�ʼ�ź�
        MOVS     R1,R4
        MOVS     R0,#+83
        BL       hw_send_signal
//  229     I2C_D_REG(num) = DeviceAddr & 0xfe;  //�����豸��ַ,��֪ͨ�ӻ���������
        ANDS     R0,R5,#0xFE
        STRB     R0,[R8, #+4]
//  230     if (hw_wait('T',MoudleNum))                //�ȴ�һ���ֽ����ݴ������
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_0
//  231         return 1;                        //û�д��ͳɹ�,дһ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  232     if (hw_wait('A',MoudleNum))               //�ȴ��ӻ�Ӧ���ź�
??hw_iic_write1_0:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_2
//  233         return 1;                       //û�еȵ�Ӧ���ź�,дһ���ֽ�ʧ��   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  234     I2C_D_REG(num) = AccessAddr;         //���ͷ��ʵ�ַ
??hw_iic_write1_2:
        STRB     R6,[R8, #+4]
//  235     if (hw_wait('T',MoudleNum))               //�ȴ�һ���ֽ����ݴ������
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_3
//  236         return 1;                       //û�д��ͳɹ�,дһ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  237     if (hw_wait('A',MoudleNum))               //�ȴ��ӻ�Ӧ���ź�
??hw_iic_write1_3:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_4
//  238         return 1;                      //û�еȵ�Ӧ���ź�,дһ���ֽ�ʧ��   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  239     I2C_D_REG(num) = Data;             //д����
??hw_iic_write1_4:
        STRB     R7,[R8, #+4]
//  240     if (hw_wait('T',MoudleNum))              //�ȴ�һ���ֽ����ݴ������
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_5
//  241         return 1;                      //û�д��ͳɹ�,дһ���ֽ�ʧ��
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  242     if (hw_wait('A',MoudleNum))              //�ȴ��ӻ�Ӧ���ź�
??hw_iic_write1_5:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_6
//  243         return 1;                      //û�еȵ�Ӧ���ź�,дһ���ֽ�ʧ��   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  244     hw_send_signal('O',MoudleNum);           //����ֹͣ�ź�
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
//  250 //�������ƣ�hw_iic_readn                                                        
//  251 //���ܸ�Ҫ�� �Ӵӻ���N���ֽ�����                                             
//  252 //����˵����  MoudleNum:ģ���       
//  253 //          DeviceAddr:�豸��ַ    
//  254 //          AccessAddr:���ʵ�ַ
//  255 //          Data:�������ݵĻ�����
//  256 //          N:�Ӵӻ������ֽڸ��� 
//  257 //�������أ� Ϊ0,�ɹ���N���ֽ�;Ϊ1,��N���ֽ�ʧ��  
//  258 //����˵��: �ڲ�����hw_iic_read1  
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
        LDR      R4,[SP, #+32]
//  262     uint16 i, j;
//  263     for (i = 0;i < N;i++)
        MOVS     R9,#+0
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
//  265         for(j = 0;j <15*40 ;j++); //��С��ʱ(���͵�ÿ���ֽ�֮��Ҫ��ʱ����)
        MOVS     R0,#+0
        B.N      ??hw_iic_readn_3
??hw_iic_readn_4:
        ADDS     R0,R0,#+1
??hw_iic_readn_3:
        MOV      R1,#+600
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
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
//  267             return 1;             //����һ���ֽ�û�н��յ�,����ʧ�ܱ�־:1
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
//  270         return 0;                 //�ɹ�����N������,���سɹ���־:0
        MOVS     R0,#+0
        B.N      ??hw_iic_readn_5
//  271 }
??hw_iic_readn_6:
??hw_iic_readn_5:
        POP      {R1,R4-R9,PC}    ;; return
//  272 
//  273 
//  274 //============================================================================
//  275 //�������ƣ�hw_iic_writen                                                        
//  276 //���ܸ�Ҫ�� ��ӻ�дN���ֽ�����                                              
//  277 //����˵����  MoudleNum:ģ���       
//  278 //          DeviceAddr:�豸��ַ    
//  279 //          AccessAddr:���ʵ�ַ
//  280 //          Data:Ҫд�������  
//  281 //          N:�Ӵӻ������ֽڸ��� 
//  282 //�������أ� Ϊ0,�ɹ�дN���ֽ�;Ϊ1,дN���ֽ�ʧ��
//  283 //����˵��: �ڲ�����hw_iic_write1   
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
        LDR      R4,[SP, #+32]
//  287     uint16 i, j;
//  288     for (i = 0;i < N;i++)
        MOVS     R9,#+0
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
//  290         for(j = 0;j < 15*40;j++); //��С��ʱ(���͵�ÿ���ֽ�֮��Ҫ��ʱ����)
        MOVS     R0,#+0
        B.N      ??hw_iic_writen_3
??hw_iic_writen_4:
        ADDS     R0,R0,#+1
??hw_iic_writen_3:
        MOV      R1,#+600
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
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
//  292             return 1;            //����һ���ֽ�û�з��ͳ�ȥ,����ʧ�ܱ�־:1
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
//  295         return 0;                //�ɹ�����N������,���سɹ���־:0
        MOVS     R0,#+0
        B.N      ??hw_iic_writen_5
//  296 }
??hw_iic_writen_6:
??hw_iic_writen_5:
        POP      {R1,R4-R9,PC}    ;; return
//  297 //============================================================================
//  298 //�������ƣ�hw_i2c_get_base_address                                                        
//  299 //���ܸ�Ҫ����ȡi2cģ��Ļ�ַ                                                
//  300 //����˵����i2cNO:i2cģ���      
//  301 //�������أ�i2cģ��Ļ�ֵַ                                                                  
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
        DATA
??DataTable2:
        DC32     0x40066000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_1:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_2:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_3:
        DC32     0x4004a004

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_4:
        DC32     0x40066001

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_5:
        DC32     0x40066002

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_6:
        DC32     0x4004b028

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_7:
        DC32     0x4004b02c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_8:
        DC32     0x40067001

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_9:
        DC32     0x40067002

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_10:
        DC32     0x40067000

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
//  316 #endif 
// 
// 944 bytes in section .text
// 
// 944 bytes of CODE memory
//
//Errors: none
//Warnings: 6
