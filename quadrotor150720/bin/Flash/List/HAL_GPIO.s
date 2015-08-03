///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:04 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720����������С�� /
//                    (��I2C)\src\Sources\C\Component_C\HAL_GPIO.c            /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\src\Sources\C\Component_C\HAL_GPIO.c" -D IAR   /
//                    -D TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quadroto /
//                    r150720����������С��(��I2C)\bin\Flash\List\" -lB       /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\bin\Flash\List\" -o                            /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\bin\Flash\Obj\" --no_cse --no_unroll           /
//                    --no_inline --no_code_motion --no_tbaa --no_clustering  /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "E:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.4\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\src\Sources\H\" -I                             /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\src\Sources\H\Component_H\" -I                 /
//                    "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\src\Sources\H\Frame_H\" -Ol --use_c++_inline   /
//    List file    =  C:\Users\Thinkpad\Desktop\quadrotor150720����������С�� /
//                    (��I2C)\bin\Flash\List\HAL_GPIO.s                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME HAL_GPIO

        #define SHT_PROGBITS 0x1

        PUBLIC GPIO_ISR
        PUBLIC LPLD_GPIO_Get
        PUBLIC LPLD_GPIO_Get_b
        PUBLIC LPLD_GPIO_Init
        PUBLIC LPLD_GPIO_Isr
        PUBLIC LPLD_GPIO_Set
        PUBLIC LPLD_GPIO_SetIsr
        PUBLIC LPLD_GPIO_Set_b
        PUBLIC LPLD_GPIO_Toggle
        PUBLIC LPLD_GPIO_Toggle_b

// C:\Users\Thinkpad\Desktop\quadrotor150720����������С��(��I2C)\src\Sources\C\Component_C\HAL_GPIO.c
//    1 /*
//    2  * ����Ӳ��ƽ̨:LPLD_K60 Card
//    3  * ��Ȩ����:�����������µ��Ӽ������޹�˾
//    4  * ��������:http://laplenden.taobao.com
//    5  * ��˾�Ż�:http://www.lpld.cn
//    6  *
//    7  * �ļ���: HAL_GPIO.c
//    8  * ��;: GPIO�ײ�ģ����غ���
//    9  * ����޸�����: 20120321
//   10  *
//   11  * ������ʹ��Э��:
//   12  *  ��������������ʹ���߿���Դ���룬�����߿��������޸�Դ���롣�����μ�����ע��Ӧ
//   13  *  ���Ա��������ø��Ļ�ɾ��ԭ��Ȩ���������������ο����߿��Լ�ע���ΰ�Ȩ�����ߣ�
//   14  *  ��Ӧ�����ش�Э��Ļ����ϣ�����Դ���롢���ó��۴��뱾��
//   15  */
//   16 /*
//   17  *******���õ�GPIO�жϣ�����isr.h��ճ��һ�´���:*********
//   18 
//   19 //GPIOģ���жϷ�����
//   20 #undef  VECTOR_103
//   21 #define VECTOR_103 LPLD_GPIO_Isr
//   22 #undef  VECTOR_104
//   23 #define VECTOR_104 LPLD_GPIO_Isr
//   24 #undef  VECTOR_105
//   25 #define VECTOR_105 LPLD_GPIO_Isr
//   26 #undef  VECTOR_106
//   27 #define VECTOR_106 LPLD_GPIO_Isr
//   28 #undef  VECTOR_107
//   29 #define VECTOR_107 LPLD_GPIO_Isr
//   30 //���º�����LPLD_Kinetis�ײ���������޸�
//   31 extern void LPLD_GPIO_Isr(void);
//   32 
//   33  ***********************�������*************************
//   34 */
//   35 
//   36 #include "common.h"
//   37 #include "HAL_GPIO.h"
//   38 
//   39 
//   40 //�û��Զ����жϷ���������

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   41 GPIO_ISR_CALLBACK GPIO_ISR[5];
GPIO_ISR:
        DS8 20
//   42 
//   43 /*
//   44  * LPLD_GPIO_Init
//   45  * GPIOͨ�ó�ʼ������
//   46  * 
//   47  * ����:
//   48  *    port--�˿ڻ���ַ
//   49  *      |__PORTA_BASE_PTR--Port A
//   50  *      |__PORTB_BASE_PTR--Port B
//   51  *      |__PORTC_BASE_PTR--Port C
//   52  *      |__PORTD_BASE_PTR--Port D
//   53  *      |__PORTE_BASE_PTR--Port E
//   54  *    port_bit--�˿�λ��
//   55  *      |__0~31
//   56  *    dir--�˿����ݷ���
//   57  *      |__1--���
//   58  *      |__0--����
//   59  *    data--�����ʼ��ƽ/��������������
//   60  *      |__2--���dir=0,�����ڲ�����
//   61  *      |__1--���dir=0,�����ڲ�����; ���dir=1,����ߵ�ƽ
//   62  *      |__0--���dir=0,���벻ʹ��������; ���dir=1,����͵�ƽ
//   63  *    irqc--�����ж�
//   64  *      |__0--��ʹ���ж�
//   65  *      |__����--�������ĵ� PORTx_PCRn�Ĵ��� IRQCλ���� 1001���� 1010�½� 1011�����½�
//   66  *
//   67  * ���:
//   68  *    0--���ô���
//   69  *    1--���óɹ�
//   70  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   71 uint8_t LPLD_GPIO_Init(PORT_MemMapPtr port, uint8_t port_bit, uint8_t dir, uint8_t data, uint8_t irqc)
//   72 {
LPLD_GPIO_Init:
        PUSH     {R4-R6}
//   73   GPIO_MemMapPtr p;
//   74   //�ж϶˿�λ��������
//   75   if(port_bit>31)
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+32
        BCC.N    ??LPLD_GPIO_Init_0
//   76     return 0;
        MOVS     R0,#+0
        B.N      ??LPLD_GPIO_Init_1
//   77   
//   78   //ѡ��IO��ʱ�ӿ�������
//   79   if(port == PORTA_BASE_PTR)
??LPLD_GPIO_Init_0:
        LDR.N    R4,??DataTable2  ;; 0x40049000
        CMP      R0,R4
        BNE.N    ??LPLD_GPIO_Init_2
//   80   {
//   81     p = PTA_BASE_PTR; 
        LDR.N    R4,??DataTable2_1  ;; 0x400ff000
//   82     SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK; 
        LDR.N    R5,??DataTable2_2  ;; 0x40048038
        LDR      R5,[R5, #+0]
        ORRS     R5,R5,#0x200
        LDR.N    R6,??DataTable2_2  ;; 0x40048038
        STR      R5,[R6, #+0]
//   83   }
//   84   else if(port == PORTB_BASE_PTR)
//   85   {
//   86     p = PTB_BASE_PTR; 
//   87     SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK; 
//   88   }
//   89   else if(port == PORTC_BASE_PTR)
//   90   {
//   91     p = PTC_BASE_PTR; 
//   92     SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK; 
//   93   }
//   94   else if(port == PORTD_BASE_PTR)
//   95   {
//   96     p = PTD_BASE_PTR; 
//   97     SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK; 
//   98   }
//   99   else if(port == PORTE_BASE_PTR)
//  100   {
//  101     p = PTE_BASE_PTR; 
//  102     SIM_SCGC5 |= SIM_SCGC5_PORTE_MASK; 
//  103   }
//  104   else
//  105   {
//  106     return 0;
//  107   }
//  108   //����ΪGPIO����
//  109   PORT_PCR_REG(port, port_bit) = PORT_PCR_MUX(1);
??LPLD_GPIO_Init_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOV      R5,#+256
        STR      R5,[R0, R1, LSL #+2]
//  110   //������������
//  111   if(dir==1)
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+1
        BNE.N    ??LPLD_GPIO_Init_4
//  112   {
//  113     GPIO_PDDR_REG(p) |= 0x1u<<port_bit;
        LDR      R0,[R4, #+20]
        MOVS     R2,#+1
        LSLS     R2,R2,R1
        ORRS     R0,R2,R0
        STR      R0,[R4, #+20]
//  114     //���ó�ʼ���
//  115     if(data==1)
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??LPLD_GPIO_Init_5
//  116     {
//  117       GPIO_PSOR_REG(p) = 0x1u<<port_bit; 
        MOVS     R0,#+1
        LSLS     R0,R0,R1
        STR      R0,[R4, #+4]
        B.N      ??LPLD_GPIO_Init_6
//  118     }
??LPLD_GPIO_Init_2:
        LDR.N    R4,??DataTable2_3  ;; 0x4004a000
        CMP      R0,R4
        BNE.N    ??LPLD_GPIO_Init_7
        LDR.N    R4,??DataTable2_4  ;; 0x400ff040
        LDR.N    R5,??DataTable2_2  ;; 0x40048038
        LDR      R5,[R5, #+0]
        ORRS     R5,R5,#0x400
        LDR.N    R6,??DataTable2_2  ;; 0x40048038
        STR      R5,[R6, #+0]
        B.N      ??LPLD_GPIO_Init_3
??LPLD_GPIO_Init_7:
        LDR.N    R4,??DataTable2_5  ;; 0x4004b000
        CMP      R0,R4
        BNE.N    ??LPLD_GPIO_Init_8
        LDR.N    R4,??DataTable2_6  ;; 0x400ff080
        LDR.N    R5,??DataTable2_2  ;; 0x40048038
        LDR      R5,[R5, #+0]
        ORRS     R5,R5,#0x800
        LDR.N    R6,??DataTable2_2  ;; 0x40048038
        STR      R5,[R6, #+0]
        B.N      ??LPLD_GPIO_Init_3
??LPLD_GPIO_Init_8:
        LDR.N    R4,??DataTable2_7  ;; 0x4004c000
        CMP      R0,R4
        BNE.N    ??LPLD_GPIO_Init_9
        LDR.N    R4,??DataTable2_8  ;; 0x400ff0c0
        LDR.N    R5,??DataTable2_2  ;; 0x40048038
        LDR      R5,[R5, #+0]
        ORRS     R5,R5,#0x1000
        LDR.N    R6,??DataTable2_2  ;; 0x40048038
        STR      R5,[R6, #+0]
        B.N      ??LPLD_GPIO_Init_3
??LPLD_GPIO_Init_9:
        LDR.N    R4,??DataTable2_9  ;; 0x4004d000
        CMP      R0,R4
        BNE.N    ??LPLD_GPIO_Init_10
        LDR.N    R4,??DataTable2_10  ;; 0x400ff100
        LDR.N    R5,??DataTable2_2  ;; 0x40048038
        LDR      R5,[R5, #+0]
        ORRS     R5,R5,#0x2000
        LDR.N    R6,??DataTable2_2  ;; 0x40048038
        STR      R5,[R6, #+0]
        B.N      ??LPLD_GPIO_Init_3
??LPLD_GPIO_Init_10:
        MOVS     R0,#+0
        B.N      ??LPLD_GPIO_Init_1
//  119     else
//  120     {
//  121       GPIO_PCOR_REG(p) = 0x1u<<port_bit;  
??LPLD_GPIO_Init_5:
        MOVS     R0,#+1
        LSLS     R0,R0,R1
        STR      R0,[R4, #+8]
        B.N      ??LPLD_GPIO_Init_6
//  122     }
//  123   }
//  124   else
//  125   { 
//  126     GPIO_PDDR_REG(p) &= ~(0x1u<<port_bit);
??LPLD_GPIO_Init_4:
        LDR      R2,[R4, #+20]
        MOVS     R5,#+1
        LSLS     R5,R5,R1
        BICS     R2,R2,R5
        STR      R2,[R4, #+20]
        LDR      R2,[SP, #+12]
//  127     //�����жϷ�ʽ
//  128     if(irqc>0xC) return 0;
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+13
        BCC.N    ??LPLD_GPIO_Init_11
        MOVS     R0,#+0
        B.N      ??LPLD_GPIO_Init_1
//  129     PORT_PCR_REG(port, port_bit) |= PORT_PCR_IRQC(irqc); 
??LPLD_GPIO_Init_11:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R4,[R0, R1, LSL #+2]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        LSLS     R2,R2,#+16
        ANDS     R2,R2,#0xF0000
        ORRS     R2,R2,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R2,[R0, R1, LSL #+2]
//  130     //�����ڲ�������������ʹ��
//  131     if(data==1)
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+1
        BNE.N    ??LPLD_GPIO_Init_12
//  132     {
//  133       //����
//  134       PORT_PCR_REG(port, port_bit) |= PORT_PCR_PE_MASK | PORT_PCR_PS_MASK ; 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R2,[R0, R1, LSL #+2]
        ORRS     R2,R2,#0x3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R2,[R0, R1, LSL #+2]
        B.N      ??LPLD_GPIO_Init_6
//  135     }
//  136     else if(data==2)
??LPLD_GPIO_Init_12:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+2
        BNE.N    ??LPLD_GPIO_Init_13
//  137     {
//  138       //����
//  139       PORT_PCR_REG(port, port_bit) |= PORT_PCR_PE_MASK ; 
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R2,[R0, R1, LSL #+2]
        ORRS     R2,R2,#0x2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R2,[R0, R1, LSL #+2]
        B.N      ??LPLD_GPIO_Init_6
//  140     }
//  141     else
//  142     {
//  143       //��ʹ��������
//  144       PORT_PCR_REG(port, port_bit) &= ~PORT_PCR_PE_MASK ; 
??LPLD_GPIO_Init_13:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR      R2,[R0, R1, LSL #+2]
        BICS     R2,R2,#0x2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R2,[R0, R1, LSL #+2]
//  145     }
//  146   }
//  147   
//  148   return 1;
??LPLD_GPIO_Init_6:
        MOVS     R0,#+1
??LPLD_GPIO_Init_1:
        POP      {R4-R6}
        BX       LR               ;; return
//  149 }
//  150 
//  151 /*
//  152  * LPLD_GPIO_SetIsr
//  153  * ����GPIOͨ���û�������жϷ�����
//  154  * 
//  155  * ����:
//  156  *    port--�˿ڻ���ַ
//  157  *      |__PORTA_BASE_PTR--Port A
//  158  *      |__PORTB_BASE_PTR--Port B
//  159  *      |__PORTC_BASE_PTR--Port C
//  160  *      |__PORTD_BASE_PTR--Port D
//  161  *      |__PORTE_BASE_PTR--Port E
//  162  *    isr_func--�û��жϳ�����ڵ�ַ
//  163  *      |__�û��ڹ����ļ��¶�����жϺ���������������Ϊ:�޷���ֵ,�޲���(eg. void isr(void);)
//  164  *
//  165  * ���:
//  166  *    0--���ô���
//  167  *    1--���óɹ�
//  168  *
//  169  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  170 uint8_t LPLD_GPIO_SetIsr(PORT_MemMapPtr port, GPIO_ISR_CALLBACK isr_func)
//  171 {
//  172   //ѡ��IO��
//  173   if(port == PORTA_BASE_PTR)
LPLD_GPIO_SetIsr:
        LDR.N    R2,??DataTable2  ;; 0x40049000
        CMP      R0,R2
        BNE.N    ??LPLD_GPIO_SetIsr_0
//  174   {
//  175     GPIO_ISR[0] = isr_func;
        LDR.N    R0,??DataTable2_11
        STR      R1,[R0, #+0]
//  176     return 1;
        MOVS     R0,#+1
        B.N      ??LPLD_GPIO_SetIsr_1
//  177   }
//  178   else if(port == PORTB_BASE_PTR)
??LPLD_GPIO_SetIsr_0:
        LDR.N    R2,??DataTable2_3  ;; 0x4004a000
        CMP      R0,R2
        BNE.N    ??LPLD_GPIO_SetIsr_2
//  179   {
//  180     GPIO_ISR[1] = isr_func;
        LDR.N    R0,??DataTable2_11
        STR      R1,[R0, #+4]
//  181     return 1;
        MOVS     R0,#+1
        B.N      ??LPLD_GPIO_SetIsr_1
//  182   }
//  183   else if(port == PORTC_BASE_PTR)
??LPLD_GPIO_SetIsr_2:
        LDR.N    R2,??DataTable2_5  ;; 0x4004b000
        CMP      R0,R2
        BNE.N    ??LPLD_GPIO_SetIsr_3
//  184   {
//  185     GPIO_ISR[2] = isr_func;
        LDR.N    R0,??DataTable2_11
        STR      R1,[R0, #+8]
//  186     return 1;
        MOVS     R0,#+1
        B.N      ??LPLD_GPIO_SetIsr_1
//  187   }
//  188   else if(port == PORTD_BASE_PTR)
??LPLD_GPIO_SetIsr_3:
        LDR.N    R2,??DataTable2_7  ;; 0x4004c000
        CMP      R0,R2
        BNE.N    ??LPLD_GPIO_SetIsr_4
//  189   {
//  190     GPIO_ISR[3] = isr_func;
        LDR.N    R0,??DataTable2_11
        STR      R1,[R0, #+12]
//  191     return 1;
        MOVS     R0,#+1
        B.N      ??LPLD_GPIO_SetIsr_1
//  192   }
//  193   else if(port == PORTE_BASE_PTR)
??LPLD_GPIO_SetIsr_4:
        LDR.N    R2,??DataTable2_9  ;; 0x4004d000
        CMP      R0,R2
        BNE.N    ??LPLD_GPIO_SetIsr_5
//  194   {
//  195     GPIO_ISR[4] = isr_func;
        LDR.N    R0,??DataTable2_11
        STR      R1,[R0, #+16]
//  196     return 1;
        MOVS     R0,#+1
        B.N      ??LPLD_GPIO_SetIsr_1
//  197   }
//  198   else
//  199   {
//  200     return 0;
??LPLD_GPIO_SetIsr_5:
        MOVS     R0,#+0
??LPLD_GPIO_SetIsr_1:
        BX       LR               ;; return
//  201   }
//  202 }
//  203 
//  204 /*
//  205  * LPLD_GPIO_Set
//  206  * ����GPIO�˿�0~31λ���
//  207  * 
//  208  * ����:
//  209  *    p--GPIO�ڻ���ַ
//  210  *      |__PTA_BASE_PTR--Port A
//  211  *      |__PTB_BASE_PTR--Port B
//  212  *      |__PTC_BASE_PTR--Port C
//  213  *      |__PTD_BASE_PTR--Port D
//  214  *      |__PTE_BASE_PTR--Port E
//  215  *    data--�������
//  216  *      |__0x00000000~0xFFFFFFFF--�͵��ߴ���GPIO�ڵĵ�0~31λ����
//  217  *
//  218  * ���:
//  219  *
//  220  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  221 void LPLD_GPIO_Set(GPIO_MemMapPtr p, uint32_t data)
//  222 { 
//  223   GPIO_PDOR_REG(p) = data;
LPLD_GPIO_Set:
        STR      R1,[R0, #+0]
//  224 }
        BX       LR               ;; return
//  225 
//  226 /*
//  227  * LPLD_GPIO_Set_b
//  228  * ����GPIO�˿�һλ�����
//  229  * 
//  230  * ����:
//  231  *    p--GPIO�ڻ���ַ
//  232  *      |__PTA_BASE_PTR--Port A
//  233  *      |__PTB_BASE_PTR--Port B
//  234  *      |__PTC_BASE_PTR--Port C
//  235  *      |__PTD_BASE_PTR--Port D
//  236  *      |__PTE_BASE_PTR--Port E
//  237  *    port_bit--λ��
//  238  *      |__0~31--GPIO�ڵĵ�0~31λ
//  239  *    data--�������
//  240  *      |__0~1--λ����߻�͵�ƽ
//  241  *
//  242  * ���:
//  243  *
//  244  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  245 void LPLD_GPIO_Set_b(GPIO_MemMapPtr p, uint8_t port_bit, uint8_t data)
//  246 {
//  247   if(data==0)
LPLD_GPIO_Set_b:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BNE.N    ??LPLD_GPIO_Set_b_0
//  248     GPIO_PCOR_REG(p) = 0x1u<<port_bit;
        MOVS     R2,#+1
        LSLS     R1,R2,R1
        STR      R1,[R0, #+8]
        B.N      ??LPLD_GPIO_Set_b_1
//  249   else
//  250     GPIO_PSOR_REG(p) = 0x1u<<port_bit;
??LPLD_GPIO_Set_b_0:
        MOVS     R2,#+1
        LSLS     R1,R2,R1
        STR      R1,[R0, #+4]
//  251 }
??LPLD_GPIO_Set_b_1:
        BX       LR               ;; return
//  252 
//  253 /*
//  254  * LPLD_GPIO_Toggle
//  255  * ����GPIO�˿�0~31�ĵ�ƽ��ת
//  256  * 
//  257  * ����:
//  258  *    p--GPIO�ڻ���ַ
//  259  *      |__PTA_BASE_PTR--Port A
//  260  *      |__PTB_BASE_PTR--Port B
//  261  *      |__PTC_BASE_PTR--Port C
//  262  *      |__PTD_BASE_PTR--Port D
//  263  *      |__PTE_BASE_PTR--Port E
//  264  *    data--��ת����
//  265  *      |__0x00000000~0xFFFFFFFF--�͵��ߴ���GPIO�ڵĵ�0~31λ�ķ�ת��1Ϊ��ת��0Ϊ���ֲ��䡣
//  266  *
//  267  * ���:
//  268  *
//  269  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  270 void LPLD_GPIO_Toggle(GPIO_MemMapPtr p, uint32_t data)
//  271 {
//  272   GPIO_PTOR_REG(p) = data;
LPLD_GPIO_Toggle:
        STR      R1,[R0, #+12]
//  273 }
        BX       LR               ;; return
//  274 
//  275 /*
//  276  * LPLD_GPIO_Toggle_b
//  277  * ����GPIO�˿�һλ�ķ�ת
//  278  * 
//  279  * ����:
//  280  *    p--GPIO�ڻ���ַ
//  281  *      |__PTA_BASE_PTR--Port A
//  282  *      |__PTB_BASE_PTR--Port B
//  283  *      |__PTC_BASE_PTR--Port C
//  284  *      |__PTD_BASE_PTR--Port D
//  285  *      |__PTE_BASE_PTR--Port E
//  286  *    port_bit--λ��
//  287  *      |__0~31--����GPIO�ڵ�һλ��ת
//  288  *
//  289  * ���:
//  290  *
//  291  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  292 void LPLD_GPIO_Toggle_b(GPIO_MemMapPtr p, uint8_t port_bit)
//  293 {
//  294   GPIO_PTOR_REG(p) = 0x1u<<port_bit;
LPLD_GPIO_Toggle_b:
        MOVS     R2,#+1
        LSLS     R1,R2,R1
        STR      R1,[R0, #+12]
//  295 }
        BX       LR               ;; return
//  296 
//  297 /*
//  298  * LPLD_GPIO_Get
//  299  * ȡ��GPIO�ڵ�����
//  300  * 
//  301  * ����:
//  302  *    p--GPIO�ڻ���ַ
//  303  *      |__PTA_BASE_PTR--Port A
//  304  *      |__PTB_BASE_PTR--Port B
//  305  *      |__PTC_BASE_PTR--Port C
//  306  *      |__PTD_BASE_PTR--Port D
//  307  *      |__PTE_BASE_PTR--Port E
//  308  *
//  309  * ���:
//  310  *    ָ��GPIO�ڵ�32λ����
//  311  *
//  312  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  313 uint32_t LPLD_GPIO_Get(GPIO_MemMapPtr p)
//  314 {
//  315   return GPIO_PDIR_REG(p);
LPLD_GPIO_Get:
        LDR      R0,[R0, #+16]
        BX       LR               ;; return
//  316 }
//  317 
//  318 /*
//  319  * LPLD_GPIO_Get_b
//  320  * ȡ��GPIO��ĳһλ������
//  321  * 
//  322  * ����:
//  323  *    p--GPIO�ڻ���ַ
//  324  *      |__PTA_BASE_PTR--Port A
//  325  *      |__PTB_BASE_PTR--Port B
//  326  *      |__PTC_BASE_PTR--Port C
//  327  *      |__PTD_BASE_PTR--Port D
//  328  *      |__PTE_BASE_PTR--Port E
//  329  *    port_bit--λ��
//  330  *      |__0~31--GPIO�ڵĵ�0~31λ
//  331  *
//  332  * ���:
//  333  *    ָ��GPIO�ڵ�ָ��λ���ĵ�ƽ
//  334  *
//  335  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  336 uint8_t LPLD_GPIO_Get_b(GPIO_MemMapPtr p, uint8_t port_bit)
//  337 {
//  338   return (GPIO_PDIR_REG(p)>>port_bit)&0x1u;
LPLD_GPIO_Get_b:
        LDR      R0,[R0, #+16]
        LSRS     R0,R0,R1
        ANDS     R0,R0,#0x1
        BX       LR               ;; return
//  339 }
//  340 
//  341 /*
//  342  * LPLD_GPIO_Isr
//  343  * GPIOͨ���жϵײ���ں���
//  344  * 
//  345  * �û������޸ģ������Զ������Ӧͨ���жϺ���
//  346  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  347 void LPLD_GPIO_Isr(void)
//  348 {
LPLD_GPIO_Isr:
        PUSH     {R4,LR}
//  349   #define GPIO_VECTORNUM   (*(volatile uint8_t*)(0xE000ED04))
//  350   uint8_t gpio_port = GPIO_VECTORNUM - 103;
        LDR.N    R0,??DataTable2_12  ;; 0xe000ed04
        LDRB     R0,[R0, #+0]
        SUBS     R4,R0,#+103
//  351     
//  352   //�����û��Զ����жϷ���
//  353   GPIO_ISR[gpio_port]();  
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable2_11
        LDR      R0,[R0, R4, LSL #+2]
        BLX      R0
//  354   
//  355   //����жϱ�־λ
//  356   PORT_ISFR_REG((PORT_MemMapPtr)((0x40049+gpio_port)<<12))=0xFFFFFFFF;
        LDR.N    R0,??DataTable2_13  ;; 0x40049
        UXTAB    R0,R0,R4
        LSLS     R0,R0,#+12
        MOVS     R1,#-1
        STR      R1,[R0, #+160]
//  357 }
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     GPIO_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     0xe000ed04

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x40049

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//  20 bytes in section .bss
// 512 bytes in section .text
// 
// 512 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none
