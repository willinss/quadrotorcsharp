///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:15 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\Component_C\ppl.c                   /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\Component_C\ppl.c" -D IAR -D       /
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
//                    28IIC\bin\Ram\List\ppl.s                                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ppl

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

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\Component_C\ppl.c
//    1 #include "ppl.h"
//    2 //锁相环频率为50/12*54=225M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    3 void pllinit225M(void)
//    4 {
//    5 	uint32_t temp_reg;
//    6         //使能IO端口时钟    
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
//   12     //这里处在默认的FEI模式
//   13     //首先移动到FBE模式
//   14     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   15     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//   16     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//   20     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//   21     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//   22     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//   23     
//   24     //等待晶振稳定	    
//   25     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//   26     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//   29     //进入FBE模式,
//   30     //0x18==25分频=2M,
//   31     //0x08==15分频=3.333M 
//   32     //0x09==16分频=3.125M,
//   33     //0x10==17分频=2.94M 
//   34     //0x11==18分频=2.7778M 
//   35     //0x12==19分频=2.63M,
//   36     //0x13==20分频=2.5M    
//   37     MCG_C5 = MCG_C5_PRDIV(0x0b);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+11
        STRB     R1,[R0, #+0]
//   38     
//   39     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//   40     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   41     
//   42     //保存FMC_PFAPR当前的值
//   43     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//   44     
//   45     //通过M&PFD置位M0PFD来禁止预取功能
//   46     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//   47                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//   48                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//   49     ///设置系统分频器
//   50     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/9
//   51     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//   52                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(8);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        MOVS     R2,#+36175872
        STR      R2,[R1, #+0]
//   53     
//   54     //从新存FMC_PFAPR的原始值
//   55     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//   56     
//   57     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//   63     //进入PBE模式    
//   64     //通过清零CLKS位来进入PEE模式
//   65     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//   66     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//   67     
//   68     //等待时钟状态位更新
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
//   72     //设置跟踪时钟为内核时钟
//   73     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//   74     //在PTA6引脚上使能TRACE_CLKOU功能
//   75     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//   76     //使能FlexBus模块时钟
//   77     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//   78     //在PTA6引脚上使能FB_CLKOUT功能
//   79     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//   80 }
        BX       LR               ;; return
//   81 //锁相环频率为50/13*55=211.538462M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   82 void pllinit211M(void)
//   83 {
//   84 	uint32_t temp_reg;
//   85         //使能IO端口时钟    
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
//   91     //这里处在默认的FEI模式
//   92     //首先移动到FBE模式
//   93     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   94     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//   95     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//   99     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  100     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  101     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  102     
//  103     //等待晶振稳定	    
//  104     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  105     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  108     //进入FBE模式,
//  109     //0x18==25分频=2M,
//  110     //0x08==15分频=3.333M 
//  111     //0x09==16分频=3.125M,
//  112     //0x10==17分频=2.94M 
//  113     //0x11==18分频=2.7778M 
//  114     //0x12==19分频=2.63M,
//  115     //0x13==20分频=2.5M    
//  116     MCG_C5 = MCG_C5_PRDIV(0x0C);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+12
        STRB     R1,[R0, #+0]
//  117     
//  118     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  119     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  120     
//  121     //保存FMC_PFAPR当前的值
//  122     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  123     
//  124     //通过M&PFD置位M0PFD来禁止预取功能
//  125     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  126                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  127                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  128     ///设置系统分频器
//  129     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  130     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  131                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  132     
//  133     //从新存FMC_PFAPR的原始值
//  134     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  135     
//  136     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  142     //进入PBE模式    
//  143     //通过清零CLKS位来进入PEE模式
//  144     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  145     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  146     
//  147     //等待时钟状态位更新
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
//  151     //设置跟踪时钟为内核时钟
//  152     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  153     //在PTA6引脚上使能TRACE_CLKOU功能
//  154     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  155     //使能FlexBus模块时钟
//  156     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  157     //在PTA6引脚上使能FB_CLKOUT功能
//  158     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  159 }
        BX       LR               ;; return
//  160 //锁相环频率为50/13*54=207.7M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  161 void pllinit207M(void)
//  162 {
//  163 	uint32_t temp_reg;
//  164         //使能IO端口时钟    
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
//  170     //这里处在默认的FEI模式
//  171     //首先移动到FBE模式
//  172     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  173     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  174     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  178     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  179     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  180     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  181     
//  182     //等待晶振稳定	    
//  183     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  184     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  187     //进入FBE模式,
//  188     //0x18==25分频=2M,
//  189     //0x08==15分频=3.333M 
//  190     //0x09==16分频=3.125M,
//  191     //0x10==17分频=2.94M 
//  192     //0x11==18分频=2.7778M 
//  193     //0x12==19分频=2.63M,
//  194     //0x13==20分频=2.5M    
//  195     MCG_C5 = MCG_C5_PRDIV(0x0C);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+12
        STRB     R1,[R0, #+0]
//  196     
//  197     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  198     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  199     
//  200     //保存FMC_PFAPR当前的值
//  201     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  202     
//  203     //通过M&PFD置位M0PFD来禁止预取功能
//  204     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  205                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  206                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  207     ///设置系统分频器
//  208     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  209     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  210                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  211     
//  212     //从新存FMC_PFAPR的原始值
//  213     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  214     
//  215     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  221     //进入PBE模式    
//  222     //通过清零CLKS位来进入PEE模式
//  223     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  224     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  225     
//  226     //等待时钟状态位更新
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
//  230     //设置跟踪时钟为内核时钟
//  231     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  232     //在PTA6引脚上使能TRACE_CLKOU功能
//  233     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  234     //使能FlexBus模块时钟
//  235     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  236     //在PTA6引脚上使能FB_CLKOUT功能
//  237     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  238 }
        BX       LR               ;; return
//  239 //锁相环频率为50/15*54=180M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  240 extern void pllinit180M(void)
//  241 {
//  242 	uint32_t temp_reg;
//  243         //使能IO端口时钟    
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
//  249     //这里处在默认的FEI模式
//  250     //首先移动到FBE模式
//  251     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  252     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  253     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  257     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  258     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  259     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  260     
//  261     //等待晶振稳定	    
//  262     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  263     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  266     //进入FBE模式,
//  267     //0x18==25分频=2M,
//  268     //0x08==15分频=3.333M 
//  269     //0x09==16分频=3.125M,
//  270     //0x10==17分频=2.94M 
//  271     //0x11==18分频=2.7778M 
//  272     //0x12==19分频=2.63M,
//  273     //0x13==20分频=2.5M    
//  274     MCG_C5 = MCG_C5_PRDIV(0x0e);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+14
        STRB     R1,[R0, #+0]
//  275     
//  276     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  277     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  278     
//  279     //保存FMC_PFAPR当前的值
//  280     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  281     
//  282     //通过M&PFD置位M0PFD来禁止预取功能
//  283     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  284                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  285                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  286     ///设置系统分频器
//  287     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  288     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  289                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  290     
//  291     //从新存FMC_PFAPR的原始值
//  292     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  293     
//  294     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  300     //进入PBE模式    
//  301     //通过清零CLKS位来进入PEE模式
//  302     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  303     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  304     
//  305     //等待时钟状态位更新
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
//  309     //设置跟踪时钟为内核时钟
//  310     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  311     //在PTA6引脚上使能TRACE_CLKOU功能
//  312     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  313     //使能FlexBus模块时钟
//  314     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  315     //在PTA6引脚上使能FB_CLKOUT功能
//  316     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  317 }
        BX       LR               ;; return
//  318 
//  319 //锁相环频率为50/16*54=168.75M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  320 void pllinit168d75M(void)
//  321 {
//  322 	uint32_t temp_reg;
//  323         //使能IO端口时钟    
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
//  329     //这里处在默认的FEI模式
//  330     //首先移动到FBE模式
//  331     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  332     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  333     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  337     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  338     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  339     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  340     
//  341     //等待晶振稳定	    
//  342     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  343     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  346     //进入FBE模式,
//  347     //0x18==25分频=2M,
//  348     //0x08==15分频=3.333M 
//  349     //0x09==16分频=3.125M,
//  350     //0x10==17分频=2.94M 
//  351     //0x11==18分频=2.7778M 
//  352     //0x12==19分频=2.63M,
//  353     //0x13==20分频=2.5M    
//  354     MCG_C5 = MCG_C5_PRDIV(0x0f);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+15
        STRB     R1,[R0, #+0]
//  355     
//  356     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  357     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  358     
//  359     //保存FMC_PFAPR当前的值
//  360     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  361     
//  362     //通过M&PFD置位M0PFD来禁止预取功能
//  363     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  364                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  365                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  366     ///设置系统分频器
//  367     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  368     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  369                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  370     
//  371     //从新存FMC_PFAPR的原始值
//  372     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  373     
//  374     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  380     //进入PBE模式    
//  381     //通过清零CLKS位来进入PEE模式
//  382     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  383     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  384     
//  385     //等待时钟状态位更新
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
//  389     //设置跟踪时钟为内核时钟
//  390     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  391     //在PTA6引脚上使能TRACE_CLKOU功能
//  392     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  393     //使能FlexBus模块时钟
//  394     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  395     //在PTA6引脚上使能FB_CLKOUT功能
//  396     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  397 }
        BX       LR               ;; return
//  398 //锁相环频率为50/18*54=150M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  399 void pllinit150M(void)
//  400 {
//  401 	uint32_t temp_reg;
//  402         //使能IO端口时钟    
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
//  408     //这里处在默认的FEI模式
//  409     //首先移动到FBE模式
//  410     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  411     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  412     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  416     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  417     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  418     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  419     
//  420     //等待晶振稳定	    
//  421     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  422     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  425     //进入FBE模式,
//  426     //0x18==25分频=2M,
//  427     //0x11==18分频=2.7778M 
//  428     //0x12==19分频=2.63M,
//  429     //0x13==20分频=2.5M    
//  430     MCG_C5 = MCG_C5_PRDIV(0x11);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+17
        STRB     R1,[R0, #+0]
//  431     
//  432     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  433     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  434     
//  435     //保存FMC_PFAPR当前的值
//  436     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  437     
//  438     //通过M&PFD置位M0PFD来禁止预取功能
//  439     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  440                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  441                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  442     ///设置系统分频器
//  443     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/8
//  444     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  445                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable11_1  ;; 0x1170000
        STR      R2,[R1, #+0]
//  446     
//  447     //从新存FMC_PFAPR的原始值
//  448     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  449     
//  450     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  456     //进入PBE模式    
//  457     //通过清零CLKS位来进入PEE模式
//  458     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  459     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  460     
//  461     //等待时钟状态位更新
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
//  465     //设置跟踪时钟为内核时钟
//  466     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  467     //在PTA6引脚上使能TRACE_CLKOU功能
//  468     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  469     //使能FlexBus模块时钟
//  470     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  471     //在PTA6引脚上使能FB_CLKOUT功能
//  472     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  473 }
        BX       LR               ;; return
//  474 //锁相环频率为50/19*55=144.7386421M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  475 void pllinit144M(void)
//  476 {
//  477 	uint32_t temp_reg;
//  478         //使能IO端口时钟    
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
//  484     //这里处在默认的FEI模式
//  485     //首先移动到FBE模式
//  486     MCG_C2 = 0;  
        LDR.N    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  487     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  488     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  492     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  493     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  494     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  495     
//  496     //等待晶振稳定	    
//  497     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  498     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  501     //进入FBE模式,
//  502     //0x18==25分频=2M,
//  503     //0x11==18分频=2.7778M 
//  504     //0x12==19分频=2.63M,
//  505     //0x13==20分频=2.5M    
//  506     MCG_C5 = MCG_C5_PRDIV(0x12);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+18
        STRB     R1,[R0, #+0]
//  507     
//  508     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  509     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  510     
//  511     //保存FMC_PFAPR当前的值
//  512     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  513     
//  514     //通过M&PFD置位M0PFD来禁止预取功能
//  515     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  516                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  517                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  518     ///设置系统分频器
//  519     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/6
//  520     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  521                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(5);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable11_2  ;; 0x1150000
        STR      R2,[R1, #+0]
//  522     
//  523     //从新存FMC_PFAPR的原始值
//  524     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  525     
//  526     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  532     //进入PBE模式    
//  533     //通过清零CLKS位来进入PEE模式
//  534     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  535     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  536     
//  537     //等待时钟状态位更新
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
//  541     //设置跟踪时钟为内核时钟
//  542     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  543     //在PTA6引脚上使能TRACE_CLKOU功能
//  544     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  545     //使能FlexBus模块时钟
//  546     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  547     //在PTA6引脚上使能FB_CLKOUT功能
//  548     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  549 }
        BX       LR               ;; return
//  550 //锁相环频率为137.5M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  551 void pllinit1375M(void)
//  552 {
//  553 	uint32_t temp_reg;
//  554         //使能IO端口时钟    
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
//  560     //这里处在默认的FEI模式
//  561     //首先移动到FBE模式
//  562     MCG_C2 = 0;  
        LDR.N    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  563     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  564     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  568     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  569     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  570     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  571     
//  572     //等待晶振稳定	    
//  573     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  574     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  577     //进入FBE模式,
//  578     //0x18==25分频=2M,
//  579     //0x11==18分频=2.7778M 
//  580     //0x12==19分频=2.63M,
//  581     //0x13==20分频=2.5M    
//  582     MCG_C5 = MCG_C5_PRDIV(0x13);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  583     
//  584     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  585     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  586     
//  587     //保存FMC_PFAPR当前的值
//  588     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  589     
//  590     //通过M&PFD置位M0PFD来禁止预取功能
//  591     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  592                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  593                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  594     ///设置系统分频器
//  595     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/6
//  596     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  597                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(5);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable11_2  ;; 0x1150000
        STR      R2,[R1, #+0]
//  598     
//  599     //从新存FMC_PFAPR的原始值
//  600     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  601     
//  602     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  608     //进入PBE模式    
//  609     //通过清零CLKS位来进入PEE模式
//  610     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  611     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  612     
//  613     //等待时钟状态位更新
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
//  617     //设置跟踪时钟为内核时钟
//  618     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  619     //在PTA6引脚上使能TRACE_CLKOU功能
//  620     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  621     //使能FlexBus模块时钟
//  622     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  623     //在PTA6引脚上使能FB_CLKOUT功能
//  624     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  625 }
        BX       LR               ;; return
//  626 //锁相环频率为125M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  627 void pllinit125M(void)
//  628 {
//  629 	uint32_t temp_reg;
//  630         //使能IO端口时钟    
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
//  636     //这里处在默认的FEI模式
//  637     //首先移动到FBE模式
//  638     MCG_C2 = 0;  
        LDR.N    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  639     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  640     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  644     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  645     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  646     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  647     
//  648     //等待晶振稳定	    
//  649     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  650     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  653     //进入FBE模式,
//  654     //0x18==25分频=2M,
//  655     //0x11==18分频=2.7778M 
//  656     //0x12==19分频=2.63M,
//  657     //0x13==20分频=2.5M    
//  658     MCG_C5 = MCG_C5_PRDIV(0x13);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  659     
//  660     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  661     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  662     
//  663     //保存FMC_PFAPR当前的值
//  664     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  665     
//  666     //通过M&PFD置位M0PFD来禁止预取功能
//  667     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  668                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  669                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  670     ///设置系统分频器
//  671     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/6
//  672     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  673                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(5);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.N    R2,??DataTable11_2  ;; 0x1150000
        STR      R2,[R1, #+0]
//  674     
//  675     //从新存FMC_PFAPR的原始值
//  676     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  677     
//  678     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  684     //进入PBE模式    
//  685     //通过清零CLKS位来进入PEE模式
//  686     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  687     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  688     
//  689     //等待时钟状态位更新
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
//  693         //设置跟踪时钟为内核时钟
//  694     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  695     //在PTA6引脚上使能TRACE_CLKOU功能
//  696     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  697     //使能FlexBus模块时钟
//  698     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  699     //在PTA6引脚上使能FB_CLKOUT功能
//  700     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  701 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8_1:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8_2:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8_3:
        DC32     0x4007c008

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8_4:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8_5:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8_6:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8_7:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable8_8:
        DC32     0x4001f000
//  702 
//  703 //锁相环频率为100M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  704 void pllinit100M(void)
//  705 {
//  706 	uint32_t temp_reg;
//  707         //使能IO端口时钟    
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
//  713     //这里处在默认的FEI模式
//  714     //首先移动到FBE模式
//  715     MCG_C2 = 0;  
        LDR.N    R0,??DataTable11_4  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  716     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  717     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  721     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  722     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  723     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  724     
//  725     //等待晶振稳定	    
//  726     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  727     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  730     //进入FBE模式,
//  731     //0x18==25分频=2M,
//  732     //0x11==18分频=2.7778M 
//  733     //0x12==19分频=2.63M,
//  734     //0x13==20分频=2.5M    
//  735     MCG_C5 = MCG_C5_PRDIV(0x18);                
        LDR.N    R0,??DataTable11_9  ;; 0x40064004
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  736     
//  737     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  738     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  739     
//  740     //保存FMC_PFAPR当前的值
//  741     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable11_11  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  742     
//  743     //通过M&PFD置位M0PFD来禁止预取功能
//  744     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  745                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  746                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable11_11  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  747     ///设置系统分频器
//  748     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  749     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  750                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(3);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.N    R2,??DataTable11_12  ;; 0x1130000
        STR      R2,[R1, #+0]
//  751     
//  752     //从新存FMC_PFAPR的原始值
//  753     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  754     
//  755     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  761     //进入PBE模式    
//  762     //通过清零CLKS位来进入PEE模式
//  763     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  764     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable11_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  765     
//  766     //等待时钟状态位更新
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
//  770         //设置跟踪时钟为内核时钟
//  771     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  772     //在PTA6引脚上使能TRACE_CLKOU功能
//  773     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  774     //使能FlexBus模块时钟
//  775     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  776     //在PTA6引脚上使能FB_CLKOUT功能
//  777     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  778 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable9:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable9_1:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable9_2:
        DC32     0x40049018

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable9_3:
        DC32     0x40048040

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable9_4:
        DC32     0x2270000
//  779 
//  780 //锁相环频率为80M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  781 void pllinit80M(void)
//  782 {
//  783 	uint32_t temp_reg;
//  784         //使能IO端口时钟    
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
//  790     //这里处在默认的FEI模式
//  791     //首先移动到FBE模式
//  792     MCG_C2 = 0;  
        LDR.N    R0,??DataTable11_4  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  793     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  794     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  798     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  799     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  800     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  801     
//  802     //等待晶振稳定	    
//  803     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  804     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  807     //进入FBE模式,
//  808     //0x18==25分频=2M,
//  809     //0x11==18分频=2.7778M 
//  810     //0x12==19分频=2.63M,
//  811     //0x13==20分频=2.5M    
//  812     MCG_C5 = MCG_C5_PRDIV(0x18);                
        LDR.N    R0,??DataTable11_9  ;; 0x40064004
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  813     
//  814     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  815     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  816     
//  817     //保存FMC_PFAPR当前的值
//  818     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable11_11  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  819     
//  820     //通过M&PFD置位M0PFD来禁止预取功能
//  821     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  822                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  823                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable11_11  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  824     ///设置系统分频器
//  825     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  826     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  827                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(3);       
        LDR.N    R1,??DataTable11_13  ;; 0x40048044
        LDR.N    R2,??DataTable11_12  ;; 0x1130000
        STR      R2,[R1, #+0]
//  828     
//  829     //从新存FMC_PFAPR的原始值
//  830     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  831     
//  832     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  839     //进入PBE模式    
//  840     //通过清零CLKS位来进入PEE模式
//  841     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  842     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable11_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  843     
//  844     //等待时钟状态位更新
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
//  848         //设置跟踪时钟为内核时钟
//  849     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable11_14  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable11_14  ;; 0x40048004
        STR      R0,[R1, #+0]
//  850     //在PTA6引脚上使能TRACE_CLKOU功能
//  851     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable11_15  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  852     //使能FlexBus模块时钟
//  853     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable11_16  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable11_16  ;; 0x40048040
        STR      R0,[R1, #+0]
//  854     //在PTA6引脚上使能FB_CLKOUT功能
//  855     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  856 }
        BX       LR               ;; return
//  857 
//  858 //锁相环频率为60M测试函数

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  859 void pllinit60M(void)
//  860 {
//  861 	uint32_t temp_reg;
//  862         //使能IO端口时钟    
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
//  868     //这里处在默认的FEI模式
//  869     //首先移动到FBE模式
//  870     MCG_C2 = 0;  
        LDR.N    R0,??DataTable11_4  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  871     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  872     //初始化晶振后释放锁定状态的振荡器和GPIO
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
//  876     //选择外部晶振，参考分频器，清IREFS来启动外部晶振
//  877     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  878     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  879     
//  880     //等待晶振稳定	    
//  881     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //等待锁相环初始化结束
//  882     while (MCG_S & MCG_S_IREFST_MASK){}                  //等待时钟切换到外部参考时钟
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
//  885     //进入FBE模式,
//  886     //0x18==25分频=2M,
//  887     //0x11==18分频=2.7778M 
//  888     //0x12==19分频=2.63M,
//  889     //0x13==20分频=2.5M    
//  890     MCG_C5 = MCG_C5_PRDIV(0x18);                
        LDR.N    R0,??DataTable11_9  ;; 0x40064004
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  891     
//  892     //确保MCG_C6处于复位状态，禁止LOLIE、PLL、和时钟控制器，清PLL VCO分频器
//  893     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  894     
//  895     //保存FMC_PFAPR当前的值
//  896     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable11_11  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  897     
//  898     //通过M&PFD置位M0PFD来禁止预取功能
//  899     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  900                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  901                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable11_11  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  902     ///设置系统分频器
//  903     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  904     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  905                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(3);       
        LDR.N    R1,??DataTable11_13  ;; 0x40048044
        LDR.N    R2,??DataTable11_12  ;; 0x1130000
        STR      R2,[R1, #+0]
//  906     
//  907     //从新存FMC_PFAPR的原始值
//  908     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  909     
//  910     //设置VCO分频器，使能PLL为100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  917     //进入PBE模式    
//  918     //通过清零CLKS位来进入PEE模式
//  919     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  920     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable11_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  921     
//  922     //等待时钟状态位更新
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
//  926         //设置跟踪时钟为内核时钟
//  927     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable11_14  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable11_14  ;; 0x40048004
        STR      R0,[R1, #+0]
//  928     //在PTA6引脚上使能TRACE_CLKOU功能
//  929     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable11_15  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  930     //使能FlexBus模块时钟
//  931     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable11_16  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable11_16  ;; 0x40048040
        STR      R0,[R1, #+0]
//  932     //在PTA6引脚上使能FB_CLKOUT功能
//  933     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  934 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_1:
        DC32     0x1170000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_2:
        DC32     0x1150000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_3:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_4:
        DC32     0x40064001

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_5:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_6:
        DC32     0x4007c008

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_7:
        DC32     0x40064000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_8:
        DC32     0x40064006

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_9:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_10:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_11:
        DC32     0x4001f000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_12:
        DC32     0x1130000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_13:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_14:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_15:
        DC32     0x40049018

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable11_16:
        DC32     0x40048040

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
// 
// 2 844 bytes in section .text
// 
// 2 844 bytes of CODE memory
//
//Errors: none
//Warnings: none
