#include "ftm.h"
#include "sysinit.h"	

void hw_FTM_init(void)
    { PORTA_PCR12 = PORT_PCR_MUX(3); 
      PORTA_PCR13 = PORT_PCR_MUX(3);
      PORTB_PCR18 = PORT_PCR_MUX(3); 
      PORTB_PCR19 = PORT_PCR_MUX(3);
      
      SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
      SIM_SCGC6|=SIM_SCGC6_FTM1_MASK;         //ʹ��FTMʱ��      
      SIM_SCGC3|=SIM_SCGC3_FTM2_MASK;
      
      FTM1_C0SC |= FTM_CnSC_ELSB_MASK;
      FTM1_C0SC &= ~FTM_CnSC_ELSA_MASK;
      FTM1_C0SC |= FTM_CnSC_MSB_MASK;   
      FTM1_C1SC |= FTM_CnSC_ELSB_MASK;
      FTM1_C1SC &= ~FTM_CnSC_ELSA_MASK;
      FTM1_C1SC |= FTM_CnSC_MSB_MASK;  
      FTM1_SC = 0x2C; //not enable the interrupt mask,up-down counting mode,System clock,Divide by 32  16          
      
      FTM2_C0SC |= FTM_CnSC_ELSB_MASK;
      FTM2_C0SC &= ~FTM_CnSC_ELSA_MASK;
      FTM2_C0SC |= FTM_CnSC_MSB_MASK;   
      FTM2_C1SC |= FTM_CnSC_ELSB_MASK;
      FTM2_C1SC &= ~FTM_CnSC_ELSA_MASK;
      FTM2_C1SC |= FTM_CnSC_MSB_MASK;  
      FTM2_SC = 0x2C; //not enable the interrupt mask,up-down counting mode,System clock,Divide by 32 16           
            
      
      FTM1_MODE |= FTM_MODE_WPDIS_MASK;      

      FTM1_MODE &= ~1;
      
      FTM2_MODE |= FTM_MODE_WPDIS_MASK;      

            FTM2_MODE &= ~1;
     // FTM1_OUTMASK=0XFE;   //0 Channel output is not masked. It continues to operate normally.
                           //1 Channel output is masked. It is forced to its inactive state.
      
      FTM1_COMBINE=0;      //Function for Linked Channels (FTMx_COMBINE)
      FTM1_OUTINIT=0;
      FTM1_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
      FTM1_POL=0;          //Channels Polarity (FTMx_POL)
                           //0 The channel polarity is active high.
                           //1 The channel polarity is active low.  
      FTM2_COMBINE=0;      //Function for Linked Channels (FTMx_COMBINE)
      FTM2_OUTINIT=0;
      FTM2_EXTTRIG=0;      //FTM External Trigger (FTMx_EXTTRIG)
      FTM2_POL=0;          //Channels Polarity (FTMx_POL)
                                 //0 The channel polarity is active high.
                                 //1 The channel polarity is active low.  
      FTM1_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;
      FTM1_INVCTRL=0;     //��ת����
      FTM1_SWOCTRL=0;     //����������F TM Software Output Control (FTMx_SWOCTRL)
      FTM1_PWMLOAD=0;     //FTM PWM Load
                          //BIT9: 0 Loading updated values is disabled.
                          //1 Loading updated values is enabled.
      FTM2_QDCTRL &=~FTM_QDCTRL_QUADEN_MASK;
      FTM2_INVCTRL=0;     //��ת����
      FTM2_SWOCTRL=0;     //����������F TM Software Output Control (FTMx_SWOCTRL)
      FTM2_PWMLOAD=0;     //FTM PWM Load
                                //BIT9: 0 Loading updated values is disabled.
                                //1 Loading updated values is enabled.
      FTM1_CNTIN=0;        //Counter Initial Value      
      FTM1_MOD=3750;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001) 
                           //��������ʱ�ӳ�ʼ�����������Եõ�4��Ƶ��Ƶ�ʣ����磺ϵͳ60MƵ��ʱ��PWMƵ����15M,�Դ�����
                           //PMWƵ��=ϵͳƵ��/4/(2^FTM1_SC_PS)/FTM1_MOD
                           //PMWƵ��=125M/4/(2^4)/19531=125000000/4/32/19531=50hz
      //PMW��Ƶ=125M/4/(2^5)=976562.5=1M,һ��������1us,1500���������1.5ms
      FTM2_CNTIN=0;        //Counter Initial Value      
      FTM2_MOD=3750;       //Modulo value,The EPWM period is determined by (MOD - CNTIN + 0x0001) 
                                //��������ʱ�ӳ�ʼ�����������Եõ�4��Ƶ��Ƶ�ʣ����磺ϵͳ60MƵ��ʱ��PWMƵ����15M,�Դ�����
                                //PMWƵ��=ϵͳƵ��/4/(2^FTM1_SC_PS)/FTM1_MOD
                                //PMWƵ��=180M/4/(2^5)/28125=180000000/4/32/28125=50hz
           //PMW��Ƶ=125M/4/(2^5)=976562.5=1M,һ��������1us,1500���������1.5ms
      FTM1_C0V= (int)(1000 / 0.6667) ;       //���� the pulse width(duty cycle) is determined by (CnV - CNTIN).
      FTM1_C1V= (int)(1000 / 0.6667) ; 
      FTM1_CNT=0;          //ֻ�е�16λ����
      
      FTM2_C0V= (int)(1000 / 0.6667);        //���� the pulse width(duty cycle) is determined by (CnV - CNTIN).
      FTM2_C1V= (int)(1000 / 0.6667); 
      FTM2_CNT=0;          //ֻ�е�16λ����
}
void set_pwm(uint16 a,uint16 b,uint16 c,uint16 d)
{     if      (a >= 2000)a = 2000;
      else if (a <= 1000)a = 1000;
      if      (b >= 2000)b = 2000;
      else if (b <= 1000)b = 1000;
      if      (c >= 2000)c = 2000;
      else if (c <= 1000)c = 1000;
      if      (d >= 2000)d = 2000;
      else if (d <= 1000)d = 1000;
      FTM1_C0V = (int)(c / 0.6667);       //���� the pulse width(duty cycle) is determined by (CnV - CNTIN).
      FTM1_C1V = (int)(d / 0.6667);
      FTM2_C0V = (int)(b / 0.6667);       //���� the pulse width(duty cycle) is determined by (CnV - CNTIN).
      FTM2_C1V = (int)(a / 0.6667);//a
}

void SteerPWM_init()
{
        
	ftm0_pwm_init(100);//Ƶ�ʳ�ʼ��   

        ftm0_pwm_open(0,0);//��ʼ��ͨ��4,��PTD4��,ռ�ձ�Ϊ0 0~10000,0.00%��100.00%
	ftm0_pwm_change_duty(0,0);//����ռ�ձ�
        
	ftm0_pwm_open(5,0);//��ʼ��ͨ��1,��PTC2��,ռ�ձ�Ϊ0 0~10000,0.00%��100.00%
	ftm0_pwm_change_duty(5,0);//����ռ�ձ�
       
}


//ȫ�ֱ�������
uint32 LPLD_FTM0_MOD;
uint32 LPLD_FTM1_MOD;
uint32 LPLD_FTM2_MOD;

/*
 * LPLD_FTM0_PWM_Init
 * FTM0ģ��PWM���ܳ�ʼ������
 * 
 * ����:
 *    freq--����Ƶ�ʣ���λHz
 *
 * ���:
 *    0--���ô���
 *    1--���óɹ�
 */
uint8 ftm0_pwm_init(uint32 freq)
{
	uint32 bus_clk_hz;
	uint32 mod;
	uint8 ps;

	bus_clk_hz = periph_clk_khz*1000;
	  
	  if(freq>bus_clk_hz) return 0;
	  
	  if((mod=bus_clk_hz/(freq*128)) < 0xFFFFu)
	  {
	    ps = 7;
	    LPLD_FTM0_MOD = mod;
	    if((mod=bus_clk_hz/(freq*64)) < 0xFFFFu)
	    {
	      ps = 6;   
	      LPLD_FTM0_MOD = mod;  
	      if((mod=bus_clk_hz/(freq*32)) < 0xFFFFu)
	      {
	        ps = 5; 
	        LPLD_FTM0_MOD = mod;  
	        if((mod=bus_clk_hz/(freq*16)) < 0xFFFFu)
	        {
	          ps = 4;  
	          LPLD_FTM0_MOD = mod;    
	          if((mod=bus_clk_hz/(freq*8)) < 0xFFFFu)
	          {
	            ps = 3;
	            LPLD_FTM0_MOD = mod;
	            if((mod=bus_clk_hz/(freq*4)) < 0xFFFFu)
	            {
	              ps = 2;
	              LPLD_FTM0_MOD = mod;
	              if((mod=bus_clk_hz/(freq*2)) < 0xFFFFu)
	              {
	                ps = 1;
	                LPLD_FTM0_MOD = mod;
	                if((mod=bus_clk_hz/(freq*1)) < 0xFFFFu)
	                {
	                  ps = 0;
	                  LPLD_FTM0_MOD = mod;
	                }
	              }
	            }
	          }
	        }  
	      }
	    }
	  }
	  else
	  {
	    return 0;
	  }
	  
	  // ʹ��FTMʱ��ģ��
	  SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;
	  
	  // ����FTM���ƼĴ���
	  // �����ж�, �Ӽ���ģʽ, ʱ��Դ:System clock��Bus Clk��, ��Ƶϵ��:8
	  // ����SysClk = 50MHz, SC_PS=3, FTM Clk = 50MHz/2^3 = 6.25MHz
	  FTM0_SC = FTM_SC_CLKS(1)|FTM_SC_PS(ps);
	  
	  // ����PWM���ڼ�ռ�ձ�
	  //    PWM���� = (MOD-CNTIN+1)*FTMʱ������ :
	  // ����FTM������ʼֵ
	  FTM0_CNT = 0;
	  FTM0_CNTIN = 0;
	  // ����FTM����MODֵ
	  FTM0_MOD = LPLD_FTM0_MOD;
	  
	  return 1;
}

/*
 * 
 * FTM0ģ��PWM���ͨ����ռ�ձ�����
 * 
 * ˵��: ����GPIOҲ������ΪFTM0���,������ֻ����PTC��PTD,����ı��������޸� 
 * 
 * ����:
 *    channel - PWM���ͨ��
 *      |__0--PTC1
 *      |__1--PTC2
 *      |__2--PTC3
 *      |__3--PTC4
 *      |__4--PTD4
 *      |__5--PTD5
 *      |__6--PTD6
 *      |__7--PTD7
 *    duty - PWM���ռ�ձ�
 *      |__0~10000--ռ�ձ�0.00%~100.00%
 *
 * ���:
 *    0--���ô���
 *    1--���óɹ�
 */
uint8 ftm0_pwm_open(uint8 channel, uint32 duty)
{
	uint32 cv;
	  volatile uint32 mod;
	  
	  if(duty>10000) return 0;
	  //ռ�ձ� = (CnV-CNTIN)/(MOD-CNTIN+1)
	  mod = LPLD_FTM0_MOD;
	  cv = (duty*(mod-0+1)+0)/10000;
	  
	  //ѡ�񲢿���ͨ��
	  switch(channel)
	  {
	    case 0:
	    case 1:
	    case 2:
	    case 3:
	      SIM_SCGC5 |= SIM_SCGC5_PORTC_MASK;
	      PORT_PCR_REG(PORTC_BASE_PTR, channel+1) = PORT_PCR_MUX(4);
	      break;
	    case 4:
	    case 5:
	    case 6:
	    case 7:
	      SIM_SCGC5 |= SIM_SCGC5_PORTD_MASK;
	      PORT_PCR_REG(PORTD_BASE_PTR, channel) = PORT_PCR_MUX(4);
	      break;
	    default:
	       return 0;
	  }  
	  
	  // ����FTMͨ�����ƼĴ��� 
	  // ͨ��ģʽ MSB:MSA-1X, ͨ����Եѡ�� ELSB:ELSA-10
	  FTM_CnSC_REG(FTM0_BASE_PTR, channel) = FTM_CnSC_MSB_MASK|FTM_CnSC_ELSB_MASK;
	  // ����FTMͨ��ֵ
	  FTM_CnV_REG(FTM0_BASE_PTR, channel) = cv;
	  
	  return 1;
}

/*
 * LPLD_FTM0_PWM_ChangeDuty
 * �ı�FTM0ģ��PWM���ͨ��ռ�ձ�
 *
 * ����:
 *    channel - PWM���ͨ��
 *      |__0--PTC1
 *      |__1--PTC2
 *      |__2--PTC3
 *      |__3--PTC4
 *      |__4--PTD4
 *      |__5--PTD5
 *      |__6--PTD6
 *      |__7--PTD7
 *    duty - PWM���ռ�ձ�
 *      |__0~10000--ռ�ձ�0.00%~100.00%
 *
 * ���:
 *    0--���ô���
 *    1--���óɹ�
 */
uint8 ftm0_pwm_change_duty(uint8 channel, uint32 duty)
{
  uint32 cv;
  volatile uint32 mod;
  
  if(duty>10000) return 0;
  //ռ�ձ� = (CnV-CNTIN)/(MOD-CNTIN+1)
  mod = LPLD_FTM0_MOD;
  cv = (duty*(mod-0+1)+0)/10000;
 
  // ����FTMͨ��ֵ
  FTM_CnV_REG(FTM0_BASE_PTR, channel) = cv;
  
  return 1;
}