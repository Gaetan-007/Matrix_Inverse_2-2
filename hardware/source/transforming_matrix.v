`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 19:57:10
// Design Name: 
// Module Name: transforming_matrix
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


module transforming_matrix(
            input                         I_sys_clk                   ,
            input                         I_sys_rstn                  ,
            input                         I_enable_transforming ,
                             
            input       [31:0]            I_w_1_1_final          ,
            input       [31:0]            I_w_2_1_final          ,
            
            output      [15:0]            O_H1_h11                ,//8位小数
            output      [15:0]            O_H1_h12                ,
            output      [15:0]            O_H1_h21                ,
            output      [15:0]            O_H1_h22                                 
    );
    
    /////// 输出 H = I - 2 * w * wT
    
    /////////H1_h11   =  1 - 2 * w1 * w1
    wire      [15 : 0]      p_H1_h11 ;// w1 * w1
    wire      [15 : 0]      p_H1_h11_step2 ;// 2 * w1 * w1
    //乘法器   w1 * w1
    multiplier  multiplier_p_H1_h11(
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_w_1_1_final),      // input wire [31 : 0] A
        .   B   (I_w_1_1_final),      // input wire [31 : 0] B
        .   CE  (I_enable_transforming),    // input wire CE
        .   P   (p_H1_h11)      // output wire [15 : 0] P
    );
    
    /////常数乘法器 * 2
    transforming_x2 transforming_x2_p_H1_h11 (

        .   A   (p_H1_h11),      // input wire [15 : 0] A
        .   P   (p_H1_h11_step2)      // output wire [16 : 0] P
    );
    
    // 减法器      1 - 2 * w1 * w1
    c_addsub_1  c_addsub_1_transforming_x2_p_H1_h11 (
        .   A   (16'b0000_0001_0000_0000),      // input wire [15 : 0] A
        .   B   (p_H1_h11_step2),      // input wire [15 : 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_enable_transforming),    // input wire CE
        .   S   (O_H1_h11)      // output wire [15 : 0] S
    );   

    /////////H1_h12   =  0 - 2 * w1 * w2
    wire      [15 : 0]      p_H1_h12 ;
    wire      [15 : 0]      p_H1_h12_step2 ;
    multiplier  multiplier_p_H1_h12(
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_w_1_1_final),      // input wire [31 : 0] A
        .   B   (I_w_2_1_final),      // input wire [31 : 0] B
        .   CE  (I_enable_transforming),    // input wire CE
        .   P   (p_H1_h12)      // output wire [15 : 0] P
    );
    
    transforming_x2     transforming_x2_p_H1_h12 (
        .   A   (p_H1_h12),      // input wire [15 : 0] A
        .   P   (p_H1_h12_step2)      // output wire [16 : 0] P
    );
    
    c_addsub_1  c_addsub_1_transforming_x2_p_H1_h12(
        .   A   (16'b0000_0000_0000_0000),      // input wire [15 : 0] A
        .   B   (p_H1_h12_step2),      // input wire [15 : 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_enable_transforming),    // input wire CE
        .   S   (O_H1_h12)      // output wire [15 : 0] S
    );   

    /////////H1_h21   =  0 - 2 * w2 * w1
    wire      [15 : 0]      p_H1_h21 ;
    wire      [15 : 0]      p_H1_h21_step2 ;
    multiplier  multiplier_p_H1_h21(
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_w_2_1_final),      // input wire [31 : 0] A
        .   B   (I_w_1_1_final),      // input wire [31 : 0] B
        .   CE  (I_enable_transforming),    // input wire CE
        .   P   (p_H1_h21)      // output wire [15 : 0] P
    );
    
    transforming_x2 transforming_x2_p_H1_h21 (
        .   A   (p_H1_h21),      // input wire [15 : 0] A
        .   P   (p_H1_h21_step2)      // output wire [16 : 0] P
    );
    
    c_addsub_1  c_addsub_1_transforming_x2_p_H1_h21(
        .   A   (16'b0000_0000_0000_0000),      // input wire [15 : 0] A
        .   B   (p_H1_h21_step2),      // input wire [15 : 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_enable_transforming),    // input wire CE
        .   S   (O_H1_h21)      // output wire [15 : 0] S
    );   

   /////////H1_h22   =  1 - 2 * w2 * w2
    wire      [15 : 0]      p_H1_h22 ;
    wire      [15 : 0]      p_H1_h22_step2 ;
    multiplier  multiplier_p_H1_h22(
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_w_2_1_final),      // input wire [31 : 0] A
        .   B   (I_w_2_1_final),      // input wire [31 : 0] B
        .   CE  (I_enable_transforming),    // input wire CE
        .   P   (p_H1_h22)      // output wire [15 : 0] P
    );
    
    transforming_x2 transforming_x2_p_H1_h22 (
        .   A   (p_H1_h22),      // input wire [15 : 0] A
        .   P   (p_H1_h22_step2)      // output wire [16 : 0] P
    );
    
    c_addsub_1  c_addsub_1_transforming_x2_p_H1_h22(
        .   A   (16'b0000_0001_0000_0000),      // input wire [15 : 0] A
        .   B   (p_H1_h22_step2),      // input wire [15 : 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_enable_transforming),    // input wire CE
        .   S   (O_H1_h22)      // output wire [15 : 0] S
    );   

endmodule





















