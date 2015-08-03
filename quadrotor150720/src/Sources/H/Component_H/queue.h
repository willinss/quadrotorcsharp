
#ifndef QUEUE_H_
#define QUEUE_H_

#include <stdlib.h>
#include "stdio.h"

#define MAX_LEN 100

typedef float ElemType;
//定义链队列
typedef struct lnode
{
	ElemType data;
	struct lnode *next;
}LNode;//定义一个普通链表

typedef struct
{
	LNode *front;
	LNode *rear;
}LQueue;//将头尾指针封装在一起的链队

extern LQueue* Init_LQueue();
extern int Free_LQueue(LQueue *q);//释放链队列
extern int Handler_LQueue(LQueue *q, ElemType x, ElemType *sum);


#endif
