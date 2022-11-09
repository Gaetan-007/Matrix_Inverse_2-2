`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 19:25:34
// Design Name: 
// Module Name: get_mirror_transforming
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module get_mirror_transforming(
    input                   I_sys_clk       ,
    input                   I_sys_rstn      ,
    input                   I_rx_valid      ,
    input       [15:0]      I_a11             ,
    input       [15:0]      I_a12             ,
    input       [15:0]      I_a21             ,
    input       [15:0]      I_a22             ,
    
    output      [23:0]      O_R11           ,
    output      [23:0]      O_R12           ,
    output      [23:0]      O_R21           ,
    output      [23:0]      O_R22           ,
    
    output      [15:0]      O_H1_h11          ,
    output      [15:0]      O_H1_h12          ,
    output      [15:0]      O_H1_h21          ,
    output      [15:0]      O_H1_h22          
    );
    wire        [31:0]      w_1_1_final   ;
    wire        [31:0]      w_2_1_final   ;
    
    wire        [16:0]      column_1_amp                                                          ;  
                                                                                                     
    wire                    amp_valid                                                         ;    
                                                                                                     
    wire    [15:0]          w_1_1                                                               ;                                                                                                         
    wire    [15:0]          w_2_1                                                       ;                    
                                                                                                     
    wire    [31:0]          w_1_1_normalize                                          ;                     
    wire    [31:0]          w_2_1_normalize                                          ;   
    
    ///////�õ���������1�е�ģ 
    get_column_1_amp   get_column_1_amp_user(
        .   I_sys_clk          (I_sys_clk   ),
        .   I_sys_rstn         (I_sys_rstn  ),
        .   I_a_matrix_ready   (I_rx_valid    ),
     
        .   I_a11              (I_a11    ),
        .   I_a21              (I_a21    ),
                                            
        .   O_column_1_amp     (column_1_amp   ),
                                            
        .   O_amp_valid        (amp_valid )     
    );
    
    ///////���� w1 �ķ��Ӳ���
    numerator_of_w1  numerator_of_w1_user(
        .   I_sys_clk                   (I_sys_clk    ),
        .   I_sys_rstn                  (I_sys_rstn   ),
        .   I_numerator_of_w1_ena    (I_rx_valid),
     
        .   I_a11                       (I_a11) ,    
        .   I_a21                       (I_a21) ,
   
        .   I_column_1_amp              (column_1_amp )      ,                   
      
        .   O_w_1_1                       ( w_1_1   )    ,
        .   O_w_2_1                       ( w_2_1   )    
    ); 
    
    ///////�� w1�ķ��� ���й�һ�����õ� w1
    normlize_w_1 normlize_w_1_user(
        .   I_sys_clk                   (I_sys_clk)    ,
        .   I_sys_rstn                  (I_sys_rstn)   ,
        .   I_normlize_w_1_w_2_ena      (I_rx_valid)     ,
                                      
        .   I_w_1_1                     (w_1_1)        ,
        .   I_w_2_1                     (w_2_1)        ,                                  
                                     
        .   O_w_1_1_normalize           (w_1_1_normalize )              ,
        .   O_w_2_1_normalize           (w_2_1_normalize )                               
    );
    
    //////��ס w1
    get_final_w     get_final_w_user(
        .   I_sys_clk             (I_sys_clk            )      ,
        .   I_sys_rstn            (I_sys_rstn           )      ,
        .   I_w_1_1_normalize     (w_1_1_normalize    )     ,    
        .   I_w_2_1_normalize     (w_2_1_normalize    )     ,      
      
        .   O_w_1_1_final  (w_1_1_final) ,
        .   O_w_2_1_final  (w_2_1_final)
    ); 
  
    ///////�� w1 ���� �任���� H1
    transforming_matrix     transforming_matrix_u(
        .   I_sys_clk             (I_sys_clk            )                                  ,
        .   I_sys_rstn            (I_sys_rstn           )                                  ,
        .   I_enable_transforming (I_rx_valid)                            ,
                              
        .   I_w_1_1_final         (w_1_1_final)                             ,
        .   I_w_2_1_final         (w_2_1_final)                             ,
                              
        .   O_H1_h11                (O_H1_h11   )                            ,
        .   O_H1_h12                (O_H1_h12   )                            ,
        .   O_H1_h21                (O_H1_h21   )                            ,
        .   O_H1_h22                (O_H1_h22   )                            
    );
    
    ////////�� H1 �����������ˣ��õ������Ǿ��� R
    get_R get_R_user(
        .   I_sys_clk       (I_sys_clk    )      ,
        .   I_sys_rstn      (I_sys_rstn   )      ,
        .   I_get_r_ena     (I_rx_valid     )      ,
        
        .   I_a11             (I_a11)              ,     //��Ҫע�����16λȫ��������
        .   I_a12             (I_a12)              ,     //��Ҫע�����16λȫ��������
        .   I_a21             (I_a21)              ,     //��Ҫע�����16λȫ��������
        .   I_a22             (I_a22)              ,     //��Ҫע�����16λȫ��������
            
        .   I_H11             (O_H1_h11  )            ,      //��Ҫע���8������     
        .   I_H12             (O_H1_h12  )            ,      //��Ҫע���8������  
        .   I_H21             (O_H1_h21  )            ,      //��Ҫע���8������  
        .   I_H22             (O_H1_h22  )            ,      //��Ҫע���8������  
     
        .   O_R11             (O_R11  )            ,  
        .   O_R12             (O_R12  )            ,  
        .   O_R21             (O_R21  )            ,  
        .   O_R22             (O_R22  )               
    );   
endmodule
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

