
#include "queue.h"
 


//初始化链队列，创建一个带头节点的空对
LQueue* Init_LQueue()
{
	LNode *p;//定义为链表指针
	LQueue *q;

	p=(LNode*)malloc(sizeof(LNode));
	if(p==NULL)
	{
		//printf("malloc error\n");
		return NULL;
	}
	q=(LQueue*)malloc(sizeof(LQueue));
	if(q==NULL)
	{
		free(p);
		//printf("malloc error\n");
		return NULL;
	}
	p->next=NULL;
	q->front=q->rear=p;
	return q;

}

//链队列入对
static int In_LQueue(LQueue *q,ElemType x)
{
	LNode *p;//链表指针

	p=(LNode*)malloc(sizeof(LNode));//开辟新空间
	if(p==NULL)
	{
		//printf("malloc error\n");
		return 0;
	}
	p->data=x;
	p->next =NULL;//链尾置空

	q->rear->next=p;//对尾指向链尾
	q->rear=p;//对尾后移
	return 1;
}

//链队列出对
static int Out_LQueue(LQueue *q,ElemType *x)
{
	LNode *p;

	if(q->front == q->rear)
	{
		//printf("链队列为空!不能出对!\n");
		return 0;	
	}

	p=q->front->next;//找到对头第一个有值节点
	*x=p->data;//取出数值
	q->front->next=p->next;
	free(p);
	if(q->front->next == NULL)//当出对为最后一个节点时，修改头尾指针.
		q->front = q->rear;
	return 1;
}

//求队列的长度
static int LQueueLen(LQueue *q)
{
	int length=0;
	LNode *p;

	p=q->front;
	while(p!=q->rear)
	{
		length++;
		p=p->next;
	}
	return length;
} 

//释放链队列
int Free_LQueue(LQueue *q)
{
	LNode *p,*t;

	p=q->front->next;
	while(p!=NULL)
	{
		t=p->next;
		free(p);//释放链表
		p=t;
	}
	q->front=q->rear=NULL;//置队列为空
	return 1;
}

int Handler_LQueue(LQueue *q, ElemType x, ElemType *sum)
{
	static int _isFull = 0;
	ElemType xOut = 0;

	*sum += x;//累加
	if(In_LQueue(q,x) == 0)
	{
	  return 0;
	}
	if(_isFull == 1 || LQueueLen(q) > MAX_LEN)
	{
		_isFull = 1;
		if(Out_LQueue(q,&xOut) == 0)
		{
		  return 0;
		}
		*sum -= xOut;
	}
	return 1;
}







