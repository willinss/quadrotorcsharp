///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:14 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\Component_C\ftm.c                   /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\Component_C\ftm.c" -D IAR -D       /
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
//                    28IIC\bin\Ram\List\ftm.s                                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ftm

        EXTERN __aeabi_d2iz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_ui2d

        PUBLIC hw_FTM_init
        PUBLIC set_pwm

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\Component_C\ftm.c
//    1 #include "ftm.h"
//    2 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    3 void hw_FTM_init(void)
//    4     { PORTA_PCR12 = PORT_PCR_MUX(3); 
hw_FTM_init:
        LDR.N    R0,??DataTable1  ;; 0x40049030
        MOV      R1,#+768
        STR      R1,[R0, #+0]
//    5       PORTA_PCR13 = PORT_PCR_MUX(3);
        LDR.N    R0,??DataTable1_1  ;; 0x40049034
        MOV      R1,#+768
        STR      R1,[R0, #+0]
//    6       PORTB_PCR18 = PORT_PCR_MUX(3); 
        LDR.N    R0,??DataTable1_2  ;; 0x4004a048
        MOV      R1,#+768
        STR      R1,[R0, #+0]
//    7       PORTB_PCR19 = PORT_PCR_MUX(3);
        LDR.N    R0,??DataTable1_3  ;; 0x4004a04c
        MOV      R1,#+768
        STR      R1,[R0, #+0]
//    8       
//    9       SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
        LDR.N    R0,??DataTable1_4  ;; 0x40048038
        LDR      R0,[R0, #+0]
        MOV      R1,#+512
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable1_4  ;; 0x40048038
        STR      R0,[R1, #+0]
//   10       SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;         //使能FTM时钟      
        LDR.N    R0,??DataTable1_5  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable1_5  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   11       SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;
        LDR.N    R0,??DataTable1_6  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable1_6  ;; 0x40048030
        STR      R0,[R1, #+0]
//   12       
//   13       FTM1_C0SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable1_7  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable1_7  ;; 0x4003900c
        STR      R0,[R1, #+0]
//   14       FTM1_C0SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable1_7  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable1_7  ;; 0x4003900c
        STR      R0,[R1, #+0]
//   15       FTM1_C0SC |= FTM_CnSC_MSB_MASK;   
        LDR.N    R0,??DataTable1_7  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable1_7  ;; 0x4003900c
        STR      R0,[R1, #+0]
//   16       FTM1_C1SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable1_8  ;; 0x40039014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable1_8  ;; 0x40039014
        STR      R0,[R1, #+0]
//   17       FTM1_C1SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable1_8  ;; 0x40039014
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable1_8  ;; 0x40039014
        STR      R0,[R1, #+0]
//   18       FTM1_C1SC |= FTM_CnSC_MSB_MASK;  
        LDR.N    R0,??DataTable1_8  ;; 0x40039014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable1_8  ;; 0x40039014
        STR      R0,[R1, #+0]
//   19       FTM1_SC = 0x2D; //not enable the interrupt mask,up-down counting mode,System clock,Divide by 32            
        LDR.N    R0,??DataTable1_9  ;; 0x40039000
        MOVS     R1,#+45
        STR      R1,[R0, #+0]
//   20       
//   21       FTM2_C0SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable1_10  ;; 0x400b800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable1_10  ;; 0x400b800c
        STR      R0,[R1, #+0]
//   22       FTM2_C0SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable1_10  ;; 0x400b800c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable1_10  ;; 0x400b800c
        STR      R0,[R1, #+0]
//   23       FTM2_C0SC |= FTM_CnSC_MSB_MASK;   
        LDR.N    R0,??DataTable1_10  ;; 0x400b800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable1_10  ;; 0x400b800c
        STR      R0,[R1, #+0]
//   24       FTM2_C1SC |= FTM_CnSC_ELSB_MASK;
        LDR.N    R0,??DataTable1_11  ;; 0x400b8014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable1_11  ;; 0x400b8014
        STR      R0,[R1, #+0]
//   25       FTM2_C1SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.N    R0,??DataTable1_11  ;; 0x400b8014
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable1_11  ;; 0x400b8014
        STR      R0,[R1, #+0]
//   26       FTM2_C1SC |= FTM_CnSC_MSB_MASK;  
        LDR.N    R0,??DataTable1_11  ;; 0x400b8014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable1_11  ;; 0x400b8014
        STR      R0,[R1, #+0]
//   27       FTM2_SC = 0x2D; //not enable the interrupt mask,up-down counting mode,System clock,Divide by 32            
        LDR.N    R0,??DataTable1_12  ;; 0x400b8000
        MOVS     R1,#+45
        STR      R1,[R0, #+0]
//   28             
//   29       
//   30       FTM1_MODE |= FTM_MODE_WPDIS_MASK;      
        LDR.N    R0,??DataTable1_13  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable1_13  ;; 0x40039054
        STR      R0,[R1, #+0]
//   31 
//   32       FTM1_MODE &= ~1;
        LDR.N    R0,??DataTable1_13  ;; 0x40039054
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable1_13  ;; 0x40039054
        STR      R0,[R1, #+0]
//   33       
//   34       FTM2_MODE |= FTM_MODE_WPDIS_MASK;      
        LDR.N    R0,??DataTable1_14  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable1_14  ;; 0x400b8054
        STR      R0,[R1, #+0]
//   35 
//   36             FTM2_MODE &= ~1;
        LDR.N    R0,??DataTable1_14  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable1_14  ;; 0x400b8054
        STR      R0,[R1, #+0]
//   37      // FTM1_OUTMASK=0XFE;   //0 Channel output is not masked. It continues to operate normally.
//   38                            //1 Channel output is masked. It is forced to its inactive state.
//   39       
//   40       FTM1_COMBINE=0;      //Function for Linked Channels (FTMx_COMBINE)
        LDR.N    R0,??DataTable1_15  ;; 0x40039064
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   41       FTM1_OUTINIT=0;
        LDR.N    R0,??DataTable1_16  ;; 0x4003905c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   42       FTM1_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
        LDR.N    R0,??DataTable1_17  ;; 0x4003906c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   43       FTM1_POL=0;          //Channels Polarity (FTMx_POL)
        LDR.N    R0,??DataTable1_18  ;; 0x40039070
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   44                            //0 The channel polarity is active high.
//   45                            //1 The channel polarity is active low.  
//   46       FTM2_COMBINE=0;      //Function for Linked Channels (FTMx_COMBINE)
        LDR.N    R0,??DataTable1_19  ;; 0x400b8064
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   47       FTM2_OUTINIT=0;
        LDR.N    R0,??DataTable1_20  ;; 0x400b805c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   48       FTM2_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
        LDR.N    R0,??DataTable1_21  ;; 0x400b806c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   49       FTM2_POL=0;          //Channels Polarity (FTMx_POL)
        LDR.N    R0,??DataTable1_22  ;; 0x400b8070
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   50                                  //0 The channel polarity is active high.
//   51                                  //1 The channel polarity is active low.  
//   52       FTM1_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;
        LDR.N    R0,??DataTable1_23  ;; 0x40039080
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable1_23  ;; 0x40039080
        STR      R0,[R1, #+0]
//   53       FTM1_INVCTRL=0;     //反转控制
        LDR.N    R0,??DataTable1_24  ;; 0x40039090
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   54       FTM1_SWOCTRL=0;     //软件输出控制F TM Software Output Control (FTMx_SWOCTRL)
        LDR.N    R0,??DataTable1_25  ;; 0x40039094
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   55       FTM1_PWMLOAD=0;     //FTM PWM Load
        LDR.N    R0,??DataTable1_26  ;; 0x40039098
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   56                           //BIT9: 0 Loading updated values is disabled.
//   57                           //1 Loading updated values is enabled.
//   58       FTM2_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;
        LDR.N    R0,??DataTable1_27  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable1_27  ;; 0x400b8080
        STR      R0,[R1, #+0]
//   59       FTM2_INVCTRL=0;     //反转控制
        LDR.N    R0,??DataTable1_28  ;; 0x400b8090
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   60       FTM2_SWOCTRL=0;     //软件输出控制F TM Software Output Control (FTMx_SWOCTRL)
        LDR.N    R0,??DataTable1_29  ;; 0x400b8094
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   61       FTM2_PWMLOAD=0;     //FTM PWM Load
        LDR.N    R0,??DataTable1_30  ;; 0x400b8098
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   62                                 //BIT9: 0 Loading updated values is disabled.
//   63                                 //1 Loading updated values is enabled.
//   64       FTM1_CNTIN=0;        //Counter Initial Value      
        LDR.N    R0,??DataTable1_31  ;; 0x4003904c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   65       FTM1_MOD=15000;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001) 
        LDR.N    R0,??DataTable1_32  ;; 0x40039008
        MOVW     R1,#+15000
        STR      R1,[R0, #+0]
//   66                            //采用龙丘时钟初始化函数，可以得到4分频的频率，例如：系统60M频率时，PWM频率是15M,以此类推
//   67                            //PMW频率=系统频率/4/(2^FTM1_SC_PS)/FTM1_MOD
//   68                            //PMW频率=125M/4/(2^5)/19531=125000000/4/32/19531=50hz
//   69       //PMW分频=125M/4/(2^5)=976562.5=1M,一个脉冲是1us,1500个脉冲就是1.5ms
//   70       FTM2_CNTIN=0;        //Counter Initial Value      
        LDR.N    R0,??DataTable1_33  ;; 0x400b804c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   71       FTM2_MOD=15000;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001) 
        LDR.N    R0,??DataTable1_34  ;; 0x400b8008
        MOVW     R1,#+15000
        STR      R1,[R0, #+0]
//   72                                 //采用龙丘时钟初始化函数，可以得到4分频的频率，例如：系统60M频率时，PWM频率是15M,以此类推
//   73                                 //PMW频率=系统频率/4/(2^FTM1_SC_PS)/FTM1_MOD
//   74                                 //PMW频率=180M/4/(2^5)/28125=180000000/4/32/28125=50hz
//   75            //PMW分频=125M/4/(2^5)=976562.5=1M,一个脉冲是1us,1500个脉冲就是1.5ms
//   76       FTM1_C0V= (int)(1000 / 1.3333) ;       //设置 the pulse width(duty cycle) is determined by (CnV - CNTIN).
        LDR.N    R0,??DataTable1_35  ;; 0x40039010
        MOVW     R1,#+750
        STR      R1,[R0, #+0]
//   77       FTM1_C1V= (int)(1000 / 1.3333) ; 
        LDR.N    R0,??DataTable1_36  ;; 0x40039018
        MOVW     R1,#+750
        STR      R1,[R0, #+0]
//   78       FTM1_CNT=0;          //只有低16位可用
        LDR.N    R0,??DataTable1_37  ;; 0x40039004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   79       
//   80       FTM2_C0V= (int)(1000 / 1.3333);        //设置 the pulse width(duty cycle) is determined by (CnV - CNTIN).
        LDR.N    R0,??DataTable1_38  ;; 0x400b8010
        MOVW     R1,#+750
        STR      R1,[R0, #+0]
//   81       FTM2_C1V= (int)(1000 / 1.3333); 
        LDR.N    R0,??DataTable1_39  ;; 0x400b8018
        MOVW     R1,#+750
        STR      R1,[R0, #+0]
//   82       FTM2_CNT=0;          //只有低16位可用
        LDR.N    R0,??DataTable1_40  ;; 0x400b8004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   83 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 void set_pwm(uint16 a,uint16 b,uint16 c,uint16 d)
//   85 {     FTM1_C0V = (int)(a / 1.3333);       //设置 the pulse width(duty cycle) is determined by (CnV - CNTIN).
set_pwm:
        PUSH     {R4-R6,LR}
        MOVS     R4,R1
        MOVS     R6,R2
        MOVS     R5,R3
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable1_41  ;; 0x617c1bda
        LDR.N    R3,??DataTable1_42  ;; 0x3ff55532
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable1_35  ;; 0x40039010
        STR      R0,[R1, #+0]
//   86       FTM1_C1V = (int)(b / 1.3333);
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,R4
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable1_41  ;; 0x617c1bda
        LDR.N    R3,??DataTable1_42  ;; 0x3ff55532
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable1_36  ;; 0x40039018
        STR      R0,[R1, #+0]
//   87       FTM2_C0V = (int)(c / 1.3333);       //设置 the pulse width(duty cycle) is determined by (CnV - CNTIN).
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable1_41  ;; 0x617c1bda
        LDR.N    R3,??DataTable1_42  ;; 0x3ff55532
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable1_38  ;; 0x400b8010
        STR      R0,[R1, #+0]
//   88       FTM2_C1V = (int)(d / 1.3333);
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,R5
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable1_41  ;; 0x617c1bda
        LDR.N    R3,??DataTable1_42  ;; 0x3ff55532
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable1_39  ;; 0x400b8018
        STR      R0,[R1, #+0]
//   89 }
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1:
        DC32     0x40049030

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_1:
        DC32     0x40049034

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_2:
        DC32     0x4004a048

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_3:
        DC32     0x4004a04c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_4:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_5:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_6:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_7:
        DC32     0x4003900c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_8:
        DC32     0x40039014

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_9:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_10:
        DC32     0x400b800c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_11:
        DC32     0x400b8014

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_12:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_13:
        DC32     0x40039054

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_14:
        DC32     0x400b8054

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_15:
        DC32     0x40039064

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_16:
        DC32     0x4003905c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_17:
        DC32     0x4003906c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_18:
        DC32     0x40039070

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_19:
        DC32     0x400b8064

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_20:
        DC32     0x400b805c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_21:
        DC32     0x400b806c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_22:
        DC32     0x400b8070

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_23:
        DC32     0x40039080

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_24:
        DC32     0x40039090

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_25:
        DC32     0x40039094

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_26:
        DC32     0x40039098

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_27:
        DC32     0x400b8080

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_28:
        DC32     0x400b8090

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_29:
        DC32     0x400b8094

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_30:
        DC32     0x400b8098

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_31:
        DC32     0x4003904c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_32:
        DC32     0x40039008

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_33:
        DC32     0x400b804c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_34:
        DC32     0x400b8008

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_35:
        DC32     0x40039010

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_36:
        DC32     0x40039018

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_37:
        DC32     0x40039004

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_38:
        DC32     0x400b8010

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_39:
        DC32     0x400b8018

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_40:
        DC32     0x400b8004

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_41:
        DC32     0x617c1bda

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable1_42:
        DC32     0x3ff55532

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
// 
// 732 bytes in section .text
// 
// 732 bytes of CODE memory
//
//Errors: none
//Warnings: none
