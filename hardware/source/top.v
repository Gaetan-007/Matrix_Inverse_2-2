`timescale 1ns / 1ps



module top(
            input                   I_sys_clk                   ,
            input                   I_sys_rstn                     
    );  
            wire    [15:0]          a11_keep                                                        ;    
            wire    [15:0]          a12_keep                                                        ;    
            wire    [15:0]          a21_keep                                                        ;    
            wire    [15:0]          a22_keep                                                        ;    
            wire                    rx_valid                                                        ;    
                                                       
            wire    [15:0]          H1_h11     ;
            wire    [15:0]          H1_h12     ;
            wire    [15:0]          H1_h21     ;
            wire    [15:0]          H1_h22     ;
            
            wire    [23:0]          R11            ;
            wire    [23:0]          R12             ;
            wire    [23:0]          R21             ;
            wire    [23:0]          R22             ;
             
            wire    [63:0]          A11_inv                    ;  
            wire    [63:0]          A12_inv                    ;  
            wire    [63:0]          A21_inv                    ;  
            wire    [63:0]          A22_inv                    ;            
    
    //////读取ram中存储的信号，计算其二阶矩Rx
    get_rx  get_rx_user(
        .   I_sys_clk       (   I_sys_clk       ),                
        .   I_sys_rstn      (   I_sys_rstn      ),
        .   O_a11_keep      (   a11_keep        ),                 
        .   O_a12_keep      (   a12_keep        ),                 
        .   O_a21_keep      (   a21_keep        ),                 
        .   O_a22_keep      (   a22_keep        ),                 
        .   O_rx_valid      (   rx_valid        )                 
    );
    
    //////将 Rx 作为待求逆矩阵A输入，得到变换矩阵 H1 和上三角矩阵 R
    get_mirror_transforming get_mirror_transforming_user(
        .   I_sys_clk       (   I_sys_clk       )   ,
        .   I_sys_rstn      (   I_sys_rstn      )   ,
        .   I_rx_valid      (   rx_valid        )   ,
        .   I_a11           (   a11_keep        )   ,
        .   I_a12           (   a12_keep        )   ,
        .   I_a21           (   a21_keep        )   ,
        .   I_a22           (   a22_keep        )   ,

        .   O_R11           (   R11             )   ,
        .   O_R12           (   R12             )   ,
        .   O_R21           (   R21             )   ,
        .   O_R22           (   R22             )   ,
        
        .   O_H1_h11        (   H1_h11          )   ,
        .   O_H1_h12        (   H1_h12          )   ,
        .   O_H1_h21        (   H1_h21          )   ,
        .   O_H1_h22        (   H1_h22          )   
    );    
    
    wire        A_inv_valid     ;
    /////输入H1 和 R，计算 R_inv 并和 H1相乘，得到矩阵 A 的逆
    get_A_inv   get_A_inv_user(
        .   I_sys_clk       (   I_sys_clk       )   ,
        .   I_sys_rstn      (   I_sys_rstn      )   ,
        .   I_rx_valid      (   rx_valid        )   ,
                                               
        .   I_R11           (   R11             )   ,
        .   I_R12           (   R12             )   ,
        .   I_R21           (   R21             )   ,
        .   I_R22           (   R22             )   ,
                                                
        .   I_H1_h11        (   H1_h11          )   ,
        .   I_H1_h12        (   H1_h12          )   ,
        .   I_H1_h21        (   H1_h21          )   ,
        .   I_H1_h22        (   H1_h22          )   ,
                                              
        .   O_A11_inv       (   A11_inv         )   ,
        .   O_A12_inv       (   A12_inv         )   ,
        .   O_A21_inv       (   A21_inv         )   ,
        .   O_A22_inv       (   A22_inv         )   ,
        .   O_A_inv_valid   (   A_inv_valid     )  
    );      
        
    ila_out ila_out_user (
	   .   clk     (I_sys_clk), // input wire clk

	   .   probe0  (A11_inv  ), // input wire [63:0]  probe0  
	   .   probe1  (A12_inv  ), // input wire [63:0]  probe1 
	   .   probe2  (A21_inv  ), // input wire [63:0]  probe2 
	   .   probe3  (A22_inv  ), // input wire [63:0]  probe3
	   .   probe4  (A_inv_valid    )
    );
      
        
              
            endmodule
            
                            
   