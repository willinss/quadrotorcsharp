/*
 * 测试硬件平台:LPLD_K60 Card
 * 版权所有:北京拉普兰德电子技术有限公司
 * 网络销售:http://laplenden.taobao.com
 * 公司门户:http://www.lpld.cn
 *
 * 文件名: HAL_GPIO.h
 * 用途: GPIO底层模块相关函数
 * 最后修改日期: 20120321
 *
 * 开发者使用协议:
 *  本代码面向所有使用者开放源代码，开发者可以随意修改源代码。但本段及以上注释应
 *  予以保留，不得更改或删除原版权所有者姓名。二次开发者可以加注二次版权所有者，
 *  但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
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
