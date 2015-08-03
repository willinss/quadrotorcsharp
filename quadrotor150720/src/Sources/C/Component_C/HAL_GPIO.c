/*
 * 测试硬件平台:LPLD_K60 Card
 * 版权所有:北京拉普兰德电子技术有限公司
 * 网络销售:http://laplenden.taobao.com
 * 公司门户:http://www.lpld.cn
 *
 * 文件名: HAL_GPIO.c
 * 用途: GPIO底层模块相关函数
 * 最后修改日期: 20120321
 *
 * 开发者使用协议:
 *  本代码面向所有使用者开放源代码，开发者可以随意修改源代码。但本段及以上注释应
 *  予以保留，不得更改或删除原版权所有者姓名。二次开发者可以加注二次版权所有者，
 *  但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
 */
/*
 *******需用到GPIO中断，请在isr.h中粘贴一下代码:*********

//GPIO模块中断服务定义
#undef  VECTOR_103
#define VECTOR_103 LPLD_GPIO_Isr
#undef  VECTOR_104
#define VECTOR_104 LPLD_GPIO_Isr
#undef  VECTOR_105
#define VECTOR_105 LPLD_GPIO_Isr
#undef  VECTOR_106
#define VECTOR_106 LPLD_GPIO_Isr
#undef  VECTOR_107
#define VECTOR_107 LPLD_GPIO_Isr
//以下函数在LPLD_Kinetis底层包，不必修改
extern void LPLD_GPIO_Isr(void);

 ***********************代码结束*************************
*/

#include "common.h"
#include "HAL_GPIO.h"


//用户自定义中断服务函数数组
GPIO_ISR_CALLBACK GPIO_ISR[5];

/*
 * LPLD_GPIO_Init
 * GPIO通用初始化函数
 * 
 * 参数:
 *    port--端口基地址
 *      |__PORTA_BASE_PTR--Port A
 *      |__PORTB_BASE_PTR--Port B
 *      |__PORTC_BASE_PTR--Port C
 *      |__PORTD_BASE_PTR--Port D
 *      |__PORTE_BASE_PTR--Port E
 *    port_bit--端口位数
 *      |__0~31
 *    dir--端口数据方向
 *      |__1--输出
 *      |__0--输入
 *    data--输出初始电平/输入上拉或下拉
 *      |__2--如果dir=0,输入内部下拉
 *      |__1--如果dir=0,输入内部上拉; 如果dir=1,输出高电平
 *      |__0--如果dir=0,输入不使能上下拉; 如果dir=1,输出低电平
 *    irqc--输入中断
 *      |__0--不使能中断
 *      |__其他--见技术文档 PORTx_PCRn寄存器 IRQC位描述 1001上升 1010下降 1011上升下降
 *
 * 输出:
 *    0--配置错误
 *    1--配置成功
 */
uint8_t LPLD_GPIO_Init(PORT_MemMapPtr port, uint8_t port_bit, uint8_t dir, uint8_t data, uint8_t irqc)
{
  GPIO_MemMapPtr p;
  //判断端口位数合理性
  if(port_bit>31)
    return 0;
  
  //选择IO口时钟控制掩码
  if(port == PORTA_BASE_PTR)
  {
    p = PTA_BASE_PTR; 
    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK; 
  }
  else if(port == PORTB_BASE_PTR)
  {
    p = PTB_BASE_PTR; 
    SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK; 
  }
  else if(port == PORTC_BASE_PTR)
  {
    p = PTC_BASE_PTR; 
    SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK; 
  }
  else if(port == PORTD_BASE_PTR)
  {
    p = PTD_BASE_PTR; 
    SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK; 
  }
  else if(port == PORTE_BASE_PTR)
  {
    p = PTE_BASE_PTR; 
    SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK; 
  }
  else
  {
    return 0;
  }
  //配置为GPIO功能
  PORT_PCR_REG(port, port_bit) = PORT_PCR_MUX(1);
  //输入或输出设置
  if(dir==1)
  {
    GPIO_PDDR_REG(p) |= 0x1u<<port_bit;
    //设置初始输出
    if(data==1)
    {
      GPIO_PSOR_REG(p) = 0x1u<<port_bit; 
    }
    else
    {
      GPIO_PCOR_REG(p) = 0x1u<<port_bit;  
    }
  }
  else
  { 
    GPIO_PDDR_REG(p) &= ~(0x1u<<port_bit);
    //配置中断方式
    if(irqc>0xC) return 0;
    PORT_PCR_REG(port, port_bit) |= PORT_PCR_IRQC(irqc); 
    //配置内部上拉或下拉或不使能
    if(data==1)
    {
      //上拉
      PORT_PCR_REG(port, port_bit) |= PORT_PCR_PE_MASK | PORT_PCR_PS_MASK ; 
    }
    else if(data==2)
    {
      //下拉
      PORT_PCR_REG(port, port_bit) |= PORT_PCR_PE_MASK ; 
    }
    else
    {
      //不使能上下拉
      PORT_PCR_REG(port, port_bit) &= ~PORT_PCR_PE_MASK ; 
    }
  }
  
  return 1;
}

/*
 * LPLD_GPIO_SetIsr
 * 设置GPIO通道用户定义的中断服务函数
 * 
 * 参数:
 *    port--端口基地址
 *      |__PORTA_BASE_PTR--Port A
 *      |__PORTB_BASE_PTR--Port B
 *      |__PORTC_BASE_PTR--Port C
 *      |__PORTD_BASE_PTR--Port D
 *      |__PORTE_BASE_PTR--Port E
 *    isr_func--用户中断程序入口地址
 *      |__用户在工程文件下定义的中断函数名，函数必须为:无返回值,无参数(eg. void isr(void);)
 *
 * 输出:
 *    0--配置错误
 *    1--配置成功
 *
 */
uint8_t LPLD_GPIO_SetIsr(PORT_MemMapPtr port, GPIO_ISR_CALLBACK isr_func)
{
  //选择IO口
  if(port == PORTA_BASE_PTR)
  {
    GPIO_ISR[0] = isr_func;
    return 1;
  }
  else if(port == PORTB_BASE_PTR)
  {
    GPIO_ISR[1] = isr_func;
    return 1;
  }
  else if(port == PORTC_BASE_PTR)
  {
    GPIO_ISR[2] = isr_func;
    return 1;
  }
  else if(port == PORTD_BASE_PTR)
  {
    GPIO_ISR[3] = isr_func;
    return 1;
  }
  else if(port == PORTE_BASE_PTR)
  {
    GPIO_ISR[4] = isr_func;
    return 1;
  }
  else
  {
    return 0;
  }
}

/*
 * LPLD_GPIO_Set
 * 设置GPIO端口0~31位输出
 * 
 * 参数:
 *    p--GPIO口基地址
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    data--输出数据
 *      |__0x00000000~0xFFFFFFFF--低到高代表GPIO口的第0~31位数据
 *
 * 输出:
 *
 */
void LPLD_GPIO_Set(GPIO_MemMapPtr p, uint32_t data)
{ 
  GPIO_PDOR_REG(p) = data;
}

/*
 * LPLD_GPIO_Set_b
 * 设置GPIO端口一位的输出
 * 
 * 参数:
 *    p--GPIO口基地址
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    port_bit--位数
 *      |__0~31--GPIO口的第0~31位
 *    data--输出数据
 *      |__0~1--位输出高或低电平
 *
 * 输出:
 *
 */
void LPLD_GPIO_Set_b(GPIO_MemMapPtr p, uint8_t port_bit, uint8_t data)
{
  if(data==0)
    GPIO_PCOR_REG(p) = 0x1u<<port_bit;
  else
    GPIO_PSOR_REG(p) = 0x1u<<port_bit;
}

/*
 * LPLD_GPIO_Toggle
 * 设置GPIO端口0~31的电平翻转
 * 
 * 参数:
 *    p--GPIO口基地址
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    data--翻转数据
 *      |__0x00000000~0xFFFFFFFF--低到高代表GPIO口的第0~31位的翻转，1为反转，0为保持不变。
 *
 * 输出:
 *
 */
void LPLD_GPIO_Toggle(GPIO_MemMapPtr p, uint32_t data)
{
  GPIO_PTOR_REG(p) = data;
}

/*
 * LPLD_GPIO_Toggle_b
 * 设置GPIO端口一位的翻转
 * 
 * 参数:
 *    p--GPIO口基地址
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    port_bit--位数
 *      |__0~31--设置GPIO口的一位翻转
 *
 * 输出:
 *
 */
void LPLD_GPIO_Toggle_b(GPIO_MemMapPtr p, uint8_t port_bit)
{
  GPIO_PTOR_REG(p) = 0x1u<<port_bit;
}

/*
 * LPLD_GPIO_Get
 * 取得GPIO口的数据
 * 
 * 参数:
 *    p--GPIO口基地址
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *
 * 输出:
 *    指定GPIO口的32位输入
 *
 */
uint32_t LPLD_GPIO_Get(GPIO_MemMapPtr p)
{
  return GPIO_PDIR_REG(p);
}

/*
 * LPLD_GPIO_Get_b
 * 取得GPIO口某一位的数据
 * 
 * 参数:
 *    p--GPIO口基地址
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    port_bit--位数
 *      |__0~31--GPIO口的第0~31位
 *
 * 输出:
 *    指定GPIO口的指定位数的电平
 *
 */
uint8_t LPLD_GPIO_Get_b(GPIO_MemMapPtr p, uint8_t port_bit)
{
  return (GPIO_PDIR_REG(p)>>port_bit)&0x1u;
}

/*
 * LPLD_GPIO_Isr
 * GPIO通用中断底层入口函数
 * 
 * 用户无需修改，程序自动进入对应通道中断函数
 */
void LPLD_GPIO_Isr(void)
{
  #define GPIO_VECTORNUM   (*(volatile uint8_t*)(0xE000ED04))
  uint8_t gpio_port = GPIO_VECTORNUM - 103;
    
  //调用用户自定义中断服务
  GPIO_ISR[gpio_port]();  
  
  //清除中断标志位
  PORT_ISFR_REG((PORT_MemMapPtr)((0x40049+gpio_port)<<12))=0xFFFFFFFF;
}