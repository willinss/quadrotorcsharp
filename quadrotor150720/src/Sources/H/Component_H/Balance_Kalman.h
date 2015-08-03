#ifndef __BALANCE_KALMAN_H__
#define __BALANCE_KALMAN_H__

extern float angle, angle_dot; 		//外部需要引用的变量
extern float angle1, angle_dot1; 		//外部需要引用的变量
extern float Kalman_Filter(float angle_m,float gyro_m);
extern float kalman_update(float gyroscope_rate, float accelerometer_angle) ;
extern float Kalman_Filter1(float angle_m1,float gyro_m1);

/***********************************************函数声明*****************************************************
* 函数名称: float Kalman_filter3(float) 
* 输入参数: float 
* 返回参数: float  
* 功    能: kalman filter  
* 作    者: by yuson
* 日    期: 2012-5-12
************************************************************************************************************/ 
float kalman_filter1(float);
float kalman_filter2(float);
float kalman_filter3(float);
float kalman_filter4(float);
#endif 