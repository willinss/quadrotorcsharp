#include "function.h"

uint8 floatToByte[4];
bool  SendToGUI_Flag = true;
bool  Integral_high = false;
void SetIrqsPrio(void)
{
    set_irq_priority(47, 2);//���ڽ���
    set_irq_priority(68, 1);//PIT0�ж�
    set_irq_priority(91, 0);//���������
    //set_irq_priority(45, 3);//�߶Ƚ���
}

bool Initial(void)
{
    hw_gpio_init (PORT_A, 15, 1, 1);                 //PORTA15�����
    hw_gpio_init (PORT_C, 18, 1, 0);                 //������Trig
    hw_gpio_init (PORT_E, 6, 1, 0);
    hw_gpio_init (PORT_E, 2, 1, 1);
    hw_gpio_init (PORT_B, 3, 1, 0);
    hw_gpio_init (PORT_B, 10, 1, 0);
    hw_gpio_init (PORT_B, 16, 1, 0);
    hw_gpio_init (PORT_B, 21, 1, 1);                 //���������ƿ�
    hw_FTM_init();                                   //PWM��ʼ��
    SteerPWM_init();                                 //��̨��ʼ��
    hw_i2c_init(0);                                   //I2C0��ʼ��
    hw_i2c_init(1);
    uart_init (UART0, periph_clk_khz, 921600);          //����0������9600
    uart_init (UART1, periph_clk_khz, 57600);	     //ң�ش���1������9600
    enableuartreint(UART0, UART0irq);	            //����0�ж�ʹ��
    enableuartreint(UART1, UART1irq);		    //����1�ж�ʹ��
    hw_pit_init(0, (int)(periph_clk_khz * T));               //��ʼ��pit0������20ms
    hw_pit_init(1, 0XFFFFFFFF);               //��ʼ��pit0������20ms                     //��pit�ж�
    LED1_OFF;
    LED2_OFF;
    LED3_OFF;
    AnalogSPI();
    //Init_BMP085();
    //Init_HMC5883L();//������
    InitBMA180();//���ٶȼ�
    InitMPU3205();//������
    InitMPUsteer(); 
    InitBMAsteer();
    LED2_ON;
    while(!InitOpticalFlowSensor());
    LED3_ON;
    //Init_L3G4200D();
    //Init_ADXL345();
    LPLD_GPIO_Init(PORTE, 5, 0, 1, 11);              //e0 �½��ж�
    LPLD_GPIO_SetIsr(PORTE, PORTE_isr);
    enable_irq(107);
    SetIrqsPrio();
    return true;
}

bool CheckHeightSensor(void)
{
    for(uint16 i = 0; i < 1000; i++ )
    {
        static uint8 temp = 0;

        Trig_ON;
        Delay_10us();
        Trig_OFF;
        Delay_ms(30);
        if( Height_update == true)
        {
            Height_update = false;
            BaseHeight = (BaseHeight + Height) / 2;
            temp++;
        }
        if(temp >= 10)
        {
          lastHeight = BaseHeight  ;
          preHeight = BaseHeight ;
          break;
        }
    }

    while(BaseHeight < 2 || BaseHeight > 20)
    {
        LED1_Change;
        LED2_Change;
        LED3_Change;
        Delay_ms(30);
    }

    return true;
}

void FloatToByte(float floatNum, unsigned char *byteArry)
{
    char *pchar = (char *)&floatNum;
    for(int i = 0; i < sizeof(float); i++)
    {
        *byteArry = *pchar;
        pchar++;
        byteArry++;
    }
}
void Int32ToByte(int32 intNum,unsigned char *byteArry)
{
  char *pchar = (char *)&intNum;
    for(int i = 0; i < sizeof(int32); i++)
    {
        *byteArry = *pchar;
        pchar++;
        byteArry++;
    }

}

void SendFloat(float floatNum,UART_MemMapPtr uartch)
{
    char *pchar = (char *)&floatNum;
    for(int m = 0; m < sizeof(float); m++)
    {
        uart_send1 (uartch, *pchar);
        pchar++;
    }
}

void SendInt32(int32 intNum,UART_MemMapPtr uartch)
{
    uint8 *pchar = (uint8 *)&intNum;

    for(int m = 0; m < sizeof(int32); m++)
    {
        uart_send1 (uartch, *pchar);//*pchar);
        pchar++;
    }

}


void SendStopToGUI(void)
{
    uint8 sendtemp = 0;
    Delay_ms(200);
    for(sendtemp = 0; sendtemp < 10; sendtemp++)
    {
        uart_send1 (UART1, 0x70);
        sendtemp++;
        Delay_ms(20);
        LED_Change;
    }
    SendToGUI_Flag = false;
}


float High_update(void)
{
    float high = 0;
    static float h;
    
    if(Height_update == true)
    { 
        Integral_high = true;
        Height_update = false;       
        h =  median(data_high, 7, (float)Height);
//           if(ph <= &wh[5999])
//           {
//             *ph = Height;
//              ph++;
//           }    
    }
   
    high =  kalman_filter1(h);
    if(high >= 180)Landing = true;
    return high;
}

void SendDataToGUI(void)
{

    Send_flag = false;
    int data_length = 0;
    Delay_ms(200);
    data_length = dataLencounter;
    if(data_length > DataLength)data_length = DataLength;
    //////////////////////�������ݳ���///////////////////////////////////////////////
    SendFloat((float)data_length,UART0);
    Delay_ms(120);
    LED_Change;
    //////////////////////����X����λ��//////////////////////////////////////////////
    for(int i = 0;i < data_length;i++)
    {
      //SendInt32(wx[i],UART0);
      SendFloat(wx[i],UART0);
      if(i % 103 == 0)
      {
      //  Delay_ms(110);
        LED_Change;
      }
    }
    //////////////////////����Y����λ��//////////////////////////////////////////////
    for(int i = 0;i < data_length;i++)
    {
      //SendInt32(wx[i],UART0);
      SendFloat(wy[i],UART0);
      if(i % 103 == 0)
      {
      //  Delay_ms(110);
        LED_Change;
      }
    }
    //////////////////////���͸߶�H/////////////////////////////////////////////////
    for(int i = 0;i < data_length;i++)
    {
      //SendInt32(wx[i],UART0);
      SendFloat(wz[i],UART0);
      if(i % 103 == 0)
      {
      //  Delay_ms(110);
        LED_Change;
      }
    }

}