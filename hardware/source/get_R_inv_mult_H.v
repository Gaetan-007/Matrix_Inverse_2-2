`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/25 19:05:04
// Design Name: 
// Module Name: get_inverse_a
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


module get_R_inv_mult_H(
          input                   I_sys_clk                   ,                                              
          input                   I_sys_rstn                  ,   
          input                   I_get_inverse_ena           ,
                                                     
          input   [31:0]          I_R11_inv                     ,                                              
          input   [31:0]          I_R12_inv                     ,                                              
          input   [31:0]          I_R21_inv                     ,                                              
          input   [31:0]          I_R22_inv                     , 
                                                       
          input   [15:0]          I_H1_h11                    ,
          input   [15:0]          I_H1_h12                    ,
          input   [15:0]          I_H1_h21                    ,
          input   [15:0]          I_H1_h22                    ,
                   
          output  [63:0]          O_A11_inv                      ,
          output  [63:0]          O_A12_inv                      ,
          output  [63:0]          O_A21_inv                      ,
          output  [63:0]          O_A22_inv                                                                                                                                                              
    );   
    wire          [31:0]          H1_h11_extend                  ;
    wire          [31:0]          H1_h12_extend                  ;
    wire          [31:0]          H1_h21_extend                  ;
    wire          [31:0]          H1_h22_extend                  ;
    
    assign  H1_h11_extend    =   {{16{I_H1_h11[15]}}, I_H1_h11};
    assign  H1_h12_extend    =   {{16{I_H1_h12[15]}}, I_H1_h12};
    assign  H1_h21_extend    =   {{16{I_H1_h21[15]}}, I_H1_h21};
    assign  H1_h22_extend    =   {{16{I_H1_h22[15]}}, I_H1_h22};
   
    ///////// A_inv = R_inv * H1
   
    ////////计算 A11_inv = R11_inv * H1_h11 + R12_inv * H1_h21 
    wire [63:0] P_inv_a11_1;
    ////////乘法器 P_inv_a11_1 = R11_inv * H1_h11
    get_a_inverse_mult get_a_inverse_mult_inv_a11_1 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_R11_inv),      // input wire [31 : 0] A
        .   B   (H1_h11_extend),      // input wire [31: 0] B
        .   P   (P_inv_a11_1)      // output wire [63 : 0] P
    );
 
    wire [63:0] P_inv_a11_2;
    ////////乘法器 P_inv_a11_2 = R12_inv * H1_h21
    get_a_inverse_mult get_a_inverse_mult_inv_a11_2 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_R12_inv),      // input wire [31 : 0] A
        .   B   (H1_h21_extend),      // input wire [31 : 0] B
        .   P   (P_inv_a11_2)      // output wire [63: 0] P
    );     
    
    ///////加法器 A11_inv = P_inv_a11_1 + P_inv_a11_2    
    adder_inverse_A  adder_inv_a11 (
    .   A   (P_inv_a11_1),      // input wire [63 : 0] A
    .   B   (P_inv_a11_2),      // input wire [63 : 0] B
    .   CLK (I_sys_clk),  // input wire CLK
    .   CE  (I_get_inverse_ena),    // input wire CE
    .   S   (O_A11_inv)      // output wire [63 : 0] S
    );
    ////////计算 A11_inv        
        
    ////////计算 A12_inv = R11_inv * H1_h12 + R12_inv * H1_h22   
    wire [63:0] P_inv_a12_1;
    get_a_inverse_mult get_a_inverse_mult_inv_a12_1 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_R11_inv),      // input wire [31 : 0] A
        .   B   (H1_h12_extend),      // input wire [31 : 0] B
        .   P   (P_inv_a12_1)      // output wire [63 : 0] P
    );
 
    wire [63 :0] P_inv_a12_2;
    get_a_inverse_mult get_a_inverse_mult_inv_a12_2 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_R12_inv),      // input wire [31: 0] A
        .   B   (H1_h22_extend),      // input wire [31: 0] B
        .   P   (P_inv_a12_2)      // output wire [63  : 0] P
    );     
        
    adder_inverse_A  adder_inv_a12 (
        .   A   (P_inv_a12_1),      // input wire [31 : 0] A
        .   B   (P_inv_a12_2),      // input wire [31 : 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_get_inverse_ena),    // input wire CE
        .   S   (O_A12_inv)      // output wire [63 : 0] S
    );               
    ////////计算 A12_inv    
    
    ////////计算 A21_inv = R21_inv * H1_h11 + R22_inv * H1_h21  
    wire [63:0] P_inv_a21_1;
    get_a_inverse_mult get_a_inverse_mult_inv_a21_1 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_R21_inv),      // input wire [31 : 0] A
        .   B   (H1_h11_extend),      // input wire [31: 0] B
        .   P   (P_inv_a21_1)      // output wire [63: 0] P
    );
 
    wire [63:0] P_inv_a21_2;
    get_a_inverse_mult get_a_inverse_mult_inv_a21_2 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_R22_inv),      // input wire [31 : 0] A
        .   B   (H1_h21_extend),      // input wire [31: 0] B
        .   P   (P_inv_a21_2)      // output wire [63 : 0] P
    );     
        
    adder_inverse_A  adder_inv_a21(
        .   A   (P_inv_a21_1),      // input wire [31 : 0] A
        .   B   (P_inv_a21_2),      // input wire [31 : 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_get_inverse_ena),    // input wire CE
        .   S   (O_A21_inv)      // output wire [63 : 0] S
    );               
    ////////计算 A21_inv            
    
    ////////计算 A22_inv = R21_inv * H1_h12 + R22_inv * H1_h22 
    wire [63:0] P_inv_a22_1;
    get_a_inverse_mult get_a_inverse_mult_inv_a22_1 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_R21_inv),      // input wire [31 : 0] A
        .   B   (H1_h12_extend),      // input wire [31: 0] B
        .   P(  P_inv_a22_1)      // output wire [63 : 0] P
    );
 
    wire [63:0] P_inv_a22_2;
    get_a_inverse_mult get_a_inverse_mult_inv_a22_2 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_R22_inv),      // input wire [31 : 0] A
        .   B   (H1_h22_extend),      // input wire [31 : 0] B
        .   P   (P_inv_a22_2)      // output wire [63 : 0] P
    );     
        
    adder_inverse_A  adder_inv_a22(
        .   A   (P_inv_a22_1),      // input wire [63 : 0] A
        .   B   (P_inv_a22_2),      // input wire [63: 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_get_inverse_ena),    // input wire CE
        .   S   (O_A22_inv)      // output wire [63 : 0] S
    );     
    ////////计算 A22_inv                     
endmodule


       
       
       
       