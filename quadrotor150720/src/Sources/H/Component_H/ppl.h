 #ifndef PIT_H_
#define PIT_H_

#include "common.h"

extern void pllinit180M(void);
 
void pllinit60M(void);
 void pllinit80M(void);
 void pllinit100M(void);
 void pllinit125M(void);
 void pllinit1375M(void);
 //锁相环频率为50/19*55=144.7386421M测试函数
 void pllinit144M(void);
 //锁相环频率为50/18*54=150M测试函数
void pllinit150M(void);
//锁相环频率为50/16*54=168.75M测试函数
void pllinit168d75M(void);
//锁相环频率为50/15*54=180M测试函数

//锁相环频率为50/13*54=207.7M测试函数
void pllinit207M(void);
//锁相环频率为50/13*55=211M测试函数
void pllinit211M(void);
//锁相环频率为50/12*54=225M测试函数
void pllinit225M(void);




 #endif 