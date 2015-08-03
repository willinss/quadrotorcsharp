/*
 * ����Ӳ��ƽ̨:LPLD_K60 Card
 * ��Ȩ����:�����������µ��Ӽ������޹�˾
 * ��������:http://laplenden.taobao.com
 * ��˾�Ż�:http://www.lpld.cn
 *
 * �ļ���: HAL_GPIO.c
 * ��;: GPIO�ײ�ģ����غ���
 * ����޸�����: 20120321
 *
 * ������ʹ��Э��:
 *  ��������������ʹ���߿���Դ���룬�����߿��������޸�Դ���롣�����μ�����ע��Ӧ
 *  ���Ա��������ø��Ļ�ɾ��ԭ��Ȩ���������������ο����߿��Լ�ע���ΰ�Ȩ�����ߣ�
 *  ��Ӧ�����ش�Э��Ļ����ϣ�����Դ���롢���ó��۴��뱾��
 */
/*
 *******���õ�GPIO�жϣ�����isr.h��ճ��һ�´���:*********

//GPIOģ���жϷ�����
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
//���º�����LPLD_Kinetis�ײ���������޸�
extern void LPLD_GPIO_Isr(void);

 ***********************�������*************************
*/

#include "common.h"
#include "HAL_GPIO.h"


//�û��Զ����жϷ���������
GPIO_ISR_CALLBACK GPIO_ISR[5];

/*
 * LPLD_GPIO_Init
 * GPIOͨ�ó�ʼ������
 * 
 * ����:
 *    port--�˿ڻ���ַ
 *      |__PORTA_BASE_PTR--Port A
 *      |__PORTB_BASE_PTR--Port B
 *      |__PORTC_BASE_PTR--Port C
 *      |__PORTD_BASE_PTR--Port D
 *      |__PORTE_BASE_PTR--Port E
 *    port_bit--�˿�λ��
 *      |__0~31
 *    dir--�˿����ݷ���
 *      |__1--���
 *      |__0--����
 *    data--�����ʼ��ƽ/��������������
 *      |__2--���dir=0,�����ڲ�����
 *      |__1--���dir=0,�����ڲ�����; ���dir=1,����ߵ�ƽ
 *      |__0--���dir=0,���벻ʹ��������; ���dir=1,����͵�ƽ
 *    irqc--�����ж�
 *      |__0--��ʹ���ж�
 *      |__����--�������ĵ� PORTx_PCRn�Ĵ��� IRQCλ���� 1001���� 1010�½� 1011�����½�
 *
 * ���:
 *    0--���ô���
 *    1--���óɹ�
 */
uint8_t LPLD_GPIO_Init(PORT_MemMapPtr port, uint8_t port_bit, uint8_t dir, uint8_t data, uint8_t irqc)
{
  GPIO_MemMapPtr p;
  //�ж϶˿�λ��������
  if(port_bit>31)
    return 0;
  
  //ѡ��IO��ʱ�ӿ�������
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
  //����ΪGPIO����
  PORT_PCR_REG(port, port_bit) = PORT_PCR_MUX(1);
  //������������
  if(dir==1)
  {
    GPIO_PDDR_REG(p) |= 0x1u<<port_bit;
    //���ó�ʼ���
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
    //�����жϷ�ʽ
    if(irqc>0xC) return 0;
    PORT_PCR_REG(port, port_bit) |= PORT_PCR_IRQC(irqc); 
    //�����ڲ�������������ʹ��
    if(data==1)
    {
      //����
      PORT_PCR_REG(port, port_bit) |= PORT_PCR_PE_MASK | PORT_PCR_PS_MASK ; 
    }
    else if(data==2)
    {
      //����
      PORT_PCR_REG(port, port_bit) |= PORT_PCR_PE_MASK ; 
    }
    else
    {
      //��ʹ��������
      PORT_PCR_REG(port, port_bit) &= ~PORT_PCR_PE_MASK ; 
    }
  }
  
  return 1;
}

/*
 * LPLD_GPIO_SetIsr
 * ����GPIOͨ���û�������жϷ�����
 * 
 * ����:
 *    port--�˿ڻ���ַ
 *      |__PORTA_BASE_PTR--Port A
 *      |__PORTB_BASE_PTR--Port B
 *      |__PORTC_BASE_PTR--Port C
 *      |__PORTD_BASE_PTR--Port D
 *      |__PORTE_BASE_PTR--Port E
 *    isr_func--�û��жϳ�����ڵ�ַ
 *      |__�û��ڹ����ļ��¶�����жϺ���������������Ϊ:�޷���ֵ,�޲���(eg. void isr(void);)
 *
 * ���:
 *    0--���ô���
 *    1--���óɹ�
 *
 */
uint8_t LPLD_GPIO_SetIsr(PORT_MemMapPtr port, GPIO_ISR_CALLBACK isr_func)
{
  //ѡ��IO��
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
 * ����GPIO�˿�0~31λ���
 * 
 * ����:
 *    p--GPIO�ڻ���ַ
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    data--�������
 *      |__0x00000000~0xFFFFFFFF--�͵��ߴ���GPIO�ڵĵ�0~31λ����
 *
 * ���:
 *
 */
void LPLD_GPIO_Set(GPIO_MemMapPtr p, uint32_t data)
{ 
  GPIO_PDOR_REG(p) = data;
}

/*
 * LPLD_GPIO_Set_b
 * ����GPIO�˿�һλ�����
 * 
 * ����:
 *    p--GPIO�ڻ���ַ
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    port_bit--λ��
 *      |__0~31--GPIO�ڵĵ�0~31λ
 *    data--�������
 *      |__0~1--λ����߻�͵�ƽ
 *
 * ���:
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
 * ����GPIO�˿�0~31�ĵ�ƽ��ת
 * 
 * ����:
 *    p--GPIO�ڻ���ַ
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    data--��ת����
 *      |__0x00000000~0xFFFFFFFF--�͵��ߴ���GPIO�ڵĵ�0~31λ�ķ�ת��1Ϊ��ת��0Ϊ���ֲ��䡣
 *
 * ���:
 *
 */
void LPLD_GPIO_Toggle(GPIO_MemMapPtr p, uint32_t data)
{
  GPIO_PTOR_REG(p) = data;
}

/*
 * LPLD_GPIO_Toggle_b
 * ����GPIO�˿�һλ�ķ�ת
 * 
 * ����:
 *    p--GPIO�ڻ���ַ
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    port_bit--λ��
 *      |__0~31--����GPIO�ڵ�һλ��ת
 *
 * ���:
 *
 */
void LPLD_GPIO_Toggle_b(GPIO_MemMapPtr p, uint8_t port_bit)
{
  GPIO_PTOR_REG(p) = 0x1u<<port_bit;
}

/*
 * LPLD_GPIO_Get
 * ȡ��GPIO�ڵ�����
 * 
 * ����:
 *    p--GPIO�ڻ���ַ
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *
 * ���:
 *    ָ��GPIO�ڵ�32λ����
 *
 */
uint32_t LPLD_GPIO_Get(GPIO_MemMapPtr p)
{
  return GPIO_PDIR_REG(p);
}

/*
 * LPLD_GPIO_Get_b
 * ȡ��GPIO��ĳһλ������
 * 
 * ����:
 *    p--GPIO�ڻ���ַ
 *      |__PTA_BASE_PTR--Port A
 *      |__PTB_BASE_PTR--Port B
 *      |__PTC_BASE_PTR--Port C
 *      |__PTD_BASE_PTR--Port D
 *      |__PTE_BASE_PTR--Port E
 *    port_bit--λ��
 *      |__0~31--GPIO�ڵĵ�0~31λ
 *
 * ���:
 *    ָ��GPIO�ڵ�ָ��λ���ĵ�ƽ
 *
 */
uint8_t LPLD_GPIO_Get_b(GPIO_MemMapPtr p, uint8_t port_bit)
{
  return (GPIO_PDIR_REG(p)>>port_bit)&0x1u;
}

/*
 * LPLD_GPIO_Isr
 * GPIOͨ���жϵײ���ں���
 * 
 * �û������޸ģ������Զ������Ӧͨ���жϺ���
 */
void LPLD_GPIO_Isr(void)
{
  #define GPIO_VECTORNUM   (*(volatile uint8_t*)(0xE000ED04))
  uint8_t gpio_port = GPIO_VECTORNUM - 103;
    
  //�����û��Զ����жϷ���
  GPIO_ISR[gpio_port]();  
  
  //����жϱ�־λ
  PORT_ISFR_REG((PORT_MemMapPtr)((0x40049+gpio_port)<<12))=0xFFFFFFFF;
}