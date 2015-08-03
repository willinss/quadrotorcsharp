//==============================================================================
//文件名称：
//功能概要：
//==============================================================================

#ifndef CONTROL_H_
#define CONTROL_H_

//1头文件
#include "common.h"
#include "isr.h"
#include "ftm.h"                        //定时器，控制PWM
#include "get_data.h"
#include "stdio.h"   
#include "queue.h"
#include "Balance_Kalman.h"
#include "function.h"

//2宏定义
#define DataLength 6000

//2.1全局变量声明
extern uint16 BASE_VALUE ;
extern  float wx[DataLength];
extern  float wy[DataLength];
extern  float wz[DataLength];
//extern  float Posx[DataLength];
//extern  float Posy[DataLength];
extern float *px ;
extern float *py;
extern float *pz;
//extern float *posx;
//extern float *posy ;
extern int dataLencounter ;
extern float lastHeight ;
extern float preHeight ;
//extern  float *px;
//extern  float *py;
//extern  float *pz;
//extern  float *ph;

//extern float  wa[4000];
//extern float  wb[4000];
//extern float  wc[4000];

extern float Kp1  ; //垂直控制
extern float Kp2   ; //滚转控制y
extern float Kp3   ; //俯仰控制x
extern float Kp4    ; //偏航控制

extern float Kd1   ;    //垂直控制
extern float Kd2    ;    //滚转控制
extern float Kd3    ;    //俯仰控制
extern float Kd4    ;    //偏航控制

extern float Ki1    ;
extern float Ki2    ;
extern float Ki3    ;
extern float Ki4   ;

extern float Kx   ;
extern float Ky   ;

extern float Kix   ;
extern float Kiy   ;

extern float Kdx   ;
extern float Kdy   ;

//extern float Xs,Ys,Zs;
extern float image_distance;
extern float revise_X,revise_Y;
extern float cx,cy,cz,sx,sy,sz;
extern  float PointX,PointY;
extern  float RE_X,RE_Y;
extern  float prePointX,prePointY;
extern bool send_data;

//extern float AX,AY,AZ;

extern void Quadrotor_pid(float angle_X, float angle_Y, float angle_Z, float height,float PointX,float PointY ,float angle_X0,float angle_Y0,float angle_Z0);

#endif 