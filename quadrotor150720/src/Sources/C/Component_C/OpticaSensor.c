#include"OpticalSensor.h"

#define SOUT_0  hw_gpio_set(PORT_E, 3, 0)
#define SOUT_1  hw_gpio_set(PORT_E, 3, 1)

#define SCLK_0  hw_gpio_set(PORT_E, 1, 0)
#define SCLK_1  hw_gpio_set(PORT_E, 1, 1)

#define SIN     hw_gpio_get(PORT_D, 3)


#define NCS_0  hw_gpio_set(PORT_D, 2, 0)
#define NCS_1  hw_gpio_set(PORT_D, 2, 1)

void AnalogSPI(void)
{
    hw_gpio_init(PORT_E, 3, 1, 1);       //PTE1 SOUT
    hw_gpio_init(PORT_E, 1, 1, 1);       //PTE2  SCLK
    hw_gpio_init(PORT_D, 3, 0, 1);       //PTE3  SIN
    hw_gpio_init(PORT_D, 2, 1, 1) ;      //PTE4   NCS
}
void Sensor_Start(void)
{
    SCLK_1;
    NCS_0;
}
void Sensor_End(void)
{
    NCS_1;//关闭总线
}


void Write_Address(uint8 addr, uint8 option)
{
    uint8 i, k;
    if(option == Write)addr |= 0x80;
    Sensor_Start();
    k = 0x80; //从高位地址开始传送
    for(i = 0; i < 8; i++)
    {
        SCLK_0;
        if(addr & k)    SOUT_1;
        else    SOUT_0;
        asm("nop");
        asm("nop");
        asm("nop");
        SCLK_1;
        k >>= 1;
        asm("nop");
        asm("nop");
        asm("nop");
    }
}


void Write_Data(uint8 temp)
{
    uint8 i, k;
    k = 0x80; //从高位地址开始传送
    for(i = 0; i < 8; i++)
    {
        SCLK_0;
        if(temp & k)    SOUT_1;
        else    SOUT_0;
        asm("nop");
        asm("nop");
        asm("nop");
        SCLK_1;
        k >>= 1;
        asm("nop");
        asm("nop");
        asm("nop");
    }

    Delay_ms(0.06);       //延时60us以上确保写操作完成
    Sensor_End();
}

uint8 Read_Sensor_Byte(void)
{
    uint8 i, dat;
    for(i = 0; i < 8; i++)
    {
        SCLK_0;
        dat <<= 1;
        asm("nop");
        asm("nop");
        asm("nop");
        SCLK_1;
        if(SIN) dat++;     //先读高位数据
        asm("nop");
        asm("nop");
        asm("nop");
    }
    Sensor_End();
    return(dat);
}
void reset(void)
{
    hw_gpio_set(PORT_A, 17, 1);
    Delay_ms(1);
    hw_gpio_set(PORT_A, 17, 0);
}

uint8 ReadByte(uint8 Addr)
{
    uint8 dat;
    Write_Address(Addr, Read);
    Delay_ms(0.08);
    dat = Read_Sensor_Byte();
    return dat;
}

void WriteByte(uint8 Addr, uint8 Dat)
{
    Write_Address(Addr, Write);
    Delay_ms(0.08);
    Write_Data(Dat);
}
 uint8 data[30][30];
void print_pixel_data()
{
    int16 i,j;
    //bool isFirstPixel = true;
    uint8 regValue;
    uint8 pixelValue;
    
    // write to frame capture register to force capture of frame
    WriteByte(ADNS3080_FRAME_CAPTURE,0x83);

    // wait 3 frame periods + 10 nanoseconds for frame to be captured
    // min frame speed is 2000 frames/second so 1 frame = 500 nano seconds.
    // so 500 x 3 + 10 = 1510
    Delay_ms(2);

    // display the pixel data
    for( i=0; i<ADNS3080_PIXELS_Y; i++ ) {
        for( j=0; j<ADNS3080_PIXELS_X; j++ ) {
          //  regValue = read_register(ADNS3080_FRAME_CAPTURE);
         data[i][j] =   ReadByte(ADNS3080_FRAME_CAPTURE);
        regValue =  data[i][j];
         pixelValue = ( regValue << 2 );
         uart_send1(UART0,pixelValue);
        }

    }

    // hardware reset to restore sensor to normal operation
    reset();
}

uint8 InitOpticalFlowSensor(void)
{
  uint8 Id = 0;
  uint8 TEMP = 0;
  Id = ReadByte(0x00);
  if(Id == 0x17)
  {
    TEMP = ReadByte(0x0A);
    TEMP |= 0X10;
    WriteByte(0x0A,TEMP);
    Delay_ms(1);
    WriteByte(0x12,0x00); //Motion clear
    return 1;
  }
  else return 0;

}