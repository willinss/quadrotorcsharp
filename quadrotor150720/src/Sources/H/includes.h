//-------------------------------------------------------------------------*
//�ļ���: includes.h                                                       *
//˵  ��: ��ͷ�ļ�,���ļ�����:                                             *
//        ������(main)�ļ����õ���ͷ�ļ����ⲿ�����������йس�������       *
//-------------------------------------------------------------------------*
#ifndef INCLUDE_H_
#define INCLUDE_H_

    //1 ͷ�ļ�
    //1.1ͨ��ͷ�ļ�
    #include "common.h"            //ͨ�ú���ͷ�ļ�
            
    //1.2��������Ӳ������ͷ�ļ�(������ģ��)       
    #include  "light.h"                  //С�ƹ���ͷ�ļ�
    #include  "uart.h"                   //���ڹ���ͷ�ļ�
    #include  "ftm.h"                   //PWMͷ�ļ�
    #include  "pit.h"                     //PIT��ʱ��ͷ�ļ�
    #include  "ppl.h"                     //���໷ͷ�ļ�
    #include  "hw_i2c.h"                //i2c����
    #include  "get_data.h"
    #include  "sysinit.h"               //ϵͳ��ʼ��
    #include  "hw_gpio.h"               //�ײ�IO��
    #include  "isr.h"                   //�жϷ������
    #include "Balance_Kalman.h"         //�������˲����������Ǽ��ٶȼƴ����ƵĽǶȼ���
    #include  "control.h"               //����
    #include "queue.h"
    #include "HAL_GPIO.h"
    //#include "MadgwickAHRS.h"
    #include "MahonyAHRS.h"            //�����Ǽ��ٶȼƵ���̬�㷨??
    #include "function.h"
#include"OpticalSensor.h"              //����������
#include "stdbool.h"
#include "math.h "
#endif
