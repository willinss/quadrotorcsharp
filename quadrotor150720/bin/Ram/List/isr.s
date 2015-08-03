///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:15 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\isr.c                               /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\isr.c" -D IAR -D TWR_K60N512 -lCN  /
//                    "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\bin\Ram\List\" -lB "C:\Documents and             /
//                    Settings\Administrator\iar\Myproject\428IIC\bin\Ram\Lis /
//                    t\" -o "C:\Documents and Settings\Administrator\iar\Myp /
//                    roject\428IIC\bin\Ram\Obj\" --no_cse --no_unroll        /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config "D:\IAR     /
//                    Systems\Embedded Workbench                              /
//                    6.0\arm\INC\c\DLib_Config_Normal.h" -I "C:\Documents    /
//                    and Settings\Administrator\iar\Myproject\428IIC\src\Sou /
//                    rces\H\" -I "C:\Documents and                           /
//                    Settings\Administrator\iar\Myproject\428IIC\src\Sources /
//                    \H\Component_H\" -I "C:\Documents and                   /
//                    Settings\Administrator\iar\Myproject\428IIC\src\Sources /
//                    \H\Frame_H\" -Ol --use_c++_inline                       /
//    List file    =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\bin\Ram\List\isr.s                                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME isr

        EXTERN Angle_accx
        EXTERN Angle_accy
        EXTERN Angle_gyroz
        EXTERN Delay_Nms
        EXTERN Dot_gyro_x
        EXTERN Dot_gyro_y
        EXTERN Kalman_Filter
        EXTERN Kalman_Filter1
        EXTERN enable_pit_interrupt
        EXTERN hw_gpio_reverse
        EXTERN read_ADXL345
        EXTERN read_L3G4200D
        EXTERN set_pwm
        EXTERN uart_re1
        EXTERN uart_reN
        EXTERN uart_send1
        EXTERN uart_sendN

        PUBLIC Angle_X
        PUBLIC Angle_Y
        PUBLIC Angle_Z
        PUBLIC Height
        PUBLIC Time_counter
        PUBLIC pit0_isr
        PUBLIC readheight
        PUBLIC uart0_isr
        PUBLIC uart1_isr
        PUBLIC uart3_isr

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\isr.c
//    1 //-------------------------------------------------------------------------*
//    2 // 文件名: isr.c                                                           *
//    3 // 说  明: 中断处理例程                                                    *
//    4 
//    5 #include "includes.h"
//    6 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 uint32 Time_counter = 0;
Time_counter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//    8 uint16 Height = 0;
Height:
        DS8 2

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    9 uint8 readheight[4] = {0x22,0x00,0x00,0x22};
readheight:
        DATA
        DC8 34, 0, 0, 34

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 float Angle_X = 0, Angle_Y = 0,Angle_Z = 0;
Angle_X:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_Y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Angle_Z:
        DS8 4
//   11   
//   12 //-------------------------------------------------------------------------*
//   13 //函数名: uart3_isr                                                        *
//   14 //功  能: 串口3数据接收中断例程                                            *
//   15 //说  明: 无                                                               *
//   16 //-------------------------------------------------------------------------*

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   17 void uart0_isr(void)
//   18 {
uart0_isr:
        PUSH     {R4,LR}
//   19   static  uint8 dat[4] = {0};
//   20   int16  sum = 0;
        MOVS     R4,#+0
//   21   
//   22   DisableInterrupts;		//关总中断
        CPSID i         
//   23   
//   24   uart_reN(UART0,dat,4);
        MOVS     R2,#+4
        LDR.N    R1,??DataTable3
        LDR.N    R0,??DataTable3_1  ;; 0x4006a000
        BL       uart_reN
//   25   sum = dat[0] + dat[1] + dat[2];                     // 校验和 
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable3
        LDRB     R1,[R1, #+1]
        UXTAB    R0,R1,R0
        LDR.N    R1,??DataTable3
        LDRB     R1,[R1, #+2]
        UXTAB    R0,R0,R1
        MOVS     R4,R0
//   26   sum &= 0xff;                                        //取校验和的低8位
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
//   27   if(dat[3] == sum)                                   //数据传输无误
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+3]
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        CMP      R0,R4
        BNE.N    ??uart0_isr_0
//   28     { 
//   29       Height = dat[1];
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+1]
        LDR.N    R1,??DataTable3_2
        STRH     R0,[R1, #+0]
//   30       Height = (Height << 8) | dat[2] ;               //计算高度单位cm
        LDR.N    R0,??DataTable3_2
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable3
        LDRB     R1,[R1, #+2]
        ORRS     R0,R1,R0, LSL #+8
        LDR.N    R1,??DataTable3_2
        STRH     R0,[R1, #+0]
//   31     }  
//   32 	
//   33   EnableInterrupts;		//开总中断
??uart0_isr_0:
        CPSIE i         
//   34 }
        POP      {R4,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??dat:
        DS8 4
//   35 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   36 void uart1_isr(void)
//   37 {
uart1_isr:
        PUSH     {R7,LR}
//   38     uint8 ch;
//   39     DisableInterrupts;		//关总中断
        CPSID i         
//   40     //接收一个字节数据并回发
//   41 	uart_re1 (UART1,&ch);
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable3_3  ;; 0x4006b000
        BL       uart_re1
//   42           if(ch == 0x05)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+5
        BNE.N    ??uart1_isr_0
//   43           {set_pwm(1000,1000,1000,1000);
        MOV      R3,#+1000
        MOV      R2,#+1000
        MOV      R1,#+1000
        MOV      R0,#+1000
        BL       set_pwm
//   44            
//   45            for(;;)
//   46            { hw_gpio_reverse(PORT_A,15);
??uart1_isr_1:
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_reverse
//   47              Delay_Nms(50);
        LDR.N    R0,??DataTable3_4  ;; 0x42480000
        BL       Delay_Nms
        B.N      ??uart1_isr_1
//   48            }
//   49           }	
//   50 	EnableInterrupts;		//开总中断
??uart1_isr_0:
        CPSIE i         
//   51 }
        POP      {R0,PC}          ;; return
//   52 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   53 void uart3_isr(void)
//   54 {
uart3_isr:
        PUSH     {R7,LR}
//   55     uint8 ch;
//   56     DisableInterrupts;		//关总中断
        CPSID i         
//   57     //接收一个字节数据并回发
//   58 	if(uart_re1 (UART3,&ch))
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable3_5  ;; 0x4006d000
        BL       uart_re1
        CMP      R0,#+0
        BEQ.N    ??uart3_isr_0
//   59 		uart_send1(UART3,ch);
        LDRB     R1,[SP, #+0]
        LDR.N    R0,??DataTable3_5  ;; 0x4006d000
        BL       uart_send1
//   60 	EnableInterrupts;		//开总中断
??uart3_isr_0:
        CPSIE i         
//   61 }
        POP      {R0,PC}          ;; return
//   62 
//   63 //==========================================================================
//   64 //函数名称：pit0_isr                                                        
//   65 //功能概要：中断例程                                                
//   66 //参数说明：无       
//   67 //函数返回：无                                                                  
//   68 //==========================================================================

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   69 void pit0_isr(void)
//   70 { 
pit0_isr:
        PUSH     {R7,LR}
//   71   
//   72   DisableInterrupts;	                  //关总中断 
        CPSID i         
//   73   Time_counter ++ ;
        LDR.N    R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+0]
//   74   
//   75 
//   76   if((PIT_TFLG(0)&PIT_TFLG_TIF_MASK)!=0)
        LDR.N    R0,??DataTable3_7  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??pit0_isr_0
//   77   {            
//   78     read_ADXL345();
        BL       read_ADXL345
//   79     read_L3G4200D(); 
        BL       read_L3G4200D
//   80     uart_sendN (UART0 ,readheight,4);                 //发送高度测量信息
        MOVS     R2,#+4
        LDR.N    R1,??DataTable3_8
        LDR.N    R0,??DataTable3_1  ;; 0x4006a000
        BL       uart_sendN
//   81   if(Time_counter >= COUNTER)//数据初始化完成开始
        LDR.N    R0,??DataTable3_6
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        CMP      R0,R1
        BCC.N    ??pit0_isr_1
//   82      {
//   83         Angle_X = Kalman_Filter(Angle_accx,-Dot_gyro_y);
        LDR.N    R0,??DataTable3_9
        LDR      R1,[R0, #+0]
        EORS     R1,R1,#0x80000000
        LDR.N    R0,??DataTable3_10
        LDR      R0,[R0, #+0]
        BL       Kalman_Filter
        LDR.N    R1,??DataTable3_11
        STR      R0,[R1, #+0]
//   84         Angle_Y = Kalman_Filter1(Angle_accy,Dot_gyro_x);
        LDR.N    R0,??DataTable3_12
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+0]
        BL       Kalman_Filter1
        LDR.N    R1,??DataTable3_14
        STR      R0,[R1, #+0]
//   85         Angle_Z = Angle_gyroz;
        LDR.N    R0,??DataTable3_15
        LDR.N    R1,??DataTable3_16
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   86         //Quadrotor_pid(Angle_X,Angle_Y,Angle_Z,Height );
//   87         set_pwm(1100,1100,1100,1100);
        MOVW     R3,#+1100
        MOVW     R2,#+1100
        MOVW     R1,#+1100
        MOVW     R0,#+1100
        BL       set_pwm
//   88      }
//   89  
//   90     PIT_TFLG(0)|=PIT_TFLG_TIF_MASK;       //清标志
??pit0_isr_1:
        LDR.N    R0,??DataTable3_7  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable3_7  ;; 0x4003710c
        STR      R0,[R1, #+0]
//   91   }
//   92   enable_pit_interrupt(0);
??pit0_isr_0:
        MOVS     R0,#+0
        BL       enable_pit_interrupt
//   93   EnableInterrupts;		          //开总中断
        CPSIE i         
//   94 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3:
        DC32     ??dat

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_1:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_2:
        DC32     Height

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_3:
        DC32     0x4006b000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_4:
        DC32     0x42480000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_5:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_6:
        DC32     Time_counter

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_7:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_8:
        DC32     readheight

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_9:
        DC32     Dot_gyro_y

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_10:
        DC32     Angle_accx

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_11:
        DC32     Angle_X

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_12:
        DC32     Dot_gyro_x

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_13:
        DC32     Angle_accy

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_14:
        DC32     Angle_Y

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_15:
        DC32     Angle_Z

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable3_16:
        DC32     Angle_gyroz

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
//   95 
// 
//  22 bytes in section .bss
//   4 bytes in section .data
// 376 bytes in section .text
// 
// 376 bytes of CODE memory
//  26 bytes of DATA memory
//
//Errors: none
//Warnings: none
