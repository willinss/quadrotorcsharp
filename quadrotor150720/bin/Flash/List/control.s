///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  11:16:15 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\control.c             /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\control.c" -D IAR    /
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
//                    (¸ÄI2C)\bin\Flash\List\control.s                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME control

        #define SHT_PROGBITS 0x1

        EXTERN Axis_x
        EXTERN Axis_y
        EXTERN Backup_landing
        EXTERN BaseHeight
        EXTERN Integral_high
        EXTERN Landing
        EXTERN ReadANDS3080
        EXTERN SendFloat
        EXTERN Stop_flag
        EXTERN SumDeltX
        EXTERN SumDeltY
        EXTERN Time_counter
        EXTERN __aeabi_cdrcmple
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2iz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2d
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2d
        EXTERN __aeabi_ui2f
        EXTERN abs
        EXTERN atan2
        EXTERN cos
        EXTERN ftm0_pwm_change_duty
        EXTERN hw_gpio_set
        EXTERN log
        EXTERN re_X
        EXTERN re_Y
        EXTERN send_data
        EXTERN set_pwm
        EXTERN signal_target
        EXTERN sin
        EXTERN sqrt
        EXTERN startMotion
        EXTERN writeDataToMemory

        PUBLIC BASE_VALUE
        PUBLIC Kd1
        PUBLIC Kd2
        PUBLIC Kd3
        PUBLIC Kd4
        PUBLIC Kdx
        PUBLIC Kdx1
        PUBLIC Kdy
        PUBLIC Kdy1
        PUBLIC Ki1
        PUBLIC Ki2
        PUBLIC Ki3
        PUBLIC Ki4
        PUBLIC Kix
        PUBLIC Kiy
        PUBLIC Kp1
        PUBLIC Kp2
        PUBLIC Kp3
        PUBLIC Kp4
        PUBLIC Kx
        PUBLIC Kx1
        PUBLIC Ky
        PUBLIC Ky1
        PUBLIC PointX
        PUBLIC PointY
        PUBLIC Quadrotor_pid
        PUBLIC RE_X
        PUBLIC RE_Y
        PUBLIC _flag_
        PUBLIC camflag
        PUBLIC cx
        PUBLIC cy
        PUBLIC cz
        PUBLIC dataLencounter
        PUBLIC errX
        PUBLIC errY
        PUBLIC image_distance
        PUBLIC kvx
        PUBLIC kvy
        PUBLIC lastHeight
        PUBLIC preHeight
        PUBLIC prePointX
        PUBLIC prePointY
        PUBLIC px
        PUBLIC py
        PUBLIC pz
        PUBLIC revise_X
        PUBLIC revise_Y
        PUBLIC sendcount
        PUBLIC sx
        PUBLIC sy
        PUBLIC sz
        PUBLIC theta
        PUBLIC wx
        PUBLIC wy
        PUBLIC wz

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\control.c
//    1 //============================================================================
//    2 //ÎÄ¼þÃû³Æ£º
//    3 //¹¦ÄÜ¸ÅÒª£ºÊ¹ÓÃPID¶Ô·ÉÐÐÆ÷½øÐÐ×ËÌ¬¿ØÖÆ
//    4 //°æÈ¨ËùÓÐ£ºÖÐÉ½´óÑ§NCSLab
//    5 //============================================================================
//    6 
//    7 #include "control.h"
//    8 #include "filters.h"
//    9 #include "pit.h"
//   10 #include  <math.h>
//   11 
//   12 #define THREAD_TOP     1990   //PWM   
//   13 #define THREAD_BOTTOM  1000   //PWM 1000±íÊ¾µÄÊÇ1ºÁÃë
//   14 #define Inc_max        30     //PWMµÄÊýÖµ·ÀÖ¹Ìø±ä
//   15 #define Dec_max       -30
//   16 
//   17 #define OptSamTime  30       
//   18 #define Velocity    60.0f         //ËÙ¶È0.6m/s
//   19 
//   20 //================================È«¾Ö±äÁ¿ÉùÃ÷=================================

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 float Kp1 = -6 ; //´¹Ö±¿ØÖÆ
Kp1:
        DATA
        DC32 0C0C00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   22 float Kp2 = -6 ; //¹ö×ª¿ØÖÆy
Kp2:
        DATA
        DC32 0C0C00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   23 float Kp3 = -6 ;//¸©Ñö¿ØÖÆx
Kp3:
        DATA
        DC32 0C0C00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   24 float Kp4 = -100;//Æ«º½¿ØÖÆ
Kp4:
        DATA
        DC32 0C2C80000H
//   25 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   26 float Kd1 = -2500 ;    //´¹Ö±¿ØÖÆ
Kd1:
        DATA
        DC32 0C51C4000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 float Kd2 = -600  ;   //¹ö×ª¿ØÖÆ
Kd2:
        DATA
        DC32 0C4160000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   28 float Kd3 = -600 ;    //¸©Ñö¿ØÖÆ
Kd3:
        DATA
        DC32 0C4160000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   29 float Kd4 = -10000 ;    //Æ«º½¿ØÖÆ
Kd4:
        DATA
        DC32 0C61C4000H
//   30 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   31 float Ki1 = -0.02;
Ki1:
        DATA
        DC32 0BCA3D70AH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   32 float Ki2 = -0.00;
Ki2:
        DATA
        DC32 80000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   33 float Ki3 = -0.00;
Ki3:
        DATA
        DC32 80000000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   34 float Ki4 = -0.01;
Ki4:
        DATA
        DC32 0BC23D70AH
//   35 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   36 float Kx = -0.20;
Kx:
        DATA
        DC32 0BE4CCCCDH

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   37 float Ky = -0.20;
Ky:
        DATA
        DC32 0BE4CCCCDH
//   38 
//   39 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   40 float Kx1 = -0.14;
Kx1:
        DATA
        DC32 0BE0F5C29H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   41 float Ky1 = -0.14;
Ky1:
        DATA
        DC32 0BE0F5C29H
//   42 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   43 float Kdx1 = -2.1;
Kdx1:
        DATA
        DC32 0C0066666H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   44 float Kdy1 = -2.1;
Kdy1:
        DATA
        DC32 0C0066666H
//   45 
//   46 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   47 float Kix = -0.0003;
Kix:
        DATA
        DC32 0B99D4952H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   48 float Kiy = -0.0003;
Kiy:
        DATA
        DC32 0B99D4952H
//   49 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   50 float Kdx = -4.0;
Kdx:
        DATA
        DC32 0C0800000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   51 float Kdy = -4.0;
Kdy:
        DATA
        DC32 0C0800000H
//   52 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   53 float kvx = -5.0;
kvx:
        DATA
        DC32 0C0A00000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   54 float kvy = -5.0;
kvy:
        DATA
        DC32 0C0A00000H
//   55 
//   56 //float kdx = -10.0;
//   57 //float kdy = -10.0;
//   58 
//   59 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   60 float errX = 0;
errX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   61 float errY = 0;
errY:
        DS8 4
//   62 

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   63 uint16 BASE_VALUE = 1000;
BASE_VALUE:
        DATA
        DC16 1000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   64 float wx[DataLength] = {0}, wy[DataLength] = {0}, wz[DataLength] = {0};//DataLength=60000
wx:
        DS8 24000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
wy:
        DS8 24000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
wz:
        DS8 24000
//   65 //float Posx[DataLength] = {0};
//   66 //float Posy[DataLength] = {0};

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   67 float *px = wx, *py = wy, *pz = wz;
px:
        DATA
        DC32 wx

        SECTION `.data`:DATA:REORDER:NOROOT(2)
py:
        DATA
        DC32 wy

        SECTION `.data`:DATA:REORDER:NOROOT(2)
pz:
        DATA
        DC32 wz
//   68 //float *posx = Posx, *posy = Posy ;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   69 float lastHeight = 0;
lastHeight:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   70 float preHeight = 0;
preHeight:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   71 int dataLencounter = 0;
dataLencounter:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   72 int sendcount =0;
sendcount:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   73 bool camflag=false;
camflag:
        DS8 1
//   74 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   75 bool _flag_=true;//Ïû³ýÎ¢·ÖÏîÍ»±ä...
_flag_:
        DATA
        DC8 1
//   76 
//   77 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   78 static float TEST1=0,TEST2=0,TEST3=0,TEST4=0,TEST5=0;
TEST1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
TEST2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
TEST3:
        DS8 4
//   79 
//   80 //float Xb=0,Yb=0,Zb=0;
//   81 
//   82 //float Alphard=0,Beta=0;
//   83 //float Phi=0,Teta=0;
//   84 
//   85 //float AngleSteering=0;
//   86 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   87 static int PWM_X=1370,PWM_Y=850;
PWM_X:
        DATA
        DC32 1370

        SECTION `.data`:DATA:REORDER:NOROOT(2)
PWM_Y:
        DATA
        DC32 850
//   88 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   89 static uint8 steerFlag=0;
steerFlag:
        DS8 1
//   90 //float camPointX=0,camPointY=0,camPointZ=0,camHeight=0;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   91 float theta=0;
theta:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   92 static float err_angX=0,err_angY=0;
err_angX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
err_angY:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   93 static float pre_err_angX=0,pre_err_angY=0;
pre_err_angX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
pre_err_angY:
        DS8 4
//   94 static int position_f = 0;
//   95 //float Xs=0,Ys=0,Zs=0;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   96 float image_distance=0;
image_distance:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   97 float revise_X=0,revise_Y=0;
revise_X:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
revise_Y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   98 float cx=0,cy=0,cz=0,sx=0,sy=0,sz=0;
cx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cy:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
cz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
sx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
sy:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
sz:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   99 float PointX=0,PointY=0;
PointX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
PointY:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  100 static float des_PointX =0;
des_PointX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  101 static float des_PointY =0;
des_PointY:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  102  float RE_X=0,RE_Y=0;
RE_X:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
RE_Y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  103 float prePointX=0,prePointY=0;//±£´æÆ«ÒÆÖµÓÃÒÔÐÞÕýÍ¼Ïñ×ø±ê
prePointX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
prePointY:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  104 static float preposx=0,preposy=0;
preposx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
preposy:
        DS8 4
//  105 
//  106 //================================È«¾Ö±äÁ¿ÉùÃ÷=================================
//  107 
//  108 //============================================================================
//  109 //º¯ÊýÃû³Æ£ºQuadrotor_pid
//  110 //º¯Êý·µ»Ø£ºÎÞ
//  111 //²ÎÊýËµÃ÷£º
//  112 //¹¦ÄÜ¸ÅÒª£º
//  113 //============================================================================
//  114 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  115 void Quadrotor_pid(float angle_X, float angle_Y, float angle_Z, float height,float PointX,float PointY,float angle_X0,float angle_Y0, float angle_Z0)
//  116 {
Quadrotor_pid:
        PUSH     {R0-R2,R4-R11,LR}
        SUB      SP,SP,#+24
        MOV      R8,R3
//  117     float U1 = 0, U2 = 0, U3 = 0, U4 = 0;
        MOVS     R4,#+0
        MOVS     R10,#+0
        MOVS     R9,#+0
        MOVS     R11,#+0
//  118     float W1 = 0, W2 = 0, W3 = 0, W4 = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  119     static int32 w1 = 0, w2 = 0, w3 = 0, w4 = 0;
//  120     static int32 last_w1 = 1000, last_w2 = 1000, last_w3 = 1000, last_w4 = 1000;
//  121     float err_p = 0;    //¸©Ñö½ÇÎó²î
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  122     float err_r  = 0;   //¹ö×ª½ÇÎó²î
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
//  123     float err_y   = 0;  //Æ«º½½ÇÎó²î
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  124     float err_h     = 0;//¸ß¶ÈÆ«²î
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  125 
//  126     float err_pitch = 0;  //±¾´Î¸©Ñö½ÇÎó²î
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  127     float err_roll  = 0;  //±¾´Î¹ö×ª½ÇÎó²î
        MOVS     R5,#+0
//  128     float err_yaw   = 0;  //±¾´ÎÆ«º½½ÇÎó²î
        MOVS     R6,#+0
//  129     float err_high  = 0;  //±¾´Î¸ß¶ÈÆ«²î
        MOVS     R7,#+0
//  130 
//  131     static float des_pitch = 0.0;
//  132     static float des_roll = 0.0;
//  133     static float des_yaw = 0.0;
//  134     static float pre_err_pitch = 0;  //ÉÏÒ»´Î¸©Ñö½ÇÎó²î
//  135     static float pre_err_roll  = 0;  //ÉÏÒ»´Î¹ö×ª½ÇÎó²î
//  136     static float pre_err_yaw   = 0;  //ÉÏÒ»´ÎÆ«º½½ÇÎó²î
//  137     static float pre_err_high  = 0;  //ÉÏÒ»´Î¸ß¶ÈÆ«²î
//  138 
//  139     static double sum_err_pitch = 0, sum_err_roll = 0, sum_err_yaw = 0, sum_err_high = 0;
//  140 
//  141     static float count = 0;
//  142 
//  143     static float des_high = 50;
//  144     static uint8 K = 0;
//  145     static uint8 high_f = 0;
//  146 
//  147 
//  148     static float W_Axis_1 = 0;
//  149     static float W_Axis_2 = 0;
//  150     static float W_Axis_3 = 0;
//  151     static float W_Axis_4 = 0;
//  152 
//  153     static float k_high = 0;
//  154     
//  155     float dotErrX = 0,dotErrY=0;
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  156     static float lastErrX=0,lastErrY=0;
//  157     static double sumErrX=0,sumErrY=0;
//  158 
//  159 
//  160     if(abs((int)angle_X) > 20 || abs((int)angle_Y) > 20)
        LDR      R0,[SP, #+24]
        BL       __aeabi_f2iz
        BL       abs
        CMP      R0,#+21
        BGE.N    ??Quadrotor_pid_0
        LDR      R0,[SP, #+28]
        BL       __aeabi_f2iz
        BL       abs
        CMP      R0,#+21
        BLT.N    ??Quadrotor_pid_1
//  161     {
//  162         Landing = true;
??Quadrotor_pid_0:
        LDR.W    R0,??Quadrotor_pid_2
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  163         LED2_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+10
        MOVS     R0,#+1
        BL       hw_gpio_set
//  164     }
//  165     if(abs((int)angle_X) > 30 || abs((int)angle_Y) > 30)
??Quadrotor_pid_1:
        LDR      R0,[SP, #+24]
        BL       __aeabi_f2iz
        BL       abs
        CMP      R0,#+31
        BGE.N    ??Quadrotor_pid_3
        LDR      R0,[SP, #+28]
        BL       __aeabi_f2iz
        BL       abs
        CMP      R0,#+31
        BLT.N    ??Quadrotor_pid_4
//  166     {
//  167         Backup_landing = true;
??Quadrotor_pid_3:
        LDR.W    R0,??Quadrotor_pid_2+0x4
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  168         LED3_OFF;
        MOVS     R2,#+1
        MOVS     R1,#+16
        MOVS     R0,#+1
        BL       hw_gpio_set
//  169     }
//  170     /////////////////////////////////////////////////////////////////////////////////////////////////
//  171     ///////////////////////////**********Ä¿±ê¸ß¶ÈÉè¶¨*********///////////////////////////////////////
//  172     if(abs((int)(height - lastHeight)) > 3 )
??Quadrotor_pid_4:
        MOV      R0,R8
        LDR.W    R1,??Quadrotor_pid_2+0x8
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2iz
        BL       abs
        CMP      R0,#+4
        BLT.N    ??Quadrotor_pid_5
//  173         height = lastHeight;
        LDR.W    R0,??Quadrotor_pid_2+0x8
        LDR      R8,[R0, #+0]
        B.N      ??Quadrotor_pid_6
//  174     else
//  175         lastHeight = height;
??Quadrotor_pid_5:
        LDR.W    R0,??Quadrotor_pid_2+0x8
        STR      R8,[R0, #+0]
//  176 
//  177     if(height > 50 && high_f == 0)
??Quadrotor_pid_6:
        MOV      R0,R8
        LDR.W    R1,??Quadrotor_pid_2+0xC  ;; 0x42480001
        BL       __aeabi_cfrcmple
        BHI.N    ??Quadrotor_pid_7
        LDR.W    R0,??Quadrotor_pid_2+0x10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Quadrotor_pid_7
//  178     {
//  179         K = 1;
        LDR.W    R0,??Quadrotor_pid_2+0x14
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  180         des_high = 80;
        LDR.W    R0,??Quadrotor_pid_2+0x18
        LDR.W    R1,??Quadrotor_pid_2+0x1C  ;; 0x42a00000
        STR      R1,[R0, #+0]
//  181 
//  182     }
//  183     if(height > 70 && high_f == 0)
??Quadrotor_pid_7:
        MOV      R0,R8
        LDR.W    R1,??Quadrotor_pid_2+0x20  ;; 0x428c0001
        BL       __aeabi_cfrcmple
        BHI.N    ??Quadrotor_pid_8
        LDR.W    R0,??Quadrotor_pid_2+0x10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Quadrotor_pid_8
//  184     {
//  185         des_high = 110;
        LDR.W    R0,??Quadrotor_pid_2+0x18
        LDR.W    R1,??Quadrotor_pid_2+0x24  ;; 0x42dc0000
        STR      R1,[R0, #+0]
//  186         high_f = 1;
        LDR.W    R0,??Quadrotor_pid_2+0x10
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  187     }
//  188     
//  189     //    if(height > 20 && high_f == 0)
//  190     //    {
//  191     //      K = 1;
//  192     //      des_high += 0.05;
//  193     //      if(des_high >= 140 )
//  194     //      {
//  195     //        des_high = 140;
//  196     //        high_f = 1;
//  197     //      }
//  198     //    }
//  199     if(height >= 80) k_high = 1;
??Quadrotor_pid_8:
        MOV      R0,R8
        LDR.W    R1,??Quadrotor_pid_2+0x1C  ;; 0x42a00000
        BL       __aeabi_cfrcmple
        BHI.N    ??Quadrotor_pid_9
        LDR.W    R0,??Quadrotor_pid_2+0x28
        MOVS     R1,#+1065353216
        STR      R1,[R0, #+0]
//  200     if( Backup_landing == true)K = 0;
??Quadrotor_pid_9:
        LDR.W    R0,??Quadrotor_pid_2+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Quadrotor_pid_10
        LDR.W    R0,??Quadrotor_pid_2+0x14
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  201     /////////Çó³ö±¾´ÎÆ«²î//////////////////////////////////////////////////////////
//  202     err_pitch = des_pitch - angle_X;
??Quadrotor_pid_10:
        LDR.W    R0,??Quadrotor_pid_2+0x2C
        LDR      R0,[R0, #+0]
        LDR      R1,[SP, #+24]
        BL       __aeabi_fsub
        STR      R0,[SP, #+8]
//  203     err_roll  = des_roll - angle_Y;
        LDR.W    R0,??Quadrotor_pid_2+0x30
        LDR      R0,[R0, #+0]
        LDR      R1,[SP, #+28]
        BL       __aeabi_fsub
        MOVS     R5,R0
//  204     err_yaw   = des_yaw - angle_Z;
        LDR.W    R0,??Quadrotor_pid_2+0x34
        LDR      R0,[R0, #+0]
        LDR      R1,[SP, #+32]
        BL       __aeabi_fsub
        MOVS     R6,R0
//  205     err_high  = des_high - height ;
        LDR.W    R0,??Quadrotor_pid_2+0x18
        LDR      R0,[R0, #+0]
        MOV      R1,R8
        BL       __aeabi_fsub
        MOVS     R7,R0
//  206     err_high  = err_high * K;
        LDR.W    R0,??Quadrotor_pid_2+0x14
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R7
        BL       __aeabi_fmul
        MOVS     R7,R0
//  207 
//  208 
//  209     ////////////Æ«²î»ý·Ö///////////////////////////////////////////////////////////
//  210     if(height > BaseHeight + 1 )
        LDR.W    R0,??Quadrotor_pid_2+0x38
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        BL       __aeabi_i2f
        MOV      R1,R8
        BL       __aeabi_cfcmple
        BCS.N    ??Quadrotor_pid_11
//  211     {
//  212         sum_err_pitch += err_pitch;
        LDR      R0,[SP, #+8]
        BL       __aeabi_f2d
        LDR.W    R4,??Quadrotor_pid_2+0x3C
        LDRD     R2,R3,[R4, #+0]
        BL       __aeabi_dadd
        LDR.W    R2,??Quadrotor_pid_2+0x3C
        STRD     R0,R1,[R2, #+0]
//  213         sum_err_roll  += err_roll;
        MOVS     R0,R5
        BL       __aeabi_f2d
        LDR.W    R4,??Quadrotor_pid_2+0x40
        LDRD     R2,R3,[R4, #+0]
        BL       __aeabi_dadd
        LDR.W    R2,??Quadrotor_pid_2+0x40
        STRD     R0,R1,[R2, #+0]
//  214         sum_err_yaw   += err_yaw;
        MOVS     R0,R6
        BL       __aeabi_f2d
        LDR.W    R4,??Quadrotor_pid_2+0x44
        LDRD     R2,R3,[R4, #+0]
        BL       __aeabi_dadd
        LDR.W    R2,??Quadrotor_pid_2+0x44
        STRD     R0,R1,[R2, #+0]
//  215         // k_high = 1;
//  216     }
//  217     if(Integral_high == true)
??Quadrotor_pid_11:
        LDR.W    R0,??Quadrotor_pid_2+0x48
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Quadrotor_pid_12
//  218     {
//  219         Integral_high = false;
        LDR.W    R0,??Quadrotor_pid_2+0x48
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
//  220         sum_err_high  += err_high;
        MOVS     R0,R7
        BL       __aeabi_f2d
        LDR.W    R4,??Quadrotor_pid_2+0x4C
        LDRD     R2,R3,[R4, #+0]
        BL       __aeabi_dadd
        LDR.W    R2,??Quadrotor_pid_2+0x4C
        STRD     R0,R1,[R2, #+0]
//  221         sum_err_high = sum_err_high * k_high;
        LDR.W    R0,??Quadrotor_pid_2+0x28
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R4,??Quadrotor_pid_2+0x4C
        LDRD     R2,R3,[R4, #+0]
        BL       __aeabi_dmul
        LDR.W    R2,??Quadrotor_pid_2+0x4C
        STRD     R0,R1,[R2, #+0]
//  222     }
//  223     //////////Çó³öÔöÁ¿ÊÇÆ«²îP///////////////////////////////////////////////////////
//  224     err_p = err_pitch - pre_err_pitch;
??Quadrotor_pid_12:
        LDR      R0,[SP, #+8]
        LDR.W    R1,??Quadrotor_pid_2+0x50
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+16]
//  225     err_r = err_roll  - pre_err_roll;
        MOVS     R0,R5
        LDR.W    R1,??Quadrotor_pid_2+0x54
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+4]
//  226     err_y = err_yaw   - pre_err_yaw;
        MOVS     R0,R6
        LDR.W    R1,??Quadrotor_pid_2+0x58
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+12]
//  227     err_h = err_high  - pre_err_high;
        MOVS     R0,R7
        LDR.W    R1,??Quadrotor_pid_2+0x5C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+0]
//  228 
//  229     /////////¸üÐÂÉÏÒ»´ÎÆ«²î////////////////////////////////////////////////////////
//  230     pre_err_pitch = err_pitch;
        LDR.W    R0,??Quadrotor_pid_2+0x50
        LDR      R1,[SP, #+8]
        STR      R1,[R0, #+0]
//  231     pre_err_roll  = err_roll;
        LDR.W    R0,??Quadrotor_pid_2+0x54
        STR      R5,[R0, #+0]
//  232     pre_err_yaw   = err_yaw;
        LDR.W    R0,??Quadrotor_pid_2+0x58
        STR      R6,[R0, #+0]
//  233     pre_err_high  = err_high;
        LDR.W    R0,??Quadrotor_pid_2+0x5C
        STR      R7,[R0, #+0]
//  234 
//  235     U1 = -Kp1 * err_high - Ki1 * sum_err_high - Kd1 * err_h;
        LDR.W    R0,??Quadrotor_pid_2+0x60
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        MOVS     R1,R7
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOV      R10,R0
        MOV      R11,R1
        LDR.W    R0,??Quadrotor_pid_2+0x64
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R4,??Quadrotor_pid_2+0x4C
        LDRD     R2,R3,[R4, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R10
        MOV      R1,R11
        BL       __aeabi_dsub
        MOV      R10,R0
        MOV      R11,R1
        LDR.W    R0,??Quadrotor_pid_2+0x68
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R10
        MOV      R1,R11
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        MOVS     R4,R0
//  236     U2 = -Kp2 * err_roll - Ki2 * sum_err_roll - Kd2 * err_r;
        LDR.W    R0,??Quadrotor_pid_2+0x6C
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        MOVS     R1,R5
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOV      R10,R0
        MOV      R11,R1
        LDR.W    R0,??Quadrotor_pid_2+0x70
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R5,??Quadrotor_pid_2+0x40
        LDRD     R2,R3,[R5, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R10
        MOV      R1,R11
        BL       __aeabi_dsub
        MOV      R10,R0
        MOV      R11,R1
        LDR.W    R0,??Quadrotor_pid_2+0x74
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+4]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R10
        MOV      R1,R11
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        MOV      R10,R0
//  237     U3 = -Kp3 * err_pitch - Ki3 * sum_err_pitch - Kd3 * err_p;
        LDR.W    R0,??Quadrotor_pid_2+0x78
        LDR      R1,[R0, #+0]
        EORS     R1,R1,#0x80000000
        LDR      R0,[SP, #+8]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        STRD     R0,R1,[SP, #+0]
        LDR.W    R0,??Quadrotor_pid_2+0x7C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R5,??Quadrotor_pid_2+0x3C
        LDRD     R2,R3,[R5, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        LDRD     R0,R1,[SP, #+0]
        BL       __aeabi_dsub
        STRD     R0,R1,[SP, #+0]
        LDR.W    R0,??Quadrotor_pid_2+0x80
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+16]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDRD     R0,R1,[SP, #+0]
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        MOV      R9,R0
//  238     U4 = -Kp4 * err_yaw - Ki4 * sum_err_yaw - Kd4 * err_y;
        LDR.W    R0,??Quadrotor_pid_2+0x84
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        MOVS     R1,R6
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_2+0x88
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R5,??Quadrotor_pid_2+0x44
        LDRD     R2,R3,[R5, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_2+0x8C
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+12]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        MOV      R11,R0
//  239 
//  240     //////////Çó³ö¶ÔÓ¦µç»úµÄPWM////////////////////////////////////////////////////
//  241     W1 = U1 / 4 - U3 / 2 - U4 / 4;
        MOVS     R0,R4
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R5,R0
        MOV      R0,R9
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R5,R0
        MOV      R0,R11
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        STR      R0,[SP, #+20]
//  242     W2 = U1 / 4 - U2 / 2 + U4 / 4;
        MOVS     R0,R4
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R5,R0
        MOV      R0,R10
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        MOVS     R5,R0
        MOV      R0,R11
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R1,R5
        BL       __aeabi_fadd
        STR      R0,[SP, #+16]
//  243     W3 = U1 / 4 + U3 / 2 - U4 / 4;
        MOVS     R0,R4
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R5,R0
        MOV      R0,R9
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R5
        BL       __aeabi_fadd
        MOVS     R5,R0
        MOV      R0,R11
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fsub
        STR      R0,[SP, #+12]
//  244     W4 = U1 / 4 + U2 / 2 + U4 / 4;
        MOVS     R0,R4
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R4,R0
        MOV      R0,R10
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        MOV      R0,R11
        MOVS     R1,#+1082130432
        BL       __aeabi_fdiv
        MOVS     R1,R4
        BL       __aeabi_fadd
        STR      R0,[SP, #+8]
//  245 
//  246     if(Backup_landing == false && Landing == false && (height - BaseHeight) <= 3 )count = count + 0.2;
        LDR.W    R0,??Quadrotor_pid_2+0x4
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_2
        LDRB     R1,[R1, #+0]
        ORRS     R0,R1,R0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??Quadrotor_pid_13
        LDR.W    R0,??Quadrotor_pid_2+0x38
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOV      R0,R8
        BL       __aeabi_fsub
        LDR.W    R1,??Quadrotor_pid_14  ;; 0x40400001
        BL       __aeabi_cfcmple
        BCS.N    ??Quadrotor_pid_13
        LDR.W    R0,??Quadrotor_pid_14+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_14+0x8  ;; 0x9999999a
        LDR.W    R3,??Quadrotor_pid_14+0xC  ;; 0x3fc99999
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_14+0x4
        STR      R0,[R1, #+0]
//  247     if(Landing == true && des_high > 2 ) des_high -= 0.1 ; //°²È«½µÂä
??Quadrotor_pid_13:
        LDR.W    R0,??Quadrotor_pid_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Quadrotor_pid_15
        LDR.W    R0,??Quadrotor_pid_2+0x18
        LDR      R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_14+0x10  ;; 0x40000001
        BL       __aeabi_cfrcmple
        BHI.N    ??Quadrotor_pid_15
        LDR.W    R0,??Quadrotor_pid_2+0x18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_14+0x8  ;; 0x9999999a
        LDR.W    R3,??Quadrotor_pid_14+0x14  ;; 0xbfb99999
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_2+0x18
        STR      R0,[R1, #+0]
//  248     if(Landing == true && abs(height - BaseHeight) <= 12)Stop_flag = true;         //½µÂäÀëµØµÍÓÚ5cm¹ØÂÝÐý½°
??Quadrotor_pid_15:
        LDR.W    R0,??Quadrotor_pid_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Quadrotor_pid_16
        LDR.W    R0,??Quadrotor_pid_2+0x38
        LDRH     R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOV      R0,R8
        BL       __aeabi_fsub
        BL       __aeabi_f2iz
        BL       abs
        CMP      R0,#+13
        BGE.N    ??Quadrotor_pid_16
        LDR.W    R0,??Quadrotor_pid_14+0x18
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  249     if(Backup_landing == true && count >= 450 )count = count - 0.25 ;          //¸ß¶È´«¸ÐÆ÷´íÎó£¬±¸ÓÃ½µÂä
??Quadrotor_pid_16:
        LDR.W    R0,??Quadrotor_pid_2+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Quadrotor_pid_17
        LDR.W    R0,??Quadrotor_pid_14+0x4
        LDR      R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_14+0x1C  ;; 0x43e10000
        BL       __aeabi_cfrcmple
        BHI.N    ??Quadrotor_pid_17
        LDR.W    R0,??Quadrotor_pid_14+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_14+0x20  ;; 0xbfd00000
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_14+0x4
        STR      R0,[R1, #+0]
//  250     if(Time_counter *T / 1000 >= 150 )Landing = true ;                         //·ÉÐÐÊ±¼ä³¬¹ý200s×Ô¶¯½µÂä
??Quadrotor_pid_17:
        LDR.W    R0,??Quadrotor_pid_14+0x24
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_14+0x28  ;; 0x40040000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_14+0x2C  ;; 0x408f4000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_14+0x30  ;; 0x4062c000
        BL       __aeabi_cdrcmple
        BHI.N    ??Quadrotor_pid_18
        LDR.W    R0,??Quadrotor_pid_2
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  251     
//  252     //if(Time_counter - COUNTER >= 11000 && count >= 400){count -=  1; Landing = 0;}//³¬Éù²¨ºÍÒ£¿Ø³ö´í½µÂä
//  253 
//  254     BASE_VALUE = 1000 + (int)count;
??Quadrotor_pid_18:
        LDR.W    R0,??Quadrotor_pid_14+0x4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        ADDS     R0,R0,#+1000
        LDR.W    R1,??Quadrotor_pid_14+0x34
        STRH     R0,[R1, #+0]
//  255     // BASE_VALUE = 1000;
//  256     static double sum_axisx = 0;
//  257     static double sum_axisy = 0;
//  258     static float target_x = 0;
//  259     static float target_y = 0;
//  260     static float dot_targetx = 0;
//  261     static float dot_targety = 0;
//  262 
//  263     static float des_x = 0;
//  264     static float des_y = 0;
//  265 
//  266     float err_dotvx = 0;
        MOVS     R0,#+0
//  267     float err_dotvy = 0;
        MOVS     R1,#+0
//  268     float err_vx=0;
        MOVS     R4,#+0
//  269     float err_vy=0;
        MOVS     R5,#+0
//  270 
//  271     static float last_dotx = 0, last_doty = 0;
//  272     static float lastx=0,lasty=0;
//  273     static float des_vx=0,des_vy=0;
//  274     float meanvx=0,meanvy=0;
        MOVS     R2,#+0
        MOVS     R3,#+0
//  275     float xpos=0,ypos=0;
        MOVS     R6,#+0
        MOVS     R7,#+0
//  276     extern bool send_data;
//  277         sendcount++;
        LDR.W    R12,??Quadrotor_pid_14+0x38
        LDR      R12,[R12, #+0]
        ADDS     R12,R12,#+1
        LDR.W    LR,??Quadrotor_pid_14+0x38
        STR      R12,[LR, #+0]
//  278         if(send_data == true)
        LDR.W    R12,??Quadrotor_pid_14+0x3C
        LDRB     R12,[R12, #+0]
        CMP      R12,#+0
        BEQ.N    ??Quadrotor_pid_19
//  279         {
//  280           //sendcount =0;
//  281           SendFloat(angle_X0,UART1);
        LDR.W    R1,??Quadrotor_pid_14+0x40  ;; 0x4006b000
        LDR      R0,[SP, #+80]
        BL       SendFloat
//  282           SendFloat(angle_Y0,UART1);
        LDR.W    R1,??Quadrotor_pid_14+0x40  ;; 0x4006b000
        LDR      R0,[SP, #+84]
        BL       SendFloat
//  283           SendFloat(angle_Z0,UART1);
        LDR.W    R1,??Quadrotor_pid_14+0x40  ;; 0x4006b000
        LDR      R0,[SP, #+88]
        BL       SendFloat
//  284           SendFloat(height,UART1);
        LDR.W    R1,??Quadrotor_pid_14+0x40  ;; 0x4006b000
        MOV      R0,R8
        BL       SendFloat
//  285         }
//  286     
//  287     
//  288     if((int)(Time_counter * T) % OptSamTime == 0)
??Quadrotor_pid_19:
        LDR.W    R0,??Quadrotor_pid_14+0x24
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_14+0x28  ;; 0x40040000
        BL       __aeabi_dmul
        BL       __aeabi_d2iz
        MOVS     R1,#+30
        SDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
        CMP      R0,#+0
        BNE.W    ??Quadrotor_pid_20
//  289     {
//  290 
//  291         ReadANDS3080();
        BL       ReadANDS3080
//  292         
//  293         //=======================================
//  294 
//  295         
//  296         
//  297         
//  298        if(signal_target==false && high_f==1) //
        LDR.W    R0,??Quadrotor_pid_21
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.W    ??Quadrotor_pid_22
        LDR.W    R0,??Quadrotor_pid_2+0x10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.W    ??Quadrotor_pid_22
//  299        {
//  300          
//  301          
//  302           if(steerFlag==0)
        LDR.W    R0,??Quadrotor_pid_21+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Quadrotor_pid_23
//  303           {
//  304              PWM_Y=1020;
        LDR.W    R0,??Quadrotor_pid_21+0x8
        MOV      R1,#+1020
        STR      R1,[R0, #+0]
//  305              PWM_X+=22;
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+22
        LDR.W    R1,??Quadrotor_pid_21+0xC
        STR      R0,[R1, #+0]
//  306           }
//  307           if(PWM_X>=2100&&steerFlag==0)
??Quadrotor_pid_23:
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        MOVW     R1,#+2100
        CMP      R0,R1
        BLT.N    ??Quadrotor_pid_24
        LDR.W    R0,??Quadrotor_pid_21+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Quadrotor_pid_24
//  308           {
//  309              steerFlag=1;
        LDR.W    R0,??Quadrotor_pid_21+0x4
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  310           } 
//  311           if(steerFlag==1)
??Quadrotor_pid_24:
        LDR.W    R0,??Quadrotor_pid_21+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Quadrotor_pid_25
//  312           {
//  313              PWM_X-=22;
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+22
        LDR.W    R1,??Quadrotor_pid_21+0xC
        STR      R0,[R1, #+0]
//  314              PWM_Y=1200;
        LDR.W    R0,??Quadrotor_pid_21+0x8
        MOV      R1,#+1200
        STR      R1,[R0, #+0]
//  315           }
//  316           if(PWM_X<=700&&steerFlag==1)
??Quadrotor_pid_25:
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+700
        BGT.N    ??Quadrotor_pid_26
        LDR.W    R0,??Quadrotor_pid_21+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Quadrotor_pid_26
//  317           {
//  318              steerFlag=2;
        LDR.W    R0,??Quadrotor_pid_21+0x4
        MOVS     R1,#+2
        STRB     R1,[R0, #+0]
//  319           }
//  320           if(steerFlag==2)
??Quadrotor_pid_26:
        LDR.W    R0,??Quadrotor_pid_21+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??Quadrotor_pid_27
//  321           {
//  322              PWM_Y=1450;
        LDR.W    R0,??Quadrotor_pid_21+0x8
        MOVW     R1,#+1450
        STR      R1,[R0, #+0]
//  323              PWM_X+=22;
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+22
        LDR.W    R1,??Quadrotor_pid_21+0xC
        STR      R0,[R1, #+0]
//  324           }
//  325           if(PWM_X>=2100&&steerFlag==2)
??Quadrotor_pid_27:
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        MOVW     R1,#+2100
        CMP      R0,R1
        BLT.N    ??Quadrotor_pid_28
        LDR.W    R0,??Quadrotor_pid_21+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??Quadrotor_pid_28
//  326           {
//  327              steerFlag=3;
        LDR.W    R0,??Quadrotor_pid_21+0x4
        MOVS     R1,#+3
        STRB     R1,[R0, #+0]
//  328           }
//  329           if(steerFlag==3)
??Quadrotor_pid_28:
        LDR.W    R0,??Quadrotor_pid_21+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??Quadrotor_pid_29
//  330           {
//  331              PWM_Y=1600;
        LDR.W    R0,??Quadrotor_pid_21+0x8
        MOV      R1,#+1600
        STR      R1,[R0, #+0]
//  332              PWM_X-=22;
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+22
        LDR.W    R1,??Quadrotor_pid_21+0xC
        STR      R0,[R1, #+0]
//  333           }
//  334            if(PWM_X<=700&&steerFlag==3)
??Quadrotor_pid_29:
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+700
        BGT.W    ??Quadrotor_pid_30
        LDR.W    R0,??Quadrotor_pid_21+0x4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.W    ??Quadrotor_pid_30
//  335           {
//  336              steerFlag=0;
        LDR.W    R0,??Quadrotor_pid_21+0x4
        MOVS     R1,#+0
        STRB     R1,[R0, #+0]
        B.N      ??Quadrotor_pid_30
//  337           }
//  338          
//  339        }
//  340        else
//  341        {         
//  342          
//  343 
//  344 
//  345           //==============¼ÆËãÉãÏñÍ·ÓëµØÃæ¼Ð½Ç£¬¼´Íâ²ÎÊý==================================
//  346          
//  347           //¶¨Òå×ø±ê
//  348           //Teta=-angle_X*3.14/180;//ÈÆ·ÉÐÐÆ÷YÖáÄæÊ±Õë
//  349           //Phi=angle_Y*3.14/180;//ÈÆ·ÉÐÐÆ÷xÖáÄæÊ±ÕëÐý×ª
//  350           //Alphard=( PWM_X - 1350 )*3.14 / 1900;//¶¨ÒåXÖáÎªÔÆÌ¨Õý·½Ïò£¬ZÖáÏòÏÂ£¬yÖáÏòÓÒ
//  351           //Beta   =( PWM_Y -850 )*3.14 / 1900;
//  352          
//  353           
//  354           //¼ÆËã³öÔÆÌ¨ÓëµØÃæ¼Ð½Ç
//  355           //==============¼ÆËãÉãÏñÍ·ÓëµØÃæ¼Ð½Ç£¬¼´Íâ²ÎÊý==================================
//  356          
//  357          // image_distance=108/cos(AY);//ÉãÏñÍ·Îï¾à
//  358 
//  359           
//  360           //ÐÞÕý²ÎÊý£¬¼ÆËãÏñËØ×ø±êµ½Í¼ÏñÖÐÐÄµãµÄÊµ¼Ê¾àÀë
//  361           if(re_X !=0 && re_Y !=0)
??Quadrotor_pid_22:
        LDR.W    R0,??Quadrotor_pid_21+0x10
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??Quadrotor_pid_31
        LDR.W    R0,??Quadrotor_pid_21+0x14
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??Quadrotor_pid_31
//  362           {
//  363            
//  364             //=====================ÔÆÌ¨¿ØÖÆ£¬ÀûÓÃÏñËØ×ª»»Îª½Ç¶È==================
//  365             err_angX = atan2((float)re_X,450);
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_21+0x18  ;; 0x407c2000
        MOVS     R4,R2
        MOVS     R5,R3
        LDR.W    R0,??Quadrotor_pid_21+0x10
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       atan2
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x1C
        STR      R0,[R1, #+0]
//  366             err_angY = atan2((float)re_Y,471);
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_21+0x20  ;; 0x407d7000
        MOVS     R4,R2
        MOVS     R5,R3
        LDR.W    R0,??Quadrotor_pid_21+0x14
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       atan2
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x24
        STR      R0,[R1, #+0]
//  367             
//  368             pre_err_angX=err_angX; 
        LDR.W    R0,??Quadrotor_pid_21+0x28
        LDR.W    R1,??Quadrotor_pid_21+0x1C
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  369             pre_err_angY=err_angY;
        LDR.W    R0,??Quadrotor_pid_21+0x2C
        LDR.W    R1,??Quadrotor_pid_21+0x24
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  370             //=====================ÔÆÌ¨¿ØÖÆ£¬ÀûÓÃÏñËØ×ª»»Îª½Ç¶È==================
//  371             
//  372           
//  373             
//  374            PWM_X=(int)(PWM_X-(0.20*err_angX)*1200 - 0.12*(err_angX - pre_err_angX)*1200);//600--2300(1370yÖá¸º·½Ïò)
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??Quadrotor_pid_21+0x1C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_14+0x8  ;; 0x9999999a
        LDR.W    R3,??Quadrotor_pid_14+0xC  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_21+0x30  ;; 0x4092c000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??Quadrotor_pid_21+0x1C
        LDR      R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_21+0x28
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_21+0x34  ;; 0xeb851eb8
        LDR.W    R3,??Quadrotor_pid_21+0x38  ;; 0x3fbeb851
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_21+0x30  ;; 0x4092c000
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2iz
        LDR.W    R1,??Quadrotor_pid_21+0xC
        STR      R0,[R1, #+0]
//  375            PWM_Y=(int)(PWM_Y+(0.20*err_angY)*1200 + 0.12*(err_angY - pre_err_angY)*1200);//850___1800(850Îª´¹Ö±ÏòÏÂ)
        LDR.W    R0,??Quadrotor_pid_21+0x8
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??Quadrotor_pid_21+0x24
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_14+0x8  ;; 0x9999999a
        LDR.W    R3,??Quadrotor_pid_14+0xC  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_21+0x30  ;; 0x4092c000
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??Quadrotor_pid_21+0x24
        LDR      R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_21+0x2C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_21+0x34  ;; 0xeb851eb8
        LDR.W    R3,??Quadrotor_pid_21+0x38  ;; 0x3fbeb851
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_21+0x30  ;; 0x4092c000
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2iz
        LDR.W    R1,??Quadrotor_pid_21+0x8
        STR      R0,[R1, #+0]
        B.N      ??Quadrotor_pid_32
//  376           }
//  377           else//Î´½ÓÊÜµ½Êý¾ÝÊ±ÔòÈÏÎªÎó²î½Ç¶ÈÎª0
//  378           {
//  379              err_angX = 0;
??Quadrotor_pid_31:
        LDR.W    R0,??Quadrotor_pid_21+0x1C
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  380              err_angY = 0;
        LDR.W    R0,??Quadrotor_pid_21+0x24
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  381           }
//  382     
//  383         
//  384          //PWM_X=(int)(PWM_X-(0.85*err_angX)*1200) - 0.7*(err_angX - pre_err_angX)*1200);//600--2300(1370yÖá¸º·½Ïò)
//  385          //PWM_Y=(int)(PWM_Y+(0.85*err_angY)*1200) + 0.7*(err_angY - pre_err_angY)*1200);//850___1800(850Îª´¹Ö±ÏòÏÂ)
//  386          if(camflag==true)
??Quadrotor_pid_32:
        LDR.W    R0,??Quadrotor_pid_21+0x3C
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Quadrotor_pid_30
//  387          {
//  388             PWM_X=1350;
        LDR.W    R0,??Quadrotor_pid_21+0xC
        MOVW     R1,#+1350
        STR      R1,[R0, #+0]
//  389             PWM_Y=850;
        LDR.W    R0,??Quadrotor_pid_21+0x8
        MOVW     R1,#+850
        STR      R1,[R0, #+0]
//  390          }
//  391 
//  392        }
//  393        
//  394           
//  395         //ÏÞÖÆ¶æ»úÐý×ª·¶Î§
//  396         if(PWM_Y<850) PWM_Y=850;
??Quadrotor_pid_30:
        LDR.W    R0,??Quadrotor_pid_21+0x8
        LDR      R0,[R0, #+0]
        MOVW     R1,#+850
        CMP      R0,R1
        BGE.N    ??Quadrotor_pid_33
        LDR.W    R0,??Quadrotor_pid_21+0x8
        MOVW     R1,#+850
        STR      R1,[R0, #+0]
//  397         if(PWM_Y>1800) PWM_Y=1800;
??Quadrotor_pid_33:
        LDR.W    R0,??Quadrotor_pid_21+0x8
        LDR      R0,[R0, #+0]
        CMP      R0,#+1800
        BLE.N    ??Quadrotor_pid_34
        LDR.W    R0,??Quadrotor_pid_21+0x8
        MOV      R1,#+1800
        STR      R1,[R0, #+0]
//  398         if(PWM_X<600) PWM_X=600;
??Quadrotor_pid_34:
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+600
        BGE.N    ??Quadrotor_pid_35
        LDR.W    R0,??Quadrotor_pid_21+0xC
        MOV      R1,#+600
        STR      R1,[R0, #+0]
//  399         if(PWM_X>2300) PWM_X=2300;
??Quadrotor_pid_35:
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R0,[R0, #+0]
        MOVW     R1,#+2301
        CMP      R0,R1
        BLT.N    ??Quadrotor_pid_36
        LDR.W    R0,??Quadrotor_pid_21+0xC
        MOVW     R1,#+2300
        STR      R1,[R0, #+0]
//  400       
//  401         ftm0_pwm_change_duty(0,PWM_Y);//¿ØÖÆ¶æ»úÉÏÏÂ
??Quadrotor_pid_36:
        LDR.W    R0,??Quadrotor_pid_21+0x8
        LDR      R1,[R0, #+0]
        MOVS     R0,#+0
        BL       ftm0_pwm_change_duty
//  402         ftm0_pwm_change_duty(5,PWM_X);//¿ØÖÆ¶æ»ú×óÓÒ
        LDR.W    R0,??Quadrotor_pid_21+0xC
        LDR      R1,[R0, #+0]
        MOVS     R0,#+5
        BL       ftm0_pwm_change_duty
//  403 
//  404         
//  405         //ÓÃÍêµÄÆ«ÒÆÖµÇåÁã
//  406         re_Y=0;
        LDR.W    R0,??Quadrotor_pid_21+0x14
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  407         re_X=0;
        LDR.W    R0,??Quadrotor_pid_21+0x10
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  408         //=======================================      
//  409         
//  410         
//  411         if(startMotion == true && signal_target==true && Landing == false)
        LDR.W    R0,??Quadrotor_pid_21+0x40
        LDRB     R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_21
        LDRB     R1,[R1, #+0]
        ANDS     R0,R1,R0
        LDR.N    R1,??Quadrotor_pid_2
        LDRB     R1,[R1, #+0]
        EORS     R1,R1,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        TST      R0,R1
        BEQ.W    ??Quadrotor_pid_37
//  412         {
//  413 
//  414             
//  415           des_PointX =0; //PointX;
        LDR.W    R0,??Quadrotor_pid_21+0x44
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  416           des_PointY =0; //PointY;
        LDR.W    R0,??Quadrotor_pid_21+0x48
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  417             
//  418           errX = PointX-des_PointX;
        LDR      R0,[SP, #+72]
        LDR.W    R1,??Quadrotor_pid_21+0x44
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??Quadrotor_pid_21+0x4C
        STR      R0,[R1, #+0]
//  419           errY = PointY-des_PointY;
        LDR      R0,[SP, #+76]
        LDR.W    R1,??Quadrotor_pid_21+0x48
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??Quadrotor_pid_21+0x50
        STR      R0,[R1, #+0]
//  420           
//  421  
//  422             //¿ØÖÆ¸úËæÐ¡³µ
//  423             //Éè¶¨·ÉÐÐÆ÷¸úËæÔÚÊ¶±ðÄ¿±êxÖáºó·½2Ã×µÄÎ»ÖÃ
//  424 //            des_PointX = 200-PointX;
//  425 //            des_PointY = 0-PointY;
//  426             theta = atan2(errX , -errY);
        LDR.W    R0,??Quadrotor_pid_21+0x50
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R4,R2
        MOVS     R5,R3
        LDR.W    R0,??Quadrotor_pid_21+0x4C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       atan2
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x54
        STR      R0,[R1, #+0]
//  427             
//  428             float kk=0,RR=0;
        MOVS     R6,#+0
        MOVS     R7,#+0
//  429             RR=sqrt(errX*errX+errY*errY);
        LDR.W    R0,??Quadrotor_pid_21+0x4C
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0x4C
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR.W    R0,??Quadrotor_pid_21+0x50
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0x50
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        BL       sqrt
        BL       __aeabi_d2f
        MOVS     R7,R0
//  430             kk=0.1*log(RR/10.0)/log(2.0);
        MOVS     R0,R7
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.W    R3,??Quadrotor_pid_21+0x58  ;; 0x40240000
        BL       __aeabi_ddiv
        BL       log
        LDR.W    R2,??Quadrotor_pid_14+0x8  ;; 0x9999999a
        LDR.W    R3,??Quadrotor_pid_21+0x5C  ;; 0x3fb99999
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+0
        MOVS     R1,#+1073741824
        BL       log
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        MOVS     R6,R0
//  431             if(RR<25)
        MOVS     R0,R7
        LDR.W    R1,??Quadrotor_pid_21+0x60  ;; 0x41c80000
        BL       __aeabi_cfcmple
        BCS.N    ??Quadrotor_pid_38
//  432             {
//  433               camflag=true;
        LDR.W    R0,??Quadrotor_pid_21+0x3C
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//  434             }
//  435             if(RR>25)
??Quadrotor_pid_38:
        MOVS     R0,R7
        LDR.W    R1,??Quadrotor_pid_21+0x64  ;; 0x41c80001
        BL       __aeabi_cfrcmple
        BHI.W    ??Quadrotor_pid_39
//  436             { 
//  437                 des_x -=kk*(Velocity / OptSamTime) * sin(theta);
        LDR.W    R0,??Quadrotor_pid_21+0x68
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOV      R8,R0
        MOV      R9,R1
        MOVS     R0,#+1073741824
        MOVS     R1,R6
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??Quadrotor_pid_21+0x54
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       sin
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x68
        STR      R0,[R1, #+0]
//  438                 des_y -=kk*(Velocity / OptSamTime) * cos(theta);
        LDR.W    R0,??Quadrotor_pid_21+0x6C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOV      R8,R0
        MOV      R9,R1
        MOVS     R0,#+1073741824
        MOVS     R1,R6
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??Quadrotor_pid_21+0x54
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       cos
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOV      R0,R8
        MOV      R1,R9
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x6C
        STR      R0,[R1, #+0]
//  439 
//  440                 _flag_=true;
        LDR.W    R0,??Quadrotor_pid_21+0x70
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
        B.N      ??Quadrotor_pid_37
        DATA
??Quadrotor_pid_2:
        DC32     Landing
        DC32     Backup_landing
        DC32     lastHeight
        DC32     0x42480001
        DC32     ??high_f
        DC32     ??K
        DC32     ??des_high
        DC32     0x42a00000
        DC32     0x428c0001
        DC32     0x42dc0000
        DC32     ??k_high
        DC32     ??des_pitch
        DC32     ??des_roll
        DC32     ??des_yaw
        DC32     BaseHeight
        DC32     ??sum_err_pitch
        DC32     ??sum_err_roll
        DC32     ??sum_err_yaw
        DC32     Integral_high
        DC32     ??sum_err_high
        DC32     ??pre_err_pitch
        DC32     ??pre_err_roll
        DC32     ??pre_err_yaw
        DC32     ??pre_err_high
        DC32     Kp1
        DC32     Ki1
        DC32     Kd1
        DC32     Kp2
        DC32     Ki2
        DC32     Kd2
        DC32     Kp3
        DC32     Ki3
        DC32     Kd3
        DC32     Kp4
        DC32     Ki4
        DC32     Kd4
        THUMB
//  441 //               
//  442            }
//  443             else
//  444             {
//  445 //              if(RR>0)
//  446 //              {
//  447 //                float k_follow=0.1,kd_follow=2.0,ux=0,uy=0,dot_errX=0,dot_errY,temperrX=0,temperrY=0;
//  448 //
//  449 //                static float pre_errX=0,pre_errY=0,predot_errX,predot_errY;
//  450 //                if(_flag_==true)
//  451 //                {pre_errX=errX;pre_errY=errY;_flag_=false;}
//  452 //                temperrX=0.8*errX+0.20*pre_errX;
//  453 //                temperrY=0.8*errY+0.20*pre_errY;
//  454 //                dot_errX=temperrX-pre_errX;
//  455 //                dot_errY=temperrY-pre_errY;
//  456 //                
//  457 //                predot_errX=dot_errX;
//  458 //                predot_errY=dot_errY;
//  459 //                ux=k_follow*temperrX+kd_follow*dot_errX;
//  460 //                uy=k_follow*temperrY+kd_follow*dot_errY;
//  461 //                pre_errX=temperrX;
//  462 //                pre_errY=temperrY;
//  463 //                des_x -=ux*(Velocity / OptSamTime) ;
//  464 //                des_y -=uy*(Velocity / OptSamTime) ;
//  465 //
//  466 //              }
//  467 //              else
//  468 //              {
//  469                des_x -=0;//.1*(Velocity / OptSamTime) ;
??Quadrotor_pid_39:
        LDR.W    R0,??Quadrotor_pid_21+0x68
        LDR.W    R1,??Quadrotor_pid_21+0x68
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  470                des_y -=0;//.1*(Velocity / OptSamTime) ;
        LDR.W    R0,??Quadrotor_pid_21+0x6C
        LDR.W    R1,??Quadrotor_pid_21+0x6C
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  471 //
//  472 //               _flag_=true;
//  473 //              }
//  474 
//  475             }
//  476            
//  477             
//  478          }
//  479 
//  480 //==============================================================================
//  481     
//  482         
//  483         
//  484         //==================================
//  485         xpos = 0.2 * SumDeltX + 0.8 * preposx;
??Quadrotor_pid_37:
        LDR.W    R0,??Quadrotor_pid_21+0x74
        LDRD     R2,R3,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_14+0x8  ;; 0x9999999a
        LDR.W    R1,??Quadrotor_pid_14+0xC  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??Quadrotor_pid_21+0x78
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_14+0x8  ;; 0x9999999a
        LDR.W    R3,??Quadrotor_pid_21+0x7C  ;; 0x3fe99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOVS     R6,R0
//  486         ypos = 0.2 * SumDeltY + 0.8 * preposy;
        LDR.W    R0,??Quadrotor_pid_21+0x80
        LDRD     R2,R3,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_14+0x8  ;; 0x9999999a
        LDR.W    R1,??Quadrotor_pid_14+0xC  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??Quadrotor_pid_21+0x84
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_14+0x8  ;; 0x9999999a
        LDR.W    R3,??Quadrotor_pid_21+0x7C  ;; 0x3fe99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        MOVS     R7,R0
//  487        
//  488         Axis_x = xpos - des_x;
        MOVS     R0,R6
        LDR.W    R1,??Quadrotor_pid_21+0x68
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_21+0x88
        STRD     R0,R1,[R2, #+0]
//  489         Axis_y = ypos - des_y;
        MOVS     R0,R7
        LDR.W    R1,??Quadrotor_pid_21+0x6C
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.W    R2,??Quadrotor_pid_21+0x8C
        STRD     R0,R1,[R2, #+0]
//  490 
//  491         dot_targetx = Axis_x -  target_x;
        LDR.W    R0,??Quadrotor_pid_21+0x90
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.W    R4,??Quadrotor_pid_21+0x88
        LDRD     R0,R1,[R4, #+0]
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x94
        STR      R0,[R1, #+0]
//  492         dot_targety = Axis_y - target_y ;
        LDR.W    R0,??Quadrotor_pid_21+0x98
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        LDR.W    R4,??Quadrotor_pid_21+0x8C
        LDRD     R0,R1,[R4, #+0]
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x9C
        STR      R0,[R1, #+0]
//  493         
//  494         dot_targetx = (dot_targetx + last_dotx) / 2.0;
        LDR.W    R0,??Quadrotor_pid_21+0x94
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0xA0
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        MOVS     R2,#+0
        MOVS     R3,#+1073741824
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x94
        STR      R0,[R1, #+0]
//  495         dot_targety = (dot_targety + last_doty) / 2.0;
        LDR.W    R0,??Quadrotor_pid_21+0x9C
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0xA4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        MOVS     R2,#+0
        MOVS     R3,#+1073741824
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x9C
        STR      R0,[R1, #+0]
//  496         
//  497         err_vx = dot_targetx - last_dotx;
        LDR.W    R0,??Quadrotor_pid_21+0x94
        LDR      R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_21+0xA0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
//  498         err_vy = dot_targety - last_doty;
        LDR.W    R0,??Quadrotor_pid_21+0x9C
        LDR      R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_21+0xA4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R5,R0
//  499      
//  500         preposx = xpos;
        LDR.W    R0,??Quadrotor_pid_21+0x78
        STR      R6,[R0, #+0]
//  501         preposy = ypos;
        LDR.W    R0,??Quadrotor_pid_21+0x84
        STR      R7,[R0, #+0]
//  502         
//  503         target_x = Axis_x;
        LDR.W    R2,??Quadrotor_pid_21+0x88
        LDRD     R0,R1,[R2, #+0]
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x90
        STR      R0,[R1, #+0]
//  504         target_y = Axis_y;
        LDR.W    R2,??Quadrotor_pid_21+0x8C
        LDRD     R0,R1,[R2, #+0]
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0x98
        STR      R0,[R1, #+0]
//  505         
//  506         last_dotx = dot_targetx;
        LDR.W    R0,??Quadrotor_pid_21+0xA0
        LDR.W    R1,??Quadrotor_pid_21+0x94
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  507         last_doty = dot_targety;
        LDR.W    R0,??Quadrotor_pid_21+0xA4
        LDR.W    R1,??Quadrotor_pid_21+0x9C
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  508         
//  509         sum_axisx += target_x ;//* k_high;
        LDR.W    R0,??Quadrotor_pid_21+0x90
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R6,??Quadrotor_pid_21+0xA8
        LDRD     R2,R3,[R6, #+0]
        BL       __aeabi_dadd
        LDR.W    R2,??Quadrotor_pid_21+0xA8
        STRD     R0,R1,[R2, #+0]
//  510         sum_axisy += target_y ;//* k_high;
        LDR.W    R0,??Quadrotor_pid_21+0x98
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R6,??Quadrotor_pid_21+0xAC
        LDRD     R2,R3,[R6, #+0]
        BL       __aeabi_dadd
        LDR.W    R2,??Quadrotor_pid_21+0xAC
        STRD     R0,R1,[R2, #+0]
//  511 
//  512         
//  513         //=========================================
//  514         float tempdotErrX = 0,tempdotErrY=0;
        MOVS     R7,#+0
        MOVS     R6,#+0
//  515         static float lastdotErrX=0,lastdotErrY=0;
//  516        
//  517         tempdotErrX = errX - lastErrX;
        LDR.W    R0,??Quadrotor_pid_21+0x4C
        LDR      R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_21+0xB0
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R7,R0
//  518         tempdotErrY = errY - lastErrY;
        LDR.W    R0,??Quadrotor_pid_21+0x50
        LDR      R0,[R0, #+0]
        LDR.W    R1,??Quadrotor_pid_21+0xB4
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R6,R0
//  519        
//  520         dotErrX = 0.3*tempdotErrX + 0.7*lastdotErrX;
        MOVS     R0,R7
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.W    R3,??Quadrotor_pid_21+0xB8  ;; 0x3fd33333
        BL       __aeabi_dmul
        MOV      R8,R0
        MOV      R9,R1
        LDR.W    R0,??Quadrotor_pid_21+0xBC
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+1717986918
        LDR.W    R3,??Quadrotor_pid_21+0xC0  ;; 0x3fe66666
        BL       __aeabi_dmul
        MOV      R2,R8
        MOV      R3,R9
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        STR      R0,[SP, #+4]
//  521         dotErrY = 0.3*tempdotErrY + 0.7*lastdotErrY;
        MOVS     R0,R6
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.W    R3,??Quadrotor_pid_21+0xB8  ;; 0x3fd33333
        BL       __aeabi_dmul
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xC4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+1717986918
        LDR.W    R3,??Quadrotor_pid_21+0xC0  ;; 0x3fe66666
        BL       __aeabi_dmul
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        STR      R0,[SP, #+0]
//  522         
//  523         lastdotErrX = dotErrX;
        LDR.W    R0,??Quadrotor_pid_21+0xBC
        LDR      R1,[SP, #+4]
        STR      R1,[R0, #+0]
//  524         lastdotErrY = dotErrY;
        LDR.W    R0,??Quadrotor_pid_21+0xC4
        LDR      R1,[SP, #+0]
        STR      R1,[R0, #+0]
//  525               
//  526         sumErrX += errX;
        LDR.W    R0,??Quadrotor_pid_21+0x4C
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R6,??Quadrotor_pid_21+0xC8
        LDRD     R2,R3,[R6, #+0]
        BL       __aeabi_dadd
        LDR.W    R2,??Quadrotor_pid_21+0xC8
        STRD     R0,R1,[R2, #+0]
//  527         sumErrY += errY;
        LDR.W    R0,??Quadrotor_pid_21+0x50
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R6,??Quadrotor_pid_21+0xCC
        LDRD     R2,R3,[R6, #+0]
        BL       __aeabi_dadd
        LDR.W    R2,??Quadrotor_pid_21+0xCC
        STRD     R0,R1,[R2, #+0]
//  528            
//  529         lastErrX = errX;
        LDR.W    R0,??Quadrotor_pid_21+0xB0
        LDR.W    R1,??Quadrotor_pid_21+0x4C
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  530         lastErrY = errY;
        LDR.W    R0,??Quadrotor_pid_21+0xB4
        LDR.W    R1,??Quadrotor_pid_21+0x50
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  531         //=========================================
//  532 
//  533         //  if(sum_axisx > 1500000)sum_axisx = 1500000;
//  534         //  else if(sum_axisx < -1500000)sum_axisx = -1500000;
//  535         //  if(sum_axisy > 1500000)sum_axisy = 1500000;
//  536         //  else if(sum_axisy < -1500000)sum_axisy = -1500000;
//  537         
//  538 
//  539 
//  540         
//  541         W_Axis_1 = target_x     * Kx + sum_axisx * Kix + Kdx * dot_targetx  + err_vx * kvx ;
        LDR.W    R0,??Quadrotor_pid_21+0x90
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0xD0
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xD4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R12,??Quadrotor_pid_21+0xA8
        LDRD     R2,R3,[R12, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xD8
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0x94
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xDC
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0xE0
        STR      R0,[R1, #+0]
//  542         W_Axis_2 = (-target_y ) * Ky - sum_axisy * Kiy - Kdy * dot_targety  - err_vy * kvy ;
        LDR.W    R0,??Quadrotor_pid_21+0x98
        LDR      R1,[R0, #+0]
        EORS     R1,R1,#0x80000000
        LDR.W    R0,??Quadrotor_pid_21+0xE4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xE8
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R12,??Quadrotor_pid_21+0xAC
        LDRD     R2,R3,[R12, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xEC
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0x9C
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xF0
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0xF4
        STR      R0,[R1, #+0]
//  543         W_Axis_3 = (-target_x ) * Kx - sum_axisx * Kix - Kdx * dot_targetx  - err_vx * kvx ;
        LDR.W    R0,??Quadrotor_pid_21+0x90
        LDR      R1,[R0, #+0]
        EORS     R1,R1,#0x80000000
        LDR.W    R0,??Quadrotor_pid_21+0xD0
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xD4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R12,??Quadrotor_pid_21+0xA8
        LDRD     R2,R3,[R12, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xD8
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0x94
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xDC
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0xF8
        STR      R0,[R1, #+0]
//  544         W_Axis_4 = target_y     * Ky + sum_axisy * Kiy + Kdy * dot_targety  + err_vy * kvy ;
        LDR.W    R0,??Quadrotor_pid_21+0x98
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0xE4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xE8
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R4,??Quadrotor_pid_21+0xAC
        LDRD     R2,R3,[R4, #+0]
        BL       __aeabi_dmul
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xEC
        LDR      R1,[R0, #+0]
        LDR.W    R0,??Quadrotor_pid_21+0x9C
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??Quadrotor_pid_21+0xF0
        LDR      R0,[R0, #+0]
        MOVS     R1,R5
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.W    R1,??Quadrotor_pid_21+0xFC
        STR      R0,[R1, #+0]
//  545         
//  546 //        if(startMotion == true && signal_target==true && Landing == false)
//  547 //        {
//  548 //          W_Axis_1 =   (-errX)  * Kx1   - dotErrX * Kdx1;//  - sumErrX * Kix;              
//  549 //          W_Axis_2 =    -errY   * Ky1   - dotErrY * Kdy1;//  + sumErrY * Kiy;
//  550 //          W_Axis_3 =    errX    * Kx1   + dotErrX * Kdx1;//  + sumErrX * Kix;
//  551 //          W_Axis_4 =   (errY)   * Ky1   + dotErrY * Kdy1;//  - sumErrY * Kiy;
//  552 //        }
//  553 
//  554 //        *posx = SumDeltX;
//  555 //        posx++;
//  556 //        *posy = SumDeltY;
//  557 //        posy++;
//  558     }
//  559    // BASE_VALUE = 1000;W1=0;W2=0;W3=0;W4=0 
//  560     w1 =  BASE_VALUE + (int)(W1 + W_Axis_1);
??Quadrotor_pid_20:
        LDR.N    R0,??Quadrotor_pid_14+0x34
        LDRH     R4,[R0, #+0]
        LDR      R1,[SP, #+20]
        LDR.W    R0,??Quadrotor_pid_21+0xE0
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        UXTAH    R0,R0,R4
        LDR.W    R1,??Quadrotor_pid_21+0x100
        STR      R0,[R1, #+0]
//  561     w2 =  BASE_VALUE + (int)(W2 + W_Axis_2);
        LDR.N    R0,??Quadrotor_pid_14+0x34
        LDRH     R4,[R0, #+0]
        LDR      R1,[SP, #+16]
        LDR.W    R0,??Quadrotor_pid_21+0xF4
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        UXTAH    R0,R0,R4
        LDR.W    R1,??Quadrotor_pid_21+0x104
        STR      R0,[R1, #+0]
//  562     w3 =  BASE_VALUE + (int)(W3 + W_Axis_3);
        LDR.N    R0,??Quadrotor_pid_14+0x34
        LDRH     R4,[R0, #+0]
        LDR      R1,[SP, #+12]
        LDR.W    R0,??Quadrotor_pid_21+0xF8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        UXTAH    R0,R0,R4
        LDR.W    R1,??Quadrotor_pid_21+0x108
        STR      R0,[R1, #+0]
//  563     w4 =  BASE_VALUE + (int)(W4 + W_Axis_4);
        LDR.N    R0,??Quadrotor_pid_14+0x34
        LDRH     R4,[R0, #+0]
        LDR      R1,[SP, #+8]
        LDR.N    R0,??Quadrotor_pid_21+0xFC
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        BL       __aeabi_f2iz
        UXTAH    R0,R0,R4
        LDR.N    R1,??Quadrotor_pid_21+0x10C
        STR      R0,[R1, #+0]
//  564     
//  565           //TEST5=(int)(W1 + W_Axis_1);
//  566 
//  567     if(w1 - last_w1 > Inc_max)w1 = last_w1 + Inc_max;
        LDR.N    R0,??Quadrotor_pid_21+0x100
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Quadrotor_pid_21+0x110
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+31
        BLT.N    ??Quadrotor_pid_40
        LDR.N    R0,??Quadrotor_pid_21+0x110
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+30
        LDR.N    R1,??Quadrotor_pid_21+0x100
        STR      R0,[R1, #+0]
        B.N      ??Quadrotor_pid_41
//  568     else if(w1 - last_w1 < Dec_max)w1 = last_w1 + Dec_max;
??Quadrotor_pid_40:
        LDR.N    R0,??Quadrotor_pid_21+0x100
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Quadrotor_pid_21+0x110
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMN      R0,#+30
        BGE.N    ??Quadrotor_pid_41
        LDR.N    R0,??Quadrotor_pid_21+0x110
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+30
        LDR.N    R1,??Quadrotor_pid_21+0x100
        STR      R0,[R1, #+0]
//  569 
//  570     if(w2 - last_w2 > Inc_max)w2 = last_w2 + Inc_max;
??Quadrotor_pid_41:
        LDR.N    R0,??Quadrotor_pid_21+0x104
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Quadrotor_pid_21+0x114
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+31
        BLT.N    ??Quadrotor_pid_42
        LDR.N    R0,??Quadrotor_pid_21+0x114
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+30
        LDR.N    R1,??Quadrotor_pid_21+0x104
        STR      R0,[R1, #+0]
        B.N      ??Quadrotor_pid_43
//  571     else if(w2 - last_w2 < Dec_max)w2 = last_w2 + Dec_max;
??Quadrotor_pid_42:
        LDR.N    R0,??Quadrotor_pid_21+0x104
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Quadrotor_pid_21+0x114
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMN      R0,#+30
        BGE.N    ??Quadrotor_pid_43
        LDR.N    R0,??Quadrotor_pid_21+0x114
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+30
        LDR.N    R1,??Quadrotor_pid_21+0x104
        STR      R0,[R1, #+0]
//  572 
//  573     if(w3 - last_w3 > Inc_max)w3 = last_w3 + Inc_max;
??Quadrotor_pid_43:
        LDR.N    R0,??Quadrotor_pid_21+0x108
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Quadrotor_pid_21+0x118
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+31
        BLT.N    ??Quadrotor_pid_44
        LDR.N    R0,??Quadrotor_pid_21+0x118
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+30
        LDR.N    R1,??Quadrotor_pid_21+0x108
        STR      R0,[R1, #+0]
        B.N      ??Quadrotor_pid_45
//  574     else if(w3 - last_w3 < Dec_max)w3 = last_w3 + Dec_max;
??Quadrotor_pid_44:
        LDR.N    R0,??Quadrotor_pid_21+0x108
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Quadrotor_pid_21+0x118
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMN      R0,#+30
        BGE.N    ??Quadrotor_pid_45
        LDR.N    R0,??Quadrotor_pid_21+0x118
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+30
        LDR.N    R1,??Quadrotor_pid_21+0x108
        STR      R0,[R1, #+0]
//  575 
//  576     if(w4 - last_w4 > Inc_max)w4 = last_w4 + Inc_max;
??Quadrotor_pid_45:
        LDR.N    R0,??Quadrotor_pid_21+0x10C
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Quadrotor_pid_21+0x11C
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+31
        BLT.N    ??Quadrotor_pid_46
        LDR.N    R0,??Quadrotor_pid_21+0x11C
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+30
        LDR.N    R1,??Quadrotor_pid_21+0x10C
        STR      R0,[R1, #+0]
        B.N      ??Quadrotor_pid_47
//  577     else if(w4 - last_w4 < Dec_max)w4 = last_w4 + Dec_max;
??Quadrotor_pid_46:
        LDR.N    R0,??Quadrotor_pid_21+0x10C
        LDR      R0,[R0, #+0]
        LDR.N    R1,??Quadrotor_pid_21+0x11C
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMN      R0,#+30
        BGE.N    ??Quadrotor_pid_47
        LDR.N    R0,??Quadrotor_pid_21+0x11C
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+30
        LDR.N    R1,??Quadrotor_pid_21+0x10C
        STR      R0,[R1, #+0]
//  578 
//  579 
//  580     // ctrl+k ×¢ÊÍ
//  581     // ctrl+shift+kÈ¡Ïû×¢ÊÍ
//  582     //////////ÏÞÖÆµç»úPWMÔÚµçµ÷·¶Î§ÄÚ1ms-2ms///////////////////////////////////////
//  583 
//  584 
//  585     if(w1 < THREAD_BOTTOM)   w1 = THREAD_BOTTOM;
??Quadrotor_pid_47:
        LDR.N    R0,??Quadrotor_pid_21+0x100
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BGE.N    ??Quadrotor_pid_48
        LDR.N    R0,??Quadrotor_pid_21+0x100
        MOV      R1,#+1000
        STR      R1,[R0, #+0]
        B.N      ??Quadrotor_pid_49
//  586     else if(w1 > THREAD_TOP) w1 = THREAD_TOP;
??Quadrotor_pid_48:
        LDR.N    R0,??Quadrotor_pid_21+0x100
        LDR      R0,[R0, #+0]
        MOVW     R1,#+1991
        CMP      R0,R1
        BLT.N    ??Quadrotor_pid_49
        LDR.N    R0,??Quadrotor_pid_21+0x100
        MOVW     R1,#+1990
        STR      R1,[R0, #+0]
//  587 
//  588     if(w2 < THREAD_BOTTOM)   w2 = THREAD_BOTTOM;
??Quadrotor_pid_49:
        LDR.N    R0,??Quadrotor_pid_21+0x104
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BGE.N    ??Quadrotor_pid_50
        LDR.N    R0,??Quadrotor_pid_21+0x104
        MOV      R1,#+1000
        STR      R1,[R0, #+0]
        B.N      ??Quadrotor_pid_51
//  589     else if(w2 > THREAD_TOP) w2 = THREAD_TOP;
??Quadrotor_pid_50:
        LDR.N    R0,??Quadrotor_pid_21+0x104
        LDR      R0,[R0, #+0]
        MOVW     R1,#+1991
        CMP      R0,R1
        BLT.N    ??Quadrotor_pid_51
        LDR.N    R0,??Quadrotor_pid_21+0x104
        MOVW     R1,#+1990
        STR      R1,[R0, #+0]
//  590 
//  591     if(w3 < THREAD_BOTTOM)   w3 = THREAD_BOTTOM;
??Quadrotor_pid_51:
        LDR.N    R0,??Quadrotor_pid_21+0x108
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BGE.N    ??Quadrotor_pid_52
        LDR.N    R0,??Quadrotor_pid_21+0x108
        MOV      R1,#+1000
        STR      R1,[R0, #+0]
        B.N      ??Quadrotor_pid_53
//  592     else if(w3 > THREAD_TOP) w3 = THREAD_TOP;
??Quadrotor_pid_52:
        LDR.N    R0,??Quadrotor_pid_21+0x108
        LDR      R0,[R0, #+0]
        MOVW     R1,#+1991
        CMP      R0,R1
        BLT.N    ??Quadrotor_pid_53
        LDR.N    R0,??Quadrotor_pid_21+0x108
        MOVW     R1,#+1990
        STR      R1,[R0, #+0]
//  593 
//  594     if(w4 < THREAD_BOTTOM)    w4 = THREAD_BOTTOM;
??Quadrotor_pid_53:
        LDR.N    R0,??Quadrotor_pid_21+0x10C
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BGE.N    ??Quadrotor_pid_54
        LDR.N    R0,??Quadrotor_pid_21+0x10C
        MOV      R1,#+1000
        STR      R1,[R0, #+0]
        B.N      ??Quadrotor_pid_55
        DATA
??Quadrotor_pid_14:
        DC32     0x40400001
        DC32     ??count
        DC32     0x9999999a
        DC32     0x3fc99999
        DC32     0x40000001
        DC32     0xbfb99999
        DC32     Stop_flag
        DC32     0x43e10000
        DC32     0xbfd00000
        DC32     Time_counter
        DC32     0x40040000
        DC32     0x408f4000
        DC32     0x4062c000
        DC32     BASE_VALUE
        DC32     sendcount
        DC32     send_data
        DC32     0x4006b000
        THUMB
//  595     else if(w4 > THREAD_TOP) w4 = THREAD_TOP;
??Quadrotor_pid_54:
        LDR.N    R0,??Quadrotor_pid_21+0x10C
        LDR      R0,[R0, #+0]
        MOVW     R1,#+1991
        CMP      R0,R1
        BLT.N    ??Quadrotor_pid_55
        LDR.N    R0,??Quadrotor_pid_21+0x10C
        MOVW     R1,#+1990
        STR      R1,[R0, #+0]
//  596 
//  597     
//  598     /////////////Êä³öPWM////////////////////////////////////////////////////////////
//  599 //        if(w1 > 1200)w1=1200;
//  600 //        if(w2 > 1200)w2=1200;
//  601 //        if(w3 > 1200)w3=1200;
//  602 //        if(w4 > 1200)w4=1200;
//  603 //   w1 = (2*w1 + 8*last_w1)/10;
//  604 //   w2 = (2*w2 + 8*last_w2)/10;
//  605 //   w3 = (2*w3 + 8*last_w3)/10;
//  606 //   w4 = (2*w4 + 8*last_w4)/10;
//  607     set_pwm(w1, w2, w3, w4);
??Quadrotor_pid_55:
        LDR.N    R0,??Quadrotor_pid_21+0x10C
        LDR      R3,[R0, #+0]
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDR.N    R0,??Quadrotor_pid_21+0x108
        LDR      R2,[R0, #+0]
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR.N    R0,??Quadrotor_pid_21+0x104
        LDR      R1,[R0, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??Quadrotor_pid_21+0x100
        LDR      R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       set_pwm
//  608     last_w1 = w1;
        LDR.N    R0,??Quadrotor_pid_21+0x110
        LDR.N    R1,??Quadrotor_pid_21+0x100
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  609     last_w2 = w2;
        LDR.N    R0,??Quadrotor_pid_21+0x114
        LDR.N    R1,??Quadrotor_pid_21+0x104
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  610     last_w3 = w3;
        LDR.N    R0,??Quadrotor_pid_21+0x118
        LDR.N    R1,??Quadrotor_pid_21+0x108
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  611     last_w4 = w4;
        LDR.N    R0,??Quadrotor_pid_21+0x11C
        LDR.N    R1,??Quadrotor_pid_21+0x10C
        LDR      R1,[R1, #+0]
        STR      R1,[R0, #+0]
//  612     // set_pwm(1000, 1000, 1200,1000);
//  613     //POWER_OFF;
//  614     
//  615       
//  616 
//  617        if(startMotion == true )//&& signal_target==true && Landing == false)
        LDR.N    R0,??Quadrotor_pid_21+0x40
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??Quadrotor_pid_56
//  618        {
//  619           writeDataToMemory(TEST1, TEST2, TEST3);
        LDR.N    R0,??Quadrotor_pid_21+0x120
        LDR      R2,[R0, #+0]
        LDR.N    R0,??Quadrotor_pid_21+0x124
        LDR      R1,[R0, #+0]
        LDR.N    R0,??Quadrotor_pid_21+0x128
        LDR      R0,[R0, #+0]
        BL       writeDataToMemory
//  620        }
//  621     
//  622     //Q_x, Q_y, Q_z,Èý¸ö×ËÌ¬½Ç=====SumDeltX, SumDeltY, heightÎªÏà¶Ô×ø±ê
//  623 }
??Quadrotor_pid_56:
        ADD      SP,SP,#+36
        POP      {R4-R11,PC}      ;; return
        Nop      
        DATA
??Quadrotor_pid_21:
        DC32     signal_target
        DC32     steerFlag
        DC32     PWM_Y
        DC32     PWM_X
        DC32     re_X
        DC32     re_Y
        DC32     0x407c2000
        DC32     err_angX
        DC32     0x407d7000
        DC32     err_angY
        DC32     pre_err_angX
        DC32     pre_err_angY
        DC32     0x4092c000
        DC32     0xeb851eb8
        DC32     0x3fbeb851
        DC32     camflag
        DC32     startMotion
        DC32     des_PointX
        DC32     des_PointY
        DC32     errX
        DC32     errY
        DC32     theta
        DC32     0x40240000
        DC32     0x3fb99999
        DC32     0x41c80000
        DC32     0x41c80001
        DC32     ??des_x
        DC32     ??des_y
        DC32     _flag_
        DC32     SumDeltX
        DC32     preposx
        DC32     0x3fe99999
        DC32     SumDeltY
        DC32     preposy
        DC32     Axis_x
        DC32     Axis_y
        DC32     ??target_x
        DC32     ??dot_targetx
        DC32     ??target_y
        DC32     ??dot_targety
        DC32     ??last_dotx
        DC32     ??last_doty
        DC32     ??sum_axisx
        DC32     ??sum_axisy
        DC32     ??lastErrX
        DC32     ??lastErrY
        DC32     0x3fd33333
        DC32     ??lastdotErrX
        DC32     0x3fe66666
        DC32     ??lastdotErrY
        DC32     ??sumErrX
        DC32     ??sumErrY
        DC32     Kx
        DC32     Kix
        DC32     Kdx
        DC32     kvx
        DC32     ??W_Axis_1
        DC32     Ky
        DC32     Kiy
        DC32     Kdy
        DC32     kvy
        DC32     ??W_Axis_2
        DC32     ??W_Axis_3
        DC32     ??W_Axis_4
        DC32     ??w1
        DC32     ??w2
        DC32     ??w3
        DC32     ??w4
        DC32     ??last_w1
        DC32     ??last_w2
        DC32     ??last_w3
        DC32     ??last_w4
        DC32     TEST3
        DC32     TEST2
        DC32     TEST1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??w1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??w2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??w3:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??w4:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??last_w1:
        DATA
        DC32 1000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??last_w2:
        DATA
        DC32 1000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??last_w3:
        DATA
        DC32 1000

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??last_w4:
        DATA
        DC32 1000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??des_pitch:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??des_roll:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??des_yaw:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??pre_err_pitch:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??pre_err_roll:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??pre_err_yaw:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??pre_err_high:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
??sum_err_pitch:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
??sum_err_roll:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
??sum_err_yaw:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
??sum_err_high:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??count:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
??des_high:
        DATA
        DC32 42480000H

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??K:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??high_f:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??W_Axis_1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??W_Axis_2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??W_Axis_3:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??W_Axis_4:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??k_high:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??lastErrX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??lastErrY:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
??sumErrX:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
??sumErrY:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
??sum_axisx:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
??sum_axisy:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??target_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??target_y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??dot_targetx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??dot_targety:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??des_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??des_y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??last_dotx:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??last_doty:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??lastdotErrX:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??lastdotErrY:
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
//  624 
// 
// 72 316 bytes in section .bss
//    139 bytes in section .data
//  5 364 bytes in section .text
// 
//  5 364 bytes of CODE memory
// 72 455 bytes of DATA memory
//
//Errors: none
//Warnings: 12
