`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 16:45:19
// Design Name: 
// Module Name: normlize_w_1_w_2
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


module normlize_w_1(
       input                       I_sys_clk                   ,
       input                       I_sys_rstn                  ,
       input                       I_normlize_w_1_w_2_ena      ,
       
       input          [15:0]       I_w_1_1                         ,
       input          [15:0]       I_w_2_1                         ,
      
       output         [31:0]       O_w_1_1_normalize                ,          
       output         [31:0]       O_w_2_1_normalize                        
    );
    
    wire     [31 : 0]   w_1_1_power2;
    wire     [31 : 0]   w_2_1_power2;
    wire     [31:  0]   w_1_amp_power2;
    wire     [15:  0]   w_1_amp       ;
    
    
    //////   
    mult_normlize_w   mult_normlize_w_1_1_power2 (
        .   CLK     (I_sys_clk),  // input wire CLK
        .   A       (I_w_1_1),      // input wire [15 : 0] A
        .   B       (I_w_1_1),      // input wire [15 : 0] B
        .   CE      (I_normlize_w_1_w_2_ena),    // input wire CE
        .   P       (w_1_1_power2)    ,  // output wire [31 : 0] P
        .   SCLR    (~I_normlize_w_1_w_2_ena)  // input wire SCLR
    );
    mult_normlize_w   mult_normlize_w_1_2_power2 (
  .CLK(I_sys_clk),  // input wire CLK
  .A(I_w_2_1),      // input wire [15 : 0] A
  .B(I_w_2_1),      // input wire [15 : 0] B
  .CE(I_normlize_w_1_w_2_ena),    // input wire CE
  .P(w_2_1_power2)  ,    // output wire [31 : 0] P
    .SCLR(~I_normlize_w_1_w_2_ena)  // input wire SCLR
);



///////
add_w_normlize add_w_normlize_w_amp_power2(
  .A(w_1_1_power2),      // input wire [31 : 0] A
  .B(w_2_1_power2),      // input wire [31 : 0] B
  .CLK(I_sys_clk),  // input wire CLK
  .CE(I_normlize_w_1_w_2_ena),    // input wire CE
  .S(w_1_amp_power2)      // output wire [31 : 0] S
);




w_normlize_sqrt w_normlize_sqrt_w_1_amp (
  .aclk(I_sys_clk),                                        // input wire aclk
  .s_axis_cartesian_tvalid(I_normlize_w_1_w_2_ena),  // input wire s_axis_cartesian_tvalid
  .s_axis_cartesian_tdata(w_1_amp_power2),    // input wire [31 : 0] s_axis_cartesian_tdata
  .m_axis_dout_tvalid( ),            // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(w_1_amp)              // output wire [23 : 0] m_axis_dout_tdata
);




div_gen_0 div_gen_0_w_1_1(
  .aclk(I_sys_clk),                                      // input wire aclk
  .s_axis_divisor_tvalid(I_normlize_w_1_w_2_ena),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tready(                       ),    // output wire s_axis_divisor_tready
  .s_axis_divisor_tdata(w_1_amp),      // input wire [15 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(I_normlize_w_1_w_2_ena),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tready(                      ),  // output wire s_axis_dividend_tready
  .s_axis_dividend_tdata(I_w_1_1),    // input wire [15 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(O_w_1_1_normalize)            // output wire [15 : 0] m_axis_dout_tdata
);

div_gen_0 div_gen_0_w_1_2(
  .aclk(I_sys_clk),                                      // input wire aclk
  .s_axis_divisor_tvalid(I_normlize_w_1_w_2_ena),    // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tready(                       ),    // output wire s_axis_divisor_tready
  .s_axis_divisor_tdata(w_1_amp),      // input wire [15 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(I_normlize_w_1_w_2_ena),  // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tready(                      ),  // output wire s_axis_dividend_tready
  .s_axis_dividend_tdata(I_w_2_1),    // input wire [15 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid(),          // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(O_w_2_1_normalize)            // output wire [15 : 0] m_axis_dout_tdata
); 
endmodule
