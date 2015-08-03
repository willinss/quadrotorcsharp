
#ifndef __ISR_H__
#define __ISR__
#include "stdbool.h"
#include "common.h"
#define POWER_OFF  set_pwm(1000,1000,1000,1000)
#define COUNTER  1000      //数据初始化归零采集次数

#define FreeMode 0x6e
#define TraceMode 0x6c
#define Axis_First_Frame  0XF0
#define Axis_End_Frame    0XFF

#define Revise_First_Frame 0xF3
#define Revise_End_Frame   0xFA

#define LoacalK60Mod  0xee
#define UpperComputerMod 0xea


#define motionClear    0x00
#define motionForward  0x01
#define motionLeft     0x02
#define motionRight    0x03
#define motionBackward 0x04

extern uint8 motionState ;
extern uint32 Time_counter;
extern bool Pit_update;
extern uint16 Height;
extern bool Landing;
extern bool Start_flag ;
extern bool Stop_flag;
extern bool Backup_landing;
extern bool Height_update;
extern float revise_x;
extern float revise_y;
extern bool startMotion;
extern uint8 irq_counter ;
extern uint16 BaseHeight;
//extern int16 Pwm_h;
//extern uint8 Fix_high;
//extern uint16 Fix_h;
extern uint8 Clear;
extern float High;
extern void PORTE_isr(void);

extern float median(float *data, char length, float high);
extern float data_high[7];
extern float datas_mid[7];
extern double Axis_x ;
extern double Axis_y ;
extern bool  Axis_update;
extern bool Send_flag;
extern uint8 Fly_Mode ;
extern uint8 Debug_Mode;
extern float c_revise_x ;
extern float c_revise_y ;
extern float signal_x ;
extern float signal_y ;
extern bool signal_target;
extern bool send_data;
extern int targetlosetime;

extern int re_X;//舵机信号
extern int re_Y;
#endif 
