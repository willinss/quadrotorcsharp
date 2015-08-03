///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:13 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720����������С�� /
//                    (��I2C)\src\Sources\C\Component_C\hw_gpio.c             /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720����������С� /
//                    �(��I2C)\src\Sources\C\Component_C\hw_gpio.c" -D IAR    /
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
//                    (��I2C)\bin\Flash\List\hw_gpio.s                        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME hw_gpio

        #define SHT_PROGBITS 0x1

        PUBLIC hw_gpio_get
        PUBLIC hw_gpio_init
        PUBLIC hw_gpio_reverse
        PUBLIC hw_gpio_set

// C:\Users\Thinkpad\Desktop\quadrotor150720����������С��(��I2C)\src\Sources\C\Component_C\hw_gpio.c
//    1 //===========================================================================
//    2 //�ļ����ƣ�hw_gpio.c
//    3 //���ܸ�Ҫ��K60 GPIO�ײ����������ļ�
//    4 //===========================================================================
//    5 
//    6 #include "hw_gpio.h"
//    7 
//    8 //=================�ڲ���������===============================================
//    9 
//   10 //===========================================================================
//   11 //�������ƣ�hw_gpio_get_port_addr
//   12 //�������أ��˿ںŶ�Ӧ�Ķ˿ڼĴ�����ָ��
//   13 //����˵������
//   14 //���ܸ�Ҫ�����˿ں�ת���ɶ˿ڼĴ�����ָ�롣�ڲ����á�
//   15 //===========================================================================
//   16 static PORT_MemMapPtr hw_gpio_get_port_addr(uint8 port);
//   17 
//   18 //===========================================================================
//   19 //�������ƣ�hw_gpio_get_pt_addr
//   20 //�������أ��˿ںŶ�Ӧ��GPIO�˿ڼĴ�����ָ��
//   21 //����˵������
//   22 //���ܸ�Ҫ�����˿ں�ת���ɶ˿ڼĴ�����ָ�롣�ڲ����á�
//   23 //============================================================================
//   24 static GPIO_MemMapPtr hw_gpio_get_pt_addr(uint8 port);
//   25 
//   26 //===========================================================================
//   27 
//   28 
//   29 //=================�ӿں���ʵ��===============================================
//   30 
//   31 //===========================================================================
//   32 //�������ƣ�hw_gpio_init
//   33 //�������أ�����ִ��״̬��0=�ɹ�������Ϊ�쳣��
//   34 //����˵����port���˿ںš��ɺ궨�塣
//   35 //          pin�����źš�0��31��
//   36 //          dir�����ŷ��� 1=�����0=���롣
//   37 //          state�����ų�ʼ״̬��1=�ߵ�ƽ��0=�͵�ƽ
//   38 //���ܸ�Ҫ����ʼ���˿���ΪGPIO���ŵĹ��ܡ�
//   39 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   40 uint8 hw_gpio_init(uint8 port, uint8 pin, uint8 dir, uint8 state)
//   41 {
hw_gpio_init:
        PUSH     {R4-R8,LR}
        MOVS     R7,R0
        MOVS     R4,R1
        MOV      R8,R2
        MOVS     R5,R3
//   42     //��GPIO�˿ں�ת���ɶ˿ڼĴ�����ָ��
//   43     GPIO_MemMapPtr pt = hw_gpio_get_pt_addr(port);
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_pt_addr
        MOVS     R6,R0
//   44     PORT_MemMapPtr p  = hw_gpio_get_port_addr(port);
        MOVS     R0,R7
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_port_addr
//   45     
//   46     if (!p) return 1;  //��������
        CMP      R0,#+0
        BNE.N    ??hw_gpio_init_0
        MOVS     R0,#+1
        B.N      ??hw_gpio_init_1
//   47      
//   48     //�趨ͨ�ö˿����ſ��ƼĴ�����ֵ���趨ΪGPIO����
//   49     PORT_PCR_REG(p, pin) = (0|PORT_PCR_MUX(1));
??hw_gpio_init_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOV      R1,#+256
        STR      R1,[R0, R4, LSL #+2]
//   50 
//   51     if(dir == 1) //�����ű�����Ϊ���
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+1
        BNE.N    ??hw_gpio_init_2
//   52     {
//   53         GPIO_PDDR_REG(pt) |= (1<<pin);
        LDR      R0,[R6, #+20]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        ORRS     R0,R1,R0
        STR      R0,[R6, #+20]
//   54     	 
//   55     	  //�趨���ų�ʼ��״̬
//   56         if(state == 1)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+1
        BNE.N    ??hw_gpio_init_3
//   57 		    BSET(pin, GPIO_PDOR_REG(pt));
        LDR      R0,[R6, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        ORRS     R0,R1,R0
        STR      R0,[R6, #+0]
        B.N      ??hw_gpio_init_4
//   58         else
//   59         	BCLR(pin, GPIO_PDOR_REG(pt));
??hw_gpio_init_3:
        LDR      R0,[R6, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        BICS     R0,R0,R1
        STR      R0,[R6, #+0]
        B.N      ??hw_gpio_init_4
//   60     }
//   61     else //�����ű�����Ϊ���� 
//   62     {
//   63     	BCLR(pin, GPIO_PDDR_REG(pt));
??hw_gpio_init_2:
        LDR      R0,[R6, #+20]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        BICS     R0,R0,R1
        STR      R0,[R6, #+20]
//   64     }
//   65 
//   66     return 0;  //�ɹ�����
??hw_gpio_init_4:
        MOVS     R0,#+0
??hw_gpio_init_1:
        POP      {R4-R8,PC}       ;; return
//   67 }
//   68 
//   69 //===========================================================================
//   70 //�������ƣ�hw_gpio_set
//   71 //�������أ���
//   72 //����˵����port���˿ںš��ɺ궨�塣
//   73 //          pin�����źš�0��31��
//   74 //          state�����ų�ʼ״̬��1=�ߵ�ƽ��0=�͵�ƽ
//   75 //���ܸ�Ҫ����ȡָ������״̬��
//   76 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   77 void hw_gpio_set(uint8 port, uint8 pin, uint8 state)
//   78 {
hw_gpio_set:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
        MOVS     R5,R2
//   79     //��GPIO�˿ں�ת���ɶ˿ڼĴ�����ָ��
//   80     GPIO_MemMapPtr pt = hw_gpio_get_pt_addr(port);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_pt_addr
//   81 	  
//   82 	if (state == 0) //����Ϊ�͵�ƽ
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??hw_gpio_set_0
//   83         BCLR(pin, GPIO_PDOR_REG(pt));
        LDR      R1,[R0, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R4
        BICS     R1,R1,R2
        STR      R1,[R0, #+0]
        B.N      ??hw_gpio_set_1
//   84     else            //����Ϊ�ߵ�ƽ
//   85         BSET(pin, GPIO_PDOR_REG(pt));
??hw_gpio_set_0:
        LDR      R1,[R0, #+0]
        MOVS     R2,#+1
        LSLS     R2,R2,R4
        ORRS     R1,R2,R1
        STR      R1,[R0, #+0]
//   86 }
??hw_gpio_set_1:
        POP      {R0,R4,R5,PC}    ;; return
//   87 
//   88 //===========================================================================
//   89 //�������ƣ�hw_gpio_get
//   90 //�������أ�ָ������״̬��0=�͵�ƽ��1=�ߵ�ƽ��
//   91 //����˵����port���˿ںš��ɺ궨�塣
//   92 //          pin�����źš�0��31��
//   93 //���ܸ�Ҫ����ȡָ������״̬��
//   94 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   95 uint8 hw_gpio_get(uint8 port, uint8 pin)
//   96 {
hw_gpio_get:
        PUSH     {R4,LR}
        MOVS     R4,R1
//   97 	uint8 i; 
//   98 	//��GPIO�˿ں�ת���ɶ˿ڼĴ�����ָ��
//   99 	GPIO_MemMapPtr pt = hw_gpio_get_pt_addr(port);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_pt_addr
//  100 	//�鿴����״̬
//  101 	i = BGET(pin, GPIO_PDIR_REG(pt));
        LDR      R0,[R0, #+16]
        LSRS     R0,R0,R4
        ANDS     R0,R0,#0x1
//  102 	return i;     //��������״̬��0��1��
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return
//  103 }
//  104 
//  105 //===========================================================================
//  106 //�������ƣ�hw_gpio_reverse
//  107 //�������أ���
//  108 //����˵����port���˿ںš��ɺ궨�塣
//  109 //          pin�����źš�0��31��
//  110 //���ܸ�Ҫ����תָ������״̬��
//  111 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 void hw_gpio_reverse(uint8 port, uint8 pin)
//  113 {
hw_gpio_reverse:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  114     //��GPIO�˿ں�ת���ɶ˿ڼĴ�����ָ��
//  115     GPIO_MemMapPtr pt = hw_gpio_get_pt_addr(port);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       hw_gpio_get_pt_addr
//  116 	//�������ȡ���Ĵ�������ӦλΪ1����תָ������״̬  
//  117     BSET(pin, GPIO_PTOR_REG(pt));
        LDR      R1,[R0, #+12]
        MOVS     R2,#+1
        LSLS     R2,R2,R4
        ORRS     R1,R2,R1
        STR      R1,[R0, #+12]
//  118 }
        POP      {R4,PC}          ;; return
//  119 
//  120 
//  121 //=================�ڲ�����ʵ��===============================================
//  122 //===========================================================================
//  123 //�������ƣ�hw_gpio_get_port_addr
//  124 //�������أ��˿ںŶ�Ӧ�Ķ˿ڼĴ�����ָ��
//  125 //����˵������
//  126 //���ܸ�Ҫ�����˿ں�ת���ɶ˿ڼĴ�����ָ�롣�ڲ����á�
//  127 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  128 PORT_MemMapPtr hw_gpio_get_port_addr (uint8 port)
//  129 {
//  130 	PORT_MemMapPtr p;
//  131     
//  132     switch(port)
hw_gpio_get_port_addr:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??hw_gpio_get_port_addr_0
        CMP      R0,#+2
        BEQ.N    ??hw_gpio_get_port_addr_1
        BCC.N    ??hw_gpio_get_port_addr_2
        CMP      R0,#+4
        BEQ.N    ??hw_gpio_get_port_addr_3
        BCC.N    ??hw_gpio_get_port_addr_4
        B.N      ??hw_gpio_get_port_addr_5
//  133     {
//  134     case PORT_A:
//  135         p = PORTA_BASE_PTR;
??hw_gpio_get_port_addr_0:
        LDR.N    R0,??DataTable1  ;; 0x40049000
//  136         break;
//  137     case PORT_B:
//  138         p = PORTB_BASE_PTR;
//  139         break;
//  140     case PORT_C:
//  141         p = PORTC_BASE_PTR;
//  142         break;
//  143     case PORT_D:
//  144         p = PORTD_BASE_PTR;
//  145         break;
//  146     case PORT_E:
//  147         p = PORTE_BASE_PTR;
//  148         break;
//  149     default:
//  150         return 0; //���������Ч����
//  151     }
//  152     
//  153     return p;
??hw_gpio_get_port_addr_6:
??hw_gpio_get_port_addr_7:
        BX       LR               ;; return
??hw_gpio_get_port_addr_2:
        LDR.N    R0,??DataTable1_1  ;; 0x4004a000
        B.N      ??hw_gpio_get_port_addr_6
??hw_gpio_get_port_addr_1:
        LDR.N    R0,??DataTable1_2  ;; 0x4004b000
        B.N      ??hw_gpio_get_port_addr_6
??hw_gpio_get_port_addr_4:
        LDR.N    R0,??DataTable1_3  ;; 0x4004c000
        B.N      ??hw_gpio_get_port_addr_6
??hw_gpio_get_port_addr_3:
        LDR.N    R0,??DataTable1_4  ;; 0x4004d000
        B.N      ??hw_gpio_get_port_addr_6
??hw_gpio_get_port_addr_5:
        MOVS     R0,#+0
        B.N      ??hw_gpio_get_port_addr_7
//  154 }
//  155 
//  156 //===========================================================================
//  157 //�������ƣ�hw_gpio_get_pt_addr
//  158 //�������أ��˿ںŶ�Ӧ��GPIO�˿ڼĴ�����ָ��
//  159 //����˵������
//  160 //���ܸ�Ҫ�����˿ں�ת���ɶ˿ڼĴ�����ָ�롣�ڲ����á�
//  161 //===========================================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  162 GPIO_MemMapPtr hw_gpio_get_pt_addr(uint8 port)
//  163 {
//  164 	GPIO_MemMapPtr p;
//  165     
//  166     switch(port)
hw_gpio_get_pt_addr:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??hw_gpio_get_pt_addr_0
        CMP      R0,#+2
        BEQ.N    ??hw_gpio_get_pt_addr_1
        BCC.N    ??hw_gpio_get_pt_addr_2
        CMP      R0,#+4
        BEQ.N    ??hw_gpio_get_pt_addr_3
        BCC.N    ??hw_gpio_get_pt_addr_4
        B.N      ??hw_gpio_get_pt_addr_5
//  167     {
//  168     case PORT_A:
//  169         p = PTA_BASE_PTR;
??hw_gpio_get_pt_addr_0:
        LDR.N    R0,??DataTable1_5  ;; 0x400ff000
//  170         break;
//  171     case PORT_B:
//  172         p = PTB_BASE_PTR;
//  173         break;
//  174     case PORT_C:
//  175         p = PTC_BASE_PTR;
//  176         break;
//  177     case PORT_D:
//  178         p = PTD_BASE_PTR;
//  179         break;
//  180     case PORT_E:
//  181         p = PTE_BASE_PTR;
//  182         break;
//  183     default:
//  184         return 0; //���������Ч����
//  185     }
//  186     
//  187     return p;
??hw_gpio_get_pt_addr_6:
??hw_gpio_get_pt_addr_7:
        BX       LR               ;; return
??hw_gpio_get_pt_addr_2:
        LDR.N    R0,??DataTable1_6  ;; 0x400ff040
        B.N      ??hw_gpio_get_pt_addr_6
??hw_gpio_get_pt_addr_1:
        LDR.N    R0,??DataTable1_7  ;; 0x400ff080
        B.N      ??hw_gpio_get_pt_addr_6
??hw_gpio_get_pt_addr_4:
        LDR.N    R0,??DataTable1_8  ;; 0x400ff0c0
        B.N      ??hw_gpio_get_pt_addr_6
??hw_gpio_get_pt_addr_3:
        LDR.N    R0,??DataTable1_9  ;; 0x400ff100
        B.N      ??hw_gpio_get_pt_addr_6
??hw_gpio_get_pt_addr_5:
        MOVS     R0,#+0
        B.N      ??hw_gpio_get_pt_addr_7
//  188 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40049000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x4004a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x4004b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x4004c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0x400ff100

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  189 
//  190 //===========================================================================
// 
// 328 bytes in section .text
// 
// 328 bytes of CODE memory
//
//Errors: none
//Warnings: none
