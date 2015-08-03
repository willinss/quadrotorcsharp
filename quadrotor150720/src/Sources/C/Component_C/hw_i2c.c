//============================================================================
//�ļ����ƣ�hw_i2c.h  
//���ܸ�Ҫ��uart����ͷ�ļ�
//��Ȩ���У����ݴ�ѧ��˼����Ƕ��ʽ����(sumcu.suda.edu.cn)
//�汾���£�2011-11-17     V1.0       stone    ��д��K60��i2c����
//============================================================================

#ifndef __I2C_H__
#define __I2C_H__
	
#include "common.h"
#include "hw_i2c.h"


//============================================================================
//�������ƣ�hw_i2c_init                                                        
//���ܸ�Ҫ����ʼ��IICXģ�顣                                                
//����˵����MoudleNum:ģ���                                                         
//�������أ���                                                                  
//============================================================================
void hw_i2c_init(int MoudleNum)
{
	//��ȡi2cģ���ַ
	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
	
	if(num == I2C0)
	{
		//��I2C0ģ��ʱ��
		SIM_SCGC4 |= SIM_SCGC4_I2C0_MASK; 
		//�������Ÿ���ΪI2C0����
		//I2C0 SCLʹ��PTB0
		//I2C0 SDAʹ��PTb1
		PORTB_PCR0 = PORT_PCR_MUX(2);
		PORTB_PCR1 = PORT_PCR_MUX(2);
		//���� MULT �� ICR   
		//оƬ�ֲ��Ƽ�����100K�Լ�СMCU����
		//k60��MCU����Ƶ��Ϊ48M���������Ϸ�Ƶ
		I2C0_F  = 0x19;  //300k  
		//ʹ��I2C0��������Ӧ���ź�
		I2C0_C1 = I2C_C1_IICEN_MASK | I2C_C1_TXAK_MASK;      
	}
	else
	{
		//��I2C1ģ��ʱ��
		SIM_SCGC4 |= SIM_SCGC4_I2C1_MASK; 
		//�������Ÿ���ΪI2C1����
		//I2C1 SCLʹ��PTC10
		//I2C1 SDAʹ��PTC11
		PORTC_PCR10 = PORT_PCR_MUX(2);
		PORTC_PCR11 = PORT_PCR_MUX(2);
		//���� MULT �� ICR   
		//оƬ�ֲ��Ƽ�����100K�Լ�СMCU����
		//k60��MCU����Ƶ��Ϊ48M���������Ϸ�Ƶ
		I2C1_F  = 0x19;   //300k 1d = 160 1B = 128 375K  19 = 96  500K
		//ʹ��I2C1��������Ӧ���ź�
		I2C1_C1 = I2C_C1_IICEN_MASK | I2C_C1_TXAK_MASK;      
	}
}

//============================================================================
//�������ƣ�hw_send_signal                                                        
//���ܸ�Ҫ��������Ҫ������ʼ��ֹͣ�ź�   ��                                                
//����˵����         MoudleNum:ģ���       
//          Signal: 'S'(Start),������ʼ�ź�      'O'(Over),  ����ֹͣ�ź�               
//�������أ���                                                                  
//============================================================================
void hw_send_signal(uint8 Signal,int MoudleNum)
{
	//��ȡi2cģ���ַ
	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
	
	if(num == I2C0)//ģ��0
	{
		if (Signal == 'S')    
		{
		  i2c0_Start(); //����ģʽѡ��λMST��0��Ϊ1,���Բ�����ʼ�ź�  
		}
		else if (Signal == 'O')
		{
		  i2c0_Stop();//����ģʽѡ��λMST��1��Ϊ0,���Բ���ֹͣ�ź�
		}
	}
	else if(num == I2C1)//ģ��1
	{
		if (Signal == 'S')    
		{
		  i2c1_Start(); //����ģʽѡ��λMST��0��Ϊ1,���Բ�����ʼ�ź�  
		}
		else if (Signal == 'O')
		{
		  i2c1_Stop();//����ģʽѡ��λMST��1��Ϊ0,���Բ���ֹͣ�ź�
		}
	}
	        
                                              
      
}



//============================================================================
//�������ƣ�hw_wait                                                        
//���ܸ�Ҫ�� ��ʱ����,ѭ��������Ӧ���־λ,������ɱ�־λ,�ж�MCU         
//          �Ƿ���յ�Ӧ���źŻ�һ���ֽ��Ƿ����������ϴ������                                            
//����˵����         MoudleNum:ģ���       
//             x:x = 'A'(Ack),�ȴ�Ӧ��;x = 'T'(Transmission),�ȴ�һ���ֽ�        
//                 ���ݴ������                   
//�������أ�0:�յ�Ӧ���źŻ�һ���ֽڴ������;
//         1:δ�յ�Ӧ���źŻ�һ�� �ֽ�û������                                                                                                                            
//============================================================================

uint8 hw_wait(uint8 x,int MoudleNum)

{
    uint16 ErrTime, i;
    I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
    ErrTime = 255*10;            //�����ѯ��ʱʱ��
    
    
    //��ȡi2cģ���ַ
    
    
	for (i = 0;i < ErrTime;i++)
	{
		if (x == 'A')           //�ȴ�Ӧ���ź�
		{
			  if(( I2C_S_REG(num)  & I2C_S_RXAK_MASK)==0)
				 return 0;      //������һ���ֽں�,�յ��˴ӻ���Ӧ���ź�               
		}
		else if (x == 'T')      //�ȴ��������һ���ֽ��ź�
		{
			if ((I2C_S_REG(num) & I2C_S_IICIF_MASK) != 0)    
			{
				(I2C_S_REG(num) |=(0 | I2C_S_IICIF_MASK));  //��IICIF��־λ
				return 0;       //�ɹ�������һ���ֽ�
			}       
		}
	}
	if (i >= ErrTime)
		return 1;               //��ʱ,û���յ�Ӧ���źŻ�����һ���ֽ�   	
}


//============================================================================
//�������ƣ�hw_iic_read1                                                        
//���ܸ�Ҫ���Ӵӻ���1���ֽ�����                                            
//����˵����  MoudleNum:ģ���       
//          DeviceAddr:�豸��ַ    
//          AccessAddr:���ʵ�ַ
//          Data:�����յ���һ���ֽ�����  
//�������أ�Ϊ0,�ɹ���һ���ֽ�;Ϊ1,��һ���ֽ�ʧ��  
//����˵��: �ڲ����� hw_send_signal,hw_wait  
//============================================================================
uint8 hw_iic_read1(int MoudleNum,uint8 DeviceAddr, uint8 AccessAddr, uint8 *Data)
{      
      
	//��ȡi2cģ���ַ
	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
	
	I2C_C1_REG(num)     |= 0x10;           //TX = 1,MCU����Ϊ����ģʽ
	hw_send_signal('S',MoudleNum);               //���Ϳ�ʼ�ź� 
	I2C_D_REG(num)  = DeviceAddr & 0xfe;   //�����豸��ַ,��֪ͨ�ӻ���������
	 
	if (hw_wait('T',MoudleNum))                  //�ȴ�һ���ֽ����ݴ������  
	{      

		return 1;                         //û�д��ͳɹ�,��һ���ֽ�ʧ��   
	}
	if (hw_wait('A',MoudleNum))                 //�ȴ��ӻ�Ӧ���ź� 
	{

		return 1;                         //û�еȵ�Ӧ���ź�,��һ���ֽ�ʧ�� 
	}
	I2C_D_REG(num)  = AccessAddr;        //���ͷ��ʵ�ַ    
	if (hw_wait('T',MoudleNum))                //�ȴ�һ���ֽ����ݴ������ 
	{
	 
		return 1;                        //û�д��ͳɹ�,��һ���ֽ�ʧ��
	}
	if (hw_wait('A',MoudleNum))                //�ȴ��ӻ�Ӧ���ź�   
	{
	  
		return 1;                        //û�еȵ�Ӧ���ź�,��һ���ֽ�ʧ��  
	}
	I2C_C1_REG(num) |= 0x04;//��MCU������ģ ʽ�£����λд1������һ�����¿�ʼ�ź�  
	I2C_D_REG(num) = DeviceAddr | 0x01; //֪ͨ�ӻ���Ϊ��������    
	if (hw_wait('T',MoudleNum))               //�ȴ�һ���ֽ����ݴ������  
	{
	 
		return 1;                       //û�д��ͳɹ�,��һ���ֽ�ʧ�� 
	}
	if (hw_wait('A',MoudleNum))               //�ȴ��ӻ�Ӧ���ź�  
	{
	 
		return 1;                      //û�еȵ�Ӧ���ź�,��һ���ֽ�ʧ��
	}
	I2C_C1_REG(num) &= 0xef;           //TX = 0,MCU����Ϊ����ģʽ    
	*Data = I2C_D_REG(num);            //����IIC1D,׼����������   
	if (hw_wait('T',MoudleNum))              //�ȴ�һ���ֽ����ݴ������  
	{  
	 
		return 1;                      //û�д��ͳɹ�,��һ���ֽ�ʧ��  
	}
	hw_send_signal('O',MoudleNum);           //����ֹͣ�ź�    
	*Data = I2C_D_REG(num);            //�������յ���һ������    
	
	return 0;                          //��ȷ���յ�һ���ֽ�����
	
}

//============================================================================
//�������ƣ�hw_iic_write1                                                        
//���ܸ�Ҫ����ӻ�д1���ֽ�����                                           
//����˵����  MoudleNum:ģ���       
//          DeviceAddr:�豸��ַ    
//          AccessAddr:���ʵ�ַ
//          Data:Ҫ�����ӻ���1���ֽ�����  
//�������أ�Ϊ0,�ɹ�дһ���ֽ�;Ϊ1,дһ���ֽ�ʧ�� 
//����˵��: �ڲ����� hw_send_signal,hw_wait  
//============================================================================

uint8 hw_iic_write1(int MoudleNum,uint8 DeviceAddr, uint8 AccessAddr, uint8 Data)
{
	//��ȡi2cģ���ַ
	I2C_MemMapPtr num = hw_i2c_get_base_address(MoudleNum);
	
	I2C_C1_REG(num) |= 0x10;             //TX = 1,MCU����Ϊ����ģʽ
    hw_send_signal('S',MoudleNum);             //���Ϳ�ʼ�ź�
    I2C_D_REG(num) = DeviceAddr & 0xfe;  //�����豸��ַ,��֪ͨ�ӻ���������
    if (hw_wait('T',MoudleNum))                //�ȴ�һ���ֽ����ݴ������
        return 1;                        //û�д��ͳɹ�,дһ���ֽ�ʧ��
    if (hw_wait('A',MoudleNum))               //�ȴ��ӻ�Ӧ���ź�
        return 1;                       //û�еȵ�Ӧ���ź�,дһ���ֽ�ʧ��   
    I2C_D_REG(num) = AccessAddr;         //���ͷ��ʵ�ַ
    if (hw_wait('T',MoudleNum))               //�ȴ�һ���ֽ����ݴ������
        return 1;                       //û�д��ͳɹ�,дһ���ֽ�ʧ��
    if (hw_wait('A',MoudleNum))               //�ȴ��ӻ�Ӧ���ź�
        return 1;                      //û�еȵ�Ӧ���ź�,дһ���ֽ�ʧ��   
    I2C_D_REG(num) = Data;             //д����
    if (hw_wait('T',MoudleNum))              //�ȴ�һ���ֽ����ݴ������
        return 1;                      //û�д��ͳɹ�,дһ���ֽ�ʧ��
    if (hw_wait('A',MoudleNum))              //�ȴ��ӻ�Ӧ���ź�
        return 1;                      //û�еȵ�Ӧ���ź�,дһ���ֽ�ʧ��   
    hw_send_signal('O',MoudleNum);           //����ֹͣ�ź�
    return 0;
}


//============================================================================
//�������ƣ�hw_iic_readn                                                        
//���ܸ�Ҫ�� �Ӵӻ���N���ֽ�����                                             
//����˵����  MoudleNum:ģ���       
//          DeviceAddr:�豸��ַ    
//          AccessAddr:���ʵ�ַ
//          Data:�������ݵĻ�����
//          N:�Ӵӻ������ֽڸ��� 
//�������أ� Ϊ0,�ɹ���N���ֽ�;Ϊ1,��N���ֽ�ʧ��  
//����˵��: �ڲ�����hw_iic_read1  
//============================================================================
uint8 hw_iic_readn(int MoudleNum,uint8 DeviceAddr, uint8 AccessAddr, uint8 Data[], uint8 N)
{
    uint16 i, j;
    for (i = 0;i < N;i++)
    {
        for(j = 0;j <15*40 ;j++); //��С��ʱ(���͵�ÿ���ֽ�֮��Ҫ��ʱ����)
        if (hw_iic_read1(MoudleNum,DeviceAddr, AccessAddr + i, &Data[i]))  
            return 1;             //����һ���ֽ�û�н��յ�,����ʧ�ܱ�־:1
    }
    if (i >= N)
        return 0;                 //�ɹ�����N������,���سɹ���־:0
}


//============================================================================
//�������ƣ�hw_iic_writen                                                        
//���ܸ�Ҫ�� ��ӻ�дN���ֽ�����                                              
//����˵����  MoudleNum:ģ���       
//          DeviceAddr:�豸��ַ    
//          AccessAddr:���ʵ�ַ
//          Data:Ҫд�������  
//          N:�Ӵӻ������ֽڸ��� 
//�������أ� Ϊ0,�ɹ�дN���ֽ�;Ϊ1,дN���ֽ�ʧ��
//����˵��: �ڲ�����hw_iic_write1   
//============================================================================
uint8 hw_iic_writen(int MoudleNum,uint8 DeviceAddr, uint8 AccessAddr,uint8 Data[], uint8 N)
{
    uint16 i, j;
    for (i = 0;i < N;i++)
    {
        for(j = 0;j < 15*40;j++); //��С��ʱ(���͵�ÿ���ֽ�֮��Ҫ��ʱ����)
        if (hw_iic_write1(MoudleNum,DeviceAddr, AccessAddr + i, Data[i]))
            return 1;            //����һ���ֽ�û�з��ͳ�ȥ,����ʧ�ܱ�־:1
    }
    if (i >= N)
        return 0;                //�ɹ�����N������,���سɹ���־:0
}
//============================================================================
//�������ƣ�hw_i2c_get_base_address                                                        
//���ܸ�Ҫ����ȡi2cģ��Ļ�ַ                                                
//����˵����i2cNO:i2cģ���      
//�������أ�i2cģ��Ļ�ֵַ                                                                  
//============================================================================
I2C_MemMapPtr hw_i2c_get_base_address(int i2cNO)
{
	switch(i2cNO)
	{
	case 0:
		return I2C0_BASE_PTR;
		break;
	case 1:
		return I2C1_BASE_PTR;
		break;
	
	}
}
#endif 
