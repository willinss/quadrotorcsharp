//-------------------------------------------------------------------------*
//文件名: includes.h                                                       *
//说  明: 总头文件,本文件包含:                                             *
//        主函数(main)文件中用到的头文件、外部函数声明及有关常量命名       *
//-------------------------------------------------------------------------*
#ifndef INCLUDE_H_
#define INCLUDE_H_

    //1 头文件
    //1.1通用头文件
    #include "common.h"            //通用函数头文件
            
    //1.2包含面向硬件对象头文件(即构件模块)       
    #include  "light.h"                  //小灯构件头文件
    #include  "uart.h"                   //串口构件头文件
    #include  "ftm.h"                   //PWM头文件
    #include  "pit.h"                     //PIT定时器头文件
    #include  "ppl.h"                     //锁相环头文件
    #include  "hw_i2c.h"                //i2c总线
    #include  "get_data.h"
    #include  "sysinit.h"               //系统初始化
    #include  "hw_gpio.h"               //底层IO口
    #include  "isr.h"                   //中断服务程序
    #include "Balance_Kalman.h"         //卡尔曼滤波用于陀螺仪加速度计磁力计的角度计算
    #include  "control.h"               //控制
    #include "queue.h"
    #include "HAL_GPIO.h"
    //#include "MadgwickAHRS.h"
    #include "MahonyAHRS.h"            //陀螺仪加速度计的姿态算法??
    #include "function.h"
#include"OpticalSensor.h"              //光流传感器
#include "stdbool.h"
#include "math.h "
#endif
