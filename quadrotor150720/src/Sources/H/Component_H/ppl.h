 #ifndef PIT_H_
#define PIT_H_

#include "common.h"

extern void pllinit180M(void);
 
void pllinit60M(void);
 void pllinit80M(void);
 void pllinit100M(void);
 void pllinit125M(void);
 void pllinit1375M(void);
 //���໷Ƶ��Ϊ50/19*55=144.7386421M���Ժ���
 void pllinit144M(void);
 //���໷Ƶ��Ϊ50/18*54=150M���Ժ���
void pllinit150M(void);
//���໷Ƶ��Ϊ50/16*54=168.75M���Ժ���
void pllinit168d75M(void);
//���໷Ƶ��Ϊ50/15*54=180M���Ժ���

//���໷Ƶ��Ϊ50/13*54=207.7M���Ժ���
void pllinit207M(void);
//���໷Ƶ��Ϊ50/13*55=211M���Ժ���
void pllinit211M(void);
//���໷Ƶ��Ϊ50/12*54=225M���Ժ���
void pllinit225M(void);




 #endif 