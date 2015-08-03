
#include "queue.h"
 


//��ʼ�������У�����һ����ͷ�ڵ�Ŀն�
LQueue* Init_LQueue()
{
	LNode *p;//����Ϊ����ָ��
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

//���������
static int In_LQueue(LQueue *q,ElemType x)
{
	LNode *p;//����ָ��

	p=(LNode*)malloc(sizeof(LNode));//�����¿ռ�
	if(p==NULL)
	{
		//printf("malloc error\n");
		return 0;
	}
	p->data=x;
	p->next =NULL;//��β�ÿ�

	q->rear->next=p;//��βָ����β
	q->rear=p;//��β����
	return 1;
}

//�����г���
static int Out_LQueue(LQueue *q,ElemType *x)
{
	LNode *p;

	if(q->front == q->rear)
	{
		//printf("������Ϊ��!���ܳ���!\n");
		return 0;	
	}

	p=q->front->next;//�ҵ���ͷ��һ����ֵ�ڵ�
	*x=p->data;//ȡ����ֵ
	q->front->next=p->next;
	free(p);
	if(q->front->next == NULL)//������Ϊ���һ���ڵ�ʱ���޸�ͷβָ��.
		q->front = q->rear;
	return 1;
}

//����еĳ���
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

//�ͷ�������
int Free_LQueue(LQueue *q)
{
	LNode *p,*t;

	p=q->front->next;
	while(p!=NULL)
	{
		t=p->next;
		free(p);//�ͷ�����
		p=t;
	}
	q->front=q->rear=NULL;//�ö���Ϊ��
	return 1;
}

int Handler_LQueue(LQueue *q, ElemType x, ElemType *sum)
{
	static int _isFull = 0;
	ElemType xOut = 0;

	*sum += x;//�ۼ�
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







