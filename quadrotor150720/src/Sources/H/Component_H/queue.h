
#ifndef QUEUE_H_
#define QUEUE_H_

#include <stdlib.h>
#include "stdio.h"

#define MAX_LEN 100

typedef float ElemType;
//����������
typedef struct lnode
{
	ElemType data;
	struct lnode *next;
}LNode;//����һ����ͨ����

typedef struct
{
	LNode *front;
	LNode *rear;
}LQueue;//��ͷβָ���װ��һ�������

extern LQueue* Init_LQueue();
extern int Free_LQueue(LQueue *q);//�ͷ�������
extern int Handler_LQueue(LQueue *q, ElemType x, ElemType *sum);


#endif
