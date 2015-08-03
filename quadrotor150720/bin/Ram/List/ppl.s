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
//    2 //���໷Ƶ��Ϊ50/12*54=225M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    3 void pllinit225M(void)
//    4 {
//    5 	uint32_t temp_reg;
//    6         //ʹ��IO�˿�ʱ��    
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
//   12     //���ﴦ��Ĭ�ϵ�FEIģʽ
//   13     //�����ƶ���FBEģʽ
//   14     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   15     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//   16     //��ʼ��������ͷ�����״̬��������GPIO
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
//   20     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//   21     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//   22     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//   23     
//   24     //�ȴ������ȶ�	    
//   25     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//   26     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//   29     //����FBEģʽ,
//   30     //0x18==25��Ƶ=2M,
//   31     //0x08==15��Ƶ=3.333M 
//   32     //0x09==16��Ƶ=3.125M,
//   33     //0x10==17��Ƶ=2.94M 
//   34     //0x11==18��Ƶ=2.7778M 
//   35     //0x12==19��Ƶ=2.63M,
//   36     //0x13==20��Ƶ=2.5M    
//   37     MCG_C5 = MCG_C5_PRDIV(0x0b);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+11
        STRB     R1,[R0, #+0]
//   38     
//   39     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//   40     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   41     
//   42     //����FMC_PFAPR��ǰ��ֵ
//   43     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//   44     
//   45     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//   46     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//   47                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//   48                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//   49     ///����ϵͳ��Ƶ��
//   50     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/9
//   51     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//   52                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(8);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        MOVS     R2,#+36175872
        STR      R2,[R1, #+0]
//   53     
//   54     //���´�FMC_PFAPR��ԭʼֵ
//   55     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//   56     
//   57     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//   63     //����PBEģʽ    
//   64     //ͨ������CLKSλ������PEEģʽ
//   65     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//   66     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//   67     
//   68     //�ȴ�ʱ��״̬λ����
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
//   72     //���ø���ʱ��Ϊ�ں�ʱ��
//   73     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//   74     //��PTA6������ʹ��TRACE_CLKOU����
//   75     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//   76     //ʹ��FlexBusģ��ʱ��
//   77     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//   78     //��PTA6������ʹ��FB_CLKOUT����
//   79     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//   80 }
        BX       LR               ;; return
//   81 //���໷Ƶ��Ϊ50/13*55=211.538462M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   82 void pllinit211M(void)
//   83 {
//   84 	uint32_t temp_reg;
//   85         //ʹ��IO�˿�ʱ��    
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
//   91     //���ﴦ��Ĭ�ϵ�FEIģʽ
//   92     //�����ƶ���FBEģʽ
//   93     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   94     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//   95     //��ʼ��������ͷ�����״̬��������GPIO
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
//   99     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  100     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  101     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  102     
//  103     //�ȴ������ȶ�	    
//  104     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  105     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  108     //����FBEģʽ,
//  109     //0x18==25��Ƶ=2M,
//  110     //0x08==15��Ƶ=3.333M 
//  111     //0x09==16��Ƶ=3.125M,
//  112     //0x10==17��Ƶ=2.94M 
//  113     //0x11==18��Ƶ=2.7778M 
//  114     //0x12==19��Ƶ=2.63M,
//  115     //0x13==20��Ƶ=2.5M    
//  116     MCG_C5 = MCG_C5_PRDIV(0x0C);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+12
        STRB     R1,[R0, #+0]
//  117     
//  118     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  119     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  120     
//  121     //����FMC_PFAPR��ǰ��ֵ
//  122     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  123     
//  124     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  125     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  126                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  127                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  128     ///����ϵͳ��Ƶ��
//  129     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  130     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  131                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  132     
//  133     //���´�FMC_PFAPR��ԭʼֵ
//  134     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  135     
//  136     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  142     //����PBEģʽ    
//  143     //ͨ������CLKSλ������PEEģʽ
//  144     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  145     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  146     
//  147     //�ȴ�ʱ��״̬λ����
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
//  151     //���ø���ʱ��Ϊ�ں�ʱ��
//  152     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  153     //��PTA6������ʹ��TRACE_CLKOU����
//  154     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  155     //ʹ��FlexBusģ��ʱ��
//  156     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  157     //��PTA6������ʹ��FB_CLKOUT����
//  158     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  159 }
        BX       LR               ;; return
//  160 //���໷Ƶ��Ϊ50/13*54=207.7M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  161 void pllinit207M(void)
//  162 {
//  163 	uint32_t temp_reg;
//  164         //ʹ��IO�˿�ʱ��    
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
//  170     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  171     //�����ƶ���FBEģʽ
//  172     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  173     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  174     //��ʼ��������ͷ�����״̬��������GPIO
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
//  178     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  179     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  180     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  181     
//  182     //�ȴ������ȶ�	    
//  183     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  184     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  187     //����FBEģʽ,
//  188     //0x18==25��Ƶ=2M,
//  189     //0x08==15��Ƶ=3.333M 
//  190     //0x09==16��Ƶ=3.125M,
//  191     //0x10==17��Ƶ=2.94M 
//  192     //0x11==18��Ƶ=2.7778M 
//  193     //0x12==19��Ƶ=2.63M,
//  194     //0x13==20��Ƶ=2.5M    
//  195     MCG_C5 = MCG_C5_PRDIV(0x0C);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+12
        STRB     R1,[R0, #+0]
//  196     
//  197     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  198     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  199     
//  200     //����FMC_PFAPR��ǰ��ֵ
//  201     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  202     
//  203     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  204     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  205                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  206                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  207     ///����ϵͳ��Ƶ��
//  208     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  209     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  210                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  211     
//  212     //���´�FMC_PFAPR��ԭʼֵ
//  213     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  214     
//  215     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  221     //����PBEģʽ    
//  222     //ͨ������CLKSλ������PEEģʽ
//  223     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  224     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  225     
//  226     //�ȴ�ʱ��״̬λ����
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
//  230     //���ø���ʱ��Ϊ�ں�ʱ��
//  231     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  232     //��PTA6������ʹ��TRACE_CLKOU����
//  233     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  234     //ʹ��FlexBusģ��ʱ��
//  235     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  236     //��PTA6������ʹ��FB_CLKOUT����
//  237     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  238 }
        BX       LR               ;; return
//  239 //���໷Ƶ��Ϊ50/15*54=180M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  240 extern void pllinit180M(void)
//  241 {
//  242 	uint32_t temp_reg;
//  243         //ʹ��IO�˿�ʱ��    
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
//  249     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  250     //�����ƶ���FBEģʽ
//  251     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  252     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  253     //��ʼ��������ͷ�����״̬��������GPIO
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
//  257     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  258     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  259     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  260     
//  261     //�ȴ������ȶ�	    
//  262     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  263     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  266     //����FBEģʽ,
//  267     //0x18==25��Ƶ=2M,
//  268     //0x08==15��Ƶ=3.333M 
//  269     //0x09==16��Ƶ=3.125M,
//  270     //0x10==17��Ƶ=2.94M 
//  271     //0x11==18��Ƶ=2.7778M 
//  272     //0x12==19��Ƶ=2.63M,
//  273     //0x13==20��Ƶ=2.5M    
//  274     MCG_C5 = MCG_C5_PRDIV(0x0e);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+14
        STRB     R1,[R0, #+0]
//  275     
//  276     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  277     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  278     
//  279     //����FMC_PFAPR��ǰ��ֵ
//  280     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  281     
//  282     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  283     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  284                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  285                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  286     ///����ϵͳ��Ƶ��
//  287     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  288     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  289                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  290     
//  291     //���´�FMC_PFAPR��ԭʼֵ
//  292     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  293     
//  294     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  300     //����PBEģʽ    
//  301     //ͨ������CLKSλ������PEEģʽ
//  302     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  303     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  304     
//  305     //�ȴ�ʱ��״̬λ����
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
//  309     //���ø���ʱ��Ϊ�ں�ʱ��
//  310     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  311     //��PTA6������ʹ��TRACE_CLKOU����
//  312     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  313     //ʹ��FlexBusģ��ʱ��
//  314     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  315     //��PTA6������ʹ��FB_CLKOUT����
//  316     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  317 }
        BX       LR               ;; return
//  318 
//  319 //���໷Ƶ��Ϊ50/16*54=168.75M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  320 void pllinit168d75M(void)
//  321 {
//  322 	uint32_t temp_reg;
//  323         //ʹ��IO�˿�ʱ��    
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
//  329     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  330     //�����ƶ���FBEģʽ
//  331     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  332     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  333     //��ʼ��������ͷ�����״̬��������GPIO
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
//  337     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  338     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  339     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  340     
//  341     //�ȴ������ȶ�	    
//  342     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  343     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  346     //����FBEģʽ,
//  347     //0x18==25��Ƶ=2M,
//  348     //0x08==15��Ƶ=3.333M 
//  349     //0x09==16��Ƶ=3.125M,
//  350     //0x10==17��Ƶ=2.94M 
//  351     //0x11==18��Ƶ=2.7778M 
//  352     //0x12==19��Ƶ=2.63M,
//  353     //0x13==20��Ƶ=2.5M    
//  354     MCG_C5 = MCG_C5_PRDIV(0x0f);                
        LDR.W    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+15
        STRB     R1,[R0, #+0]
//  355     
//  356     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  357     MCG_C6 = 0x0;
        LDR.W    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  358     
//  359     //����FMC_PFAPR��ǰ��ֵ
//  360     temp_reg = FMC_PFAPR;
        LDR.W    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  361     
//  362     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  363     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  364                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  365                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.W    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  366     ///����ϵͳ��Ƶ��
//  367     //MCG=PLL, core = MCG, bus = MCG/3, FlexBus = MCG/3, Flash clock= MCG/8
//  368     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(2) 
//  369                  | SIM_CLKDIV1_OUTDIV3(2) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable9_4  ;; 0x2270000
        STR      R2,[R1, #+0]
//  370     
//  371     //���´�FMC_PFAPR��ԭʼֵ
//  372     FMC_PFAPR = temp_reg; 
        LDR.W    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  373     
//  374     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  380     //����PBEģʽ    
//  381     //ͨ������CLKSλ������PEEģʽ
//  382     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  383     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.W    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  384     
//  385     //�ȴ�ʱ��״̬λ����
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
//  389     //���ø���ʱ��Ϊ�ں�ʱ��
//  390     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  391     //��PTA6������ʹ��TRACE_CLKOU����
//  392     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  393     //ʹ��FlexBusģ��ʱ��
//  394     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  395     //��PTA6������ʹ��FB_CLKOUT����
//  396     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  397 }
        BX       LR               ;; return
//  398 //���໷Ƶ��Ϊ50/18*54=150M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  399 void pllinit150M(void)
//  400 {
//  401 	uint32_t temp_reg;
//  402         //ʹ��IO�˿�ʱ��    
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
//  408     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  409     //�����ƶ���FBEģʽ
//  410     MCG_C2 = 0;  
        LDR.W    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  411     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  412     //��ʼ��������ͷ�����״̬��������GPIO
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
//  416     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  417     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  418     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.W    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  419     
//  420     //�ȴ������ȶ�	    
//  421     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  422     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  425     //����FBEģʽ,
//  426     //0x18==25��Ƶ=2M,
//  427     //0x11==18��Ƶ=2.7778M 
//  428     //0x12==19��Ƶ=2.63M,
//  429     //0x13==20��Ƶ=2.5M    
//  430     MCG_C5 = MCG_C5_PRDIV(0x11);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+17
        STRB     R1,[R0, #+0]
//  431     
//  432     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  433     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  434     
//  435     //����FMC_PFAPR��ǰ��ֵ
//  436     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  437     
//  438     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  439     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  440                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  441                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  442     ///����ϵͳ��Ƶ��
//  443     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/8
//  444     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  445                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(7);       
        LDR.W    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable11_1  ;; 0x1170000
        STR      R2,[R1, #+0]
//  446     
//  447     //���´�FMC_PFAPR��ԭʼֵ
//  448     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  449     
//  450     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  456     //����PBEģʽ    
//  457     //ͨ������CLKSλ������PEEģʽ
//  458     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  459     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  460     
//  461     //�ȴ�ʱ��״̬λ����
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
//  465     //���ø���ʱ��Ϊ�ں�ʱ��
//  466     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.W    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  467     //��PTA6������ʹ��TRACE_CLKOU����
//  468     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.W    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  469     //ʹ��FlexBusģ��ʱ��
//  470     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.W    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  471     //��PTA6������ʹ��FB_CLKOUT����
//  472     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  473 }
        BX       LR               ;; return
//  474 //���໷Ƶ��Ϊ50/19*55=144.7386421M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  475 void pllinit144M(void)
//  476 {
//  477 	uint32_t temp_reg;
//  478         //ʹ��IO�˿�ʱ��    
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
//  484     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  485     //�����ƶ���FBEģʽ
//  486     MCG_C2 = 0;  
        LDR.N    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  487     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  488     //��ʼ��������ͷ�����״̬��������GPIO
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
//  492     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  493     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  494     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  495     
//  496     //�ȴ������ȶ�	    
//  497     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  498     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  501     //����FBEģʽ,
//  502     //0x18==25��Ƶ=2M,
//  503     //0x11==18��Ƶ=2.7778M 
//  504     //0x12==19��Ƶ=2.63M,
//  505     //0x13==20��Ƶ=2.5M    
//  506     MCG_C5 = MCG_C5_PRDIV(0x12);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+18
        STRB     R1,[R0, #+0]
//  507     
//  508     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  509     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  510     
//  511     //����FMC_PFAPR��ǰ��ֵ
//  512     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  513     
//  514     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  515     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  516                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  517                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  518     ///����ϵͳ��Ƶ��
//  519     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/6
//  520     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  521                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(5);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable11_2  ;; 0x1150000
        STR      R2,[R1, #+0]
//  522     
//  523     //���´�FMC_PFAPR��ԭʼֵ
//  524     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  525     
//  526     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  532     //����PBEģʽ    
//  533     //ͨ������CLKSλ������PEEģʽ
//  534     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  535     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  536     
//  537     //�ȴ�ʱ��״̬λ����
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
//  541     //���ø���ʱ��Ϊ�ں�ʱ��
//  542     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  543     //��PTA6������ʹ��TRACE_CLKOU����
//  544     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  545     //ʹ��FlexBusģ��ʱ��
//  546     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  547     //��PTA6������ʹ��FB_CLKOUT����
//  548     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  549 }
        BX       LR               ;; return
//  550 //���໷Ƶ��Ϊ137.5M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  551 void pllinit1375M(void)
//  552 {
//  553 	uint32_t temp_reg;
//  554         //ʹ��IO�˿�ʱ��    
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
//  560     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  561     //�����ƶ���FBEģʽ
//  562     MCG_C2 = 0;  
        LDR.N    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  563     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  564     //��ʼ��������ͷ�����״̬��������GPIO
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
//  568     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  569     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  570     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  571     
//  572     //�ȴ������ȶ�	    
//  573     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  574     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  577     //����FBEģʽ,
//  578     //0x18==25��Ƶ=2M,
//  579     //0x11==18��Ƶ=2.7778M 
//  580     //0x12==19��Ƶ=2.63M,
//  581     //0x13==20��Ƶ=2.5M    
//  582     MCG_C5 = MCG_C5_PRDIV(0x13);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  583     
//  584     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  585     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  586     
//  587     //����FMC_PFAPR��ǰ��ֵ
//  588     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  589     
//  590     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  591     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  592                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  593                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  594     ///����ϵͳ��Ƶ��
//  595     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/6
//  596     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  597                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(5);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.W    R2,??DataTable11_2  ;; 0x1150000
        STR      R2,[R1, #+0]
//  598     
//  599     //���´�FMC_PFAPR��ԭʼֵ
//  600     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  601     
//  602     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  608     //����PBEģʽ    
//  609     //ͨ������CLKSλ������PEEģʽ
//  610     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  611     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  612     
//  613     //�ȴ�ʱ��״̬λ����
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
//  617     //���ø���ʱ��Ϊ�ں�ʱ��
//  618     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  619     //��PTA6������ʹ��TRACE_CLKOU����
//  620     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  621     //ʹ��FlexBusģ��ʱ��
//  622     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  623     //��PTA6������ʹ��FB_CLKOUT����
//  624     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.W    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  625 }
        BX       LR               ;; return
//  626 //���໷Ƶ��Ϊ125M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  627 void pllinit125M(void)
//  628 {
//  629 	uint32_t temp_reg;
//  630         //ʹ��IO�˿�ʱ��    
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
//  636     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  637     //�����ƶ���FBEģʽ
//  638     MCG_C2 = 0;  
        LDR.N    R0,??DataTable8_1  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  639     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  640     //��ʼ��������ͷ�����״̬��������GPIO
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
//  644     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  645     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  646     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  647     
//  648     //�ȴ������ȶ�	    
//  649     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  650     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  653     //����FBEģʽ,
//  654     //0x18==25��Ƶ=2M,
//  655     //0x11==18��Ƶ=2.7778M 
//  656     //0x12==19��Ƶ=2.63M,
//  657     //0x13==20��Ƶ=2.5M    
//  658     MCG_C5 = MCG_C5_PRDIV(0x13);                
        LDR.N    R0,??DataTable8_6  ;; 0x40064004
        MOVS     R1,#+19
        STRB     R1,[R0, #+0]
//  659     
//  660     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  661     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable8_7  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  662     
//  663     //����FMC_PFAPR��ǰ��ֵ
//  664     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable8_8  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  665     
//  666     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  667     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  668                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  669                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable8_8  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  670     ///����ϵͳ��Ƶ��
//  671     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/6
//  672     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  673                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(5);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.N    R2,??DataTable11_2  ;; 0x1150000
        STR      R2,[R1, #+0]
//  674     
//  675     //���´�FMC_PFAPR��ԭʼֵ
//  676     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable8_8  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  677     
//  678     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  684     //����PBEģʽ    
//  685     //ͨ������CLKSλ������PEEģʽ
//  686     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  687     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable8_4  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable8_4  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  688     
//  689     //�ȴ�ʱ��״̬λ����
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
//  693         //���ø���ʱ��Ϊ�ں�ʱ��
//  694     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  695     //��PTA6������ʹ��TRACE_CLKOU����
//  696     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  697     //ʹ��FlexBusģ��ʱ��
//  698     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  699     //��PTA6������ʹ��FB_CLKOUT����
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
//  703 //���໷Ƶ��Ϊ100M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  704 void pllinit100M(void)
//  705 {
//  706 	uint32_t temp_reg;
//  707         //ʹ��IO�˿�ʱ��    
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
//  713     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  714     //�����ƶ���FBEģʽ
//  715     MCG_C2 = 0;  
        LDR.N    R0,??DataTable11_4  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  716     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  717     //��ʼ��������ͷ�����״̬��������GPIO
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
//  721     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  722     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  723     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  724     
//  725     //�ȴ������ȶ�	    
//  726     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  727     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  730     //����FBEģʽ,
//  731     //0x18==25��Ƶ=2M,
//  732     //0x11==18��Ƶ=2.7778M 
//  733     //0x12==19��Ƶ=2.63M,
//  734     //0x13==20��Ƶ=2.5M    
//  735     MCG_C5 = MCG_C5_PRDIV(0x18);                
        LDR.N    R0,??DataTable11_9  ;; 0x40064004
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  736     
//  737     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  738     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  739     
//  740     //����FMC_PFAPR��ǰ��ֵ
//  741     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable11_11  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  742     
//  743     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  744     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  745                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  746                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable11_11  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  747     ///����ϵͳ��Ƶ��
//  748     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  749     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  750                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(3);       
        LDR.N    R1,??DataTable9  ;; 0x40048044
        LDR.N    R2,??DataTable11_12  ;; 0x1130000
        STR      R2,[R1, #+0]
//  751     
//  752     //���´�FMC_PFAPR��ԭʼֵ
//  753     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  754     
//  755     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  761     //����PBEģʽ    
//  762     //ͨ������CLKSλ������PEEģʽ
//  763     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  764     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable11_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  765     
//  766     //�ȴ�ʱ��״̬λ����
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
//  770         //���ø���ʱ��Ϊ�ں�ʱ��
//  771     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable9_1  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable9_1  ;; 0x40048004
        STR      R0,[R1, #+0]
//  772     //��PTA6������ʹ��TRACE_CLKOU����
//  773     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable9_2  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  774     //ʹ��FlexBusģ��ʱ��
//  775     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable9_3  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable9_3  ;; 0x40048040
        STR      R0,[R1, #+0]
//  776     //��PTA6������ʹ��FB_CLKOUT����
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
//  780 //���໷Ƶ��Ϊ80M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  781 void pllinit80M(void)
//  782 {
//  783 	uint32_t temp_reg;
//  784         //ʹ��IO�˿�ʱ��    
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
//  790     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  791     //�����ƶ���FBEģʽ
//  792     MCG_C2 = 0;  
        LDR.N    R0,??DataTable11_4  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  793     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  794     //��ʼ��������ͷ�����״̬��������GPIO
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
//  798     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  799     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  800     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  801     
//  802     //�ȴ������ȶ�	    
//  803     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  804     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  807     //����FBEģʽ,
//  808     //0x18==25��Ƶ=2M,
//  809     //0x11==18��Ƶ=2.7778M 
//  810     //0x12==19��Ƶ=2.63M,
//  811     //0x13==20��Ƶ=2.5M    
//  812     MCG_C5 = MCG_C5_PRDIV(0x18);                
        LDR.N    R0,??DataTable11_9  ;; 0x40064004
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  813     
//  814     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  815     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  816     
//  817     //����FMC_PFAPR��ǰ��ֵ
//  818     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable11_11  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  819     
//  820     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  821     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  822                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  823                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable11_11  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  824     ///����ϵͳ��Ƶ��
//  825     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  826     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  827                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(3);       
        LDR.N    R1,??DataTable11_13  ;; 0x40048044
        LDR.N    R2,??DataTable11_12  ;; 0x1130000
        STR      R2,[R1, #+0]
//  828     
//  829     //���´�FMC_PFAPR��ԭʼֵ
//  830     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  831     
//  832     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  839     //����PBEģʽ    
//  840     //ͨ������CLKSλ������PEEģʽ
//  841     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  842     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable11_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  843     
//  844     //�ȴ�ʱ��״̬λ����
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
//  848         //���ø���ʱ��Ϊ�ں�ʱ��
//  849     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable11_14  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable11_14  ;; 0x40048004
        STR      R0,[R1, #+0]
//  850     //��PTA6������ʹ��TRACE_CLKOU����
//  851     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable11_15  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  852     //ʹ��FlexBusģ��ʱ��
//  853     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable11_16  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable11_16  ;; 0x40048040
        STR      R0,[R1, #+0]
//  854     //��PTA6������ʹ��FB_CLKOUT����
//  855     PORTC_PCR3 = ( PORT_PCR_MUX(0x5));
        LDR.N    R0,??DataTable11  ;; 0x4004b00c
        MOV      R1,#+1280
        STR      R1,[R0, #+0]
//  856 }
        BX       LR               ;; return
//  857 
//  858 //���໷Ƶ��Ϊ60M���Ժ���

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  859 void pllinit60M(void)
//  860 {
//  861 	uint32_t temp_reg;
//  862         //ʹ��IO�˿�ʱ��    
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
//  868     //���ﴦ��Ĭ�ϵ�FEIģʽ
//  869     //�����ƶ���FBEģʽ
//  870     MCG_C2 = 0;  
        LDR.N    R0,??DataTable11_4  ;; 0x40064001
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  871     //MCG_C2 = MCG_C2_RANGE(2) | MCG_C2_HGO_MASK | MCG_C2_EREFS_MASK;
//  872     //��ʼ��������ͷ�����״̬��������GPIO
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
//  876     //ѡ���ⲿ���񣬲ο���Ƶ������IREFS�������ⲿ����
//  877     //011 If RANGE = 0, Divide Factor is 8; for all other RANGE values, Divide Factor is 256.
//  878     MCG_C1 = MCG_C1_CLKS(2) | MCG_C1_FRDIV(3);
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        MOVS     R1,#+152
        STRB     R1,[R0, #+0]
//  879     
//  880     //�ȴ������ȶ�	    
//  881     //while (!(MCG_S & MCG_S_OSCINIT_MASK)){}              //�ȴ����໷��ʼ������
//  882     while (MCG_S & MCG_S_IREFST_MASK){}                  //�ȴ�ʱ���л����ⲿ�ο�ʱ��
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
//  885     //����FBEģʽ,
//  886     //0x18==25��Ƶ=2M,
//  887     //0x11==18��Ƶ=2.7778M 
//  888     //0x12==19��Ƶ=2.63M,
//  889     //0x13==20��Ƶ=2.5M    
//  890     MCG_C5 = MCG_C5_PRDIV(0x18);                
        LDR.N    R0,??DataTable11_9  ;; 0x40064004
        MOVS     R1,#+24
        STRB     R1,[R0, #+0]
//  891     
//  892     //ȷ��MCG_C6���ڸ�λ״̬����ֹLOLIE��PLL����ʱ�ӿ���������PLL VCO��Ƶ��
//  893     MCG_C6 = 0x0;
        LDR.N    R0,??DataTable11_10  ;; 0x40064005
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  894     
//  895     //����FMC_PFAPR��ǰ��ֵ
//  896     temp_reg = FMC_PFAPR;
        LDR.N    R0,??DataTable11_11  ;; 0x4001f000
        LDR      R0,[R0, #+0]
//  897     
//  898     //ͨ��M&PFD��λM0PFD����ֹԤȡ����
//  899     FMC_PFAPR |= FMC_PFAPR_M7PFD_MASK | FMC_PFAPR_M6PFD_MASK | FMC_PFAPR_M5PFD_MASK
//  900                      | FMC_PFAPR_M4PFD_MASK | FMC_PFAPR_M3PFD_MASK | FMC_PFAPR_M2PFD_MASK
//  901                      | FMC_PFAPR_M1PFD_MASK | FMC_PFAPR_M0PFD_MASK;    
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0xFF0000
        LDR.N    R2,??DataTable11_11  ;; 0x4001f000
        STR      R1,[R2, #+0]
//  902     ///����ϵͳ��Ƶ��
//  903     //MCG=PLL, core = MCG, bus = MCG/2, FlexBus = MCG/2, Flash clock= MCG/4
//  904     SIM_CLKDIV1 = SIM_CLKDIV1_OUTDIV1(0) | SIM_CLKDIV1_OUTDIV2(1) 
//  905                  | SIM_CLKDIV1_OUTDIV3(1) | SIM_CLKDIV1_OUTDIV4(3);       
        LDR.N    R1,??DataTable11_13  ;; 0x40048044
        LDR.N    R2,??DataTable11_12  ;; 0x1130000
        STR      R2,[R1, #+0]
//  906     
//  907     //���´�FMC_PFAPR��ԭʼֵ
//  908     FMC_PFAPR = temp_reg; 
        LDR.N    R1,??DataTable11_11  ;; 0x4001f000
        STR      R0,[R1, #+0]
//  909     
//  910     //����VCO��Ƶ����ʹ��PLLΪ100MHz, LOLIE=0, PLLS=1, CME=0, VDIV=26
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
//  917     //����PBEģʽ    
//  918     //ͨ������CLKSλ������PEEģʽ
//  919     // CLKS=0, FRDIV=3, IREFS=0, IRCLKEN=0, IREFSTEN=0
//  920     MCG_C1 &= ~MCG_C1_CLKS_MASK;
        LDR.N    R0,??DataTable11_7  ;; 0x40064000
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3F
        LDR.N    R1,??DataTable11_7  ;; 0x40064000
        STRB     R0,[R1, #+0]
//  921     
//  922     //�ȴ�ʱ��״̬λ����
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
//  926         //���ø���ʱ��Ϊ�ں�ʱ��
//  927     SIM_SOPT2 |= SIM_SOPT2_TRACECLKSEL_MASK;	
        LDR.N    R0,??DataTable11_14  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.N    R1,??DataTable11_14  ;; 0x40048004
        STR      R0,[R1, #+0]
//  928     //��PTA6������ʹ��TRACE_CLKOU����
//  929     PORTA_PCR6 = ( PORT_PCR_MUX(0x7));  
        LDR.N    R0,??DataTable11_15  ;; 0x40049018
        MOV      R1,#+1792
        STR      R1,[R0, #+0]
//  930     //ʹ��FlexBusģ��ʱ��
//  931     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;
        LDR.N    R0,??DataTable11_16  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable11_16  ;; 0x40048040
        STR      R0,[R1, #+0]
//  932     //��PTA6������ʹ��FB_CLKOUT����
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
