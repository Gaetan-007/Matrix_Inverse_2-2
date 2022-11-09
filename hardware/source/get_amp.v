`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 14:27:40
// Design Name: 
// Module Name: amp_get
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


module get_amp(
       input                       I_sys_clk                   ,
       input                       I_sys_rstn                  ,
       input                       I_amp_get_ena               ,
       input          [15:0]       I_a1                        ,
       input          [15:0]       I_a2                        ,
       
       output         [16:0]       O_amp                       ,
       output  reg                 O_amp_valid                         
    );
    



     
    wire [31 : 0]   P_1      ;
    wire [31 : 0]   P_2      ;     
    wire [31 : 0]   amp_2    ; 
    wire amp_valid         ;
    reg  amp_valid_delay1;        
          
    always @(posedge  I_sys_clk  or negedge I_sys_rstn)  begin
        if (!I_sys_rstn) begin
            amp_valid_delay1 <= 1'b0;
            O_amp_valid <= 1'd0;
        end
        else begin
            amp_valid_delay1 <= amp_valid;
            O_amp_valid <= amp_valid_delay1;
        end
    end
     
    //2个乘法器，都是延迟1拍
    //1个加法器，延迟1拍
    //所以要将开方模块输出的valid信号延迟2拍再输出
    //输出O_amp = (A1 * A1 + A2 * A2)^0.5，也就是输入向量的模
    mult_gen_1  mult_gen_1_user1 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_a1),      // input wire [15 : 0] A
        .   B   (I_a1),      // input wire [15 : 0] B
        .   CE  (I_amp_get_ena),    // input wire CE
        .   P   (P_1)      // output wire [31 : 0] P
    );   


    mult_gen_1  mult_gen_1_user2 (
        .   CLK (I_sys_clk),  // input wire CLK
        .   A   (I_a2),      // input wire [15 : 0] A
        .   B   (I_a2),      // input wire [15 : 0] B
        .   CE  (I_amp_get_ena),    // input wire CE
        .   P   (P_2)      // output wire [31 : 0] P
    );   
    
    c_addsub_0  c_addsub_0_user (
        .   A   (P_1),      // input wire [31 : 0] A
        .   B   (P_2),      // input wire [31 : 0] B
        .   CLK (I_sys_clk),  // input wire CLK
        .   CE  (I_amp_get_ena),    // input wire CE
        .   S   (amp_2)      // output wire [31 : 0] S
    );
    
    cordic_0   cordic_0_user (
        .   aclk                    (I_sys_clk),       // input wire aclk
        .   s_axis_cartesian_tvalid (I_amp_get_ena),  // input wire s_axis_cartesian_tvalid
        .   s_axis_cartesian_tdata  (amp_2),    // input wire [31 : 0] s_axis_cartesian_tdata
        .   m_axis_dout_tvalid      (amp_valid),            // output wire m_axis_dout_tvalid
        .   m_axis_dout_tdata       (O_amp)              // output wire [15 : 0] m_axis_dout_tdata
    );
endmodule
