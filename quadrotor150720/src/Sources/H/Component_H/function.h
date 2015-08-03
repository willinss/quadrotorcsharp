#ifndef __FUNCTION_H__
#define __FUNCTION__
#include "stdbool.h"
#include "common.h"
#include "includes.h"

#define LED_OFF    hw_gpio_set(PORT_A,15,1)
#define LED_ON     hw_gpio_set(PORT_A,15,0)
#define LED_Change hw_gpio_reverse(PORT_A, 15)
#define Trig_ON    hw_gpio_set(PORT_C, 18, 1)
#define Trig_OFF   hw_gpio_set(PORT_C, 18, 0)
#define cLED_OFF   hw_gpio_set(PORT_E,2,0)
#define cLED_ON    hw_gpio_set(PORT_E,2,1)
#define Buzzer_ON  hw_gpio_set(PORT_B,21,0)
#define Buzzer_OFF hw_gpio_set(PORT_B,21,1)
#define LED1_ON    hw_gpio_set(PORT_B,3,0)
#define LED1_OFF   hw_gpio_set(PORT_B,3,1)
#define LED1_Change hw_gpio_reverse(PORT_B, 3)
#define LED2_ON    hw_gpio_set(PORT_B,10,0)
#define LED2_OFF   hw_gpio_set(PORT_B,10,1)
#define LED2_Change hw_gpio_reverse(PORT_B, 10)
#define LED3_ON    hw_gpio_set(PORT_B,16,0)
#define LED3_OFF   hw_gpio_set(PORT_B,16,1)
#define LED3_Change hw_gpio_reverse(PORT_B, 16)
extern bool  SendToGUI_Flag;
extern bool Integral_high;
extern bool Initial(void);
extern bool CheckHeightSensor(void);
extern void SetIrqsPrio();
extern void FloatToByte(float floatNum, unsigned char *byteArry);
extern void SendFloat(float floatNum,UART_MemMapPtr uartch);
extern void Senddata();
extern void SendStopToGUI(void);
extern float High_update(void);
extern void SendDataToGUI(void);
extern void SendInt32(int32 intNum,UART_MemMapPtr uartch);
#endif 
