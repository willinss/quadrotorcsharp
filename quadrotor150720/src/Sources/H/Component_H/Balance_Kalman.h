#ifndef __BALANCE_KALMAN_H__
#define __BALANCE_KALMAN_H__

extern float angle, angle_dot; 		//�ⲿ��Ҫ���õı���
extern float angle1, angle_dot1; 		//�ⲿ��Ҫ���õı���
extern float Kalman_Filter(float angle_m,float gyro_m);
extern float kalman_update(float gyroscope_rate, float accelerometer_angle) ;
extern float Kalman_Filter1(float angle_m1,float gyro_m1);

/***********************************************��������*****************************************************
* ��������: float Kalman_filter3(float) 
* �������: float 
* ���ز���: float  
* ��    ��: kalman filter  
* ��    ��: by yuson
* ��    ��: 2012-5-12
************************************************************************************************************/ 
float kalman_filter1(float);
float kalman_filter2(float);
float kalman_filter3(float);
float kalman_filter4(float);
#endif 