#include "pit.h"
#include "Balance_Kalman.h"
//*
//-------------------------------------------------------
//Kalman滤波，8MHz的处理时间约1.8ms；
//-------------------------------------------------------
float angle, angle_dot; 		//外部需要引用的变量
//-------------------------------------------------------
float Q_angle=0.001, Q_gyro=0.003, R_angle=0.5, dt = 0.01;
/*R_angle =0.025 
Q_angle =0.073
Q_gyro  =0.00008
dt=0.05
*/			//注意：dt的取值为kalman滤波器采样时间;
float P[2][2] = {
							{ 1, 0 },
							{ 0, 1 }
						};
	
float Pdot[4] ={0,0,0,0};

const char C_0 = 1;

float q_bias, angle_err, PCt_0, PCt_1, E, K_0, K_1, t_0, t_1;
//-------------------------------------------------------

float Kalman_Filter(float angle_m,float gyro_m)			//gyro_m:gyro_measure
{
	angle+=(gyro_m-q_bias) * dt;//先验估计
	
	Pdot[0]=Q_angle - P[0][1] - P[1][0];// Pk-' 先验估计误差协方差的微分
	Pdot[1]=- P[1][1];
	Pdot[2]=- P[1][1];
	Pdot[3]=Q_gyro;
	
	P[0][0] += Pdot[0] * dt;// Pk- 先验估计误差协方差微分的积分 = 先验估计误差协方差
	P[0][1] += Pdot[1] * dt;
	P[1][0] += Pdot[2] * dt;
	P[1][1] += Pdot[3] * dt;
	
	
	angle_err = angle_m - angle;//zk-先验估计
	
	
	PCt_0 = C_0 * P[0][0];
	PCt_1 = C_0 * P[1][0];
	
	E = R_angle + C_0 * PCt_0;
	
	K_0 = PCt_0 / E;//Kk
	K_1 = PCt_1 / E;
	
	t_0 = PCt_0;
	t_1 = C_0 * P[0][1];

	P[0][0] -= K_0 * t_0;//后验估计误差协方差
	P[0][1] -= K_0 * t_1;
	P[1][0] -= K_1 * t_0;
	P[1][1] -= K_1 * t_1;
	
	
	angle	+= K_0 * angle_err;//后验估计
	q_bias	+= K_1 * angle_err;//后验估计
	angle_dot = gyro_m-q_bias;//输出值（后验估计）的微分 = 角速度
        return angle;
}




float angle1, angle_dot1; 		//外部需要引用的变量
//-------------------------------------------------------
float Q_angle1=0.001, Q_gyro1=0.003, R_angle1=0.5, dt1 = 0.01;
			//注意：dt的取值为kalman滤波器采样时间;
float P1[2][2] = {
							{ 1, 0 },
							{ 0, 1 }
						};
	
float Pdot1[4] ={0,0,0,0};

const char C_01 = 1;

float q_bias1, angle_err1, PCt_01, PCt_11, E1, K_01, K_11, t_01, t_11;
//-------------------------------------------------------

float Kalman_Filter1(float angle_m1,float gyro_m1)			//gyro_m:gyro_measure
{
	angle1+=(gyro_m1-q_bias1) * dt1;//先验估计
	
	Pdot1[0]=Q_angle1 - P1[0][1] - P1[1][0];// Pk-' 先验估计误差协方差的微分
	Pdot1[1]=- P1[1][1];
	Pdot1[2]=- P1[1][1];
	Pdot1[3]=Q_gyro1;
	
	P1[0][0] += Pdot1[0] * dt1;// Pk- 先验估计误差协方差微分的积分 = 先验估计误差协方差
	P1[0][1] += Pdot1[1] * dt1;
	P1[1][0] += Pdot1[2] * dt1;
	P1[1][1] += Pdot1[3] * dt1;
	
	
	angle_err1 = angle_m1 - angle1;//zk-先验估计
	
	
	PCt_01 = C_01 * P1[0][0];
	PCt_11 = C_01 * P1[1][0];
	
	E1 = R_angle1 + C_01 * PCt_01;
	
	K_01 = PCt_01 / E1;//Kk
	K_11 = PCt_11 / E1;
	
	t_01 = PCt_01;
	t_11 = C_01 * P1[0][1];

	P1[0][0] -= K_01 * t_01;//后验估计误差协方差
	P1[0][1] -= K_01 * t_11;
	P1[1][0] -= K_11 * t_01;
	P1[1][1] -= K_11 * t_11;
	
	
	angle1	+= K_01 * angle_err1;//后验估计
	q_bias1	+= K_11 * angle_err1;//后验估计
	angle_dot1 = gyro_m1-q_bias1;//输出值（后验估计）的微分 = 角速度
        return angle1;
}


float X_b1 = 0 ;   //先验状态估计
float X_a1 = 0 ;   //后验状态估计
float P_b1 = 0 ;   //先验估计误差的协方差
float P_a1 = 1 ;   //后验估计误差的协方差
float K1   = 0 ;   //残余的增益/混合因数
float Q1   = 0.05; //过程激励噪声协方差  
float R1   = 1; //观测噪声协方差

float X_b2 = 0 ;   //先验状态估计
float X_a2 = 0 ;   //后验状态估计
float P_b2 = 0 ;   //先验估计误差的协方差
float P_a2 = 1 ;   //后验估计误差的协方差
float K2   = 0 ;   //残余的增益/混合因数
float Q2   = 0.1; //过程激励噪声协方差  
float R2   = 0.9; //观测噪声协方差

float X_b3 = 0 ;   //先验状态估计
float X_a3 = 0 ;   //后验状态估计
float P_b3 = 0 ;   //先验估计误差的协方差
float P_a3 = 1 ;   //后验估计误差的协方差
float K3   = 0 ;   //残余的增益/混合因数
float Q3   = 0.1; //过程激励噪声协方差  
float R3   = 0.9; //观测噪声协方差

float X_b4 = 0 ;   //先验状态估计
float X_a4 = 0 ;   //后验状态估计
float P_b4 = 0 ;   //先验估计误差的协方差
float P_a4 = 1 ;   //后验估计误差的协方差
float K4   = 0 ;   //残余的增益/混合因数
float Q4   = 0.1; //过程激励噪声协方差  
float R4   = 0.9; //观测噪声协方差

float kalman_filter1(float Z1)
{ X_b1 = X_a1 ;
  P_b1 = P_a1 + Q1 ;
  K1   = P_b1  / (P_b1 + R1) ;
  X_a1 = X_b1 + K1 * (Z1 - X_b1) ;
  P_a1 = (1 - K1) * P_b1 ;
  return X_a1 ;
}        
float kalman_filter2(float Z2)
{ X_b2 = X_a2 ;
  P_b2 = P_a2 + Q2 ;
  K2  =  P_b2  / (P_b2 + R2) ;
  X_a2 = X_b2 + K2 * (Z2 - X_b2) ;
  P_a2 = (1 - K2) * P_b2 ;
  return X_a2 ;
}        
float kalman_filter3(float Z3)
{ X_b3 = X_a3 ;
  P_b3 = P_a3 + Q3 ;
  K3   = P_b3  / (P_b3 + R3) ;
  X_a3 = X_b3 + K3 * (Z3 - X_b3) ;
  P_a3 = (1 - K3) * P_b3 ;
  return X_a3 ;
}
float kalman_filter4(float Z4)
{ X_b4 = X_a4 ;
  P_b4 = P_a4 + Q4 ;
  K4   = P_b4  / (P_b4 + R4) ;
  X_a4 = X_b4 + K4 * (Z4 - X_b4) ;
  P_a4 = (1 - K4) * P_b4 ;
  return X_a4 ;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
void matrix_multiply(float* A, float* B, int m, int p, int n, float* C)
{

    int i, j, k; 
    for (i=0;i<m;i++) 
        for(j=0;j<n;j++) 
        { 
          C[n*i+j]=0; 
          for (k=0;k<p;k++) 
            C[n*i+j]= C[n*i+j]+A[p*i+k]*B[n*k+j]; 
        } 
} 


static void matrix_addition(float* A, float* B, int m, int n, float* C) 

{ 

    int i, j; 
    for (i=0;i<m;i++) 
        for(j=0;j<n;j++) 
            C[n*i+j]=A[n*i+j]+B[n*i+j]; 
} 

void matrix_subtraction(float* A, float* B, int m, int n, float* C) 
{
    int i, j; 
    for (i=0;i<m;i++) 
        for(j=0;j<n;j++) 
            C[n*i+j]=A[n*i+j]-B[n*i+j]; 
} 
void matrix_transpose(float* A, int m, int n, float* C) 
{     
     int i, j; 
    for (i=0;i<m;i++) 
        for(j=0;j<n;j++) 
            C[m*j+i]=A[n*i+j]; 
}
int matrix_inversion(float* A, int n, float* AInverse) 
{ 
    int i, j, iPass, imx, icol, irow; 
    float det, temp, pivot, factor; 
    float* ac = (float*)calloc(n*n, sizeof(float)); 
    det = 1; 
    for (i = 0; i < n; i++) 
    { 
        for (j = 0; j < n; j++) 
        { 
            AInverse[n*i+j] = 0; 
            ac[n*i+j] = A[n*i+j]; 
        } 
        AInverse[n*i+i] = 1; 
    } 


    for (iPass = 0; iPass < n; iPass++) 
    { 
        imx = iPass; 
        for (irow = iPass; irow < n; irow++) 
        { 
            if (fabs(A[n*irow+iPass]) > fabs(A[n*imx+iPass])) imx = irow; 
        } 


        if (imx != iPass) 
        { 
            for (icol = 0; icol < n; icol++) 
            { 
                temp = AInverse[n*iPass+icol]; 
                AInverse[n*iPass+icol] = AInverse[n*imx+icol]; 
                AInverse[n*imx+icol] = temp; 
                if (icol >= iPass) 
                { 
                    temp = A[n*iPass+icol]; 
                    A[n*iPass+icol] = A[n*imx+icol]; 
                    A[n*imx+icol] = temp; 
                } 
            } 
        } 

        pivot = A[n*iPass+iPass]; 
        det = det * pivot; 
        if (det == 0) 
        { 
            free(ac); 
            return 0; 
        } 

        for (icol = 0; icol < n; icol++) 
        { 

            AInverse[n*iPass+icol] = AInverse[n*iPass+icol] / pivot; 
            if (icol >= iPass) A[n*iPass+icol] = A[n*iPass+icol] / pivot; 
        } 

        for (irow = 0; irow < n; irow++) 
        { 

            if (irow != iPass) factor = A[n*irow+iPass]; 
            for (icol = 0; icol < n; icol++) 
            { 
                if (irow != iPass) 
                { 
                    AInverse[n*irow+icol] -= factor * AInverse[n*iPass+icol]; 
                    A[n*irow+icol] -= factor * A[n*iPass+icol]; 
                } 
            } 
        } 
    } 

    free(ac); 
    return 1; 
} 





float kalman_update(float gyroscope_rate, float accelerometer_angle) 
{ 

   static  float A[2][2] = {{1.0, -0.019968}, {0.0, 1.0}}; 
   static  float B[2][1] = {{0.019968}, {0.0}}; 
  static   float C[1][2] = {{1.0, 0.0}}; 
  static   float Sz[1][1] = {{17.2}}; 
  static   float Sw[2][2] = {{0.005, 0.005}, {0.005, 0.005}}; 


   static   float xhat[2][1] = {{0.0}, {0.0}}; 
   static   float P[2][2] = {{0.005, 0.005}, {0.005, 0.005}}; 


    float u[1][1];        
    float y[1][1];         

    float AP[2][2];            
    float CT[2][1];         
    float APCT[2][1];         
    float CP[1][2];  
    float CPCT[1][1];   
    float CPCTSz[1][1];   
    float CPCTSzInv[1][1]; 
    float K[2][1];   
    float Cxhat[1][1];   
    float yCxhat[1][1];      
    float KyCxhat[2][1];  
    float Axhat[2][1];      
    float Bu[2][1];  
    float AxhatBu[2][1];  
    float AT[2][2];   
    float APAT[2][2];       
    float APATSw[2][2];         
    float KC[2][2];          
    float KCP[2][2];        
    float KCPAT[2][2];     


    u[0][0] = gyroscope_rate; 
    y[0][0] = accelerometer_angle; 



    matrix_multiply((float*) A, (float*) xhat, 2, 2, 1, (float*) Axhat); 
    matrix_multiply((float*) B, (float*) u, 2, 1, 1, (float*) Bu); 
    matrix_addition((float*) Axhat, (float*) Bu, 2, 1, (float*) AxhatBu); 




    matrix_multiply((float*) C, (float*) xhat, 1, 2, 1, (float*) Cxhat); 
    matrix_subtraction((float*) y, (float*) Cxhat, 1, 1, (float*) yCxhat); 

 
    matrix_transpose((float*) C, 1, 2, (float*) CT); 
    matrix_multiply((float*) C, (float*) P, 1, 2, 2, (float*) CP); 
    matrix_multiply((float*) CP, (float*) CT, 1, 2, 1, (float*) CPCT); 
    matrix_addition((float*) CPCT, (float*) Sz, 1, 1, (float*) CPCTSz); 

    matrix_multiply((float*) A, (float*) P, 2, 2, 2, (float*) AP); 
    matrix_multiply((float*) AP, (float*) CT, 2, 2, 1, (float*) APCT); 
    matrix_inversion((float*) CPCTSz, 1, (float*) CPCTSzInv); 
    matrix_multiply((float*) APCT, (float*) CPCTSzInv, 2, 1, 1, (float*) K); 


    matrix_multiply((float*) K, (float*) yCxhat, 2, 1, 1, (float*) KyCxhat); 
    matrix_addition((float*) AxhatBu, (float*) KyCxhat, 2, 1, (float*) xhat); 

    matrix_transpose((float*) A, 2, 2, (float*) AT); 
    matrix_multiply((float*) AP, (float*) AT, 2, 2, 2, (float*) APAT); 
    matrix_addition((float*) APAT, (float*) Sw, 2, 2, (float*) APATSw); 
    matrix_multiply((float*) K, (float*) C, 2, 1, 2, (float*) KC); 
    matrix_multiply((float*) KC, (float*) P, 2, 2, 2, (float*) KCP); 
    matrix_multiply((float*) KCP, (float*) AT, 2, 2, 2, (float*) KCPAT); 
    matrix_subtraction((float*) APATSw, (float*) KCPAT, 2, 2, (float*) P); 


    return xhat[0][0]; 
} 