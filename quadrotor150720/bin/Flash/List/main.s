///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:14 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\main.c                            /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\main.c" -D IAR -D TWR_K60N512    /
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
//                    (¸ÄI2C)\bin\Flash\List\main.s                           /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME main

        #define SHT_PROGBITS 0x1

        EXTERN Angle_X
        EXTERN Angle_X0
        EXTERN Angle_Y
        EXTERN Angle_Y0
        EXTERN Angle_Z
        EXTERN Angle_Z0
        EXTERN CheckHeightSensor
        EXTERN Delay_10us
        EXTERN Delay_ms
        EXTERN Dot_xacc
        EXTERN Dot_xacc0
        EXTERN Dot_xgyro
        EXTERN Dot_xgyro0
        EXTERN Dot_yacc
        EXTERN Dot_yacc0
        EXTERN Dot_ygyro
        EXTERN Dot_ygyro0
        EXTERN Dot_zacc
        EXTERN Dot_zacc0
        EXTERN Dot_zgyro
        EXTERN Dot_zgyro0
        EXTERN `High`
        EXTERN High_update
        EXTERN Initial
        EXTERN MahonyAHRSupdateIMU
        EXTERN MahonyAHRSupdateIMU1
        EXTERN Pit_update
        EXTERN PointX
        EXTERN PointY
        EXTERN Q_x
        EXTERN Q_x1
        EXTERN Q_y
        EXTERN Q_y1
        EXTERN Q_z
        EXTERN Q_z1
        EXTERN Quadrotor_pid
        EXTERN RE_X
        EXTERN RE_Y
        EXTERN ReadBMA180
        EXTERN ReadBMAsteer
        EXTERN ReadMPU3205
        EXTERN ReadMPUsteer
        EXTERN SendDataToGUI
        EXTERN Send_flag
        EXTERN Start_flag
        EXTERN Stop_flag
        EXTERN Time_counter
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2d
        EXTERN abs
        EXTERN cos
        EXTERN cx
        EXTERN cy
        EXTERN cz
        EXTERN disable_pit_interrupt
        EXTERN enable_pit_interrupt
        EXTERN ftm0_pwm_change_duty
        EXTERN hw_gpio_reverse
        EXTERN hw_gpio_set
        EXTERN image_distance
        EXTERN irq_counter
        EXTERN prePointX
        EXTERN prePointY
        EXTERN re_X
        EXTERN re_Y
        EXTERN revise_X
        EXTERN revise_Y
        EXTERN set_pwm
        EXTERN sin
        EXTERN sx
        EXTERN sy
        EXTERN sz

        PUBLIC main

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\main.c
//    1 //============================================================================
//    2 //¹¤³ÌÃû³Æ£º
//    3 //Ó²¼þÁ¬½Ó£º
//    4 //³ÌÐòÃèÊö£º
//    5 //¹¤³ÌËµÃ÷£º
//    6 //°æÈ¨ËùÓÐ£ºÖÐÉ½´óÑ§NCSLab
//    7 //============================================================================
//    8 
//    9 #include "includes.h"
//   10 
//   11 //È«¾Ö±äÁ¿ÉùÃ÷
//   12 
//   13 
//   14 //Ö÷º¯Êý

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   15 void main(void)
//   16 {   
main:
        SUB      SP,SP,#+24
//   17     DisableInterrupts;                              //½ûÖ¹×ÜÖÐ¶Ï
        CPSID i
//   18     Delay_ms(100);                                 //ÑÓÊ±100ms¿ªÊ¼Ö´ÐÐ³ÌÐò
        LDR.W    R0,??main_0      ;; 0x42c80000
        BL       Delay_ms
//   19     LED_OFF;                                        //LedÁÁ±íÊ¾¿ª»ú 
        MOVS     R2,#+1
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_set
//   20     LED1_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       hw_gpio_set
//   21     LED2_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+10
        MOVS     R0,#+1
        BL       hw_gpio_set
//   22     LED3_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOVS     R0,#+1
        BL       hw_gpio_set
//   23     while(!Initial());                         //µÈ´ý³õÊ¼»¯½áÊø
??main_1:
        BL       Initial
        CMP      R0,#+0
        BEQ.N    ??main_1
//   24     EnableInterrupts;			          //¿ª×ÜÖÐ¶Ï
        CPSIE i
//   25     
//   26   //LedÃð³õÊ¼»¯½áÊø                                      
//   27     while(!CheckHeightSensor());                  //µÈ´ý¸ß¶È³õÊ¼»¯Íê³É
??main_2:
        BL       CheckHeightSensor
        CMP      R0,#+0
        BEQ.N    ??main_2
//   28     LED_ON;                                       //Ö¸Ê¾µÆÁÁ£¬µÈ´ýÒ£¿Ø¿ªÊ¼Ö¸Áî
        MOVS     R2,#+0
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_set
//   29     
//   30     while(Start_flag == false );                  
??main_3:
        LDR.W    R0,??main_0+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_3
//   31    
//   32     LED_OFF;                                      //ËùÓÐ³õÊ¼»¯Õý³£LEDÃð
        MOVS     R2,#+1
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_set
//   33     Buzzer_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+21
        MOVS     R0,#+1
        BL       hw_gpio_set
//   34     enable_pit_interrupt(PIT0);
        MOVS     R0,#+0
        BL       enable_pit_interrupt
//   35    
//   36     while(Time_counter <= COUNTER);               //Êý¾Ý³õÊ¼»¯Íê³É¿ªÊ¼
??main_4:
        LDR.W    R0,??main_0+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BLS.N    ??main_4
//   37    // hw_gpio_init(PORT_B,23, 1, 0); 
//   38    
//   39      
//   40     while(1)
//   41     {
//   42   //===========================Ö÷Ñ­»·£¨¿ªÊ¼£©===================================
//   43         while(Pit_update == false);
??main_5:
??main_6:
        LDR.W    R0,??main_0+0xC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_6
//   44        //hw_gpio_set(PORT_B,23, 1);
//   45         Pit_update = false;
        LDR.W    R0,??main_0+0xC
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   46 
//   47         ReadMPU3205();
        BL       ReadMPU3205
//   48         ReadBMA180();
        BL       ReadBMA180
//   49         if((int)(Time_counter * T) % 25 == 0)   //20ms²âÁ¿Ò»´Î¸ß¶È
        LDR.W    R0,??main_0+0x8
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR.W    R3,??main_0+0x10  ;; 0x40040000
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        MOVS     R1,#+25
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        CMP      R0,#+0
        BNE.N    ??main_7
//   50         {   irq_counter = 0;
        LDR.W    R0,??main_0+0x14
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//   51             LED1_ON;
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       hw_gpio_set
//   52             Trig_ON;
        MOVS     R2,#+1
        MOVS     R1,#+18
        MOVS     R0,#+2
        BL       hw_gpio_set
//   53             Delay_10us();
        BL       Delay_10us
//   54             Trig_OFF;
        MOVS     R2,#+0
        MOVS     R1,#+18
        MOVS     R0,#+2
        BL       hw_gpio_set
//   55             LED_Change;
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_reverse
//   56         }
//   57 //================================²»Ê¹ÓÃ´ÅÁ¦¼Æ=============================================        
//   58         MahonyAHRSupdateIMU(Dot_xgyro, Dot_ygyro, Dot_zgyro, Dot_xacc, Dot_yacc, Dot_zacc);
??main_7:
        LDR.W    R0,??main_0+0x18
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+4]
        LDR.W    R0,??main_0+0x1C
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR.W    R0,??main_0+0x20
        LDR      R3,[R0, #+0]
        LDR.W    R0,??main_0+0x24
        LDR      R2,[R0, #+0]
        LDR.W    R0,??main_0+0x28
        LDR      R1,[R0, #+0]
        LDR.W    R0,??main_0+0x2C
        LDR      R0,[R0, #+0]
        BL       MahonyAHRSupdateIMU
//   59 //=========================================================================================
//   60         
//   61         //==========================================Ê¹ÓÃ´ÅÁ¦¼Æ====================================
//   62         //²ÎÊýËµÃ÷£º(float)mx,(float)my,(float)mz)Îª´ÅÁ¦¼ÆµÄÊý¾Ý
//   63         //MahonyAHRSupdate(Dot_xgyro, Dot_ygyro, Dot_zgyro, Dot_xacc, Dot_yacc, Dot_zacc,(float)mx,(float)my,(float)mz);
//   64         //========================================================================================
//   65         
//   66         //¶Ô½Ç¶ÈÊý¾Ý½øÐÐÐ£Õý
//   67         Angle_X = (Angle_X + Q_x) / 2 ;//+ revise_x + c_revise_x;
        LDR.W    R0,??main_0+0x30
        LDR      R0,[R0, #+0]
        LDR.W    R1,??main_0+0x34
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        LDR.W    R1,??main_0+0x30
        STR      R0,[R1, #+0]
//   68         Angle_Y = (Angle_Y + Q_y) / 2 ;//+ revise_y + c_revise_y;
        LDR.W    R0,??main_0+0x38
        LDR      R0,[R0, #+0]
        LDR.W    R1,??main_0+0x3C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        LDR.W    R1,??main_0+0x38
        STR      R0,[R1, #+0]
//   69         Angle_Z = (Angle_Z + Q_z) / 2 ;
        LDR.W    R0,??main_0+0x40
        LDR      R0,[R0, #+0]
        LDR.W    R1,??main_0+0x44
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        LDR.W    R1,??main_0+0x40
        STR      R0,[R1, #+0]
//   70         
//   71         High = High_update(); 
        BL       High_update
        LDR.W    R1,??main_0+0x48
        STR      R0,[R1, #+0]
//   72         
//   73 //================================¸üÐÂÔÆÌ¨×ËÌ¬½Ç=============================================
//   74 
//   75         ReadMPUsteer();
        BL       ReadMPUsteer
//   76         ReadBMAsteer();        
        BL       ReadBMAsteer
//   77         MahonyAHRSupdateIMU1(Dot_xgyro0, Dot_ygyro0, Dot_zgyro0, Dot_xacc0, Dot_yacc0, Dot_zacc0);
        LDR.W    R0,??main_0+0x4C
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+4]
        LDR.W    R0,??main_0+0x50
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR.W    R0,??main_0+0x54
        LDR      R3,[R0, #+0]
        LDR.W    R0,??main_0+0x58
        LDR      R2,[R0, #+0]
        LDR.W    R0,??main_0+0x5C
        LDR      R1,[R0, #+0]
        LDR.W    R0,??main_0+0x60
        LDR      R0,[R0, #+0]
        BL       MahonyAHRSupdateIMU1
//   78         //¶Ô½Ç¶ÈÊý¾Ý½øÐÐÐ£Õý
//   79         Angle_X0 = Q_x1;//(Angle_X0 + Q_x1) / 2 ;
        LDR.W    R0,??main_0+0x64
        LDR.W    R1,??main_0+0x68
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   80         Angle_Y0 = Q_y1;//(Angle_Y0 + Q_y1) / 2 ;
        LDR.W    R0,??main_0+0x6C
        LDR.W    R1,??main_0+0x70
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   81         Angle_Z0 = Q_z1;//(Angle_Z0 + Q_z1) / 2 ;
        LDR.W    R0,??main_0+0x74
        LDR.W    R1,??main_0+0x78
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//   82         
//   83 
//   84         //ÐÞÕý²ÎÊý£¬¼ÆËãÏñËØ×ø±êµ½Í¼ÏñÖÐÐÄµãµÄÊµ¼Ê¾àÀë
//   85           if(re_X !=0 && re_Y !=0)
        LDR.W    R0,??main_0+0x7C
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??main_8
        LDR.W    R0,??main_0+0x80
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??main_8
//   86           {
//   87             cx=cos(Angle_X0);
        LDR.W    R0,??main_0+0x64
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       cos
        BL       __aeabi_d2f
        LDR.W    R1,??main_0+0x84
        STR      R0,[R1, #+0]
//   88             cy=cos(Angle_Y0);
        LDR.W    R0,??main_0+0x6C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       cos
        BL       __aeabi_d2f
        LDR.W    R1,??main_0+0x88
        STR      R0,[R1, #+0]
//   89             cz=cos(Angle_Z0);
        LDR.W    R0,??main_0+0x74
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       cos
        BL       __aeabi_d2f
        LDR.W    R1,??main_0+0x8C
        STR      R0,[R1, #+0]
//   90             sx=sin(Angle_X0);
        LDR.W    R0,??main_0+0x64
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       sin
        BL       __aeabi_d2f
        LDR.W    R1,??main_0+0x90
        STR      R0,[R1, #+0]
//   91             sy=sin(Angle_Y0);
        LDR.W    R0,??main_0+0x6C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       sin
        BL       __aeabi_d2f
        LDR.W    R1,??main_0+0x94
        STR      R0,[R1, #+0]
//   92             sz=sin(Angle_Z0);
        LDR.W    R0,??main_0+0x74
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       sin
        BL       __aeabi_d2f
        LDR.W    R1,??main_0+0x98
        STR      R0,[R1, #+0]
//   93             
//   94             RE_X=(float)re_X;
        LDR.W    R0,??main_0+0x7C
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.W    R1,??main_0+0x9C
        STR      R0,[R1, #+0]
//   95             RE_Y=(float)re_Y;
        LDR.W    R0,??main_0+0x80
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.W    R1,??main_0+0xA0
        STR      R0,[R1, #+0]
//   96                       
//   97             image_distance=108/cy;//ÉãÏñÍ·Îï¾à
        LDR.W    R0,??main_0+0xA4  ;; 0x42d80000
        LDR.W    R1,??main_0+0x88
        LDR      R1,[R1, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??main_0+0xA8
        STR      R0,[R1, #+0]
//   98             revise_Y=-RE_X*image_distance/450;//180ÎªÉãÏñÍ·±ê¶¨Ë®Æ½½¹¾à
        LDR.W    R0,??main_0+0x9C
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        LDR.W    R1,??main_0+0xA8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??main_0+0xAC  ;; 0x43e10000
        BL       __aeabi_fdiv
        LDR.W    R1,??main_0+0xB0
        STR      R0,[R1, #+0]
//   99             revise_X=RE_Y*image_distance/471;//190ÎªÉãÏñÍ·±ê¶¨ÊúÖ±½¹¾à
        LDR.W    R0,??main_0+0xA0
        LDR      R0,[R0, #+0]
        LDR.W    R1,??main_0+0xA8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??main_0+0xB4  ;; 0x43eb8000
        BL       __aeabi_fdiv
        LDR.W    R1,??main_0+0xB8
        STR      R0,[R1, #+0]
//  100 
//  101 
//  102             //====================½«ÉãÏñ»ú×ø±ê×ª»»ÎªÊÀ½ç×ø±êÏµ=====================    
//  103 
//  104            //×ª»»ÎªÊÀ½ç×ø±êÏµ
//  105             PointX=cy*cz*revise_X +(sy*sx*cz-cx*sz)*revise_Y +(sy*cx*cz+sx*sz)*image_distance ;
        LDR.W    R0,??main_0+0x88
        LDR      R0,[R0, #+0]
        LDR.W    R1,??main_0+0x8C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??main_0+0xB8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.W    R0,??main_0+0x94
        LDR      R0,[R0, #+0]
        LDR.W    R1,??main_0+0x90
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??main_0+0x8C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??main_0+0x84
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x98
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        LDR.N    R1,??main_0+0xB0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.N    R0,??main_0+0x94
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x84
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??main_0+0x8C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??main_0+0x90
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x98
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR.N    R1,??main_0+0xA8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR.N    R1,??main_0+0xBC
        STR      R0,[R1, #+0]
//  106             PointY=cy*sz*revise_X +(sx*sy*sz+cx*cz)*revise_Y +(sy*cx*sz-sx*cz)*image_distance;
        LDR.N    R0,??main_0+0x88
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x98
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??main_0+0xB8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.N    R0,??main_0+0x90
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x94
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??main_0+0x98
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??main_0+0x84
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x8C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R5
        BL       __aeabi_fadd
        LDR.N    R1,??main_0+0xB0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR.N    R0,??main_0+0x94
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x84
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.N    R1,??main_0+0x98
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R5,R0
        LDR.N    R0,??main_0+0x90
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0x8C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        LDR.N    R1,??main_0+0xA8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        LDR.N    R1,??main_0+0xC0
        STR      R0,[R1, #+0]
//  107             //Zs=-sy*revise_X        + sx*cy*revise_Y                         +cy*cx*image_distance;
//  108           
//  109             
//  110             //×ª»»ÎªÊÀ½ç×ø±êÏµ
//  111             //PointX= Xs;//image_distance*Xs/Zs ; 
//  112             //PointY= Ys;//image_distance*Ys/Zs ;
//  113         
//  114             //====================½«Ä¿±ê×ø±ê×ª»»ÎªÊÀ½ç×ø±êÏµ=====================
//  115     
//  116             if(PointX - prePointX > 8)PointX = prePointX + 8;
        LDR.N    R0,??main_0+0xBC
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0xC4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??main_0+0xC8  ;; 0x41000001
        BL       __aeabi_cfrcmple
        BHI.N    ??main_9
        LDR.N    R0,??main_0+0xC4
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1090519040
        BL       __aeabi_fadd
        LDR.N    R1,??main_0+0xBC
        STR      R0,[R1, #+0]
        B.N      ??main_10
//  117             else if(PointX - prePointX < -8)PointX = prePointX - 8;
??main_9:
        LDR.N    R0,??main_0+0xBC
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0xC4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,#-1056964608
        BL       __aeabi_cfcmple
        BCS.N    ??main_10
        LDR.N    R0,??main_0+0xC4
        LDR      R0,[R0, #+0]
        MOVS     R1,#-1056964608
        BL       __aeabi_fadd
        LDR.N    R1,??main_0+0xBC
        STR      R0,[R1, #+0]
//  118             if(PointY - prePointY > 8)PointY = prePointY + 8;
??main_10:
        LDR.N    R0,??main_0+0xC0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0xCC
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.N    R1,??main_0+0xC8  ;; 0x41000001
        BL       __aeabi_cfrcmple
        BHI.N    ??main_11
        LDR.N    R0,??main_0+0xCC
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1090519040
        BL       __aeabi_fadd
        LDR.N    R1,??main_0+0xC0
        STR      R0,[R1, #+0]
        B.N      ??main_12
//  119             else if(PointY - prePointY < -8)PointY = prePointY - 8;
??main_11:
        LDR.N    R0,??main_0+0xC0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??main_0+0xCC
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R1,#-1056964608
        BL       __aeabi_cfcmple
        BCS.N    ??main_12
        LDR.N    R0,??main_0+0xCC
        LDR      R0,[R0, #+0]
        MOVS     R1,#-1056964608
        BL       __aeabi_fadd
        LDR.N    R1,??main_0+0xC0
        STR      R0,[R1, #+0]
//  120             //Æ½»¬
//  121             PointX=0.6*PointX+0.4*prePointX;
??main_12:
        LDR.N    R0,??main_0+0xBC
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.N    R3,??main_0+0xD0  ;; 0x3fe33333
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??main_0+0xC4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??main_0+0xD4  ;; 0x9999999a
        LDR.N    R3,??main_0+0xD8  ;; 0x3fd99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??main_0+0xBC
        STR      R0,[R1, #+0]
//  122             PointY=0.6*PointY+0.4*prePointY;
        LDR.N    R0,??main_0+0xC0
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.N    R3,??main_0+0xD0  ;; 0x3fe33333
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??main_0+0xCC
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??main_0+0xD4  ;; 0x9999999a
        LDR.N    R3,??main_0+0xD8  ;; 0x3fd99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??main_0+0xC0
        STR      R0,[R1, #+0]
//  123             prePointX = PointX;
        LDR.N    R0,??main_0+0xC4
        LDR.N    R1,??main_0+0xBC
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  124             prePointY = PointY;
        LDR.N    R0,??main_0+0xCC
        LDR.N    R1,??main_0+0xC0
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  125           
//  126 
//  127          }
//  128        
//  129 //=========================================================================================    
//  130         
//  131         Quadrotor_pid(Angle_X, Angle_Y, Angle_Z, High,PointX,PointY , Angle_X0,Angle_Y0,Angle_Z0 );//Angle_YÎªYÖáÏòÏÂÇãÐ±ÎªÕýÏò,Angle_XÎªxÖáÏòÉÏÎªÕýÏò
??main_8:
        LDR.N    R0,??main_0+0x74
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+16]
        LDR.N    R0,??main_0+0x6C
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+12]
        LDR.N    R0,??main_0+0x64
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+8]
        LDR.N    R0,??main_0+0xC0
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+4]
        LDR.N    R0,??main_0+0xBC
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+0]
        LDR.N    R0,??main_0+0x48
        LDR      R3,[R0, #+0]
        LDR.N    R0,??main_0+0x40
        LDR      R2,[R0, #+0]
        LDR.N    R0,??main_0+0x38
        LDR      R1,[R0, #+0]
        LDR.N    R0,??main_0+0x30
        LDR      R0,[R0, #+0]
        BL       Quadrotor_pid
//  132         
//  133         ////////////////////·ÉÐÐÆ÷Í£Ö¹////////////////////////
//  134         while(Stop_flag == true || abs((int)Angle_X) >= 70 || abs((int)Angle_Y) >= 70)
??main_13:
        LDR.N    R0,??main_0+0xDC
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_14
        LDR.N    R0,??main_0+0x30
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        BL       abs
        CMP      R0,#+70
        BGE.N    ??main_14
        LDR.N    R0,??main_0+0x38
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        BL       abs
        CMP      R0,#+70
        BLT.W    ??main_5
//  135         {
//  136             disable_pit_interrupt(PIT0);
??main_14:
        MOVS     R0,#+0
        BL       disable_pit_interrupt
//  137             POWER_OFF;
        MOV      R3,#+1000
        MOV      R2,#+1000
        MOV      R1,#+1000
        MOV      R0,#+1000
        BL       set_pwm
//  138             LED_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+15
        MOVS     R0,#+0
        BL       hw_gpio_set
//  139             
//  140             ftm0_pwm_change_duty(0,850);//¿ØÖÆ¶æ»úÉÏÏÂ
        MOVW     R1,#+850
        MOVS     R0,#+0
        BL       ftm0_pwm_change_duty
//  141             ftm0_pwm_change_duty(5,1370);//¿ØÖÆ¶æ»ú×óÓÒ
        MOVW     R1,#+1370
        MOVS     R0,#+5
        BL       ftm0_pwm_change_duty
//  142             //if(SendToGUI_Flag == true)SendStopToGUI();
//  143             //if(Send_flag == true)Senddata();
//  144              if(Send_flag == true)SendDataToGUI();
        LDR.N    R0,??main_0+0xE0
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_13
        BL       SendDataToGUI
        B.N      ??main_13
        Nop      
        DATA
??main_0:
        DC32     0x42c80000
        DC32     Start_flag
        DC32     Time_counter
        DC32     Pit_update
        DC32     0x40040000
        DC32     irq_counter
        DC32     Dot_zacc
        DC32     Dot_yacc
        DC32     Dot_xacc
        DC32     Dot_zgyro
        DC32     Dot_ygyro
        DC32     Dot_xgyro
        DC32     Angle_X
        DC32     Q_x
        DC32     Angle_Y
        DC32     Q_y
        DC32     Angle_Z
        DC32     Q_z
        DC32     `High`
        DC32     Dot_zacc0
        DC32     Dot_yacc0
        DC32     Dot_xacc0
        DC32     Dot_zgyro0
        DC32     Dot_ygyro0
        DC32     Dot_xgyro0
        DC32     Angle_X0
        DC32     Q_x1
        DC32     Angle_Y0
        DC32     Q_y1
        DC32     Angle_Z0
        DC32     Q_z1
        DC32     re_X
        DC32     re_Y
        DC32     cx
        DC32     cy
        DC32     cz
        DC32     sx
        DC32     sy
        DC32     sz
        DC32     RE_X
        DC32     RE_Y
        DC32     0x42d80000
        DC32     image_distance
        DC32     0x43e10000
        DC32     revise_Y
        DC32     0x43eb8000
        DC32     revise_X
        DC32     PointX
        DC32     PointY
        DC32     prePointX
        DC32     0x41000001
        DC32     prePointY
        DC32     0x3fe33333
        DC32     0x9999999a
        DC32     0x3fd99999
        DC32     Stop_flag
        DC32     Send_flag
//  145         }
//  146     // hw_gpio_set(PORT_B,23,0);
//  147    //=============================Ö÷Ñ­»·£¨½áÊø£©================================
//  148     }
//  149 }//end main

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
// 1 712 bytes in section .text
// 
// 1 712 bytes of CODE memory
//
//Errors: none
//Warnings: none
