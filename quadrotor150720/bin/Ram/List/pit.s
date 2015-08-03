///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.10.1.52143/W32 for ARM    28/Apr/2012  19:46:15 /
// Copyright 1999-2010 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Documents and Settings\Administrator\iar\Myproject\4 /
//                    28IIC\src\Sources\C\Component_C\pit.c                   /
//    Command line =  "C:\Documents and Settings\Administrator\iar\Myproject\ /
//                    428IIC\src\Sources\C\Component_C\pit.c" -D IAR -D       /
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
//                    28IIC\bin\Ram\List\pit.s                                /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME pit

        EXTERN disable_irq
        EXTERN enable_irq

        PUBLIC disable_pit_interrupt
        PUBLIC enable_pit_interrupt
        PUBLIC hw_pit_init

// C:\Documents and Settings\Administrator\iar\Myproject\428IIC\src\Sources\C\Component_C\pit.c
//    1 
//    2 #include "pit.h"
//    3 //==========================================================================
//    4 //函数名称: hw_pit_init                                                         
//    5 //函数返回: 无                                          
//    6 //参数说明: pitno:表示pit通道号。  
//    7 //			timeout:表示定时溢出开始递减的值          
//    8 //功能概要: 设置相关寄存器的值        
//    9 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   10     void hw_pit_init(uint8 pitno,uint32 timeout)
//   11     {
//   12       SIM_SCGC6|=SIM_SCGC6_PIT_MASK;              //使能PIT时钟
hw_pit_init:
        LDR.N    R2,??DataTable2  ;; 0x4004803c
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x800000
        LDR.N    R3,??DataTable2  ;; 0x4004803c
        STR      R2,[R3, #+0]
//   13       PIT_MCR&=~(PIT_MCR_MDIS_MASK);              //调试模式下禁止
        LDR.N    R2,??DataTable2_1  ;; 0x40037000
        LDR      R2,[R2, #+0]
        BICS     R2,R2,#0x2
        LDR.N    R3,??DataTable2_1  ;; 0x40037000
        STR      R2,[R3, #+0]
//   14       PIT_MCR|=PIT_MCR_FRZ_MASK;                  //使能PIT模块时钟
        LDR.N    R2,??DataTable2_1  ;; 0x40037000
        LDR      R2,[R2, #+0]
        ORRS     R2,R2,#0x1
        LDR.N    R3,??DataTable2_1  ;; 0x40037000
        STR      R2,[R3, #+0]
//   15       PIT_LDVAL(pitno)=timeout;                   //设置周期
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSLS     R2,R0,#+4
        LDR.N    R3,??DataTable2_2  ;; 0x40037100
        STR      R1,[R2, R3]
//   16       PIT_TCTRL(pitno)|=PIT_TCTRL_TEN_MASK;       //使能pit模块运行
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_2  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        ORRS     R1,R1,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_2  ;; 0x40037100
        ADDS     R2,R2,R0, LSL #+4
        STR      R1,[R2, #+8]
//   17       PIT_TCTRL(pitno)&=~(PIT_TCTRL_TIE_MASK);    //关pit中断
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_2  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        BICS     R1,R1,#0x2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_2  ;; 0x40037100
        ADDS     R0,R2,R0, LSL #+4
        STR      R1,[R0, #+8]
//   18     }
        BX       LR               ;; return
//   19     
//   20 //==========================================================================
//   21 //函数名: enable_pit_interrupt                                                     
//   22 //函数返回: 无                                              
//   23 //参数说明: pitno: 表示pit通道号      
//   24 //功能概要: 开接收引脚的IRQ中断                                                      
//   25 
//   26                                                
//   27 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28     void enable_pit_interrupt(uint8 pitno)
//   29     {
enable_pit_interrupt:
        PUSH     {R7,LR}
//   30       PIT_TCTRL(pitno)|=(PIT_TCTRL_TIE_MASK); //开pit中断
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_2  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        ORRS     R1,R1,#0x2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_2  ;; 0x40037100
        ADDS     R2,R2,R0, LSL #+4
        STR      R1,[R2, #+8]
//   31       switch(pitno)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??enable_pit_interrupt_0
        CMP      R0,#+2
        BEQ.N    ??enable_pit_interrupt_1
        BCC.N    ??enable_pit_interrupt_2
        CMP      R0,#+3
        BEQ.N    ??enable_pit_interrupt_3
        B.N      ??enable_pit_interrupt_4
//   32       {
//   33       case 0:
//   34         enable_irq(68);			      //开接收引脚的IRQ中断
??enable_pit_interrupt_0:
        MOVS     R0,#+68
        BL       enable_irq
//   35         break;
        B.N      ??enable_pit_interrupt_4
//   36       case 1:
//   37         enable_irq(69);			      //开接收引脚的IRQ中断
??enable_pit_interrupt_2:
        MOVS     R0,#+69
        BL       enable_irq
//   38         break;
        B.N      ??enable_pit_interrupt_4
//   39       case 2:
//   40         enable_irq(70);			      //开接收引脚的IRQ中断
??enable_pit_interrupt_1:
        MOVS     R0,#+70
        BL       enable_irq
//   41         break;
        B.N      ??enable_pit_interrupt_4
//   42       case 3:
//   43         enable_irq(71);			      //开接收引脚的IRQ中断
??enable_pit_interrupt_3:
        MOVS     R0,#+71
        BL       enable_irq
//   44         break;
//   45       }
//   46     }
??enable_pit_interrupt_4:
        POP      {R0,PC}          ;; return
//   47 
//   48 //==========================================================================
//   49 //函数名: disable_pit_interrupt                                                     
//   50 //函数返回: 无                                              
//   51 //参数说明: pitno: 表示pit通道号      
//   52 //功能概要: 开接收引脚的IRQ中断                                                      
//   53 
//   54                                                
//   55 //==========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   56     void disable_pit_interrupt(uint8 pitno)
//   57     {
disable_pit_interrupt:
        PUSH     {R7,LR}
//   58       PIT_TCTRL(pitno)&=~(PIT_TCTRL_TIE_MASK);//关pit中断
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable2_2  ;; 0x40037100
        ADDS     R1,R1,R0, LSL #+4
        LDR      R1,[R1, #+8]
        BICS     R1,R1,#0x2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R2,??DataTable2_2  ;; 0x40037100
        ADDS     R2,R2,R0, LSL #+4
        STR      R1,[R2, #+8]
//   59       switch(pitno)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??disable_pit_interrupt_0
        CMP      R0,#+2
        BEQ.N    ??disable_pit_interrupt_1
        BCC.N    ??disable_pit_interrupt_2
        CMP      R0,#+3
        BEQ.N    ??disable_pit_interrupt_3
        B.N      ??disable_pit_interrupt_4
//   60       {
//   61       case 0:
//   62         disable_irq(68);	              //关接收引脚的IRQ中断
??disable_pit_interrupt_0:
        MOVS     R0,#+68
        BL       disable_irq
//   63         break;
        B.N      ??disable_pit_interrupt_4
//   64       case 1:
//   65         disable_irq(69);		      //关接收引脚的IRQ中断
??disable_pit_interrupt_2:
        MOVS     R0,#+69
        BL       disable_irq
//   66         break;
        B.N      ??disable_pit_interrupt_4
//   67       case 2:
//   68         disable_irq(70);		      //关接收引脚的IRQ中断
??disable_pit_interrupt_1:
        MOVS     R0,#+70
        BL       disable_irq
//   69         break;
        B.N      ??disable_pit_interrupt_4
//   70       case 3:
//   71         disable_irq(71);		      //关接收引脚的IRQ中断
??disable_pit_interrupt_3:
        MOVS     R0,#+71
        BL       disable_irq
//   72         break;
//   73       }
//   74     }
??disable_pit_interrupt_4:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_1:
        DC32     0x40037000

        SECTION `.text`:CODE:NOROOT(2)
        DATA
??DataTable2_2:
        DC32     0x40037100

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)

        END
// 
// 258 bytes in section .text
// 
// 258 bytes of CODE memory
//
//Errors: none
//Warnings: none
