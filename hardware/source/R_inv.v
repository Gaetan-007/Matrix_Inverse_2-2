`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/25 17:26:54
// Design Name: 
// Module Name: R_inv
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


module R_inv(
        input                       I_sys_clk               ,
        input                       I_sys_rstn              ,
                                    
        input       [23:0]          I_R11                     ,
        input       [23:0]          I_R12                     ,
        input       [23:0]          I_R21                     ,
        input       [23:0]          I_R22                     ,
                                    
        output      [31:0]          O_R11_inv                 ,         
        output      [31:0]          O_R12_inv                 ,         
        output      [31:0]          O_R21_inv                 ,         
        output      [31:0]          O_R22_inv                         
    );
    
    reg    [10:0]      total_control_cnt_1_64                ;
   
     //全局控制计数器
    always @(posedge I_sys_clk or negedge I_sys_rstn)begin
        if  (!I_sys_rstn) begin
            total_control_cnt_1_64 <= 11'd0; 
        end
        else if (total_control_cnt_1_64 <=  11'd1024)   begin
            total_control_cnt_1_64 <= total_control_cnt_1_64 + 1'b1;
        end
        else begin
            total_control_cnt_1_64 <= 11'd0;
        end
    end 
    
    reg    data_ena                ;
    always @(posedge I_sys_clk or negedge I_sys_rstn)begin
        if  (!I_sys_rstn) begin
            data_ena <= 1'b0; 
        end
        else if (total_control_cnt_1_64 > 11'd60)   begin
            data_ena <= 1'b1;
        end
        else begin
            data_ena <= 1'b0;
        end
    end 
    
    ////////R21_inv = 0
    assign  O_R21_inv =   24'd0;
    
    /////// R11_inv = 1 / R11  
    div_of_R_inverse div_of_R_inverse_R11_inv (
        .   aclk                    (   I_sys_clk                           ),     // input wire aclk
        .   s_axis_divisor_tvalid   (   data_ena                            ),    // input wire s_axis_divisor_tvalid
        .   s_axis_divisor_tready   (                                       ),    // output wire s_axis_divisor_tready
        .   s_axis_divisor_tdata    (   I_R11                               ),    // input wire [23 : 0] s_axis_divisor_tdata
        .   s_axis_dividend_tvalid  (   data_ena                            ),   // input wire s_axis_dividend_tvalid
        .   s_axis_dividend_tready  (                                       ),   // output wire s_axis_dividend_tready
        .   s_axis_dividend_tdata   (   {16'd0000_0000_0000_0001,   8'd0}   ),   // input wire [23 : 0] s_axis_dividend_tdata
        .   m_axis_dout_tvalid      (                                       ),   // output wire m_axis_dout_tvalid
        .   m_axis_dout_tdata       (   O_R11_inv                             )    // output wire [31 : 0] m_axis_dout_tdata
    );
  
    /////// R22_inv = 1 / R22
    div_of_R_inverse div_of_R_inverse_R22_inv (
        .   aclk                    (   I_sys_clk                           ),     // input wire aclk
        .   s_axis_divisor_tvalid   (   data_ena                            ),    // input wire s_axis_divisor_tvalid
        .   s_axis_divisor_tready   (                                       ),    // output wire s_axis_divisor_tready
        .   s_axis_divisor_tdata    (   I_R22                               ),    // input wire [23 : 0] s_axis_divisor_tdata
        .   s_axis_dividend_tvalid  (   data_ena                            ),   // input wire s_axis_dividend_tvalid
        .   s_axis_dividend_tready  (                                       ),   // output wire s_axis_dividend_tready
        .   s_axis_dividend_tdata   (   {16'd0000_0000_0000_0001,   8'd0}   ),   // input wire [23 : 0] s_axis_dividend_tdata
        .   m_axis_dout_tvalid      (                                       ),   // output wire m_axis_dout_tvalid
        .   m_axis_dout_tdata       (   O_R22_inv                             )    // output wire [31 : 0] m_axis_dout_tdata
    );
   
    /////// R11_inv = - R12 / (R11 * R22)
    wire   [23 : 0] P1;
    ////////常数乘法器 P1 = -1 * R12
    mult_inv_fu1  mult_of_R_INV_1 (
        .   CLK     (   I_sys_clk   ),  // input wire CLK
        .   A       (   I_R12         ),  // input wire [23 : 0] A
        .   P       (   P1          )   // output wire [23 : 0] P
    );

    wire   [23 : 0] P2;
    ////乘法器 P2 = R11 * R22
    mult_of_R_INV  mult_of_R_INV_2 (
        .   CLK (   I_sys_clk   ),  // input wire CLK
        .   A   (   I_R22         ),      // input wire [23 : 0] A
        .   B   (   I_R11         ),      // input wire [23 : 0] B
        .   P   (   P2          )      // output wire [23 : 0] P
    );
    
    ////除法器 R11_inv = P1 / P2
    div_of_R_inverse div_of_R_inverse_R12_inv (
        .   aclk                        (   I_sys_clk   ),                                      // input wire aclk
        .   s_axis_divisor_tvalid       (   data_ena    ),    // input wire s_axis_divisor_tvalid
        .   s_axis_divisor_tready       (               ),    // output wire s_axis_divisor_tready
        .   s_axis_divisor_tdata        (   P2          ),      // input wire [23 : 0] s_axis_divisor_tdata
        .   s_axis_dividend_tvalid      (   data_ena    ),  // input wire s_axis_dividend_tvalid
        .   s_axis_dividend_tready      (               ),  // output wire s_axis_dividend_tready
        .   s_axis_dividend_tdata       (   P1          ),    // input wire [23 : 0] s_axis_dividend_tdata
        .   m_axis_dout_tvalid          (               ),          // output wire m_axis_dout_tvalid
        .   m_axis_dout_tdata           (   O_R12_inv   )            // output wire [31 : 0] m_axis_dout_tdata
    );
endmodule
