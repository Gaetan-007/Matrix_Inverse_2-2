`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/06 14:05:29
// Design Name: 
// Module Name: get_A_inv
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


module get_A_inv(
    input               I_sys_clk,
    input               I_sys_rstn,
    input               I_rx_valid,
    
    input       [23:0]          I_R11         ,
    input       [23:0]          I_R12         ,
    input       [23:0]          I_R21         ,
    input       [23:0]          I_R22         ,
    
    
    input       [15:0]          I_H1_h11          ,
    input       [15:0]          I_H1_h12          ,
    input       [15:0]          I_H1_h21          ,
    input       [15:0]          I_H1_h22          ,
    
    output      [63:0]           O_A11_inv      ,
    output      [63:0]           O_A12_inv      ,
    output      [63:0]           O_A21_inv      ,
    output      [63:0]           O_A22_inv      ,
    output                       O_A_inv_valid    
    );
    
    wire    [31:0]          R11_inv  ;             
    wire    [31:0]          R12_inv  ;             
    wire    [31:0]          R21_inv  ;             
    wire    [31:0]          R22_inv  ;             
                                                   
    wire    [31:0]          R11_inv_final         ;
    wire    [31:0]          R12_inv_final         ;
    wire    [31:0]          R21_inv_final         ;
    wire    [31:0]          R22_inv_final         ;
    
    ///////输入上三角矩阵 R，输出 R 的逆
    R_inv    R_inv_user(
        .  I_sys_clk      (I_sys_clk  )         ,
        .  I_sys_rstn     (I_sys_rstn )         ,
     
        .  I_R11            ( I_R11       ) ,
        .  I_R12            ( I_R12       ) ,
        .  I_R21            ( I_R21       ) ,
        .  I_R22            ( I_R22       ) ,
                         
        .  O_R11_inv        (  R11_inv  )      ,         
        .  O_R12_inv        (  R12_inv  )      ,         
        .  O_R21_inv        (  R21_inv  )      ,         
        .  O_R22_inv        (  R22_inv  )                
    );
          
    //////锁住 R 的逆      
    knock_R_inv  knock_R_inv_user(
        .   I_sys_clk           (I_sys_clk  )    ,
        .   I_sys_rstn          (I_sys_rstn )    ,
        .   I_R11_inv           (R11_inv    )    ,
        .   I_R12_inv           (R12_inv    )    ,
        .   I_R21_inv           (R21_inv    )    ,
        .   I_R22_inv           (R22_inv    )    ,  
        
        .   O_R11_inv_final     (R11_inv_final )                    ,       
        .   O_R12_inv_final     (R12_inv_final )                    ,       
        .   O_R21_inv_final     (R21_inv_final )                    ,       
        .   O_R22_inv_final     (R22_inv_final )                                    
    );         
    
    wire        [63:0]           A11_inv  ;
    wire        [63:0]           A12_inv  ;
    wire        [63:0]           A21_inv  ;
    wire        [63:0]           A22_inv  ;
    
    ///////将 R_inv 和 H1 相乘，计算出 A 的逆     
    get_R_inv_mult_H   get_R_inv_mult_H_user(
        .   I_sys_clk           (I_sys_clk)         ,                                              
        .   I_sys_rstn          (I_sys_rstn)        , 
        .   I_get_inverse_ena   (I_rx_valid)        ,
                                                     
        .   I_R11_inv           (R11_inv_final)     ,                                              
        .   I_R12_inv           (R12_inv_final)      ,                                              
        .   I_R21_inv           (R21_inv_final)      ,                                              
        .   I_R22_inv           (R22_inv_final)      ,  
                                                    
        .   I_H1_h11            (I_H1_h11 )      ,
        .   I_H1_h12            (I_H1_h12 )      ,
        .   I_H1_h21            (I_H1_h21 )      ,
        .   I_H1_h22            (I_H1_h22 )      ,
                
        .   O_A11_inv           (A11_inv )            ,
        .   O_A12_inv           (A12_inv )            ,
        .   O_A21_inv           (A21_inv )            ,
        .   O_A22_inv           (A22_inv )                                                                                                                                                    
    );
    
    knock_A_inv     knock_A_inv_user(
        .   I_sys_clk           (   I_sys_clk       )   ,
        .   I_sys_rstn          (   I_sys_rstn      )   ,
        .   I_A11_inv           (   A11_inv         )   ,
        .   I_A12_inv           (   A12_inv         )   ,
        .   I_A21_inv           (   A21_inv         )   ,
        .   I_A22_inv           (   A22_inv         )   ,
                                                        
        .   O_A11_inv_final     (   O_A11_inv       )   ,
        .   O_A12_inv_final     (   O_A12_inv       )   ,
        .   O_A21_inv_final     (   O_A21_inv       )   ,
        .   O_A22_inv_final     (   O_A22_inv       )   ,
        .   O_A_inv_valid       (   O_A_inv_valid   )
    );    
endmodule
