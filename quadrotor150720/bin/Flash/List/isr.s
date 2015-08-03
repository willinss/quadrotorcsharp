///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:13 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\isr.c                             /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\isr.c" -D IAR -D TWR_K60N512     /
//                    -lCN "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸ú /
//                    ËæÐ¡³µ(¸ÄI2C)\bin\Flash\List\" -lB                      /
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
//                    (¸ÄI2C)\bin\Flash\List\isr.s                            /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME isr

        #define SHT_PROGBITS 0x1

        EXTERN ReadBMA180
        EXTERN ReadBMAsteer
        EXTERN ReadMPU3205
        EXTERN ReadMPUsteer
        EXTERN __aeabi_cfcmple
        EXTERN hw_gpio_reverse
        EXTERN periph_clk_khz
        EXTERN print_pixel_data
        EXTERN set_pwm
        EXTERN uart_re1

        PUBLIC Axis_update
        PUBLIC Axis_x
        PUBLIC Axis_y
        PUBLIC Backup_landing
        PUBLIC BaseHeight
        PUBLIC CH
        PUBLIC Clear
        PUBLIC Debug_Mode
        PUBLIC Fly_Mode
        PUBLIC Height
        PUBLIC Height_update
        PUBLIC `High`
        PUBLIC Initial_flag
        PUBLIC Landing
        PUBLIC PORTE_isr
        PUBLIC Pit_update
        PUBLIC Pwm_h
        PUBLIC Send_flag
        PUBLIC Start_flag
        PUBLIC Stop_flag
        PUBLIC Time_counter
        PUBLIC c_revise_x
        PUBLIC c_revise_y
        PUBLIC data_high
        PUBLIC datas_mid
        PUBLIC irq_counter
        PUBLIC isrcounter
        PUBLIC median
        PUBLIC motionState
        PUBLIC pit0_isr
        PUBLIC re_X
        PUBLIC re_Y
        PUBLIC revise_x
        PUBLIC revise_y
        PUBLIC send_data
        PUBLIC signal_target
        PUBLIC signal_x
        PUBLIC signal_y
        PUBLIC startMotion
        PUBLIC uart0_isr
        PUBLIC uart1_isr

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\isr.c
//    1 //-------------------------------------------------------------------------*
//    2 // ÎÄ¼þÃû: isr.c                                                           *
//    3 // Ëµ  Ã÷: ÖÐ¶Ï´¦ÀíÀý³Ì                                                    *
//    4 
//    5 #include "includes.h"
//    6 #include "math.h"
//    7 #include "control.h"
//    8 #define Initial_Ok 0xe9
//    9 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 float revise_x  = 0;
revise_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 float revise_y  = 0;
revise_y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 uint32 Time_counter = 0;
Time_counter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   13 uint16 Height = 0;
Height:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   14 uint16 BaseHeight = 0;
BaseHeight:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   15 bool send_data = false;
send_data:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   16 bool Pit_update = false;
Pit_update:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   17 bool Landing  = false;
Landing:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   18 bool Start_flag = false;
Start_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   19 bool Stop_flag = false;
Stop_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   20 bool Backup_landing = false;
Backup_landing:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   21 bool Height_update = false;
Height_update:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   22 bool Send_flag = false;
Send_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   23 bool Initial_flag = false;
Initial_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   24 bool startMotion = false;
startMotion:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   25 bool signal_target = false;//ÓÃÒÔÅÐ¶ÏÉãÏñÍ·ÊÇ·ñ·¢ÏÖÄ¿±ê
signal_target:
        DS8 1
//   26 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   27 uint8 motionState = motionClear;
motionState:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 float data_high[7] = {0};
data_high:
        DS8 28

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 float datas_mid[7];
datas_mid:
        DS8 28
//   30 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   31 uint8 irq_counter = 0;
irq_counter:
        DS8 1
//   32 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   33 int16 Pwm_h = 0;
Pwm_h:
        DS8 2
//   34 //uint8 Fix_high = 0;
//   35 //uint16 Fix_h = 0;

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   36 uint8 Clear = 1;
Clear:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   37 float High = 0;
`High`:
        DS8 4
//   38 

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
//   39 double Axis_x = 0;
Axis_x:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
//   40 double Axis_y = 0;
Axis_y:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   41 bool Axis_update = false;
Axis_update:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   42 int16 isrcounter = 0;
isrcounter:
        DS8 2
//   43 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   44 uint8 Fly_Mode = 0x6e;//Ä¬ÈÏÎª×ÔÓÉÄ£Ê½
Fly_Mode:
        DATA
        DC8 110

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   45 uint8 Debug_Mode = LoacalK60Mod;
Debug_Mode:
        DATA
        DC8 238

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   46 float c_revise_x = 0,c_revise_y = 0;
c_revise_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
c_revise_y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47 float signal_x =0,signal_y = 0;
signal_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
signal_y:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   48 float median(float *data, char length, float high)
//   49 {
median:
        PUSH     {R4-R6,LR}
        MOVS     R3,R1
//   50     unsigned char ii, jj, mid;
//   51     float data_tmp;
//   52 
//   53 
//   54     data_high[0] = data_high[1];
        LDR.W    R1,??DataTable4
        LDR      R1,[R1, #+4]
        LDR.W    R4,??DataTable4
        STR      R1,[R4, #+0]
//   55     data_high[1] = data_high[2];
        LDR.W    R1,??DataTable4
        LDR.W    R4,??DataTable4
        LDR      R4,[R4, #+8]
        STR      R4,[R1, #+4]
//   56     data_high[2] = data_high[3];
        LDR.W    R1,??DataTable4
        LDR.W    R4,??DataTable4
        LDR      R4,[R4, #+12]
        STR      R4,[R1, #+8]
//   57     data_high[3] = data_high[4];
        LDR.W    R1,??DataTable4
        LDR.W    R4,??DataTable4
        LDR      R4,[R4, #+16]
        STR      R4,[R1, #+12]
//   58     data_high[4] = data_high[5];
        LDR.W    R1,??DataTable4
        LDR.W    R4,??DataTable4
        LDR      R4,[R4, #+20]
        STR      R4,[R1, #+16]
//   59     data_high[5] = data_high[6];
        LDR.W    R1,??DataTable4
        LDR.W    R4,??DataTable4
        LDR      R4,[R4, #+24]
        STR      R4,[R1, #+20]
//   60     data_high[6] = high;
        LDR.W    R1,??DataTable4
        STR      R2,[R1, #+24]
//   61 
//   62     mid = length >> 1;
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LSRS     R2,R3,#+1
//   63     for(ii = 0; ii < length; ii++)
        MOVS     R4,#+0
        B.N      ??median_0
//   64     {
//   65         *(datas_mid + ii) = *(data + ii);
??median_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR      R1,[R0, R4, LSL #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R5,??DataTable4_1
        STR      R1,[R5, R4, LSL #+2]
//   66     }
        ADDS     R4,R4,#+1
??median_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R4,R3
        BCC.N    ??median_1
//   67 
//   68     for(ii = 0; ii <= mid; ii++)
        MOVS     R4,#+0
        B.N      ??median_2
//   69         for(jj = ii + 1; jj < length; jj++)
//   70         {
//   71 
//   72             if (*(datas_mid + ii) < *(datas_mid + jj) )
??median_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R4, LSL #+2]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable4_1
        LDR      R1,[R1, R5, LSL #+2]
        BL       __aeabi_cfcmple
        BCS.N    ??median_4
//   73             {
//   74                 data_tmp = *(datas_mid + ii);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R4, LSL #+2]
//   75                 *(datas_mid + ii) = *(datas_mid + jj);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R1,??DataTable4_1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R6,??DataTable4_1
        LDR      R6,[R6, R5, LSL #+2]
        STR      R6,[R1, R4, LSL #+2]
//   76                 *(datas_mid + jj) = data_tmp;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDR.W    R1,??DataTable4_1
        STR      R0,[R1, R5, LSL #+2]
//   77             }
//   78         }
??median_4:
        ADDS     R5,R5,#+1
??median_5:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R5,R3
        BCC.N    ??median_3
        ADDS     R4,R4,#+1
??median_2:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R2,R4
        BCC.N    ??median_6
        ADDS     R5,R4,#+1
        B.N      ??median_5
//   79     return *(datas_mid + mid);
??median_6:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, R2, LSL #+2]
        POP      {R4-R6,PC}       ;; return
//   80 }
//   81 
//   82 /*
//   83 int get_mid(int a, int b,int c)
//   84 {
//   85  int x=0;
//   86  if(a>b){x=b;b=a;a=x;}
//   87  if(b>c){x=c;c=b;b=x;}
//   88  if(a>b){x=b;b=a;a=x;}
//   89  return b ;
//   90 }
//   91 */
//   92 //-------------------------------------------------------------------------*
//   93 //º¯ÊýÃû: uart0_isr                                                        *
//   94 //¹¦  ÄÜ: ´®¿Ú0Êý¾Ý½ÓÊÕÖÐ¶ÏÀý                                              *
//   95 //Ëµ  Ã÷: ÎÞ                                                               *
//   96 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   97 void uart0_isr(void)
//   98 { uint8 ch = 0;
uart0_isr:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//   99   static uint8 send_data_flag = 0;
//  100   uart_re1 (UART0, &ch);
        ADD      R1,SP,#+0
        LDR.W    R0,??DataTable4_2  ;; 0x4006a000
        BL       uart_re1
//  101    if(Stop_flag == true)
        LDR.W    R0,??DataTable4_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??uart0_isr_0
//  102  {
//  103     if(send_data_flag = 0 && ch == 0xaa)send_data_flag = 1;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable4_4
        STRB     R0,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??uart0_isr_1
        LDR.N    R0,??DataTable4_4
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??uart0_isr_0
//  104     else if(send_data_flag = 1 && ch == 0x4a)send_data_flag = 2;
??uart0_isr_1:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+74
        BNE.N    ??uart0_isr_2
        MOVS     R0,#+1
        B.N      ??uart0_isr_3
??uart0_isr_2:
        MOVS     R0,#+0
??uart0_isr_3:
        LDR.N    R1,??DataTable4_4
        STRB     R0,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??uart0_isr_4
        LDR.N    R0,??DataTable4_4
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
        B.N      ??uart0_isr_0
//  105     else if(send_data_flag = 2 && ch == 0x06)send_data_flag = 3;
??uart0_isr_4:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+6
        BNE.N    ??uart0_isr_5
        MOVS     R0,#+1
        B.N      ??uart0_isr_6
??uart0_isr_5:
        MOVS     R0,#+0
??uart0_isr_6:
        LDR.N    R1,??DataTable4_4
        STRB     R0,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??uart0_isr_7
        LDR.N    R0,??DataTable4_4
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
        B.N      ??uart0_isr_0
//  106     else if(send_data_flag = 3 && ch == 0xbb)
??uart0_isr_7:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+187
        BNE.N    ??uart0_isr_8
        MOVS     R0,#+1
        B.N      ??uart0_isr_9
??uart0_isr_8:
        MOVS     R0,#+0
??uart0_isr_9:
        LDR.N    R1,??DataTable4_4
        STRB     R0,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??uart0_isr_10
//  107     {
//  108       send_data_flag = 0;
        LDR.N    R0,??DataTable4_4
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  109       Send_flag = true;
        LDR.N    R0,??DataTable4_5
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??uart0_isr_0
//  110     }
//  111    else send_data_flag = 0;
??uart0_isr_10:
        LDR.N    R0,??DataTable4_4
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  112  }
//  113  
//  114  if(ch == 0xee)print_pixel_data();
??uart0_isr_0:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+238
        BNE.N    ??uart0_isr_11
        BL       print_pixel_data
//  115  
//  116 }
??uart0_isr_11:
        POP      {R0,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??send_data_flag:
        DS8 1
//  117 //-------------------------------------------------------------------------*
//  118 //º¯ÊýÃû: uart0_isr                                                        *
//  119 //¹¦  ÄÜ: ´®¿Ú1Êý¾Ý½ÓÊÕÖÐ¶ÏÀý                                              *
//  120 //Ëµ  Ã÷: ÎÞ                                                               *
//  121 //-------------------------------------------------------------------------*

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  122 int re_X;
re_X:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  123 int re_Y;
re_Y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  124 uint8 CH;
CH:
        DS8 1
//  125 //extern int PointX,PointY;
//  126 //int targetlosetime=0;
//  127 
//  128 //int GlobleRec[10];

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  129 void uart1_isr(void)
//  130 {
uart1_isr:
        PUSH     {R7,LR}
//  131     uint8 ch;
//  132     static uint8 data_flag = 0;
//  133     //static uint8 i = 0;
//  134     //static uint8 axis[4] = {0};
//  135     static uint8 rec0[4]={0};
//  136     //static uint8 send0[6]={0};
//  137     static bool data_finish = true;
//  138     static bool rev_data_fish = true;
//  139     static uint8 revise_flag = 0;
//  140     static uint8 buff_counter=0;
//  141  
//  142     
//  143     //½ÓÊÕÒ»¸ö×Ö½ÚÊý¾Ý²¢»Ø·¢
//  144     uart_re1 (UART1, &ch);
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable4_6  ;; 0x4006b000
        BL       uart_re1
//  145     CH=ch;
        LDR.N    R0,??DataTable4_7
        LDRB     R1,[SP, #+0]
        STRB     R1,[R0, #+0]
//  146     
//  147 
//  148    if(ch>0x60 &&ch<0x80)//ÅÐ¶Ï½ÓÊÜ×Ö½ÚÎª´Ë·¶Î§Êý¾ÝÔòÊÇÒ£¿ØÆ÷ÐÅºÅ
        LDRB     R0,[SP, #+0]
        SUBS     R0,R0,#+97
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+31
        BCS.N    ??uart1_isr_0
//  149    {
//  150 //////////////////////////////½ÓÊÕÄ¿±êÎ»ÖÃ×ø±ê//////////////////////////////////
//  151 //    if(data_flag == 2)
//  152 //    {
//  153 //        axis[i] = ch;
//  154 //        i++;
//  155 //    }
//  156 //    if(i >= 4)
//  157 //    {
//  158 //        data_finish = false;
//  159 //        axistemp = *(int32 *)axis;
//  160 //        Axis_x = axistemp % 1000;
//  161 //        Axis_y = axistemp / 1000 % 1000;
//  162 //        symbolBit = axistemp / 1000000;
//  163 //        //Axis_y = *(int16 *)(axis + 2);
//  164 //        if(symbolBit == 1)Axis_y = -Axis_y;
//  165 //        if(symbolBit == 2)Axis_x = -Axis_x;
//  166 //        if(symbolBit == 3){Axis_y = -Axis_y;Axis_x = -Axis_x;}
//  167 //        i = 0;
//  168 //        data_flag = 0;
//  169 //        isrcounter++;
//  170 //        Axis_update = true;
//  171 //    }
//  172 //    else
//  173 //    {
//  174 //        data_finish = true;
//  175 //    }
//  176 //    
//  177 //    if(data_flag == 0 && Start_flag == true)
//  178 //    {
//  179 //        if(ch == Axis_First_Frame) data_flag = 1;
//  180 //        else           data_flag = 0;
//  181 //    }
//  182 //    else if (data_flag == 1 )
//  183 //    {
//  184 //        if(ch == Axis_End_Frame) data_flag = 2;
//  185 //        else           data_flag = 0;
//  186 //    }
//  187 ////////////////////////////////////////////////////////////////////////////////    
//  188 //////////////////////////³õÊ¼»¯²ÎÊý½ÓÊÕ////////////////////////////////////////
//  189 //  rev_data_fish = true;
//  190 //  if(Initial_flag == false)
//  191 //  {
//  192 //    if(revise_flag == 2)
//  193 //    {
//  194 //        revise_data[j] = ch;
//  195 //        j++;
//  196 //    }
//  197 //    if(j >= 82  && revise_data[80]== 0xD3 && revise_data[81]== 0xDA)
//  198 //    {
//  199 //        rev_data_fish = false;
//  200 //        c_revise_y = *(float *)revise_data;
//  201 //        c_revise_x = *(float *)(revise_data + 4 * 1);
//  202 //        Kp3 = *(float *)(revise_data + 4 * 2);
//  203 //        Ki3 = *(float *)(revise_data + 4 * 3);
//  204 //        Kd3 = *(float *)(revise_data + 4 * 4);
//  205 //        
//  206 //        Kp2 = *(float *)(revise_data + 4 * 5);
//  207 //        Ki2 = *(float *)(revise_data + 4 * 6);
//  208 //        Kd2 = *(float *)(revise_data + 4 * 7);
//  209 //        
//  210 //        Kp4 = *(float *)(revise_data + 4 * 8);
//  211 //        Ki4 = *(float *)(revise_data + 4 * 9);
//  212 //        Kd4 = *(float *)(revise_data + 4 * 10);
//  213 //        
//  214 //        Kx = *(float *)(revise_data + 4 * 11);
//  215 //        Kix = *(float *)(revise_data + 4 * 12);
//  216 //        Kdx = *(float *)(revise_data + 4 *13);
//  217 //        
//  218 //        Ky = *(float *)(revise_data + 4 * 14);
//  219 //        Kiy = *(float *)(revise_data + 4 * 15);
//  220 //        Kdy = *(float *)(revise_data + 4 * 16);
//  221 //        
//  222 //        Kp1 = *(float *)(revise_data + 4 * 17);
//  223 //        Ki1 = *(float *)(revise_data + 4 * 18);
//  224 //        Kd1 = *(float *)(revise_data + 4 * 19);   
//  225 //        j = 0;
//  226 //        revise_flag = 0;
//  227 //        Initial_flag = true;
//  228 //        
//  229 //        uart_send1 (UART1, Initial_Ok);
//  230 //        uart_send1 (UART1, Initial_Ok);
//  231 //        uart_send1 (UART1, Initial_Ok);//³õÊ¼»¯Íê³É
//  232 //        LED3_OFF;
//  233 //    }
//  234 //
//  235 //    
//  236 //        
//  237 //    
//  238 //    
//  239 //    if(revise_flag == 0 )
//  240 //    {
//  241 //        if(ch == Revise_First_Frame) revise_flag = 1;
//  242 //        else           revise_flag = 0;
//  243 //    }
//  244 //    else if (revise_flag == 1 )
//  245 //    {
//  246 //        if(ch == Revise_End_Frame) revise_flag = 2;
//  247 //        else           revise_flag = 0;
//  248 //    }
//  249 //  }
//  250 ////////////////////////////////////////////////////////////////////////////////    
//  251 //////////////////////////ÅÐ¶Ï·¢ËÍÊý¾ÝÃüÁî//////////////////////////////////////
//  252 // if(Stop_flag == true)
//  253 // {
//  254 //    if(send_data_flag = 0 && ch == 0xaa)send_data_flag = 1;
//  255 //    else if(send_data_flag = 1 && ch == 0x4a)send_data_flag = 2;
//  256 //    else if(send_data_flag = 2 && ch == 0x06)send_data_flag = 3;
//  257 //    else if(send_data_flag = 3 && ch == 0xbb)
//  258 //    {
//  259 //      send_data_flag = 0;
//  260 //      Send_flag = true;
//  261 //    }
//  262 //   else send_data_flag = 0;
//  263 // }
//  264 ////////////////////////////////////////////////////////////////////////////////    
//  265 //////////////////////////////¿ØÖÆÃüÁî//////////////////////////////////////////
//  266     if(data_flag == 0 && revise_flag == 0 && data_finish == true && rev_data_fish == true)
        LDR.N    R0,??DataTable4_8
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable4_9
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.W    ??uart1_isr_1
        LDR.N    R0,??DataTable4_10
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable4_11
        LDRB     R1,[R1, #+0]
        TST      R0,R1
        BEQ.W    ??uart1_isr_1
//  267     {
//  268         switch( ch )
        LDRB     R0,[SP, #+0]
        CMP      R0,#+103
        BEQ.N    ??uart1_isr_2
        CMP      R0,#+105
        BEQ.N    ??uart1_isr_3
        CMP      R0,#+107
        BEQ.N    ??uart1_isr_4
        CMP      R0,#+108
        BEQ.N    ??uart1_isr_5
        CMP      R0,#+109
        BEQ.N    ??uart1_isr_6
        CMP      R0,#+110
        BEQ.N    ??uart1_isr_7
        CMP      R0,#+111
        BEQ.N    ??uart1_isr_8
        CMP      R0,#+112
        BNE.W    ??uart1_isr_1
//  269         {
//  270         case 0x70 :
//  271             Stop_flag = true;
??uart1_isr_9:
        LDR.N    R0,??DataTable4_3
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  272             POWER_OFF;
        MOV      R3,#+1000
        MOV      R2,#+1000
        MOV      R1,#+1000
        MOV      R0,#+1000
        BL       set_pwm
//  273             break;//Í£Ö¹
        B.N      ??uart1_isr_1
//  274         case 0x6F :
//  275             Landing   = true;
??uart1_isr_8:
        LDR.N    R0,??DataTable4_12
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  276             break;//»ºÂý½µÂä
        B.N      ??uart1_isr_1
//  277         case 0x6D :
//  278             Start_flag  = true;
??uart1_isr_6:
        LDR.N    R0,??DataTable4_13
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  279             break;//ÎÕÊÖÐÅºÅ
        B.N      ??uart1_isr_1
//  280         case 0x6c :
//  281             Backup_landing  = true;
??uart1_isr_5:
        LDR.N    R0,??DataTable4_14
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  282             break;
        B.N      ??uart1_isr_1
//  283         case FreeMode ://6e
//  284             Fly_Mode = FreeMode;
??uart1_isr_7:
        LDR.N    R0,??DataTable4_15
        MOVS     R1,#+110
        STRB     R1,[R0, #+0]
//  285             break;
        B.N      ??uart1_isr_1
//  286         case 0x6b:
//  287             startMotion = true;
??uart1_isr_4:
        LDR.N    R0,??DataTable4_16
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  288             break;
        B.N      ??uart1_isr_1
//  289         case 0x69:
//  290           send_data =true;//¿ªÊ¼·¢Êý¾Ý
??uart1_isr_3:
        LDR.N    R0,??DataTable4_17
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  291           break;
        B.N      ??uart1_isr_1
//  292         case 0x67:
//  293           send_data = false;//Í£Ö¹·¢Êý¾Ý
??uart1_isr_2:
        LDR.N    R0,??DataTable4_17
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  294           break;
        B.N      ??uart1_isr_1
//  295 
//  296         }
//  297     }
//  298    }
//  299    
//  300    else   //ÆäÓàÎª¶æ»ú¿ØÖÆÐÅºÅ
//  301    {  
//  302         //½ÓÊÕÊý¾Ý»º³åÇø
//  303         for(int i=0;i<3;i++)
??uart1_isr_0:
        MOVS     R0,#+0
        B.N      ??uart1_isr_10
//  304         rec0[i]=rec0[i+1];//½ÓÊÕÊý¾Ý¸üÐÂ
??uart1_isr_11:
        LDR.N    R1,??DataTable4_18
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+1]
        LDR.N    R2,??DataTable4_18
        STRB     R1,[R0, R2]
        ADDS     R0,R0,#+1
??uart1_isr_10:
        CMP      R0,#+3
        BLT.N    ??uart1_isr_11
//  305         rec0[3]=ch;
        LDR.N    R0,??DataTable4_18
        LDRB     R1,[SP, #+0]
        STRB     R1,[R0, #+3]
//  306 
//  307         if(255==rec0[0])
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+255
        BNE.N    ??uart1_isr_1
//  308         {
//  309           if(rec0[1]>95)
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+1]
        CMP      R0,#+96
        BCC.N    ??uart1_isr_12
//  310           {
//  311             rec0[1]=rec0[1];
        LDR.N    R0,??DataTable4_18
        LDR.N    R1,??DataTable4_18
        LDRB     R1,[R1, #+1]
        STRB     R1,[R0, #+1]
//  312           }
//  313           if(rec0[2]>95)
??uart1_isr_12:
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+2]
        CMP      R0,#+96
        BCC.N    ??uart1_isr_13
//  314           {
//  315             rec0[2]=rec0[2];
        LDR.N    R0,??DataTable4_18
        LDR.N    R1,??DataTable4_18
        LDRB     R1,[R1, #+2]
        STRB     R1,[R0, #+2]
//  316           }
//  317           if(253==rec0[3])
??uart1_isr_13:
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+3]
        CMP      R0,#+253
        BNE.N    ??uart1_isr_14
//  318           {
//  319             re_X=rec0[1];
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable4_19
        STR      R0,[R1, #+0]
//  320             re_Y=rec0[2];
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable4_20
        STR      R0,[R1, #+0]
        B.N      ??uart1_isr_15
//  321           }
//  322           else if(252==rec0[3])
??uart1_isr_14:
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+3]
        CMP      R0,#+252
        BNE.N    ??uart1_isr_16
//  323           {
//  324             re_X=rec0[1];
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable4_19
        STR      R0,[R1, #+0]
//  325             re_X=-re_X;
        LDR.N    R0,??DataTable4_19
        LDR.N    R1,??DataTable4_19
        LDR      R1,[R1, #+0]
        RSBS     R1,R1,#+0
        STR      R1,[R0, #+0]
//  326             re_Y=rec0[2];
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable4_20
        STR      R0,[R1, #+0]
        B.N      ??uart1_isr_15
//  327           }
//  328           else if(251==rec0[3])
??uart1_isr_16:
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+3]
        CMP      R0,#+251
        BNE.N    ??uart1_isr_17
//  329           {
//  330             re_X=rec0[1];
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable4_19
        STR      R0,[R1, #+0]
//  331             re_Y=rec0[2];
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable4_20
        STR      R0,[R1, #+0]
//  332             re_Y=-re_Y;
        LDR.N    R0,??DataTable4_20
        LDR.N    R1,??DataTable4_20
        LDR      R1,[R1, #+0]
        RSBS     R1,R1,#+0
        STR      R1,[R0, #+0]
        B.N      ??uart1_isr_15
//  333           }
//  334           else if(250==rec0[3])
??uart1_isr_17:
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+3]
        CMP      R0,#+250
        BNE.N    ??uart1_isr_15
//  335           {
//  336             re_X=rec0[1];
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable4_19
        STR      R0,[R1, #+0]
//  337             re_Y=rec0[2];
        LDR.N    R0,??DataTable4_18
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable4_20
        STR      R0,[R1, #+0]
//  338             re_X=-re_X;
        LDR.N    R0,??DataTable4_19
        LDR.N    R1,??DataTable4_19
        LDR      R1,[R1, #+0]
        RSBS     R1,R1,#+0
        STR      R1,[R0, #+0]
//  339             re_Y=-re_Y;
        LDR.N    R0,??DataTable4_20
        LDR.N    R1,??DataTable4_20
        LDR      R1,[R1, #+0]
        RSBS     R1,R1,#+0
        STR      R1,[R0, #+0]
//  340           }
//  341           for(int j=0;j<4;j++)//¶ÁÈ¡Êý¾Ýºó»º³åÇøÇåÁã
??uart1_isr_15:
        MOVS     R0,#+0
        B.N      ??uart1_isr_18
//  342           {
//  343               rec0[j]=0;
??uart1_isr_19:
        LDR.N    R1,??DataTable4_18
        MOVS     R2,#+0
        STRB     R2,[R0, R1]
//  344           }
        ADDS     R0,R0,#+1
??uart1_isr_18:
        CMP      R0,#+4
        BLT.N    ??uart1_isr_19
//  345           signal_target=true;
        LDR.N    R0,??DataTable4_21
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  346         }
//  347 //        if(255==rec0[0]&&254==rec0[5])
//  348 //        {
//  349 //          if(0!=rec0[1])
//  350 //          {
//  351 //            re_X=rec0[1];
//  352 //          }
//  353 //          else
//  354 //          {
//  355 //            re_X=-rec0[2];
//  356 //          }
//  357 //          if(0!=rec0[3])
//  358 //          {
//  359 //            re_Y=rec0[3];
//  360 //          }
//  361 //          else
//  362 //          {
//  363 //            re_Y=-rec0[4];
//  364 //          }
//  365 //          for(int j=0;j<6;j++)//¶ÁÈ¡Êý¾Ýºó»º³åÇøÇåÁã
//  366 //          {
//  367 //             rec0[j]=0;
//  368 //          }
//  369 //          signal_target=true;
//  370 //          
//  371 //        }
//  372 //        else if(253==rec0[0])
//  373 //        {
//  374 //            targetlosetime++;
//  375 //            if(targetlosetime==10)
//  376 //            {
//  377 //              //signal_target=false;
//  378 //              targetlosetime=0;
//  379 //            }
//  380 //        }
//  381 
//  382 //        send0[0]=255;
//  383 //        if(PointX>=0)
//  384 //          {
//  385 //            send0[1]=(uint8)PointX;
//  386 //          }
//  387 //          else
//  388 //          {
//  389 //            send0[2]=(uint8)-PointX;
//  390 //          }
//  391 //        if(PointY>=0)
//  392 //          {
//  393 //            send0[3]=(uint8)PointY;
//  394 //          }
//  395 //          else
//  396 //          {
//  397 //            send0[4]=(uint8)-PointY;
//  398 //          }
//  399 //        send0[5]=254;
//  400 //        
//  401 //          uart_send1 (UART1, send0[buff_counter]);
//  402 //          buff_counter++;
//  403 //          if(buff_counter==6)buff_counter=0;
//  404    }
//  405   
//  406    
//  407         
//  408 }
??uart1_isr_1:
        POP      {R0,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??data_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??rec0:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??data_finish:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
??rev_data_fish:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??revise_flag:
        DS8 1
//  409 //==========================================================================
//  410 //º¯ÊýÃû³Æ£ºpit0_isr
//  411 //¹¦ÄÜ¸ÅÒª£ºÖÐ¶ÏÀý³Ì
//  412 //²ÎÊýËµÃ÷£ºÎÞ
//  413 //º¯Êý·µ»Ø£ºÎÞ
//  414 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  415 void pit0_isr(void)
//  416 {
pit0_isr:
        PUSH     {R7,LR}
//  417     //DisableInterrupts;	                                //¹Ø×ÜÖÐ¶Ï
//  418     PIT_TFLG(0) |= PIT_TFLG_TIF_MASK; //ÇåÖÐ¶Ï±êÖ¾
        LDR.N    R0,??DataTable4_22  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable4_22  ;; 0x4003710c
        STR      R0,[R1, #+0]
//  419     Pit_update = true;
        LDR.N    R0,??DataTable4_23
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  420 
//  421     Time_counter ++ ;
        LDR.N    R0,??DataTable4_24
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_24
        STR      R0,[R1, #+0]
//  422 
//  423 
//  424     if(Time_counter <= COUNTER)                      //Êý¾Ý³õÊ¼»¯Íê³É¿ªÊ¼
        LDR.N    R0,??DataTable4_24
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BHI.N    ??pit0_isr_0
//  425     {
//  426         ReadMPU3205();
        BL       ReadMPU3205
//  427         ReadBMA180();
        BL       ReadBMA180
//  428         ReadMPUsteer();
        BL       ReadMPUsteer
//  429         ReadBMAsteer();
        BL       ReadBMAsteer
//  430         //read_hmc5883l();
//  431         //read_L3G4200D();
//  432         //read_ADXL345();
//  433     }
//  434 }
??pit0_isr_0:
        POP      {R0,PC}          ;; return
//  435 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  436 void PORTE_isr(void)
//  437 {
PORTE_isr:
        PUSH     {R4,LR}
//  438     uint32 timer_count = 0;
        MOVS     R4,#+0
//  439     uint16 hight = 0;
        MOVS     R0,#+0
//  440     uint32 time = 0;
        MOVS     R1,#+0
//  441     static uint32 s_time = 0, r_time = 0;
//  442   
//  443     //PORTE_ISFR
//  444 
//  445     timer_count = PIT_CVAL(1);
        LDR.N    R2,??DataTable4_25  ;; 0x40037114
        LDR      R2,[R2, #+0]
        MOVS     R4,R2
//  446     irq_counter++;
        LDR.N    R2,??DataTable4_26
        LDRB     R2,[R2, #+0]
        ADDS     R2,R2,#+1
        LDR.N    R3,??DataTable4_26
        STRB     R2,[R3, #+0]
//  447     if(irq_counter == 1)
        LDR.N    R2,??DataTable4_26
        LDRB     R2,[R2, #+0]
        CMP      R2,#+1
        BNE.N    ??PORTE_isr_0
//  448     {
//  449         s_time = timer_count;
        LDR.N    R0,??DataTable4_27
        STR      R4,[R0, #+0]
        B.N      ??PORTE_isr_1
//  450     }
//  451     else if(irq_counter == 2)
??PORTE_isr_0:
        LDR.N    R0,??DataTable4_26
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??PORTE_isr_1
//  452     {
//  453         LED1_Change;
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       hw_gpio_reverse
//  454         irq_counter = 0;
        LDR.N    R0,??DataTable4_26
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  455         r_time = timer_count;
        LDR.N    R0,??DataTable4_28
        STR      R4,[R0, #+0]
//  456         time =  (s_time - r_time) * 1000 / periph_clk_khz; //Î¢Ãëus
        LDR.N    R0,??DataTable4_27
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_28
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        MOV      R1,#+1000
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable4_29
        LDR      R1,[R1, #+0]
        UDIV     R1,R0,R1
//  457         hight = time  / 58 ;                               //Ê±¼ä(Î¢Ãë)³ýÒÔ58¾ÍÊÇ¾àÀë(ÀåÃ×)
        MOVS     R0,#+58
        UDIV     R0,R1,R0
//  458         if(hight < 250 )
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+250
        BCS.N    ??PORTE_isr_1
//  459         {
//  460             Height_update = true;
        LDR.N    R1,??DataTable4_30
        MOVS     R2,#+1
        STRB     R2,[R1, #+0]
//  461             Height = hight;
        LDR.N    R1,??DataTable4_31
        STRH     R0,[R1, #+0]
//  462         }
//  463     }
//  464 }
??PORTE_isr_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     data_high

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     datas_mid

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     Stop_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     ??send_data_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     Send_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x4006b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     CH

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     ??data_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     ??revise_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     ??data_finish

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     ??rev_data_fish

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     Landing

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     Start_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     Backup_landing

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     Fly_Mode

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_16:
        DC32     startMotion

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_17:
        DC32     send_data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_18:
        DC32     ??rec0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_19:
        DC32     re_X

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_20:
        DC32     re_Y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_21:
        DC32     signal_target

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_22:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_23:
        DC32     Pit_update

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_24:
        DC32     Time_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_25:
        DC32     0x40037114

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_26:
        DC32     irq_counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_27:
        DC32     ??s_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_28:
        DC32     ??r_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_29:
        DC32     periph_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_30:
        DC32     Height_update

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_31:
        DC32     Height

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??s_time:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??r_time:
        DS8 4

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  465 
// 
//   150 bytes in section .bss
//     5 bytes in section .data
// 1 110 bytes in section .text
// 
// 1 110 bytes of CODE memory
//   155 bytes of DATA memory
//
//Errors: none
//Warnings: 2
