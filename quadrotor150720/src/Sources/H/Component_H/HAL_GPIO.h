/*
 * ����Ӳ��ƽ̨:LPLD_K60 Card
 * ��Ȩ����:�����������µ��Ӽ������޹�˾
 * ��������:http://laplenden.taobao.com
 * ��˾�Ż�:http://www.lpld.cn
 *
 * �ļ���: HAL_GPIO.h
 * ��;: GPIO�ײ�ģ����غ���
 * ����޸�����: 20120321
 *
 * ������ʹ��Э��:
 *  ��������������ʹ���߿���Դ���룬�����߿��������޸�Դ���롣�����μ�����ע��Ӧ
 *  ���Ա��������ø��Ļ�ɾ��ԭ��Ȩ���������������ο����߿��Լ�ע���ΰ�Ȩ�����ߣ�
 *  ��Ӧ�����ش�Э��Ļ����ϣ�����Դ���롢���ó��۴��뱾��
 */
#ifndef __HAL_GPIO_H__
#define __HAL_GPIO_H__
/********************************************************************/

typedef void (*GPIO_ISR_CALLBACK)(void);

uint8_t LPLD_GPIO_Init(PORT_MemMapPtr, uint8, uint8, uint8, uint8);
uint8_t LPLD_GPIO_SetIsr(PORT_MemMapPtr, GPIO_ISR_CALLBACK);
void LPLD_GPIO_Set(GPIO_MemMapPtr, uint32_t);
void LPLD_GPIO_Set_b(GPIO_MemMapPtr, uint8_t, uint8_t);
void LPLD_GPIO_Toggle(GPIO_MemMapPtr, uint32_t);
void LPLD_GPIO_Toggle_b(GPIO_MemMapPtr, uint8_t);
uint32_t LPLD_GPIO_Get(GPIO_MemMapPtr);
uint8_t LPLD_GPIO_Get_b(GPIO_MemMapPtr, uint8_t);

#endif /* __HAL_GPIO_H__ */
