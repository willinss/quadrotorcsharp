///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:14 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\Component_C\hw_gpio.c               /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\Component_C\hw_gpio.c" -D IAR -D   /
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
//                    28IIC\bin\Ram\List\hw_gpio.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME hw_gpio

        PUBLIC hw_gpio_get
        PUBLIC hw_gpio_init
        PUBLIC hw_gpio_reverse
        PUBLIC hw_gpio_set

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\Component_C\hw_gpio.c
//    1 //===========================================================================
//    2 //文件名称：hw_gpio.c
//    3 //功能概要：K60 GPIO底层驱动程序文件
//    4 //===========================================================================
//    5 
//    6 #include "hw_gpio.h"
//    7 
//    8 //=================内部函数声明===============================================
//    9 
//   10 //===========================================================================
//   11 //函数名称：hw_gpio_get_port_addr
//   12 //函数返回：端口号对应的端口寄存器组指针
//   13 //参数说明：无
//   14 //功能概要：将端口号转换成端口寄存器组指针。内部调用。
//   15 //===========================================================================
//   16 static PORT_MemMapPtr hw_gpio_get_port_addr(uint8 port);
//   17 
//   18 //===========================================================================
//   19 //函数名称：hw_gpio_get_pt_addr
//   20 //函数返回：端口号对应的GPIO端口寄存器组指针
//   21 //参数说明：无
//   22 //功能概要：将端口号转换成端口寄存器组指针。内部调用。
//   23 //============================================================================
//   24 static GPIO_MemMapPtr hw_gpio_get_pt_addr(uint8 port);
//   25 
//   26 //===========================================================================
//   27 
//   28 
//   29 //=================接口函数实现===============================================
//   30 
//   31 //===========================================================================
//   32 //函数名称：hw_gpio_init
//   33 //函数返回：函数执行状态。0=成功，其它为异常。
//   34 //参数说明：port：端口号。由宏定义。
//   35 //          pin：引脚号。0～31。
//   36 //          dir：引脚方向。 1=输出，0=输入。
//   37 //          state：引脚初始状态。1=高电平，0=低电平
//   38 //功能概要：初始化端口作为GPIO引脚的功能。
//   39 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   40 uint8 hw_gpio_init(uint8 port, uint8 pin, uint8 dir, uint8 state)
//   41 {
hw_gpio_init:
        PUSH     {R4-R8,LR}
        MOVS     R7,R0
        MOVS     R4,R1
        MOV      R8,R2
        MOVS     R5,R3
//   42     //将GPIO端口号转换成端口寄存器组指针
//   43     GPIO_MemMapPtr pt = hw_gpio_get_pt_addr(port);
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_pt_addr
        MOVS     R6,R0
//   44     PORT_MemMapPtr p  = hw_gpio_get_port_addr(port);
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_port_addr
//   45     
//   46     if (!p) return 1;  //参数错误
        CMP      R0,#+0
        BNE.N    ??hw_gpio_init_0
        MOVS     R0,#+1
        B.N      ??hw_gpio_init_1
//   47      
//   48     //设定通用端口引脚控制寄存器的值，设定为GPIO功能
//   49     PORT_PCR_REG(p, pin) = (0|PORT_PCR_MUX(1));
??hw_gpio_init_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOV      R1,#+256
        STR      R1,[R0, R4, LSL #+2]
//   50 
//   51     if(dir == 1) //若引脚被定义为输出
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??hw_gpio_init_2
//   52     {
//   53         GPIO_PDDR_REG(pt) |= (1<<pin);
        LDR      R0,[R6, #+20]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        ORRS     R0,R1,R0
        STR      R0,[R6, #+20]
//   54     	 
//   55     	  //设定引脚初始化状态
//   56         if(state == 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??hw_gpio_init_3
//   57 		    BSET(pin, GPIO_PDOR_REG(pt));
        LDR      R0,[R6, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        ORRS     R0,R1,R0
        STR      R0,[R6, #+0]
        B.N      ??hw_gpio_init_4
//   58         else
//   59         	BCLR(pin, GPIO_PDOR_REG(pt));
??hw_gpio_init_3:
        LDR      R0,[R6, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        BICS     R0,R0,R1
        STR      R0,[R6, #+0]
        B.N      ??hw_gpio_init_4
//   60     }
//   61     else //若引脚被定义为输入 
//   62     {
//   63     	BCLR(pin, GPIO_PDDR_REG(pt));
??hw_gpio_init_2:
        LDR      R0,[R6, #+20]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        BICS     R0,R0,R1
        STR      R0,[R6, #+20]
//   64     }
//   65 
//   66     return 0;  //成功返回
??hw_gpio_init_4:
        MOVS     R0,#+0
??hw_gpio_init_1:
        POP      {R4-R8,PC}       ;; return
//   67 }
//   68 
//   69 //===========================================================================
//   70 //函数名称：hw_gpio_set
//   71 //函数返回：无
//   72 //参数说明：port：端口号。由宏定义。
//   73 //          pin：引脚号。0～31。
//   74 //          state：引脚初始状态。1=高电平，0=低电平
//   75 //功能概要：获取指定引脚状态。
//   76 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   77 void hw_gpio_set(uint8 port, uint8 pin, uint8 state)
//   78 {
hw_gpio_set:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//   79     //将GPIO端口号转换成端口寄存器组指针
//   80     GPIO_MemMapPtr pt = hw_gpio_get_pt_addr(port);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_pt_addr
//   81 	  
//   82 	if (state == 0) //控制为低电平
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??hw_gpio_set_0
//   83         BCLR(pin, GPIO_PDOR_REG(pt));
        LDR      R1,[R0, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R4
        BICS     R1,R1,R2
        STR      R1,[R0, #+0]
        B.N      ??hw_gpio_set_1
//   84     else            //控制为高电平
//   85         BSET(pin, GPIO_PDOR_REG(pt));
??hw_gpio_set_0:
        LDR      R1,[R0, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R4
        ORRS     R1,R2,R1
        STR      R1,[R0, #+0]
//   86 }
??hw_gpio_set_1:
        POP      {R0,R4,R5,PC}    ;; return
//   87 
//   88 //===========================================================================
//   89 //函数名称：hw_gpio_get
//   90 //函数返回：指定引脚状态。0=低电平，1=高电平。
//   91 //参数说明：port：端口号。由宏定义。
//   92 //          pin：引脚号。0～31。
//   93 //功能概要：获取指定引脚状态。
//   94 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   95 uint8 hw_gpio_get(uint8 port, uint8 pin)
//   96 {
hw_gpio_get:
        PUSH     {R4,LR}
        MOVS     R4,R1
//   97 	uint8 i; 
//   98 	//将GPIO端口号转换成端口寄存器组指针
//   99 	GPIO_MemMapPtr pt = hw_gpio_get_pt_addr(port);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_pt_addr
//  100 	//查看引脚状态
//  101 	i = BGET(pin, GPIO_PDIR_REG(pt));
        LDR      R0,[R0, #+16]
        LSRS     R0,R0,R4
        ANDS     R0,R0,#0x1
//  102 	return i;     //返回引脚状态（0或1）
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//  103 }
//  104 
//  105 //===========================================================================
//  106 //函数名称：hw_gpio_reverse
//  107 //函数返回：无
//  108 //参数说明：port：端口号。由宏定义。
//  109 //          pin：引脚号。0～31。
//  110 //功能概要：反转指定引脚状态。
//  111 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 void hw_gpio_reverse(uint8 port, uint8 pin)
//  113 {
hw_gpio_reverse:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  114     //将GPIO端口号转换成端口寄存器组指针
//  115     GPIO_MemMapPtr pt = hw_gpio_get_pt_addr(port);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_pt_addr
//  116 	//设置输出取反寄存器的相应位为1，反转指定引脚状态  
//  117     BSET(pin, GPIO_PTOR_REG(pt));
        LDR      R1,[R0, #+12]
        MOVS     R2,#+1
        LSLS     R2,R2,R4
        ORRS     R1,R2,R1
        STR      R1,[R0, #+12]
//  118 }
        POP      {R4,PC}          ;; return
//  119 
//  120 
//  121 //=================内部函数实现===============================================
//  122 //===========================================================================
//  123 //函数名称：hw_gpio_get_port_addr
//  124 //函数返回：端口号对应的端口寄存器组指针
//  125 //参数说明：无
//  126 //功能概要：将端口号转换成端口寄存器组指针。内部调用。
//  127 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  128 PORT_MemMapPtr hw_gpio_get_port_addr (uint8 port)
//  129 {
//  130 	PORT_MemMapPtr p;
//  131     
//  132     switch(port)
hw_gpio_get_port_addr:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??hw_gpio_get_port_addr_0
        CMP      R0,#+2
        BEQ.N    ??hw_gpio_get_port_addr_1
        BCC.N    ??hw_gpio_get_port_addr_2
        CMP      R0,#+4
        BEQ.N    ??hw_gpio_get_port_addr_3
        BCC.N    ??hw_gpio_get_port_addr_4
        B.N      ??hw_gpio_get_port_addr_5
//  133     {
//  134     case PORT_A:
//  135         p = PORTA_BASE_PTR;
??hw_gpio_get_port_addr_0:
        LDR.N    R0,??DataTable1  ;; 0x40049000
//  136         break;
//  137     case PORT_B:
//  138         p = PORTB_BASE_PTR;
//  139         break;
//  140     case PORT_C:
//  141         p = PORTC_BASE_PTR;
//  142         break;
//  143     case PORT_D:
//  144         p = PORTD_BASE_PTR;
//  145         break;
//  146     case PORT_E:
//  147         p = PORTE_BASE_PTR;
//  148         break;
//  149     default:
//  150         return 0; //输入参数无效返回
//  151     }
//  152     
//  153     return p;
??hw_gpio_get_port_addr_6:
??hw_gpio_get_port_addr_7:
        BX       LR               ;; return
??hw_gpio_get_port_addr_2:
        LDR.N    R0,??DataTable1_1  ;; 0x4004a000
        B.N      ??hw_gpio_get_port_addr_6
??hw_gpio_get_port_addr_1:
        LDR.N    R0,??DataTable1_2  ;; 0x4004b000
        B.N      ??hw_gpio_get_port_addr_6
??hw_gpio_get_port_addr_4:
        LDR.N    R0,??DataTable1_3  ;; 0x4004c000
        B.N      ??hw_gpio_get_port_addr_6
??hw_gpio_get_port_addr_3:
        LDR.N    R0,??DataTable1_4  ;; 0x4004d000
        B.N      ??hw_gpio_get_port_addr_6
??hw_gpio_get_port_addr_5:
        MOVS     R0,#+0
        B.N      ??hw_gpio_get_port_addr_7
//  154 }
//  155 
//  156 //===========================================================================
//  157 //函数名称：hw_gpio_get_pt_addr
//  158 //函数返回：端口号对应的GPIO端口寄存器组指针
//  159 //参数说明：无
//  160 //功能概要：将端口号转换成端口寄存器组指针。内部调用。
//  161 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  162 GPIO_MemMapPtr hw_gpio_get_pt_addr(uint8 port)
//  163 {
//  164 	GPIO_MemMapPtr p;
//  165     
//  166     switch(port)
hw_gpio_get_pt_addr:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??hw_gpio_get_pt_addr_0
        CMP      R0,#+2
        BEQ.N    ??hw_gpio_get_pt_addr_1
        BCC.N    ??hw_gpio_get_pt_addr_2
        CMP      R0,#+4
        BEQ.N    ??hw_gpio_get_pt_addr_3
        BCC.N    ??hw_gpio_get_pt_addr_4
        B.N      ??hw_gpio_get_pt_addr_5
//  167     {
//  168     case PORT_A:
//  169         p = PTA_BASE_PTR;
??hw_gpio_get_pt_addr_0:
        LDR.N    R0,??DataTable1_5  ;; 0x400ff000
//  170         break;
//  171     case PORT_B:
//  172         p = PTB_BASE_PTR;
//  173         break;
//  174     case PORT_C:
//  175         p = PTC_BASE_PTR;
//  176         break;
//  177     case PORT_D:
//  178         p = PTD_BASE_PTR;
//  179         break;
//  180     case PORT_E:
//  181         p = PTE_BASE_PTR;
//  182         break;
//  183     default:
//  184         return 0; //输入参数无效返回
//  185     }
//  186     
//  187     return p;
??hw_gpio_get_pt_addr_6:
??hw_gpio_get_pt_addr_7:
        BX       LR               ;; return
??hw_gpio_get_pt_addr_2:
        LDR.N    R0,??DataTable1_6  ;; 0x400ff040
        B.N      ??hw_gpio_get_pt_addr_6
??hw_gpio_get_pt_addr_1:
        LDR.N    R0,??DataTable1_7  ;; 0x400ff080
        B.N      ??hw_gpio_get_pt_addr_6
??hw_gpio_get_pt_addr_4:
        LDR.N    R0,??DataTable1_8  ;; 0x400ff0c0
        B.N      ??hw_gpio_get_pt_addr_6
??hw_gpio_get_pt_addr_3:
        LDR.N    R0,??DataTable1_9  ;; 0x400ff100
        B.N      ??hw_gpio_get_pt_addr_6
??hw_gpio_get_pt_addr_5:
        MOVS     R0,#+0
        B.N      ??hw_gpio_get_pt_addr_7
//  188 }

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_1:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_2:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_3:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_4:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_5:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_6:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_7:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_8:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_9:
        DC32     0x400ff100

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
//  189 
//  190 //===========================================================================
// 
// 328 bytes in section .text
// 
// 328 bytes of CODE memory
//
//Errors: none
//Warnings: none
