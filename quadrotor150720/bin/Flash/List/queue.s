///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:16 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\queue.c               /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\queue.c" -D IAR -D   /
//                    TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quadrotor15 /
//                    0720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\bin\Flash\List\" -lB          /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\bin\Flash\List\" -o                            /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\bin\Flash\Obj\" --no_cse --no_unroll           /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "E:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.4\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\H\" -I                             /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\H\Component_H\" -I                 /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\H\Frame_H\" -Ol --use_c++_inline   /
//    List file    =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\bin\Flash\List\queue.s                          /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME queue

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_fadd
        EXTERN __aeabi_fsub
        EXTERN free
        EXTERN malloc

        PUBLIC Free_LQueue
        PUBLIC Handler_LQueue
        PUBLIC Init_LQueue

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\queue.c
//    1 
//    2 #include "queue.h"
//    3  
//    4 
//    5 
//    6 //³õÊ¼»¯Á´¶ÓÁÐ£¬´´½¨Ò»¸ö´øÍ·½ÚµãµÄ¿Õ¶Ô

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 LQueue* Init_LQueue()
//    8 {
Init_LQueue:
        PUSH     {R4,LR}
//    9 	LNode *p;//¶¨ÒåÎªÁ´±íÖ¸Õë
//   10 	LQueue *q;
//   11 
//   12 	p=(LNode*)malloc(sizeof(LNode));
        MOVS     R0,#+8
        BL       malloc
        MOVS     R4,R0
//   13 	if(p==NULL)
        CMP      R4,#+0
        BNE.N    ??Init_LQueue_0
//   14 	{
//   15 		//printf("malloc error\n");
//   16 		return NULL;
        MOVS     R0,#+0
        B.N      ??Init_LQueue_1
//   17 	}
//   18 	q=(LQueue*)malloc(sizeof(LQueue));
??Init_LQueue_0:
        MOVS     R0,#+8
        BL       malloc
//   19 	if(q==NULL)
        CMP      R0,#+0
        BNE.N    ??Init_LQueue_2
//   20 	{
//   21 		free(p);
        MOVS     R0,R4
        BL       free
//   22 		//printf("malloc error\n");
//   23 		return NULL;
        MOVS     R0,#+0
        B.N      ??Init_LQueue_1
//   24 	}
//   25 	p->next=NULL;
??Init_LQueue_2:
        MOVS     R1,#+0
        STR      R1,[R4, #+4]
//   26 	q->front=q->rear=p;
        STR      R4,[R0, #+4]
        STR      R4,[R0, #+0]
//   27 	return q;
??Init_LQueue_1:
        POP      {R4,PC}          ;; return
//   28 
//   29 }
//   30 
//   31 //Á´¶ÓÁÐÈë¶Ô

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 static int In_LQueue(LQueue *q,ElemType x)
//   33 {
In_LQueue:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//   34 	LNode *p;//Á´±íÖ¸Õë
//   35 
//   36 	p=(LNode*)malloc(sizeof(LNode));//¿ª±ÙÐÂ¿Õ¼ä
        MOVS     R0,#+8
        BL       malloc
//   37 	if(p==NULL)
        CMP      R0,#+0
        BNE.N    ??In_LQueue_0
//   38 	{
//   39 		//printf("malloc error\n");
//   40 		return 0;
        MOVS     R0,#+0
        B.N      ??In_LQueue_1
//   41 	}
//   42 	p->data=x;
??In_LQueue_0:
        STR      R5,[R0, #+0]
//   43 	p->next =NULL;//Á´Î²ÖÃ¿Õ
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
//   44 
//   45 	q->rear->next=p;//¶ÔÎ²Ö¸ÏòÁ´Î²
        LDR      R1,[R4, #+4]
        STR      R0,[R1, #+4]
//   46 	q->rear=p;//¶ÔÎ²ºóÒÆ
        STR      R0,[R4, #+4]
//   47 	return 1;
        MOVS     R0,#+1
??In_LQueue_1:
        POP      {R1,R4,R5,PC}    ;; return
//   48 }
//   49 
//   50 //Á´¶ÓÁÐ³ö¶Ô

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   51 static int Out_LQueue(LQueue *q,ElemType *x)
//   52 {
Out_LQueue:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   53 	LNode *p;
//   54 
//   55 	if(q->front == q->rear)
        LDR      R0,[R4, #+0]
        LDR      R2,[R4, #+4]
        CMP      R0,R2
        BNE.N    ??Out_LQueue_0
//   56 	{
//   57 		//printf("Á´¶ÓÁÐÎª¿Õ!²»ÄÜ³ö¶Ô!\n");
//   58 		return 0;	
        MOVS     R0,#+0
        B.N      ??Out_LQueue_1
//   59 	}
//   60 
//   61 	p=q->front->next;//ÕÒµ½¶ÔÍ·µÚÒ»¸öÓÐÖµ½Úµã
??Out_LQueue_0:
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+4]
//   62 	*x=p->data;//È¡³öÊýÖµ
        LDR      R2,[R0, #+0]
        STR      R2,[R1, #+0]
//   63 	q->front->next=p->next;
        LDR      R1,[R4, #+0]
        LDR      R2,[R0, #+4]
        STR      R2,[R1, #+4]
//   64 	free(p);
        BL       free
//   65 	if(q->front->next == NULL)//µ±³ö¶ÔÎª×îºóÒ»¸ö½ÚµãÊ±£¬ÐÞ¸ÄÍ·Î²Ö¸Õë.
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??Out_LQueue_2
//   66 		q->front = q->rear;
        LDR      R0,[R4, #+4]
        STR      R0,[R4, #+0]
//   67 	return 1;
??Out_LQueue_2:
        MOVS     R0,#+1
??Out_LQueue_1:
        POP      {R4,PC}          ;; return
//   68 }
//   69 
//   70 //Çó¶ÓÁÐµÄ³¤¶È

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   71 static int LQueueLen(LQueue *q)
//   72 {
//   73 	int length=0;
LQueueLen:
        MOVS     R1,#+0
//   74 	LNode *p;
//   75 
//   76 	p=q->front;
        LDR      R2,[R0, #+0]
        B.N      ??LQueueLen_0
//   77 	while(p!=q->rear)
//   78 	{
//   79 		length++;
??LQueueLen_1:
        ADDS     R1,R1,#+1
//   80 		p=p->next;
        LDR      R2,[R2, #+4]
//   81 	}
??LQueueLen_0:
        LDR      R3,[R0, #+4]
        CMP      R2,R3
        BNE.N    ??LQueueLen_1
//   82 	return length;
        MOVS     R0,R1
        BX       LR               ;; return
//   83 } 
//   84 
//   85 //ÊÍ·ÅÁ´¶ÓÁÐ

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   86 int Free_LQueue(LQueue *q)
//   87 {
Free_LQueue:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   88 	LNode *p,*t;
//   89 
//   90 	p=q->front->next;
        LDR      R0,[R4, #+0]
        LDR      R0,[R0, #+4]
        B.N      ??Free_LQueue_0
//   91 	while(p!=NULL)
//   92 	{
//   93 		t=p->next;
??Free_LQueue_1:
        LDR      R5,[R0, #+4]
//   94 		free(p);//ÊÍ·ÅÁ´±í
        BL       free
//   95 		p=t;
        MOVS     R0,R5
//   96 	}
??Free_LQueue_0:
        CMP      R0,#+0
        BNE.N    ??Free_LQueue_1
//   97 	q->front=q->rear=NULL;//ÖÃ¶ÓÁÐÎª¿Õ
        MOVS     R0,#+0
        STR      R0,[R4, #+4]
        STR      R0,[R4, #+0]
//   98 	return 1;
        MOVS     R0,#+1
        POP      {R1,R4,R5,PC}    ;; return
//   99 }
//  100 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  101 int Handler_LQueue(LQueue *q, ElemType x, ElemType *sum)
//  102 {
Handler_LQueue:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
//  103 	static int _isFull = 0;
//  104 	ElemType xOut = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  105 
//  106 	*sum += x;//ÀÛ¼Ó
        LDR      R0,[R5, #+0]
        MOVS     R1,R6
        BL       __aeabi_fadd
        STR      R0,[R5, #+0]
//  107 	if(In_LQueue(q,x) == 0)
        MOVS     R1,R6
        MOVS     R0,R4
        BL       In_LQueue
        CMP      R0,#+0
        BNE.N    ??Handler_LQueue_0
//  108 	{
//  109 	  return 0;
        MOVS     R0,#+0
        B.N      ??Handler_LQueue_1
//  110 	}
//  111 	if(_isFull == 1 || LQueueLen(q) > MAX_LEN)
??Handler_LQueue_0:
        LDR.N    R0,??DataTable0
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??Handler_LQueue_2
        MOVS     R0,R4
        BL       LQueueLen
        CMP      R0,#+101
        BLT.N    ??Handler_LQueue_3
//  112 	{
//  113 		_isFull = 1;
??Handler_LQueue_2:
        LDR.N    R0,??DataTable0
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  114 		if(Out_LQueue(q,&xOut) == 0)
        ADD      R1,SP,#+0
        MOVS     R0,R4
        BL       Out_LQueue
        CMP      R0,#+0
        BNE.N    ??Handler_LQueue_4
//  115 		{
//  116 		  return 0;
        MOVS     R0,#+0
        B.N      ??Handler_LQueue_1
//  117 		}
//  118 		*sum -= xOut;
??Handler_LQueue_4:
        LDR      R0,[R5, #+0]
        LDR      R1,[SP, #+0]
        BL       __aeabi_fsub
        STR      R0,[R5, #+0]
//  119 	}
//  120 	return 1;
??Handler_LQueue_3:
        MOVS     R0,#+1
??Handler_LQueue_1:
        POP      {R1,R2,R4-R6,PC}  ;; return
//  121 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     ??_isFull

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??_isFull:
        DS8 4

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  122 
//  123 
//  124 
//  125 
//  126 
//  127 
//  128 
// 
//   4 bytes in section .bss
// 284 bytes in section .text
// 
// 284 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
