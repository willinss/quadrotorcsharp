///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.40.1.53790/W32 for ARM    03/Aug/2015  09:48:05 /
// Copyright 1999-2012 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ /
//                    (¸ÄI2C)\src\Sources\C\Component_C\OpticaSensor.c        /
//    Command line =  "C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³ /
//                    µ(¸ÄI2C)\src\Sources\C\Component_C\OpticaSensor.c" -D   /
//                    IAR -D TWR_K60N512 -lCN "C:\Users\Thinkpad\Desktop\quad /
//                    rotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\bin\Flash\List\" -lB   /
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
//                    (¸ÄI2C)\bin\Flash\List\OpticaSensor.s                   /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME OpticaSensor

        #define SHT_PROGBITS 0x1

        EXTERN Delay_ms
        EXTERN hw_gpio_get
        EXTERN hw_gpio_init
        EXTERN hw_gpio_set
        EXTERN uart_send1

        PUBLIC AnalogSPI
        PUBLIC InitOpticalFlowSensor
        PUBLIC ReadByte
        PUBLIC Read_Sensor_Byte
        PUBLIC Sensor_End
        PUBLIC Sensor_Start
        PUBLIC WriteByte
        PUBLIC Write_Address
        PUBLIC Write_Data
        PUBLIC `data`
        PUBLIC print_pixel_data
        PUBLIC reset

// C:\Users\Thinkpad\Desktop\quadrotor150720·ÉÐÐÆ÷¸úËæÐ¡³µ(¸ÄI2C)\src\Sources\C\Component_C\OpticaSensor.c
//    1 #include"OpticalSensor.h"
//    2 
//    3 #define SOUT_0  hw_gpio_set(PORT_E, 3, 0)
//    4 #define SOUT_1  hw_gpio_set(PORT_E, 3, 1)
//    5 
//    6 #define SCLK_0  hw_gpio_set(PORT_E, 1, 0)
//    7 #define SCLK_1  hw_gpio_set(PORT_E, 1, 1)
//    8 
//    9 #define SIN     hw_gpio_get(PORT_D, 3)
//   10 
//   11 
//   12 #define NCS_0  hw_gpio_set(PORT_D, 2, 0)
//   13 #define NCS_1  hw_gpio_set(PORT_D, 2, 1)
//   14 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   15 void AnalogSPI(void)
//   16 {
AnalogSPI:
        PUSH     {R7,LR}
//   17     hw_gpio_init(PORT_E, 3, 1, 1);       //PTE1 SOUT
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+4
        BL       hw_gpio_init
//   18     hw_gpio_init(PORT_E, 1, 1, 1);       //PTE2  SCLK
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       hw_gpio_init
//   19     hw_gpio_init(PORT_D, 3, 0, 1);       //PTE3  SIN
        MOVS     R3,#+1
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+3
        BL       hw_gpio_init
//   20     hw_gpio_init(PORT_D, 2, 1, 1) ;      //PTE4   NCS
        MOVS     R3,#+1
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOVS     R0,#+3
        BL       hw_gpio_init
//   21 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 void Sensor_Start(void)
//   23 {
Sensor_Start:
        PUSH     {R7,LR}
//   24     SCLK_1;
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       hw_gpio_set
//   25     NCS_0;
        MOVS     R2,#+0
        MOVS     R1,#+2
        MOVS     R0,#+3
        BL       hw_gpio_set
//   26 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   27 void Sensor_End(void)
//   28 {
Sensor_End:
        PUSH     {R7,LR}
//   29     NCS_1;//¹Ø±Õ×ÜÏß
        MOVS     R2,#+1
        MOVS     R1,#+2
        MOVS     R0,#+3
        BL       hw_gpio_set
//   30 }
        POP      {R0,PC}          ;; return
//   31 
//   32 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   33 void Write_Address(uint8 addr, uint8 option)
//   34 {
Write_Address:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//   35     uint8 i, k;
//   36     if(option == Write)addr |= 0x80;
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??Write_Address_0
        ORRS     R4,R4,#0x80
//   37     Sensor_Start();
??Write_Address_0:
        BL       Sensor_Start
//   38     k = 0x80; //´Ó¸ßÎ»µØÖ·¿ªÊ¼´«ËÍ
        MOVS     R6,#+128
//   39     for(i = 0; i < 8; i++)
        MOVS     R5,#+0
        B.N      ??Write_Address_1
//   40     {
//   41         SCLK_0;
//   42         if(addr & k)    SOUT_1;
//   43         else    SOUT_0;
??Write_Address_2:
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+4
        BL       hw_gpio_set
//   44         asm("nop");
??Write_Address_3:
        nop
//   45         asm("nop");
        nop
//   46         asm("nop");
        nop
//   47         SCLK_1;
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       hw_gpio_set
//   48         k >>= 1;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSRS     R6,R6,#+1
//   49         asm("nop");
        nop
//   50         asm("nop");
        nop
//   51         asm("nop");
        nop
        ADDS     R5,R5,#+1
??Write_Address_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BCS.N    ??Write_Address_4
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       hw_gpio_set
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        TST      R0,R6
        BEQ.N    ??Write_Address_2
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+4
        BL       hw_gpio_set
        B.N      ??Write_Address_3
//   52     }
//   53 }
??Write_Address_4:
        POP      {R4-R6,PC}       ;; return
//   54 
//   55 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   56 void Write_Data(uint8 temp)
//   57 {
Write_Data:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//   58     uint8 i, k;
//   59     k = 0x80; //´Ó¸ßÎ»µØÖ·¿ªÊ¼´«ËÍ
        MOVS     R6,#+128
//   60     for(i = 0; i < 8; i++)
        MOVS     R5,#+0
        B.N      ??Write_Data_0
//   61     {
//   62         SCLK_0;
//   63         if(temp & k)    SOUT_1;
//   64         else    SOUT_0;
??Write_Data_1:
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,#+4
        BL       hw_gpio_set
//   65         asm("nop");
??Write_Data_2:
        nop
//   66         asm("nop");
        nop
//   67         asm("nop");
        nop
//   68         SCLK_1;
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       hw_gpio_set
//   69         k >>= 1;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSRS     R6,R6,#+1
//   70         asm("nop");
        nop
//   71         asm("nop");
        nop
//   72         asm("nop");
        nop
        ADDS     R5,R5,#+1
??Write_Data_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BCS.N    ??Write_Data_3
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       hw_gpio_set
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        TST      R0,R6
        BEQ.N    ??Write_Data_1
        MOVS     R2,#+1
        MOVS     R1,#+3
        MOVS     R0,#+4
        BL       hw_gpio_set
        B.N      ??Write_Data_2
//   73     }
//   74 
//   75     Delay_ms(0.06);       //ÑÓÊ±60usÒÔÉÏÈ·±£Ð´²Ù×÷Íê³É
??Write_Data_3:
        LDR.N    R0,??DataTable3  ;; 0x3d75c28f
        BL       Delay_ms
//   76     Sensor_End();
        BL       Sensor_End
//   77 }
        POP      {R4-R6,PC}       ;; return
//   78 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   79 uint8 Read_Sensor_Byte(void)
//   80 {
Read_Sensor_Byte:
        PUSH     {R3-R5,LR}
//   81     uint8 i, dat;
//   82     for(i = 0; i < 8; i++)
        MOVS     R4,#+0
        B.N      ??Read_Sensor_Byte_0
//   83     {
//   84         SCLK_0;
??Read_Sensor_Byte_1:
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       hw_gpio_set
//   85         dat <<= 1;
        LSLS     R5,R5,#+1
//   86         asm("nop");
        nop
//   87         asm("nop");
        nop
//   88         asm("nop");
        nop
//   89         SCLK_1;
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       hw_gpio_set
//   90         if(SIN) dat++;     //ÏÈ¶Á¸ßÎ»Êý¾Ý
        MOVS     R1,#+3
        MOVS     R0,#+3
        BL       hw_gpio_get
        CMP      R0,#+0
        BEQ.N    ??Read_Sensor_Byte_2
        ADDS     R5,R5,#+1
//   91         asm("nop");
??Read_Sensor_Byte_2:
        nop
//   92         asm("nop");
        nop
//   93         asm("nop");
        nop
//   94     }
        ADDS     R4,R4,#+1
??Read_Sensor_Byte_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BCC.N    ??Read_Sensor_Byte_1
//   95     Sensor_End();
        BL       Sensor_End
//   96     return(dat);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
//   97 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   98 void reset(void)
//   99 {
reset:
        PUSH     {R7,LR}
//  100     hw_gpio_set(PORT_A, 17, 1);
        MOVS     R2,#+1
        MOVS     R1,#+17
        MOVS     R0,#+0
        BL       hw_gpio_set
//  101     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  102     hw_gpio_set(PORT_A, 17, 0);
        MOVS     R2,#+0
        MOVS     R1,#+17
        MOVS     R0,#+0
        BL       hw_gpio_set
//  103 }
        POP      {R0,PC}          ;; return
//  104 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  105 uint8 ReadByte(uint8 Addr)
//  106 {
ReadByte:
        PUSH     {R7,LR}
//  107     uint8 dat;
//  108     Write_Address(Addr, Read);
        MOVS     R1,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Write_Address
//  109     Delay_ms(0.08);
        LDR.N    R0,??DataTable3_1  ;; 0x3da3d70a
        BL       Delay_ms
//  110     dat = Read_Sensor_Byte();
        BL       Read_Sensor_Byte
//  111     return dat;
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return
//  112 }
//  113 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  114 void WriteByte(uint8 Addr, uint8 Dat)
//  115 {
WriteByte:
        PUSH     {R4,LR}
        MOVS     R4,R1
//  116     Write_Address(Addr, Write);
        MOVS     R1,#+0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Write_Address
//  117     Delay_ms(0.08);
        LDR.N    R0,??DataTable3_1  ;; 0x3da3d70a
        BL       Delay_ms
//  118     Write_Data(Dat);
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       Write_Data
//  119 }
        POP      {R4,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  120  uint8 data[30][30];
`data`:
        DS8 900

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  121 void print_pixel_data()
//  122 {
print_pixel_data:
        PUSH     {R4-R6,LR}
//  123     int16 i,j;
//  124     //bool isFirstPixel = true;
//  125     uint8 regValue;
//  126     uint8 pixelValue;
//  127     
//  128     // write to frame capture register to force capture of frame
//  129     WriteByte(ADNS3080_FRAME_CAPTURE,0x83);
        MOVS     R1,#+131
        MOVS     R0,#+19
        BL       WriteByte
//  130 
//  131     // wait 3 frame periods + 10 nanoseconds for frame to be captured
//  132     // min frame speed is 2000 frames/second so 1 frame = 500 nano seconds.
//  133     // so 500 x 3 + 10 = 1510
//  134     Delay_ms(2);
        MOVS     R0,#+1073741824
        BL       Delay_ms
//  135 
//  136     // display the pixel data
//  137     for( i=0; i<ADNS3080_PIXELS_Y; i++ ) {
        MOVS     R4,#+0
        B.N      ??print_pixel_data_0
//  138         for( j=0; j<ADNS3080_PIXELS_X; j++ ) {
//  139           //  regValue = read_register(ADNS3080_FRAME_CAPTURE);
//  140          data[i][j] =   ReadByte(ADNS3080_FRAME_CAPTURE);
??print_pixel_data_1:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R0,#+30
        LDR.N    R1,??DataTable3_2
        SMLABB   R6,R4,R0,R1
        MOVS     R0,#+19
        BL       ReadByte
        STRB     R0,[R5, R6]
//  141         regValue =  data[i][j];
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        MOVS     R0,#+30
        LDR.N    R1,??DataTable3_2
        SMLABB   R0,R4,R0,R1
        LDRB     R0,[R5, R0]
//  142          pixelValue = ( regValue << 2 );
        LSLS     R1,R0,#+2
//  143          uart_send1(UART0,pixelValue);
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable3_3  ;; 0x4006a000
        BL       uart_send1
//  144         }
        ADDS     R5,R5,#+1
??print_pixel_data_2:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+30
        BLT.N    ??print_pixel_data_1
        ADDS     R4,R4,#+1
??print_pixel_data_0:
        SXTH     R4,R4            ;; SignExt  R4,R4,#+16,#+16
        CMP      R4,#+30
        BGE.N    ??print_pixel_data_3
        MOVS     R5,#+0
        B.N      ??print_pixel_data_2
//  145 
//  146     }
//  147 
//  148     // hardware reset to restore sensor to normal operation
//  149     reset();
??print_pixel_data_3:
        BL       reset
//  150 }
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x3d75c28f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x3da3d70a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     `data`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x4006a000
//  151 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  152 uint8 InitOpticalFlowSensor(void)
//  153 {
InitOpticalFlowSensor:
        PUSH     {R3-R5,LR}
//  154   uint8 Id = 0;
        MOVS     R4,#+0
//  155   uint8 TEMP = 0;
        MOVS     R5,#+0
//  156   Id = ReadByte(0x00);
        MOVS     R0,#+0
        BL       ReadByte
        MOVS     R4,R0
//  157   if(Id == 0x17)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+23
        BNE.N    ??InitOpticalFlowSensor_0
//  158   {
//  159     TEMP = ReadByte(0x0A);
        MOVS     R0,#+10
        BL       ReadByte
        MOVS     R5,R0
//  160     TEMP |= 0X10;
        ORRS     R5,R5,#0x10
//  161     WriteByte(0x0A,TEMP);
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,#+10
        BL       WriteByte
//  162     Delay_ms(1);
        MOVS     R0,#+1065353216
        BL       Delay_ms
//  163     WriteByte(0x12,0x00); //Motion clear
        MOVS     R1,#+0
        MOVS     R0,#+18
        BL       WriteByte
//  164     return 1;
        MOVS     R0,#+1
        B.N      ??InitOpticalFlowSensor_1
//  165   }
//  166   else return 0;
??InitOpticalFlowSensor_0:
        MOVS     R0,#+0
??InitOpticalFlowSensor_1:
        POP      {R1,R4,R5,PC}    ;; return
//  167 
//  168 }

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
// 900 bytes in section .bss
// 612 bytes in section .text
// 
// 612 bytes of CODE memory
// 900 bytes of DATA memory
//
//Errors: none
//Warnings: none
