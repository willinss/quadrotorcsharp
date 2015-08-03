///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:12 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\function.c            /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\function.c" -D IAR   /
//                    -D TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quadroto /
//                    r150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\bin\Flash\List\" -lB       /
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
//                    (¸ÄI2C)\bin\Flash\List\function.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME function

        #define SHT_PROGBITS 0x1

        EXTERN AnalogSPI
        EXTERN BaseHeight
        EXTERN Delay_10us
        EXTERN Delay_ms
        EXTERN Height
        EXTERN Height_update
        EXTERN InitBMA180
        EXTERN InitBMAsteer
        EXTERN InitMPU3205
        EXTERN InitMPUsteer
        EXTERN InitOpticalFlowSensor
        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_GPIO_SetIsr
        EXTERN Landing
        EXTERN PORTE_isr
        EXTERN Send_flag
        EXTERN SteerPWM_init
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dmul
        EXTERN __aeabi_i2d
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN dataLencounter
        EXTERN data_high
        EXTERN enable_irq
        EXTERN enableuartreint
        EXTERN hw_FTM_init
        EXTERN hw_gpio_init
        EXTERN hw_gpio_reverse
        EXTERN hw_gpio_set
        EXTERN hw_i2c_init
        EXTERN hw_pit_init
        EXTERN kalman_filter1
        EXTERN lastHeight
        EXTERN median
        EXTERN periph_clk_khz
        EXTERN preHeight
        EXTERN set_irq_priority
        EXTERN uart_init
        EXTERN uart_send1
        EXTERN wx
        EXTERN wy
        EXTERN wz

        PUBLIC CheckHeightSensor
        PUBLIC FloatToByte
        PUBLIC High_update
        PUBLIC Initial
        PUBLIC Int32ToByte
        PUBLIC Integral_high
        PUBLIC SendDataToGUI
        PUBLIC SendFloat
        PUBLIC SendInt32
        PUBLIC SendStopToGUI
        PUBLIC SendToGUI_Flag
        PUBLIC SetIrqsPrio
        PUBLIC floatToByte

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\function.c
//    1 #include "function.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 uint8 floatToByte[4];
floatToByte:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//    4 bool  SendToGUI_Flag = true;
SendToGUI_Flag:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    5 bool  Integral_high = false;
Integral_high:
        DS8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    6 void SetIrqsPrio(void)
//    7 {
SetIrqsPrio:
        PUSH     {R7,LR}
//    8     set_irq_priority(47, 2);//´®¿Ú½ÓÊÕ
        MOVS     R1,#+2
        MOVS     R0,#+47
        BL       set_irq_priority
//    9     set_irq_priority(68, 1);//PIT0ÖÐ¶Ï
        MOVS     R1,#+1
        MOVS     R0,#+68
        BL       set_irq_priority
//   10     set_irq_priority(91, 0);//³¬Éù²¨²â¸ß
        MOVS     R1,#+0
        MOVS     R0,#+91
        BL       set_irq_priority
//   11     //set_irq_priority(45, 3);//¸ß¶È½ÓÊÕ
//   12 }
        POP      {R0,PC}          ;; return
//   13 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   14 bool Initial(void)
//   15 {
Initial:
        PUSH     {R7,LR}
//   16     hw_gpio_init (PORT_A, 15, 1, 1);                 //PORTA15Êä³ö¿Ú
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_init
//   17     hw_gpio_init (PORT_C, 18, 1, 0);                 //³¬Éù²¨Trig
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+18
        MOVS     R0,#+2
        BL       hw_gpio_init
//   18     hw_gpio_init (PORT_E, 6, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+6
        MOVS     R0,#+4
        BL       hw_gpio_init
//   19     hw_gpio_init (PORT_E, 2, 1, 1);
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOVS     R0,#+4
        BL       hw_gpio_init
//   20     hw_gpio_init (PORT_B, 3, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       hw_gpio_init
//   21     hw_gpio_init (PORT_B, 10, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+10
        MOVS     R0,#+1
        BL       hw_gpio_init
//   22     hw_gpio_init (PORT_B, 16, 1, 0);
        MOVS     R3,#+0
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOVS     R0,#+1
        BL       hw_gpio_init
//   23     hw_gpio_init (PORT_B, 21, 1, 1);                 //·äÃùÆ÷¿ØÖÆ¿Ú
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+21
        MOVS     R0,#+1
        BL       hw_gpio_init
//   24     hw_FTM_init();                                   //PWM³õÊ¼»¯
        BL       hw_FTM_init
//   25     SteerPWM_init();                                 //ÔÆÌ¨³õÊ¼»¯
        BL       SteerPWM_init
//   26     hw_i2c_init(0);                                   //I2C0³õÊ¼»¯
        MOVS     R0,#+0
        BL       hw_i2c_init
//   27     hw_i2c_init(1);
        MOVS     R0,#+1
        BL       hw_i2c_init
//   28     uart_init (UART0, periph_clk_khz, 921600);          //´®¿Ú0²¨ÌØÂÊ9600
        MOVS     R2,#+921600
        LDR.N    R0,??DataTable4
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable4_1  ;; 0x4006a000
        BL       uart_init
//   29     uart_init (UART1, periph_clk_khz, 57600);	     //Ò£¿Ø´®¿Ú1²¨ÌØÂÊ9600
        MOV      R2,#+57600
        LDR.N    R0,??DataTable4
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable4_2  ;; 0x4006b000
        BL       uart_init
//   30     enableuartreint(UART0, UART0irq);	            //´®¿Ú0ÖÐ¶ÏÊ¹ÄÜ
        MOVS     R1,#+45
        LDR.N    R0,??DataTable4_1  ;; 0x4006a000
        BL       enableuartreint
//   31     enableuartreint(UART1, UART1irq);		    //´®¿Ú1ÖÐ¶ÏÊ¹ÄÜ
        MOVS     R1,#+47
        LDR.N    R0,??DataTable4_2  ;; 0x4006b000
        BL       enableuartreint
//   32     hw_pit_init(0, (int)(periph_clk_khz * T));               //³õÊ¼»¯pit0£¬ÖÜÆÚ20ms
        LDR.N    R0,??DataTable4
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable4_3  ;; 0x40040000
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        MOVS     R1,R0
        MOVS     R0,#+0
        BL       hw_pit_init
//   33     hw_pit_init(1, 0XFFFFFFFF);               //³õÊ¼»¯pit0£¬ÖÜÆÚ20ms                     //¿ªpitÖÐ¶Ï
        MOVS     R1,#-1
        MOVS     R0,#+1
        BL       hw_pit_init
//   34     LED1_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       hw_gpio_set
//   35     LED2_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+10
        MOVS     R0,#+1
        BL       hw_gpio_set
//   36     LED3_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOVS     R0,#+1
        BL       hw_gpio_set
//   37     AnalogSPI();
        BL       AnalogSPI
//   38     //Init_BMP085();
//   39     //Init_HMC5883L();//´ÅÁ¦¼Æ
//   40     InitBMA180();//¼ÓËÙ¶È¼Æ
        BL       InitBMA180
//   41     InitMPU3205();//ÍÓÂÝÒÇ
        BL       InitMPU3205
//   42     InitMPUsteer(); 
        BL       InitMPUsteer
//   43     InitBMAsteer();
        BL       InitBMAsteer
//   44     LED2_ON;
        MOVS     R2,#+0
        MOVS     R1,#+10
        MOVS     R0,#+1
        BL       hw_gpio_set
//   45     while(!InitOpticalFlowSensor());
??Initial_0:
        BL       InitOpticalFlowSensor
        CMP      R0,#+0
        BEQ.N    ??Initial_0
//   46     LED3_ON;
        MOVS     R2,#+0
        MOVS     R1,#+16
        MOVS     R0,#+1
        BL       hw_gpio_set
//   47     //Init_L3G4200D();
//   48     //Init_ADXL345();
//   49     LPLD_GPIO_Init(PORTE, 5, 0, 1, 11);              //e0 ÏÂ½µÖÐ¶Ï
        MOVS     R0,#+11
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+5
        LDR.N    R0,??DataTable4_4  ;; 0x4004d000
        BL       LPLD_GPIO_Init
//   50     LPLD_GPIO_SetIsr(PORTE, PORTE_isr);
        LDR.N    R1,??DataTable4_5
        LDR.N    R0,??DataTable4_4  ;; 0x4004d000
        BL       LPLD_GPIO_SetIsr
//   51     enable_irq(107);
        MOVS     R0,#+107
        BL       enable_irq
//   52     SetIrqsPrio();
        BL       SetIrqsPrio
//   53     return true;
        MOVS     R0,#+1
        POP      {R1,PC}          ;; return
//   54 }
//   55 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   56 bool CheckHeightSensor(void)
//   57 {
CheckHeightSensor:
        PUSH     {R4,LR}
//   58     for(uint16 i = 0; i < 1000; i++ )
        MOVS     R4,#+0
        B.N      ??CheckHeightSensor_0
??CheckHeightSensor_1:
        ADDS     R4,R4,#+1
??CheckHeightSensor_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+1000
        BCS.N    ??CheckHeightSensor_2
//   59     {
//   60         static uint8 temp = 0;
//   61 
//   62         Trig_ON;
        MOVS     R2,#+1
        MOVS     R1,#+18
        MOVS     R0,#+2
        BL       hw_gpio_set
//   63         Delay_10us();
        BL       Delay_10us
//   64         Trig_OFF;
        MOVS     R2,#+0
        MOVS     R1,#+18
        MOVS     R0,#+2
        BL       hw_gpio_set
//   65         Delay_ms(30);
        LDR.N    R0,??DataTable4_6  ;; 0x41f00000
        BL       Delay_ms
//   66         if( Height_update == true)
        LDR.N    R0,??DataTable4_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??CheckHeightSensor_3
//   67         {
//   68             Height_update = false;
        LDR.N    R0,??DataTable4_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   69             BaseHeight = (BaseHeight + Height) / 2;
        LDR.N    R0,??DataTable4_8
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable4_9
        LDRH     R1,[R1, #+0]
        UXTAH    R0,R1,R0
        MOVS     R1,#+2
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable4_8
        STRH     R0,[R1, #+0]
//   70             temp++;
        LDR.N    R0,??DataTable4_10
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_10
        STRB     R0,[R1, #+0]
//   71         }
//   72         if(temp >= 10)
??CheckHeightSensor_3:
        LDR.N    R0,??DataTable4_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BCC.N    ??CheckHeightSensor_1
//   73         {
//   74           lastHeight = BaseHeight  ;
        LDR.N    R0,??DataTable4_8
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable4_11
        STR      R0,[R1, #+0]
//   75           preHeight = BaseHeight ;
        LDR.N    R0,??DataTable4_8
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.N    R1,??DataTable4_12
        STR      R0,[R1, #+0]
//   76           break;
        B.N      ??CheckHeightSensor_2
//   77         }
//   78     }
//   79 
//   80     while(BaseHeight < 2 || BaseHeight > 20)
//   81     {
//   82         LED1_Change;
??CheckHeightSensor_4:
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       hw_gpio_reverse
//   83         LED2_Change;
        MOVS     R1,#+10
        MOVS     R0,#+1
        BL       hw_gpio_reverse
//   84         LED3_Change;
        MOVS     R1,#+16
        MOVS     R0,#+1
        BL       hw_gpio_reverse
//   85         Delay_ms(30);
        LDR.N    R0,??DataTable4_6  ;; 0x41f00000
        BL       Delay_ms
//   86     }
??CheckHeightSensor_2:
        LDR.N    R0,??DataTable4_8
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+19
        BCS.N    ??CheckHeightSensor_4
//   87 
//   88     return true;
        MOVS     R0,#+1
        POP      {R4,PC}          ;; return
//   89 }

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??temp:
        DS8 1
//   90 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   91 void FloatToByte(float floatNum, unsigned char *byteArry)
//   92 {
FloatToByte:
        PUSH     {R0}
//   93     char *pchar = (char *)&floatNum;
        ADD      R0,SP,#+0
//   94     for(int i = 0; i < sizeof(float); i++)
        MOVS     R2,#+0
        B.N      ??FloatToByte_0
//   95     {
//   96         *byteArry = *pchar;
??FloatToByte_1:
        LDRB     R3,[R0, #+0]
        STRB     R3,[R1, #+0]
//   97         pchar++;
        ADDS     R0,R0,#+1
//   98         byteArry++;
        ADDS     R1,R1,#+1
//   99     }
        ADDS     R2,R2,#+1
??FloatToByte_0:
        CMP      R2,#+4
        BCC.N    ??FloatToByte_1
//  100 }
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  101 void Int32ToByte(int32 intNum,unsigned char *byteArry)
//  102 {
Int32ToByte:
        PUSH     {R0}
//  103   char *pchar = (char *)&intNum;
        ADD      R0,SP,#+0
//  104     for(int i = 0; i < sizeof(int32); i++)
        MOVS     R2,#+0
        B.N      ??Int32ToByte_0
//  105     {
//  106         *byteArry = *pchar;
??Int32ToByte_1:
        LDRB     R3,[R0, #+0]
        STRB     R3,[R1, #+0]
//  107         pchar++;
        ADDS     R0,R0,#+1
//  108         byteArry++;
        ADDS     R1,R1,#+1
//  109     }
        ADDS     R2,R2,#+1
??Int32ToByte_0:
        CMP      R2,#+4
        BCC.N    ??Int32ToByte_1
//  110 
//  111 }
        ADD      SP,SP,#+4
        BX       LR               ;; return
//  112 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  113 void SendFloat(float floatNum,UART_MemMapPtr uartch)
//  114 {
SendFloat:
        PUSH     {R0,R4-R6,LR}
        SUB      SP,SP,#+4
        MOVS     R4,R1
//  115     char *pchar = (char *)&floatNum;
        ADD      R5,SP,#+4
//  116     for(int m = 0; m < sizeof(float); m++)
        MOVS     R6,#+0
        B.N      ??SendFloat_0
//  117     {
//  118         uart_send1 (uartch, *pchar);
??SendFloat_1:
        LDRB     R1,[R5, #+0]
        MOVS     R0,R4
        BL       uart_send1
//  119         pchar++;
        ADDS     R5,R5,#+1
//  120     }
        ADDS     R6,R6,#+1
??SendFloat_0:
        CMP      R6,#+4
        BCC.N    ??SendFloat_1
//  121 }
        POP      {R0,R1,R4-R6,PC}  ;; return
//  122 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  123 void SendInt32(int32 intNum,UART_MemMapPtr uartch)
//  124 {
SendInt32:
        PUSH     {R0,R4-R6,LR}
        SUB      SP,SP,#+4
        MOVS     R4,R1
//  125     uint8 *pchar = (uint8 *)&intNum;
        ADD      R5,SP,#+4
//  126 
//  127     for(int m = 0; m < sizeof(int32); m++)
        MOVS     R6,#+0
        B.N      ??SendInt32_0
//  128     {
//  129         uart_send1 (uartch, *pchar);//*pchar);
??SendInt32_1:
        LDRB     R1,[R5, #+0]
        MOVS     R0,R4
        BL       uart_send1
//  130         pchar++;
        ADDS     R5,R5,#+1
//  131     }
        ADDS     R6,R6,#+1
??SendInt32_0:
        CMP      R6,#+4
        BCC.N    ??SendInt32_1
//  132 
//  133 }
        POP      {R0,R1,R4-R6,PC}  ;; return
//  134 
//  135 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  136 void SendStopToGUI(void)
//  137 {
SendStopToGUI:
        PUSH     {R4,LR}
//  138     uint8 sendtemp = 0;
        MOVS     R4,#+0
//  139     Delay_ms(200);
        LDR.N    R0,??DataTable4_13  ;; 0x43480000
        BL       Delay_ms
//  140     for(sendtemp = 0; sendtemp < 10; sendtemp++)
        MOVS     R0,#+0
        MOVS     R4,R0
        B.N      ??SendStopToGUI_0
//  141     {
//  142         uart_send1 (UART1, 0x70);
??SendStopToGUI_1:
        MOVS     R1,#+112
        LDR.N    R0,??DataTable4_2  ;; 0x4006b000
        BL       uart_send1
//  143         sendtemp++;
        ADDS     R4,R4,#+1
//  144         Delay_ms(20);
        LDR.N    R0,??DataTable4_14  ;; 0x41a00000
        BL       Delay_ms
//  145         LED_Change;
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_reverse
//  146     }
        ADDS     R4,R4,#+1
??SendStopToGUI_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+10
        BCC.N    ??SendStopToGUI_1
//  147     SendToGUI_Flag = false;
        LDR.N    R0,??DataTable4_15
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  148 }
        POP      {R4,PC}          ;; return
//  149 
//  150 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  151 float High_update(void)
//  152 {
High_update:
        PUSH     {R7,LR}
//  153     float high = 0;
        MOVS     R0,#+0
//  154     static float h;
//  155     
//  156     if(Height_update == true)
        LDR.N    R1,??DataTable4_7
        LDRB     R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??High_update_0
//  157     { 
//  158         Integral_high = true;
        LDR.N    R0,??DataTable4_16
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  159         Height_update = false;       
        LDR.N    R0,??DataTable4_7
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  160         h =  median(data_high, 7, (float)Height);
        LDR.N    R0,??DataTable4_9
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R2,R0
        MOVS     R1,#+7
        LDR.N    R0,??DataTable4_17
        BL       median
        LDR.N    R1,??DataTable4_18
        STR      R0,[R1, #+0]
//  161 //           if(ph <= &wh[5999])
//  162 //           {
//  163 //             *ph = Height;
//  164 //              ph++;
//  165 //           }    
//  166     }
//  167    
//  168     high =  kalman_filter1(h);
??High_update_0:
        LDR.N    R0,??DataTable4_18
        LDR      R0,[R0, #+0]
        BL       kalman_filter1
//  169     if(high >= 180)Landing = true;
        LDR.N    R1,??DataTable4_19  ;; 0x43340000
        BL       __aeabi_cfrcmple
        BHI.N    ??High_update_1
        LDR.N    R1,??DataTable4_20
        MOVS     R2,#+1
        STRB     R2,[R1, #+0]
//  170     return high;
??High_update_1:
        POP      {R1,PC}          ;; return
//  171 }

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??h:
        DS8 4
//  172 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  173 void SendDataToGUI(void)
//  174 {
SendDataToGUI:
        PUSH     {R3-R5,LR}
//  175 
//  176     Send_flag = false;
        LDR.N    R0,??DataTable4_21
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  177     int data_length = 0;
        MOVS     R4,#+0
//  178     Delay_ms(200);
        LDR.N    R0,??DataTable4_13  ;; 0x43480000
        BL       Delay_ms
//  179     data_length = dataLencounter;
        LDR.N    R0,??DataTable4_22
        LDR      R0,[R0, #+0]
        MOVS     R4,R0
//  180     if(data_length > DataLength)data_length = DataLength;
        MOVW     R0,#+6001
        CMP      R4,R0
        BLT.N    ??SendDataToGUI_0
        MOVW     R4,#+6000
//  181     //////////////////////·¢ËÍÊý¾Ý³¤¶È///////////////////////////////////////////////
//  182     SendFloat((float)data_length,UART0);
??SendDataToGUI_0:
        LDR.N    R1,??DataTable4_1  ;; 0x4006a000
        MOVS     R5,R1
        MOVS     R0,R4
        BL       __aeabi_i2f
        MOVS     R1,R5
        BL       SendFloat
//  183     Delay_ms(120);
        LDR.N    R0,??DataTable4_23  ;; 0x42f00000
        BL       Delay_ms
//  184     LED_Change;
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_reverse
//  185     //////////////////////·¢ËÍX·½ÏòÎ»ÒÆ//////////////////////////////////////////////
//  186     for(int i = 0;i < data_length;i++)
        MOVS     R5,#+0
        B.N      ??SendDataToGUI_1
//  187     {
//  188       //SendInt32(wx[i],UART0);
//  189       SendFloat(wx[i],UART0);
??SendDataToGUI_2:
        LDR.N    R1,??DataTable4_1  ;; 0x4006a000
        LDR.N    R0,??DataTable4_24
        LDR      R0,[R0, R5, LSL #+2]
        BL       SendFloat
//  190       if(i % 103 == 0)
        MOVS     R0,#+103
        SDIV     R1,R5,R0
        MLS      R0,R0,R1,R5
        CMP      R0,#+0
        BNE.N    ??SendDataToGUI_3
//  191       {
//  192       //  Delay_ms(110);
//  193         LED_Change;
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_reverse
//  194       }
//  195     }
??SendDataToGUI_3:
        ADDS     R5,R5,#+1
??SendDataToGUI_1:
        CMP      R5,R4
        BLT.N    ??SendDataToGUI_2
//  196     //////////////////////·¢ËÍY·½ÏòÎ»ÒÆ//////////////////////////////////////////////
//  197     for(int i = 0;i < data_length;i++)
        MOVS     R5,#+0
        B.N      ??SendDataToGUI_4
//  198     {
//  199       //SendInt32(wx[i],UART0);
//  200       SendFloat(wy[i],UART0);
??SendDataToGUI_5:
        LDR.N    R1,??DataTable4_1  ;; 0x4006a000
        LDR.N    R0,??DataTable4_25
        LDR      R0,[R0, R5, LSL #+2]
        BL       SendFloat
//  201       if(i % 103 == 0)
        MOVS     R0,#+103
        SDIV     R1,R5,R0
        MLS      R0,R0,R1,R5
        CMP      R0,#+0
        BNE.N    ??SendDataToGUI_6
//  202       {
//  203       //  Delay_ms(110);
//  204         LED_Change;
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_reverse
//  205       }
//  206     }
??SendDataToGUI_6:
        ADDS     R5,R5,#+1
??SendDataToGUI_4:
        CMP      R5,R4
        BLT.N    ??SendDataToGUI_5
//  207     //////////////////////·¢ËÍ¸ß¶ÈH/////////////////////////////////////////////////
//  208     for(int i = 0;i < data_length;i++)
        MOVS     R5,#+0
        B.N      ??SendDataToGUI_7
//  209     {
//  210       //SendInt32(wx[i],UART0);
//  211       SendFloat(wz[i],UART0);
??SendDataToGUI_8:
        LDR.N    R1,??DataTable4_1  ;; 0x4006a000
        LDR.N    R0,??DataTable4_26
        LDR      R0,[R0, R5, LSL #+2]
        BL       SendFloat
//  212       if(i % 103 == 0)
        MOVS     R0,#+103
        SDIV     R1,R5,R0
        MLS      R0,R0,R1,R5
        CMP      R0,#+0
        BNE.N    ??SendDataToGUI_9
//  213       {
//  214       //  Delay_ms(110);
//  215         LED_Change;
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_reverse
//  216       }
//  217     }
??SendDataToGUI_9:
        ADDS     R5,R5,#+1
??SendDataToGUI_7:
        CMP      R5,R4
        BLT.N    ??SendDataToGUI_8
//  218 
//  219 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x4006b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     PORTE_isr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x41f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     Height_update

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     BaseHeight

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     Height

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     ??temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     lastHeight

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     preHeight

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     0x43480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     SendToGUI_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_16:
        DC32     Integral_high

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_17:
        DC32     data_high

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_18:
        DC32     ??h

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_19:
        DC32     0x43340000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_20:
        DC32     Landing

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_21:
        DC32     Send_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_22:
        DC32     dataLencounter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_23:
        DC32     0x42f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_24:
        DC32     wx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_25:
        DC32     wy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_26:
        DC32     wz

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
//    10 bytes in section .bss
//     1 byte  in section .data
// 1 060 bytes in section .text
// 
// 1 060 bytes of CODE memory
//    11 bytes of DATA memory
//
//Errors: none
//Warnings: none
