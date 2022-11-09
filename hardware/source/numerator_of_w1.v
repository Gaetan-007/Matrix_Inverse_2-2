`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 15:55:09
// Design Name: 
// Module Name: numerator_of_w1
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


module numerator_of_w1(
       input                       I_sys_clk                   ,
       input                       I_sys_rstn                  ,
       input                       I_numerator_of_w1_ena    ,
       
       input          [15:0]       I_a11                       ,
       input          [15:0]       I_a21                       ,
       
       input          [16:0]       I_column_1_amp                   ,                    
       
       output         [15:0]       O_w_1_1                       ,
       output         [15:0]       O_w_2_1                                          
    );
    
    assign  O_w_2_1   =   I_a21;
    
    //¼õ·¨ip£¬
    c_addsub_1_wfenzijisuan    c_addsub_w_1_1_not_divid  (
        .   A   (I_a11),      // input wire [15: 0] A
        .   B   (I_column_1_amp[15:0]),      // input wire [15: 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_numerator_of_w1_ena),    // input wire CE
        .   S   (O_w_1_1)      // output wire [15 : 0] S
    );
endmodule
