`timescale 1ns / 1ps


module get_R(
            input                   I_sys_clk                  ,
            input                   I_sys_rstn                 ,
            input                   I_get_r_ena                ,
            
            input      [15:0]          I_a11                     ,     //需要注意这个16位全部是整数
            input      [15:0]          I_a12                     ,     //需要注意这个16位全部是整数
            input      [15:0]          I_a21                     ,     //需要注意这个16位全部是整数
            input      [15:0]          I_a22                     ,     //需要注意这个16位全部是整数
                                       
            input      [15:0]          I_H11                    ,      //需要注意高8是整数   
            input      [15:0]          I_H12                    ,      //需要注意高8是整数
            input      [15:0]          I_H21                    ,      //需要注意高8是整数
            input      [15:0]          I_H22                    ,       //需要注意高8是整数
            
            output     [23:0]          O_R11                    ,   //8位小数
            output     [23:0]          O_R12                    ,
            output     [23:0]          O_R21                    ,
            output     [23:0]          O_R22                     
            
            
            
                            
    );
    
    //扩位
    wire          [23:0]          a11_24    ;  
    wire          [23:0]          a12_24    ;  
    wire          [23:0]          a21_24    ;  
    wire          [23:0]          a22_24    ;  
    
    wire          [23:0]           H11_24    ;
    wire          [23:0]           H12_24    ;
    wire          [23:0]           H21_24    ;
    wire          [23:0]           H22_24    ;
    
    
    assign      a11_24  = {I_a11, 8'b0};
    assign      a12_24  = {I_a12, 8'b0};
    assign      a21_24  = {I_a21, 8'b0};
    assign      a22_24  = {I_a22, 8'b0};
    
    //有符号补高位
    assign  H11_24 = {  {8{I_H11[15]}},     I_H11};
    assign  H12_24 = {  {8{I_H12[15]}},     I_H12};
    assign  H21_24 = {  {8{I_H21[15]}},     I_H21};
    assign  H22_24 = {  {8{I_H22[15]}},     I_H22};
    
    ///////R = a * h
    
    ////////计算 R11 = a11 * h11 + a12 * h21
    //a11 * h11
    wire     [23 : 0]      P_a11_mult_h11;
    mult_get_r_v  mult_a11_mult_h11 (
        .   CLK     (   I_sys_clk       ),  // input wire CLK
        .   A       (   a11_24          ),      // input wire [23 : 0] A
        .   B       (   H11_24          ),      // input wire [23 : 0] B
        .   CE      (   I_get_r_ena     ),    // input wire CE
        .   P       (   P_a11_mult_h11  )      // output wire [23: 0] P
    );
     
    //a12 * h21
    wire     [23 : 0]      P_a12_mult_h21; 
    mult_get_r_v mult_a12_mult_h21 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (a12_24),      // input wire [23 : 0] A
        .   B   (H21_24),      // input wire [23 : 0] B
        .   CE  (I_get_r_ena),    // input wire CE
        .   P   (P_a12_mult_h21)      // output wire [23 : 0] P
    );
      
    ///////R11 = a11 * h11 + a12 * h21
    add_mult_get_R get_R11 (
        .   A   (P_a11_mult_h11),      // input wire [15 : 0] A
        .   B   (P_a12_mult_h21),      // input wire [15 : 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_get_r_ena),    // input wire CE
        .   S   (O_R11)      // output wire [23 : 0] S
    );  
    /////////////////计算 R11 
   
    
  ///////////////////////////////////////// 
  //a11*h12
   wire     [23 : 0]      P_a11_mult_h12;
   mult_get_r_v  mult_a11_mult_h12 (
  .CLK(I_sys_clk),  // input wire CLK
  .A(a12_24),      // input wire [23 : 0] A
  .B(H11_24),      // input wire [23 : 0] B
  .CE(I_get_r_ena),    // input wire CE
  .P(P_a11_mult_h12)      // output wire [23 : 0] P
);
   
   
  //a12*h22
  wire     [23: 0]      P_a12_mult_h22; 
   mult_get_r_v mult_a12_mult_h22 (
  .CLK(I_sys_clk),  // input wire CLK
  .A(a22_24),      // input wire [23 : 0] A
  .B(H12_24),      // input wire [23 : 0] B
  .CE(I_get_r_ena),    // input wire CE
  .P(P_a12_mult_h22)      // output wire [23 : 0] P
);
      
  //get R12
   add_mult_get_R get_R12 (
  .A(P_a11_mult_h12),      // input wire [15 : 0] A
  .B(P_a12_mult_h22),      // input wire [15 : 0] B
  .CLK(I_sys_clk),  // input wire CLK
  .CE(I_get_r_ena),    // input wire CE
  .S(O_R12)      // output wire [23 : 0] S
);
   
 ////////////////////////////////////////////////     
   
    //get R21
   add_mult_get_R get_R21 (
  .A(24'd0),      // input wire [15 : 0] A
  .B(24'd0),      // input wire [15 : 0] B
  .CLK(I_sys_clk),  // input wire CLK
  .CE(I_get_r_ena),    // input wire CE
  .S(O_R21)      // output wire [23 : 0] S
);
    
   
  ///////////////////////////////////////// 
  //a21*h12
   wire     [23 : 0]      P_a21_mult_h12;
   mult_get_r_v  mult_a21_mult_h12 (
  .CLK(I_sys_clk),  // input wire CLK
  .A(a12_24),      // input wire [23 : 0] A
  .B(H21_24),      // input wire [23 : 0] B
  .CE(I_get_r_ena),    // input wire CE
  .P(P_a21_mult_h12)      // output wire [23: 0] P
);
   
   
  //a22*h22
  wire     [23 : 0]      P_a22_mult_h22; 
   mult_get_r_v mult_a22_mult_h22 (
  .CLK(I_sys_clk),  // input wire CLK
  .A(a22_24),      // input wire [23 : 0] A
  .B(H22_24),      // input wire [23 : 0] B
  .CE(I_get_r_ena),    // input wire CE
  .P(P_a22_mult_h22)      // output wire [23 : 0] P
);
      
  //get R12
   add_mult_get_R get_R22 (
  .A(P_a21_mult_h12),      // input wire [15 : 0] A
  .B(P_a22_mult_h22),      // input wire [15 : 0] B
  .CLK(I_sys_clk),  // input wire CLK
  .CE(I_get_r_ena),    // input wire CE
  .S(O_R22)      // output wire [23 : 0] S
);
   
 ////////////////////////////////////////////////        

    
endmodule
