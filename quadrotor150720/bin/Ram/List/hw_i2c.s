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
//    2 //文件名称：hw_i2c.h  
//    3 //功能概要：uart构件头文件
//    4 //版权所有：苏州大学飞思卡尔嵌入式中心(sumcu.suda.edu.cn)
//    5 //版本更新：2011-11-17     V1.0       stone    编写了K60的i2c驱动
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
//   16 //函数名称：hw_i2c_init                                                        
//   17 //功能概要：初始化IICX模块。                                                
//   18 //参数说明：MoudleNum:模块号                                                         
//   19 //函数返回：无                                                                  
//   20 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void hw_i2c_init(int MoudleNum)
//   22 {
hw_i2c_init:
        PUSH     {R7,LR}
//   23 	//获取i2c模块基址
//   24 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        BL       hw_i2c_get_base_address
//   25 	
//   26 	if(num == I2C0)
        LDR.W    R1,??DataTable2  ;; 0x40066000
        CMP      R0,R1
        BNE.N    ??hw_i2c_init_0
//   27 	{
//   28 		//打开I2C0模块时钟
//   29 		SIM_SCGC4 |= SIM_SCGC4_I2C0_MASK; 
        LDR.W    R0,??DataTable2_1  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.W    R1,??DataTable2_1  ;; 0x40048034
        STR      R0,[R1, #+0]
//   30 		//配置引脚复用为I2C0功能
//   31 		//I2C0 SCL使用PTD8
//   32 		//I2C0 SDA使用PTD9
//   33 		PORTB_PCR0 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_2  ;; 0x4004a000
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   34 		PORTB_PCR1 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_3  ;; 0x4004a004
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   35 		//设置 MULT 和 ICR   
//   36 		//芯片手册推荐设置100K以减小MCU负载
//   37 		//k60的MCU总线频率为48M，在总线上分频
//   38 		I2C0_F  = 0x65;   
        LDR.W    R0,??DataTable2_4  ;; 0x40066001
        MOVS     R1,#+101
        STRB     R1,[R0, #+0]
//   39 		//使能I2C0，不发送应答信号
//   40 		I2C0_C1 = I2C_C1_IICEN_MASK | I2C_C1_TXAK_MASK;      
        LDR.W    R0,??DataTable2_5  ;; 0x40066002
        MOVS     R1,#+136
        STRB     R1,[R0, #+0]
        B.N      ??hw_i2c_init_1
//   41 	}
//   42 	else
//   43 	{
//   44 		//打开I2C1模块时钟
//   45 		SIM_SCGC4 |= SIM_SCGC4_I2C1_MASK; 
??hw_i2c_init_0:
        LDR.W    R0,??DataTable2_1  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable2_1  ;; 0x40048034
        STR      R0,[R1, #+0]
//   46 		//配置引脚复用为I2C1功能
//   47 		//I2C1 SCL使用PTC10
//   48 		//I2C1 SDA使用PTC11
//   49 		PORTC_PCR10 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_6  ;; 0x4004b028
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   50 		PORTC_PCR11 = PORT_PCR_MUX(2);
        LDR.W    R0,??DataTable2_7  ;; 0x4004b02c
        MOV      R1,#+512
        STR      R1,[R0, #+0]
//   51 		//设置 MULT 和 ICR   
//   52 		//芯片手册推荐设置100K以减小MCU负载
//   53 		//k60的MCU总线频率为48M，在总线上分频
//   54 		I2C1_F  = 0x65;   
        LDR.N    R0,??DataTable2_8  ;; 0x40067001
        MOVS     R1,#+101
        STRB     R1,[R0, #+0]
//   55 		//使能I2C1，不发送应答信号
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
//   61 //函数名称：hw_send_signal                                                        
//   62 //功能概要：根据需要产生开始或停止信号   。                                                
//   63 //参数说明：         MoudleNum:模块号       
//   64 //          Signal: 'S'(Start),产生开始信号      'O'(Over),  产生停止信号               
//   65 //函数返回：无                                                                  
//   66 //============================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   67 void hw_send_signal(uint8 Signal,int MoudleNum)
//   68 {
hw_send_signal:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R1
//   69 	//获取i2c模块基址
//   70 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        BL       hw_i2c_get_base_address
//   71 	
//   72 	if(num == I2C0)//模块0
        LDR.N    R1,??DataTable2  ;; 0x40066000
        CMP      R0,R1
        BNE.N    ??hw_send_signal_0
//   73 	{
//   74 		if (Signal == 'S')    
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+83
        BNE.N    ??hw_send_signal_1
//   75 		{
//   76 		  i2c0_Start(); //主机模式选择位MST由0变为1,可以产生开始信号  
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
//   80 		  i2c0_Stop();//主机模式选择位MST由1变为0,可以产生停止信号
        LDR.N    R0,??DataTable2_5  ;; 0x40066002
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable2_5  ;; 0x40066002
        STRB     R0,[R1, #+0]
        B.N      ??hw_send_signal_2
//   81 		}
//   82 	}
//   83 	else if(num == I2C1)//模块1
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
//   87 		  i2c1_Start(); //主机模式选择位MST由0变为1,可以产生开始信号  
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
//   91 		  i2c1_Stop();//主机模式选择位MST由1变为0,可以产生停止信号
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
//  102 //函数名称：hw_wait                                                        
//  103 //功能概要： 在时限内,循环检测接收应答标志位,或传送完成标志位,判断MCU         
//  104 //          是否接收到应答信号或一个字节是否已在总线上传送完毕                                            
//  105 //参数说明：         MoudleNum:模块号       
//  106 //             x:x = 'A'(Ack),等待应答;x = 'T'(Transmission),等待一个字节        
//  107 //                 数据传输完成                   
//  108 //函数返回：0:收到应答信号或一个字节传送完毕;
//  109 //         1:未收到应答信号或一个 字节没传送完                                                                                                                            
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
//  117     ErrTime = 255*10;            //定义查询超时时限
        MOVW     R1,#+2550
//  118     
//  119     
//  120     //获取i2c模块基址
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
//  125 		if (x == 'A')           //等待应答信号
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+65
        BNE.N    ??hw_wait_3
//  126 		{
//  127 			  if(( I2C_S_REG(num)  & I2C_S_RXAK_MASK)==0)
        LDRB     R3,[R0, #+3]
        LSLS     R3,R3,#+31
        BMI.N    ??hw_wait_1
//  128 				 return 0;      //传送完一个字节后,收到了从机的应答信号               
        MOVS     R0,#+0
        B.N      ??hw_wait_4
//  129 		}
//  130 		else if (x == 'T')      //等待传送完成一个字节信号
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
//  134 				(I2C_S_REG(num) |=(0 | I2C_S_IICIF_MASK));  //清IICIF标志位
        LDRB     R1,[R0, #+3]
        ORRS     R1,R1,#0x2
        STRB     R1,[R0, #+3]
//  135 				return 0;       //成功发送完一个字节
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
//  140 		return 1;               //超时,没有收到应答信号或发送完一个字节   	
        MOVS     R0,#+1
        B.N      ??hw_wait_4
//  141 }
??hw_wait_5:
??hw_wait_4:
        POP      {R4,PC}          ;; return
//  142 
//  143 
//  144 //============================================================================
//  145 //函数名称：hw_iic_read1                                                        
//  146 //功能概要：从从机读1个字节数据                                            
//  147 //参数说明：  MoudleNum:模块号       
//  148 //          DeviceAddr:设备地址    
//  149 //          AccessAddr:访问地址
//  150 //          Data:带回收到的一个字节数据  
//  151 //函数返回：为0,成功读一个字节;为1,读一个字节失败  
//  152 //函数说明: 内部调用 hw_send_signal,hw_wait  
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
//  157 	//获取i2c模块基址
//  158 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        MOVS     R0,R4
        BL       hw_i2c_get_base_address
        MOVS     R7,R0
//  159 	
//  160 	I2C_C1_REG(num)     |= 0x10;           //TX = 1,MCU设置为发送模式
        LDRB     R0,[R7, #+2]
        ORRS     R0,R0,#0x10
        STRB     R0,[R7, #+2]
//  161 	hw_send_signal('S',MoudleNum);               //发送开始信号 
        MOVS     R1,R4
        MOVS     R0,#+83
        BL       hw_send_signal
//  162 	I2C_D_REG(num)  = DeviceAddr & 0xfe;   //发送设备地址,并通知从机接收数据
        ANDS     R0,R5,#0xFE
        STRB     R0,[R7, #+4]
//  163 	 
//  164 	if (hw_wait('T',MoudleNum))                  //等待一个字节数据传送完成  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_0
//  165 	{      
//  166 
//  167 		return 1;                         //没有传送成功,读一个字节失败   
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  168 	}
//  169 	if (hw_wait('A',MoudleNum))                 //等待从机应答信号 
??hw_iic_read1_0:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_2
//  170 	{
//  171 
//  172 		return 1;                         //没有等到应答信号,读一个字节失败 
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  173 	}
//  174 	I2C_D_REG(num)  = AccessAddr;        //发送访问地址    
??hw_iic_read1_2:
        STRB     R8,[R7, #+4]
//  175 	if (hw_wait('T',MoudleNum))                //等待一个字节数据传送完成 
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_3
//  176 	{
//  177 	 
//  178 		return 1;                        //没有传送成功,读一个字节失败
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  179 	}
//  180 	if (hw_wait('A',MoudleNum))                //等待从机应答信号   
??hw_iic_read1_3:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_4
//  181 	{
//  182 	  
//  183 		return 1;                        //没有等到应答信号,读一个字节失败  
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  184 	}
//  185 	I2C_C1_REG(num) |= 0x04;//当MCU在主机模 式下，向该位写1将产生一个重新开始信号  
??hw_iic_read1_4:
        LDRB     R0,[R7, #+2]
        ORRS     R0,R0,#0x4
        STRB     R0,[R7, #+2]
//  186 	I2C_D_REG(num) = DeviceAddr | 0x01; //通知从机改为发送数据    
        ORRS     R0,R5,#0x1
        STRB     R0,[R7, #+4]
//  187 	if (hw_wait('T',MoudleNum))               //等待一个字节数据传送完成  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_5
//  188 	{
//  189 	 
//  190 		return 1;                       //没有传送成功,读一个字节失败 
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  191 	}
//  192 	if (hw_wait('A',MoudleNum))               //等待从机应答信号  
??hw_iic_read1_5:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_6
//  193 	{
//  194 	 
//  195 		return 1;                      //没有等到应答信号,读一个字节失败
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  196 	}
//  197 	I2C_C1_REG(num) &= 0xef;           //TX = 0,MCU设置为接收模式    
??hw_iic_read1_6:
        LDRB     R0,[R7, #+2]
        ANDS     R0,R0,#0xEF
        STRB     R0,[R7, #+2]
//  198 	*Data = I2C_D_REG(num);            //读出IIC1D,准备接收数据   
        LDRB     R0,[R7, #+4]
        STRB     R0,[R6, #+0]
//  199 	if (hw_wait('T',MoudleNum))              //等待一个字节数据传送完成  
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_read1_7
//  200 	{  
//  201 	 
//  202 		return 1;                      //没有传送成功,读一个字节失败  
        MOVS     R0,#+1
        B.N      ??hw_iic_read1_1
//  203 	}
//  204 	hw_send_signal('O',MoudleNum);           //发送停止信号    
??hw_iic_read1_7:
        MOVS     R1,R4
        MOVS     R0,#+79
        BL       hw_send_signal
//  205 	*Data = I2C_D_REG(num);            //读出接收到的一个数据    
        LDRB     R0,[R7, #+4]
        STRB     R0,[R6, #+0]
//  206 	
//  207 	return 0;                          //正确接收到一个字节数据
        MOVS     R0,#+0
??hw_iic_read1_1:
        POP      {R4-R8,PC}       ;; return
//  208 	
//  209 }
//  210 
//  211 //============================================================================
//  212 //函数名称：hw_iic_write1                                                        
//  213 //功能概要：向从机写1个字节数据                                           
//  214 //参数说明：  MoudleNum:模块号       
//  215 //          DeviceAddr:设备地址    
//  216 //          AccessAddr:访问地址
//  217 //          Data:要发给从机的1个字节数据  
//  218 //函数返回：为0,成功写一个字节;为1,写一个字节失败 
//  219 //函数说明: 内部调用 hw_send_signal,hw_wait  
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
//  224 	//获取i2c模块基址
//  225 	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
        MOVS     R0,R4
        BL       hw_i2c_get_base_address
        MOV      R8,R0
//  226 	
//  227 	I2C_C1_REG(num) |= 0x10;             //TX = 1,MCU设置为发送模式
        LDRB     R0,[R8, #+2]
        ORRS     R0,R0,#0x10
        STRB     R0,[R8, #+2]
//  228     hw_send_signal('S',MoudleNum);             //发送开始信号
        MOVS     R1,R4
        MOVS     R0,#+83
        BL       hw_send_signal
//  229     I2C_D_REG(num) = DeviceAddr & 0xfe;  //发送设备地址,并通知从机接收数据
        ANDS     R0,R5,#0xFE
        STRB     R0,[R8, #+4]
//  230     if (hw_wait('T',MoudleNum))                //等待一个字节数据传送完成
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_0
//  231         return 1;                        //没有传送成功,写一个字节失败
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  232     if (hw_wait('A',MoudleNum))               //等待从机应答信号
??hw_iic_write1_0:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_2
//  233         return 1;                       //没有等到应答信号,写一个字节失败   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  234     I2C_D_REG(num) = AccessAddr;         //发送访问地址
??hw_iic_write1_2:
        STRB     R6,[R8, #+4]
//  235     if (hw_wait('T',MoudleNum))               //等待一个字节数据传送完成
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_3
//  236         return 1;                       //没有传送成功,写一个字节失败
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  237     if (hw_wait('A',MoudleNum))               //等待从机应答信号
??hw_iic_write1_3:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_4
//  238         return 1;                      //没有等到应答信号,写一个字节失败   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  239     I2C_D_REG(num) = Data;             //写数据
??hw_iic_write1_4:
        STRB     R7,[R8, #+4]
//  240     if (hw_wait('T',MoudleNum))              //等待一个字节数据传送完成
        MOVS     R1,R4
        MOVS     R0,#+84
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_5
//  241         return 1;                      //没有传送成功,写一个字节失败
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  242     if (hw_wait('A',MoudleNum))              //等待从机应答信号
??hw_iic_write1_5:
        MOVS     R1,R4
        MOVS     R0,#+65
        BL       hw_wait
        CMP      R0,#+0
        BEQ.N    ??hw_iic_write1_6
//  243         return 1;                      //没有等到应答信号,写一个字节失败   
        MOVS     R0,#+1
        B.N      ??hw_iic_write1_1
//  244     hw_send_signal('O',MoudleNum);           //发送停止信号
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
//  250 //函数名称：hw_iic_readn                                                        
//  251 //功能概要： 从从机读N个字节数据                                             
//  252 //参数说明：  MoudleNum:模块号       
//  253 //          DeviceAddr:设备地址    
//  254 //          AccessAddr:访问地址
//  255 //          Data:读出数据的缓冲区
//  256 //          N:从从机读的字节个数 
//  257 //函数返回： 为0,成功读N个字节;为1,读N个字节失败  
//  258 //函数说明: 内部调用hw_iic_read1  
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
//  265         for(j = 0;j <15*40 ;j++); //最小延时(发送的每个字节之间要有时间间隔)
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
//  267             return 1;             //其中一个字节没有接收到,返回失败标志:1
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
//  270         return 0;                 //成功接收N个数据,返回成功标志:0
        MOVS     R0,#+0
        B.N      ??hw_iic_readn_5
//  271 }
??hw_iic_readn_6:
??hw_iic_readn_5:
        POP      {R1,R4-R9,PC}    ;; return
//  272 
//  273 
//  274 //============================================================================
//  275 //函数名称：hw_iic_writen                                                        
//  276 //功能概要： 向从机写N个字节数据                                              
//  277 //参数说明：  MoudleNum:模块号       
//  278 //          DeviceAddr:设备地址    
//  279 //          AccessAddr:访问地址
//  280 //          Data:要写入的数据  
//  281 //          N:从从机读的字节个数 
//  282 //函数返回： 为0,成功写N个字节;为1,写N个字节失败
//  283 //函数说明: 内部调用hw_iic_write1   
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
//  290         for(j = 0;j < 15*40;j++); //最小延时(发送的每个字节之间要有时间间隔)
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
//  292             return 1;            //其中一个字节没有发送出去,返回失败标志:1
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
//  295         return 0;                //成功发送N个数据,返回成功标志:0
        MOVS     R0,#+0
        B.N      ??hw_iic_writen_5
//  296 }
??hw_iic_writen_6:
??hw_iic_writen_5:
        POP      {R1,R4-R9,PC}    ;; return
//  297 //============================================================================
//  298 //函数名称：hw_i2c_get_base_address                                                        
//  299 //功能概要：获取i2c模块的基址                                                
//  300 //参数说明：i2cNO:i2c模块号      
//  301 //函数返回：i2c模块的基址值                                                                  
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
