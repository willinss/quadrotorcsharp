///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:10 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥µ /
//                    (∏ƒI2C)\src\Sources\C\Component_C\ftm.c                 /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\src\Sources\C\Component_C\ftm.c" -D IAR -D     /
//                    TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quadrotor15 /
//                    0720∑…––∆˜∏˙ÀÊ–°≥µ(∏ƒI2C)\bin\Flash\List\" -lB          /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\bin\Flash\List\" -o                            /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\bin\Flash\Obj\" --no_cse --no_unroll           /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "E:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.4\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\src\Sources\H\" -I                             /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\src\Sources\H\Component_H\" -I                 /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥ /
//                    µ(∏ƒI2C)\src\Sources\H\Frame_H\" -Ol --use_c++_inline   /
//    List file    =  C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥µ /
//                    (∏ƒI2C)\bin\Flash\List\ftm.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ftm

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_d2iz
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_ui2d
        EXTERN periph_clk_khz

        PUBLIC LPLD_FTM0_MOD
        PUBLIC LPLD_FTM1_MOD
        PUBLIC LPLD_FTM2_MOD
        PUBLIC SteerPWM_init
        PUBLIC ftm0_pwm_change_duty
        PUBLIC ftm0_pwm_init
        PUBLIC ftm0_pwm_open
        PUBLIC hw_FTM_init
        PUBLIC set_pwm

// C:\Users\Thinkpad\Desktop\quadrotor150720∑…––∆˜∏˙ÀÊ–°≥µ(∏ƒI2C)\src\Sources\C\Component_C\ftm.c
//    1 #include "ftm.h"
//    2 #include "sysinit.h"	
//    3 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    4 void hw_FTM_init(void)
//    5     { PORTA_PCR12 = PORT_PCR_MUX(3); 
hw_FTM_init:
        LDR.W    R0,??DataTable4  ;; 0x40049030
        MOV      R1,#+768
        STR      R1,[R0, #+0]
//    6       PORTA_PCR13 = PORT_PCR_MUX(3);
        LDR.W    R0,??DataTable4_1  ;; 0x40049034
        MOV      R1,#+768
        STR      R1,[R0, #+0]
//    7       PORTB_PCR18 = PORT_PCR_MUX(3); 
        LDR.W    R0,??DataTable4_2  ;; 0x4004a048
        MOV      R1,#+768
        STR      R1,[R0, #+0]
//    8       PORTB_PCR19 = PORT_PCR_MUX(3);
        LDR.W    R0,??DataTable4_3  ;; 0x4004a04c
        MOV      R1,#+768
        STR      R1,[R0, #+0]
//    9       
//   10       SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
        LDR.W    R0,??DataTable4_4  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x200
        LDR.W    R1,??DataTable4_4  ;; 0x40048038
        STR      R0,[R1, #+0]
//   11       SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;         // πƒ‹FTM ±÷”      
        LDR.W    R0,??DataTable4_5  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable4_5  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   12       SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;
        LDR.W    R0,??DataTable4_6  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable4_6  ;; 0x40048030
        STR      R0,[R1, #+0]
//   13       
//   14       FTM1_C0SC |= FTM_CnSC_ELSB_MASK;
        LDR.W    R0,??DataTable4_7  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable4_7  ;; 0x4003900c
        STR      R0,[R1, #+0]
//   15       FTM1_C0SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.W    R0,??DataTable4_7  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_7  ;; 0x4003900c
        STR      R0,[R1, #+0]
//   16       FTM1_C0SC |= FTM_CnSC_MSB_MASK;   
        LDR.W    R0,??DataTable4_7  ;; 0x4003900c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable4_7  ;; 0x4003900c
        STR      R0,[R1, #+0]
//   17       FTM1_C1SC |= FTM_CnSC_ELSB_MASK;
        LDR.W    R0,??DataTable4_8  ;; 0x40039014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable4_8  ;; 0x40039014
        STR      R0,[R1, #+0]
//   18       FTM1_C1SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.W    R0,??DataTable4_8  ;; 0x40039014
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_8  ;; 0x40039014
        STR      R0,[R1, #+0]
//   19       FTM1_C1SC |= FTM_CnSC_MSB_MASK;  
        LDR.W    R0,??DataTable4_8  ;; 0x40039014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable4_8  ;; 0x40039014
        STR      R0,[R1, #+0]
//   20       FTM1_SC = 0x2C; //not enable the interrupt mask,up-down counting mode,System clock,Divide by 32  16          
        LDR.W    R0,??DataTable4_9  ;; 0x40039000
        MOVS     R1,#+44
        STR      R1,[R0, #+0]
//   21       
//   22       FTM2_C0SC |= FTM_CnSC_ELSB_MASK;
        LDR.W    R0,??DataTable4_10  ;; 0x400b800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable4_10  ;; 0x400b800c
        STR      R0,[R1, #+0]
//   23       FTM2_C0SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.W    R0,??DataTable4_10  ;; 0x400b800c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_10  ;; 0x400b800c
        STR      R0,[R1, #+0]
//   24       FTM2_C0SC |= FTM_CnSC_MSB_MASK;   
        LDR.W    R0,??DataTable4_10  ;; 0x400b800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable4_10  ;; 0x400b800c
        STR      R0,[R1, #+0]
//   25       FTM2_C1SC |= FTM_CnSC_ELSB_MASK;
        LDR.W    R0,??DataTable4_11  ;; 0x400b8014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable4_11  ;; 0x400b8014
        STR      R0,[R1, #+0]
//   26       FTM2_C1SC &= ~FTM_CnSC_ELSA_MASK;
        LDR.W    R0,??DataTable4_11  ;; 0x400b8014
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_11  ;; 0x400b8014
        STR      R0,[R1, #+0]
//   27       FTM2_C1SC |= FTM_CnSC_MSB_MASK;  
        LDR.W    R0,??DataTable4_11  ;; 0x400b8014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable4_11  ;; 0x400b8014
        STR      R0,[R1, #+0]
//   28       FTM2_SC = 0x2C; //not enable the interrupt mask,up-down counting mode,System clock,Divide by 32 16           
        LDR.W    R0,??DataTable4_12  ;; 0x400b8000
        MOVS     R1,#+44
        STR      R1,[R0, #+0]
//   29             
//   30       
//   31       FTM1_MODE |= FTM_MODE_WPDIS_MASK;      
        LDR.W    R0,??DataTable4_13  ;; 0x40039054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_13  ;; 0x40039054
        STR      R0,[R1, #+0]
//   32 
//   33       FTM1_MODE &= ~1;
        LDR.W    R0,??DataTable4_13  ;; 0x40039054
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable4_13  ;; 0x40039054
        STR      R0,[R1, #+0]
//   34       
//   35       FTM2_MODE |= FTM_MODE_WPDIS_MASK;      
        LDR.W    R0,??DataTable4_14  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable4_14  ;; 0x400b8054
        STR      R0,[R1, #+0]
//   36 
//   37             FTM2_MODE &= ~1;
        LDR.W    R0,??DataTable4_14  ;; 0x400b8054
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable4_14  ;; 0x400b8054
        STR      R0,[R1, #+0]
//   38      // FTM1_OUTMASK=0XFE;   //0 Channel output is not masked. It continues to operate normally.
//   39                            //1 Channel output is masked. It is forced to its inactive state.
//   40       
//   41       FTM1_COMBINE=0;      //Function for Linked Channels (FTMx_COMBINE)
        LDR.W    R0,??DataTable4_15  ;; 0x40039064
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   42       FTM1_OUTINIT=0;
        LDR.W    R0,??DataTable4_16  ;; 0x4003905c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   43       FTM1_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
        LDR.W    R0,??DataTable4_17  ;; 0x4003906c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   44       FTM1_POL=0;          //Channels Polarity (FTMx_POL)
        LDR.W    R0,??DataTable4_18  ;; 0x40039070
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   45                            //0 The channel polarity is active high.
//   46                            //1 The channel polarity is active low.  
//   47       FTM2_COMBINE=0;      //Function for Linked Channels (FTMx_COMBINE)
        LDR.W    R0,??DataTable4_19  ;; 0x400b8064
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   48       FTM2_OUTINIT=0;
        LDR.W    R0,??DataTable4_20  ;; 0x400b805c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   49       FTM2_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
        LDR.W    R0,??DataTable4_21  ;; 0x400b806c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   50       FTM2_POL=0;          //Channels Polarity (FTMx_POL)
        LDR.W    R0,??DataTable4_22  ;; 0x400b8070
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   51                                  //0 The channel polarity is active high.
//   52                                  //1 The channel polarity is active low.  
//   53       FTM1_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;
        LDR.W    R0,??DataTable4_23  ;; 0x40039080
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable4_23  ;; 0x40039080
        STR      R0,[R1, #+0]
//   54       FTM1_INVCTRL=0;     //∑¥◊™øÿ÷∆
        LDR.W    R0,??DataTable4_24  ;; 0x40039090
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   55       FTM1_SWOCTRL=0;     //»Ìº˛ ‰≥ˆøÿ÷∆F TM Software Output Control (FTMx_SWOCTRL)
        LDR.W    R0,??DataTable4_25  ;; 0x40039094
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   56       FTM1_PWMLOAD=0;     //FTM PWM Load
        LDR.W    R0,??DataTable4_26  ;; 0x40039098
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   57                           //BIT9: 0 Loading updated values is disabled.
//   58                           //1 Loading updated values is enabled.
//   59       FTM2_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;
        LDR.W    R0,??DataTable4_27  ;; 0x400b8080
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.W    R1,??DataTable4_27  ;; 0x400b8080
        STR      R0,[R1, #+0]
//   60       FTM2_INVCTRL=0;     //∑¥◊™øÿ÷∆
        LDR.W    R0,??DataTable4_28  ;; 0x400b8090
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   61       FTM2_SWOCTRL=0;     //»Ìº˛ ‰≥ˆøÿ÷∆F TM Software Output Control (FTMx_SWOCTRL)
        LDR.W    R0,??DataTable4_29  ;; 0x400b8094
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   62       FTM2_PWMLOAD=0;     //FTM PWM Load
        LDR.W    R0,??DataTable4_30  ;; 0x400b8098
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   63                                 //BIT9: 0 Loading updated values is disabled.
//   64                                 //1 Loading updated values is enabled.
//   65       FTM1_CNTIN=0;        //Counter Initial Value      
        LDR.W    R0,??DataTable4_31  ;; 0x4003904c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   66       FTM1_MOD=3750;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001) 
        LDR.W    R0,??DataTable4_32  ;; 0x40039008
        MOVW     R1,#+3750
        STR      R1,[R0, #+0]
//   67                            //≤…”√¡˙« ±÷”≥ı ºªØ∫Ø ˝£¨ø…“‘µ√µΩ4∑÷∆µµƒ∆µ¬ £¨¿˝»Á£∫œµÕ≥60M∆µ¬  ±£¨PWM∆µ¬  «15M,“‘¥À¿‡Õ∆
//   68                            //PMW∆µ¬ =œµÕ≥∆µ¬ /4/(2^FTM1_SC_PS)/FTM1_MOD
//   69                            //PMW∆µ¬ =125M/4/(2^4)/19531=125000000/4/32/19531=50hz
//   70       //PMW∑÷∆µ=125M/4/(2^5)=976562.5=1M,“ª∏ˆ¬ˆ≥Â «1us,1500∏ˆ¬ˆ≥ÂæÕ «1.5ms
//   71       FTM2_CNTIN=0;        //Counter Initial Value      
        LDR.W    R0,??DataTable4_33  ;; 0x400b804c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   72       FTM2_MOD=3750;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001) 
        LDR.W    R0,??DataTable4_34  ;; 0x400b8008
        MOVW     R1,#+3750
        STR      R1,[R0, #+0]
//   73                                 //≤…”√¡˙« ±÷”≥ı ºªØ∫Ø ˝£¨ø…“‘µ√µΩ4∑÷∆µµƒ∆µ¬ £¨¿˝»Á£∫œµÕ≥60M∆µ¬  ±£¨PWM∆µ¬  «15M,“‘¥À¿‡Õ∆
//   74                                 //PMW∆µ¬ =œµÕ≥∆µ¬ /4/(2^FTM1_SC_PS)/FTM1_MOD
//   75                                 //PMW∆µ¬ =180M/4/(2^5)/28125=180000000/4/32/28125=50hz
//   76            //PMW∑÷∆µ=125M/4/(2^5)=976562.5=1M,“ª∏ˆ¬ˆ≥Â «1us,1500∏ˆ¬ˆ≥ÂæÕ «1.5ms
//   77       FTM1_C0V= (int)(1000 / 0.6667) ;       //…Ë÷√ the pulse width(duty cycle) is determined by (CnV - CNTIN).
        LDR.W    R0,??DataTable4_35  ;; 0x40039010
        MOVW     R1,#+1499
        STR      R1,[R0, #+0]
//   78       FTM1_C1V= (int)(1000 / 0.6667) ; 
        LDR.W    R0,??DataTable4_36  ;; 0x40039018
        MOVW     R1,#+1499
        STR      R1,[R0, #+0]
//   79       FTM1_CNT=0;          //÷ª”–µÕ16Œªø…”√
        LDR.W    R0,??DataTable4_37  ;; 0x40039004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   80       
//   81       FTM2_C0V= (int)(1000 / 0.6667);        //…Ë÷√ the pulse width(duty cycle) is determined by (CnV - CNTIN).
        LDR.W    R0,??DataTable4_38  ;; 0x400b8010
        MOVW     R1,#+1499
        STR      R1,[R0, #+0]
//   82       FTM2_C1V= (int)(1000 / 0.6667); 
        LDR.W    R0,??DataTable4_39  ;; 0x400b8018
        MOVW     R1,#+1499
        STR      R1,[R0, #+0]
//   83       FTM2_CNT=0;          //÷ª”–µÕ16Œªø…”√
        LDR.W    R0,??DataTable4_40  ;; 0x400b8004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//   84 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   85 void set_pwm(uint16 a,uint16 b,uint16 c,uint16 d)
//   86 {     if      (a >= 2000)a = 2000;
set_pwm:
        PUSH     {R4-R6,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R0,R2
        MOVS     R6,R3
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+2000
        BCC.N    ??set_pwm_0
        MOV      R5,#+2000
        B.N      ??set_pwm_1
//   87       else if (a <= 1000)a = 1000;
??set_pwm_0:
        MOVW     R1,#+1001
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,R1
        BCS.N    ??set_pwm_1
        MOV      R5,#+1000
//   88       if      (b >= 2000)b = 2000;
??set_pwm_1:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+2000
        BCC.N    ??set_pwm_2
        MOV      R4,#+2000
        B.N      ??set_pwm_3
//   89       else if (b <= 1000)b = 1000;
??set_pwm_2:
        MOVW     R1,#+1001
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,R1
        BCS.N    ??set_pwm_3
        MOV      R4,#+1000
//   90       if      (c >= 2000)c = 2000;
??set_pwm_3:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+2000
        BCC.N    ??set_pwm_4
        MOV      R0,#+2000
        B.N      ??set_pwm_5
//   91       else if (c <= 1000)c = 1000;
??set_pwm_4:
        MOVW     R1,#+1001
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BCS.N    ??set_pwm_5
        MOV      R0,#+1000
//   92       if      (d >= 2000)d = 2000;
??set_pwm_5:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+2000
        BCC.N    ??set_pwm_6
        MOV      R6,#+2000
        B.N      ??set_pwm_7
//   93       else if (d <= 1000)d = 1000;
??set_pwm_6:
        MOVW     R1,#+1001
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,R1
        BCS.N    ??set_pwm_7
        MOV      R6,#+1000
//   94       FTM1_C0V = (int)(c / 0.6667);       //…Ë÷√ the pulse width(duty cycle) is determined by (CnV - CNTIN).
??set_pwm_7:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable4_41  ;; 0x3d07c84b
        LDR.N    R3,??DataTable4_42  ;; 0x3fe5559b
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable4_35  ;; 0x40039010
        STR      R0,[R1, #+0]
//   95       FTM1_C1V = (int)(d / 0.6667);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable4_41  ;; 0x3d07c84b
        LDR.N    R3,??DataTable4_42  ;; 0x3fe5559b
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable4_36  ;; 0x40039018
        STR      R0,[R1, #+0]
//   96       FTM2_C0V = (int)(b / 0.6667);       //…Ë÷√ the pulse width(duty cycle) is determined by (CnV - CNTIN).
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,R4
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable4_41  ;; 0x3d07c84b
        LDR.N    R3,??DataTable4_42  ;; 0x3fe5559b
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable4_38  ;; 0x400b8010
        STR      R0,[R1, #+0]
//   97       FTM2_C1V = (int)(a / 0.6667);//a
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,R5
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable4_41  ;; 0x3d07c84b
        LDR.N    R3,??DataTable4_42  ;; 0x3fe5559b
        BL       __aeabi_ddiv
        BL       __aeabi_d2iz
        LDR.N    R1,??DataTable4_39  ;; 0x400b8018
        STR      R0,[R1, #+0]
//   98 }
        POP      {R4-R6,PC}       ;; return
//   99 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  100 void SteerPWM_init()
//  101 {
SteerPWM_init:
        PUSH     {R7,LR}
//  102         
//  103 	ftm0_pwm_init(100);//∆µ¬ ≥ı ºªØ   
        MOVS     R0,#+100
        BL       ftm0_pwm_init
//  104 
//  105         ftm0_pwm_open(0,0);//≥ı ºªØÕ®µ¿4,º¥PTD4ø⁄,’ºø’±»Œ™0 0~10000,0.00%µΩ100.00%
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       ftm0_pwm_open
//  106 	ftm0_pwm_change_duty(0,0);//øÿ÷∆’ºø’±»
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       ftm0_pwm_change_duty
//  107         
//  108 	ftm0_pwm_open(5,0);//≥ı ºªØÕ®µ¿1,º¥PTC2ø⁄,’ºø’±»Œ™0 0~10000,0.00%µΩ100.00%
        MOVS     R1,#+0
        MOVS     R0,#+5
        BL       ftm0_pwm_open
//  109 	ftm0_pwm_change_duty(5,0);//øÿ÷∆’ºø’±»
        MOVS     R1,#+0
        MOVS     R0,#+5
        BL       ftm0_pwm_change_duty
//  110        
//  111 }
        POP      {R0,PC}          ;; return
//  112 
//  113 
//  114 //»´æ÷±‰¡ø∂®“Â

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  115 uint32 LPLD_FTM0_MOD;
LPLD_FTM0_MOD:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  116 uint32 LPLD_FTM1_MOD;
LPLD_FTM1_MOD:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  117 uint32 LPLD_FTM2_MOD;
LPLD_FTM2_MOD:
        DS8 4
//  118 
//  119 /*
//  120  * LPLD_FTM0_PWM_Init
//  121  * FTM0ƒ£øÈPWMπ¶ƒ‹≥ı ºªØ∫Ø ˝
//  122  * 
//  123  * ≤Œ ˝:
//  124  *    freq--∆⁄Õ˚∆µ¬ £¨µ•ŒªHz
//  125  *
//  126  *  ‰≥ˆ:
//  127  *    0--≈‰÷√¥ÌŒÛ
//  128  *    1--≈‰÷√≥…π¶
//  129  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  130 uint8 ftm0_pwm_init(uint32 freq)
//  131 {
ftm0_pwm_init:
        PUSH     {R4}
//  132 	uint32 bus_clk_hz;
//  133 	uint32 mod;
//  134 	uint8 ps;
//  135 
//  136 	bus_clk_hz = periph_clk_khz*1000;
        LDR.N    R1,??DataTable4_43
        LDR      R1,[R1, #+0]
        MOV      R2,#+1000
        MULS     R1,R2,R1
//  137 	  
//  138 	  if(freq>bus_clk_hz) return 0;
        CMP      R1,R0
        BCS.N    ??ftm0_pwm_init_0
        MOVS     R0,#+0
        B.N      ??ftm0_pwm_init_1
//  139 	  
//  140 	  if((mod=bus_clk_hz/(freq*128)) < 0xFFFFu)
??ftm0_pwm_init_0:
        MOVS     R2,#+128
        MUL      R2,R2,R0
        UDIV     R3,R1,R2
        MOVW     R2,#+65535
        CMP      R3,R2
        BCS.N    ??ftm0_pwm_init_2
//  141 	  {
//  142 	    ps = 7;
        MOVS     R2,#+7
//  143 	    LPLD_FTM0_MOD = mod;
        LDR.N    R4,??DataTable4_44
        STR      R3,[R4, #+0]
//  144 	    if((mod=bus_clk_hz/(freq*64)) < 0xFFFFu)
        MOVS     R3,#+64
        MUL      R3,R3,R0
        UDIV     R3,R1,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??ftm0_pwm_init_3
//  145 	    {
//  146 	      ps = 6;   
        MOVS     R2,#+6
//  147 	      LPLD_FTM0_MOD = mod;  
        LDR.N    R4,??DataTable4_44
        STR      R3,[R4, #+0]
//  148 	      if((mod=bus_clk_hz/(freq*32)) < 0xFFFFu)
        LSLS     R3,R0,#+5
        UDIV     R3,R1,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??ftm0_pwm_init_3
//  149 	      {
//  150 	        ps = 5; 
        MOVS     R2,#+5
//  151 	        LPLD_FTM0_MOD = mod;  
        LDR.N    R4,??DataTable4_44
        STR      R3,[R4, #+0]
//  152 	        if((mod=bus_clk_hz/(freq*16)) < 0xFFFFu)
        LSLS     R3,R0,#+4
        UDIV     R3,R1,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??ftm0_pwm_init_3
//  153 	        {
//  154 	          ps = 4;  
        MOVS     R2,#+4
//  155 	          LPLD_FTM0_MOD = mod;    
        LDR.N    R4,??DataTable4_44
        STR      R3,[R4, #+0]
//  156 	          if((mod=bus_clk_hz/(freq*8)) < 0xFFFFu)
        LSLS     R3,R0,#+3
        UDIV     R3,R1,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??ftm0_pwm_init_3
//  157 	          {
//  158 	            ps = 3;
        MOVS     R2,#+3
//  159 	            LPLD_FTM0_MOD = mod;
        LDR.N    R4,??DataTable4_44
        STR      R3,[R4, #+0]
//  160 	            if((mod=bus_clk_hz/(freq*4)) < 0xFFFFu)
        LSLS     R3,R0,#+2
        UDIV     R3,R1,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??ftm0_pwm_init_3
//  161 	            {
//  162 	              ps = 2;
        MOVS     R2,#+2
//  163 	              LPLD_FTM0_MOD = mod;
        LDR.N    R4,??DataTable4_44
        STR      R3,[R4, #+0]
//  164 	              if((mod=bus_clk_hz/(freq*2)) < 0xFFFFu)
        LSLS     R3,R0,#+1
        UDIV     R3,R1,R3
        MOVW     R4,#+65535
        CMP      R3,R4
        BCS.N    ??ftm0_pwm_init_3
//  165 	              {
//  166 	                ps = 1;
        MOVS     R2,#+1
//  167 	                LPLD_FTM0_MOD = mod;
        LDR.N    R4,??DataTable4_44
        STR      R3,[R4, #+0]
//  168 	                if((mod=bus_clk_hz/(freq*1)) < 0xFFFFu)
        UDIV     R3,R1,R0
        MOVW     R0,#+65535
        CMP      R3,R0
        BCS.N    ??ftm0_pwm_init_3
//  169 	                {
//  170 	                  ps = 0;
        MOVS     R2,#+0
//  171 	                  LPLD_FTM0_MOD = mod;
        LDR.N    R0,??DataTable4_44
        STR      R3,[R0, #+0]
//  172 	                }
//  173 	              }
//  174 	            }
//  175 	          }
//  176 	        }  
//  177 	      }
//  178 	    }
//  179 	  }
//  180 	  else
//  181 	  {
//  182 	    return 0;
//  183 	  }
//  184 	  
//  185 	  //  πƒ‹FTM ±÷”ƒ£øÈ
//  186 	  SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;
??ftm0_pwm_init_3:
        LDR.N    R0,??DataTable4_5  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable4_5  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  187 	  
//  188 	  // ≈‰÷√FTMøÿ÷∆ºƒ¥Ê∆˜
//  189 	  // Ω˚”√÷–∂œ, º”º∆ ˝ƒ£ Ω,  ±÷”‘¥:System clock£®Bus Clk£©, ∑÷∆µœµ ˝:8
//  190 	  // ºŸ…ËSysClk = 50MHz, SC_PS=3, FTM Clk = 50MHz/2^3 = 6.25MHz
//  191 	  FTM0_SC = FTM_SC_CLKS(1)|FTM_SC_PS(ps);
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        ANDS     R0,R2,#0x7
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable4_45  ;; 0x40038000
        STR      R0,[R1, #+0]
//  192 	  
//  193 	  // …Ë÷√PWM÷‹∆⁄º∞’ºø’±»
//  194 	  //    PWM÷‹∆⁄ = (MOD-CNTIN+1)*FTM ±÷”÷‹∆⁄ :
//  195 	  // ≈‰÷√FTMº∆ ˝≥ı º÷µ
//  196 	  FTM0_CNT = 0;
        LDR.N    R0,??DataTable4_46  ;; 0x40038004
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  197 	  FTM0_CNTIN = 0;
        LDR.N    R0,??DataTable4_47  ;; 0x4003804c
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  198 	  // ≈‰÷√FTMº∆ ˝MOD÷µ
//  199 	  FTM0_MOD = LPLD_FTM0_MOD;
        LDR.N    R0,??DataTable4_48  ;; 0x40038008
        LDR.N    R1,??DataTable4_44
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  200 	  
//  201 	  return 1;
        MOVS     R0,#+1
        B.N      ??ftm0_pwm_init_1
??ftm0_pwm_init_2:
        MOVS     R0,#+0
??ftm0_pwm_init_1:
        POP      {R4}
        BX       LR               ;; return
//  202 }
//  203 
//  204 /*
//  205  * 
//  206  * FTM0ƒ£øÈPWM ‰≥ˆÕ®µ¿º∞’ºø’±»≈‰÷√
//  207  * 
//  208  * Àµ√˜: ∆‰À˚GPIO“≤ø…≈‰÷√Œ™FTM0 ‰≥ˆ,±æ∫Ø ˝÷ªøº¬«PTC∫ÕPTD,»Á–Ë∏ƒ±‰«Î◊‘–––ﬁ∏ƒ 
//  209  * 
//  210  * ≤Œ ˝:
//  211  *    channel - PWM ‰≥ˆÕ®µ¿
//  212  *      |__0--PTC1
//  213  *      |__1--PTC2
//  214  *      |__2--PTC3
//  215  *      |__3--PTC4
//  216  *      |__4--PTD4
//  217  *      |__5--PTD5
//  218  *      |__6--PTD6
//  219  *      |__7--PTD7
//  220  *    duty - PWM ‰≥ˆ’ºø’±»
//  221  *      |__0~10000--’ºø’±»0.00%~100.00%
//  222  *
//  223  *  ‰≥ˆ:
//  224  *    0--≈‰÷√¥ÌŒÛ
//  225  *    1--≈‰÷√≥…π¶
//  226  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  227 uint8 ftm0_pwm_open(uint8 channel, uint32 duty)
//  228 {
ftm0_pwm_open:
        SUB      SP,SP,#+4
//  229 	uint32 cv;
//  230 	  volatile uint32 mod;
//  231 	  
//  232 	  if(duty>10000) return 0;
        MOVW     R2,#+10001
        CMP      R1,R2
        BCC.N    ??ftm0_pwm_open_0
        MOVS     R0,#+0
        B.N      ??ftm0_pwm_open_1
//  233 	  //’ºø’±» = (CnV-CNTIN)/(MOD-CNTIN+1)
//  234 	  mod = LPLD_FTM0_MOD;
??ftm0_pwm_open_0:
        LDR.N    R2,??DataTable4_44
        LDR      R2,[R2, #+0]
        STR      R2,[SP, #+0]
//  235 	  cv = (duty*(mod-0+1)+0)/10000;
        LDR      R2,[SP, #+0]
        ADDS     R2,R2,#+1
        MULS     R1,R2,R1
        MOVW     R2,#+10000
        UDIV     R1,R1,R2
//  236 	  
//  237 	  //—°‘Ò≤¢ø™∆ÙÕ®µ¿
//  238 	  switch(channel)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R2,R0
        CMP      R2,#+0
        CMP      R2,#+3
        BLS.N    ??ftm0_pwm_open_2
        SUBS     R2,R2,#+4
        CMP      R2,#+3
        BLS.N    ??ftm0_pwm_open_3
        B.N      ??ftm0_pwm_open_4
//  239 	  {
//  240 	    case 0:
//  241 	    case 1:
//  242 	    case 2:
//  243 	    case 3:
//  244 	      SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
??ftm0_pwm_open_2:
        LDR.N    R2,??DataTable4_4  ;; 0x40048038
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x800
        LDR.N    R3,??DataTable4_4  ;; 0x40048038
        STR      R2,[R3, #+0]
//  245 	      PORT_PCR_REG(PORTC_BASE_PTR, channel+1) = PORT_PCR_MUX(4);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+2
        ADD      R2,R2,#+1073741824
        ADDS     R2,R2,#+307200
        MOV      R3,#+1024
        STR      R3,[R2, #+4]
//  246 	      break;
//  247 	    case 4:
//  248 	    case 5:
//  249 	    case 6:
//  250 	    case 7:
//  251 	      SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
//  252 	      PORT_PCR_REG(PORTD_BASE_PTR, channel) = PORT_PCR_MUX(4);
//  253 	      break;
//  254 	    default:
//  255 	       return 0;
//  256 	  }  
//  257 	  
//  258 	  // ≈‰÷√FTMÕ®µ¿øÿ÷∆ºƒ¥Ê∆˜ 
//  259 	  // Õ®µ¿ƒ£ Ω MSB:MSA-1X, Õ®µ¿±ﬂ‘µ—°‘Ò ELSB:ELSA-10
//  260 	  FTM_CnSC_REG(FTM0_BASE_PTR, channel) = FTM_CnSC_MSB_MASK|FTM_CnSC_ELSB_MASK;
??ftm0_pwm_open_5:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable4_49  ;; 0x4003800c
        MOVS     R3,#+40
        STR      R3,[R2, R0, LSL #+3]
//  261 	  // ≈‰÷√FTMÕ®µ¿÷µ
//  262 	  FTM_CnV_REG(FTM0_BASE_PTR, channel) = cv;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable4_49  ;; 0x4003800c
        ADDS     R0,R2,R0, LSL #+3
        STR      R1,[R0, #+4]
//  263 	  
//  264 	  return 1;
        MOVS     R0,#+1
??ftm0_pwm_open_1:
        ADD      SP,SP,#+4
        BX       LR               ;; return
??ftm0_pwm_open_3:
        LDR.N    R2,??DataTable4_4  ;; 0x40048038
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x1000
        LDR.N    R3,??DataTable4_4  ;; 0x40048038
        STR      R2,[R3, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable4_50  ;; 0x4004c000
        MOV      R3,#+1024
        STR      R3,[R2, R0, LSL #+2]
        B.N      ??ftm0_pwm_open_5
??ftm0_pwm_open_4:
        MOVS     R0,#+0
        B.N      ??ftm0_pwm_open_1
//  265 }
//  266 
//  267 /*
//  268  * LPLD_FTM0_PWM_ChangeDuty
//  269  * ∏ƒ±‰FTM0ƒ£øÈPWM ‰≥ˆÕ®µ¿’ºø’±»
//  270  *
//  271  * ≤Œ ˝:
//  272  *    channel - PWM ‰≥ˆÕ®µ¿
//  273  *      |__0--PTC1
//  274  *      |__1--PTC2
//  275  *      |__2--PTC3
//  276  *      |__3--PTC4
//  277  *      |__4--PTD4
//  278  *      |__5--PTD5
//  279  *      |__6--PTD6
//  280  *      |__7--PTD7
//  281  *    duty - PWM ‰≥ˆ’ºø’±»
//  282  *      |__0~10000--’ºø’±»0.00%~100.00%
//  283  *
//  284  *  ‰≥ˆ:
//  285  *    0--≈‰÷√¥ÌŒÛ
//  286  *    1--≈‰÷√≥…π¶
//  287  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  288 uint8 ftm0_pwm_change_duty(uint8 channel, uint32 duty)
//  289 {
ftm0_pwm_change_duty:
        SUB      SP,SP,#+4
//  290   uint32 cv;
//  291   volatile uint32 mod;
//  292   
//  293   if(duty>10000) return 0;
        MOVW     R2,#+10001
        CMP      R1,R2
        BCC.N    ??ftm0_pwm_change_duty_0
        MOVS     R0,#+0
        B.N      ??ftm0_pwm_change_duty_1
//  294   //’ºø’±» = (CnV-CNTIN)/(MOD-CNTIN+1)
//  295   mod = LPLD_FTM0_MOD;
??ftm0_pwm_change_duty_0:
        LDR.N    R2,??DataTable4_44
        LDR      R2,[R2, #+0]
        STR      R2,[SP, #+0]
//  296   cv = (duty*(mod-0+1)+0)/10000;
        LDR      R2,[SP, #+0]
        ADDS     R2,R2,#+1
        MULS     R1,R2,R1
        MOVW     R2,#+10000
        UDIV     R1,R1,R2
//  297  
//  298   // ≈‰÷√FTMÕ®µ¿÷µ
//  299   FTM_CnV_REG(FTM0_BASE_PTR, channel) = cv;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable4_49  ;; 0x4003800c
        ADDS     R0,R2,R0, LSL #+3
        STR      R1,[R0, #+4]
//  300   
//  301   return 1;
        MOVS     R0,#+1
??ftm0_pwm_change_duty_1:
        ADD      SP,SP,#+4
        BX       LR               ;; return
//  302 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40049030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40049034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x4004a048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x4004a04c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x4003900c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x40039014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0x400b800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x400b8014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     0x40039054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     0x400b8054

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     0x40039064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_16:
        DC32     0x4003905c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_17:
        DC32     0x4003906c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_18:
        DC32     0x40039070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_19:
        DC32     0x400b8064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_20:
        DC32     0x400b805c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_21:
        DC32     0x400b806c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_22:
        DC32     0x400b8070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_23:
        DC32     0x40039080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_24:
        DC32     0x40039090

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_25:
        DC32     0x40039094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_26:
        DC32     0x40039098

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_27:
        DC32     0x400b8080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_28:
        DC32     0x400b8090

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_29:
        DC32     0x400b8094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_30:
        DC32     0x400b8098

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_31:
        DC32     0x4003904c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_32:
        DC32     0x40039008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_33:
        DC32     0x400b804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_34:
        DC32     0x400b8008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_35:
        DC32     0x40039010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_36:
        DC32     0x40039018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_37:
        DC32     0x40039004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_38:
        DC32     0x400b8010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_39:
        DC32     0x400b8018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_40:
        DC32     0x400b8004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_41:
        DC32     0x3d07c84b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_42:
        DC32     0x3fe5559b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_43:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_44:
        DC32     LPLD_FTM0_MOD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_45:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_46:
        DC32     0x40038004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_47:
        DC32     0x4003804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_48:
        DC32     0x40038008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_49:
        DC32     0x4003800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_50:
        DC32     0x4004c000

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
//    12 bytes in section .bss
// 1 492 bytes in section .text
// 
// 1 492 bytes of CODE memory
//    12 bytes of DATA memory
//
//Errors: none
//Warnings: none
