///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:11 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\main.c                              /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\main.c" -D IAR -D TWR_K60N512      /
//                    -lCN "C:\Documents and Settings\Administrator\iar\Mypro /
//                    ject\428IIC\bin\Ram\List\" -lB "C:\Documents and        /
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
//                    28IIC\bin\Ram\List\main.s                               /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        EXTERN Init_ADXL345
        EXTERN Init_L3G4200D
        EXTERN enable_pit_interrupt
        EXTERN enableuartreint
        EXTERN hw_FTM_init
        EXTERN hw_gpio_init
        EXTERN hw_i2c_init
        EXTERN hw_pit_init
        EXTERN periph_clk_khz
        EXTERN uart_init

        PUBLIC main

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\main.c
//    1 ////////////////////////////////////////////////////////////////////////////////
//    2 /////////////////////////////426IIC////////////////////////////////////////////
//    3 ////////////////////////////////////////////////////////////////////////////////
//    4 //头文件
//    5 #include "includes.h"
//    6 
//    7 //extern void pllinit180M();
//    8 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//    9 void main(void)
//   10 {
main:
        PUSH     {R7,LR}
//   11     //1 主程序使用的变量定义
//   12 
//   13    
//   14     //2 关中断
//   15     DisableInterrupts;      //禁止总中断
        CPSID i         
//   16    
//   17     hw_i2c_init(0);                                   //I2C0初始化
        MOVS     R0,#+0
        BL       hw_i2c_init
//   18     
//   19     hw_gpio_init (PORT_A,15,1,1);                      //PORTA15输出口
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_init
//   20     
//   21     uart_init (UART0,periph_clk_khz,9600);            //串口0波特率9600 	         
        MOV      R2,#+9600
        LDR.N    R0,??main_0
        LDR      R1,[R0, #+0]
        LDR.N    R0,??main_0+0x4  ;; 0x4006a000
        BL       uart_init
//   22     uart_init (UART1,periph_clk_khz,57600);	     //串口1波特率57600
        MOV      R2,#+57600
        LDR.N    R0,??main_0
        LDR      R1,[R0, #+0]
        LDR.N    R0,??main_0+0x8  ;; 0x4006b000
        BL       uart_init
//   23     enableuartreint(UART0,UART0irq);	             //串口0中断使能
        MOVS     R1,#+45
        LDR.N    R0,??main_0+0x4  ;; 0x4006a000
        BL       enableuartreint
//   24     enableuartreint(UART1,UART1irq);		     //串口1中断使能  
        MOVS     R1,#+47
        LDR.N    R0,??main_0+0x8  ;; 0x4006b000
        BL       enableuartreint
//   25     
//   26     hw_pit_init(0,periph_clk_khz * T);                //初始化pit0，周期20ms
        LDR.N    R0,??main_0
        LDR      R0,[R0, #+0]
        MOVS     R1,#+20
        MUL      R1,R1,R0
        MOVS     R0,#+0
        BL       hw_pit_init
//   27     enable_pit_interrupt(PIT0);                      //开pit中断
        MOVS     R0,#+0
        BL       enable_pit_interrupt
//   28    
//   29     hw_FTM_init();                                   //PWM初始化 
        BL       hw_FTM_init
//   30                                      
//   31     Init_L3G4200D();
        BL       Init_L3G4200D
//   32     Init_ADXL345();
        BL       Init_ADXL345
//   33 
//   34     EnableInterrupts;			             //开总中断
        CPSIE i         
//   35     
//   36   
//   37 
//   38 
//   39     ////////////
//   40     //主循环
//   41     while(1)
??main_1:
        B.N      ??main_1
        DATA
??main_0:
        DC32     periph_clk_khz
        DC32     0x4006a000
        DC32     0x4006b000
//   42     {   //hw_gpio_reverse(PORT_A,15);
//   43 	//Delay_Nms(5);	
//   44     }
//   45 }

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
//   46 
//   47 
//   48 
//   49 
// 
// 116 bytes in section .text
// 
// 116 bytes of CODE memory
//
//Errors: none
//Warnings: none
