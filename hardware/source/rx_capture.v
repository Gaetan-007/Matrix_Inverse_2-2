`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 14:09:24
// Design Name: 
// Module Name: rx_get
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


module rx_capture(
            input                   I_sys_clk                   ,
            input                   I_sys_rstn                  ,
            input     [15:0]        a11                      ,
            input     [15:0]        a12                      ,
            input     [15:0]        a21                      ,
            input     [15:0]        a22                      ,
            
            output   reg  [15:0]        a11_keep                      ,   
            output   reg  [15:0]        a12_keep                      ,   
            output   reg  [15:0]        a21_keep                      ,   
            output   reg  [15:0]        a22_keep                      ,   
            
            output  reg                 rx_valid
      
    );
    reg  [10:0]      total_control_cnt_1_64                ;
          //全局控制计数器
    always @(posedge I_sys_clk or negedge I_sys_rstn) begin
        if (!I_sys_rstn) begin
            total_control_cnt_1_64 <= 11'd0; 
        end
        else if (total_control_cnt_1_64 <= 11'd1024) begin
            total_control_cnt_1_64 <= total_control_cnt_1_64 + 1'b1;
        end
        else begin
            total_control_cnt_1_64 <= 11'd0;
        end
    end
   
    always @(posedge I_sys_clk or negedge I_sys_rstn) begin
        if (!I_sys_rstn) begin
            a11_keep  <=    16'd0;
            a12_keep  <=    16'd0;
            a21_keep  <=    16'd0;
            a22_keep  <=    16'd0;
            rx_valid  <=    1'd0;
        end
        else if (total_control_cnt_1_64 == 10'd11) begin
            a11_keep <=     a11;
            a12_keep <=     a12;
            a21_keep <=     a21;
            a22_keep <=     a22;
            rx_valid  <=    1'd1;
        end
        else if (total_control_cnt_1_64 > 10'd11 && total_control_cnt_1_64 < 10'd1000) begin
            a11_keep <=     a11_keep;
            a12_keep <=     a12_keep;
            a21_keep <=     a21_keep;
            a22_keep <=     a22_keep;
            rx_valid  <=    1'd1;
        end
        else begin
            a11_keep  <=    16'd0;
            a12_keep  <=    16'd0;
            a21_keep  <=    16'd0;
            a22_keep  <=    16'd0;
            rx_valid  <=    1'd0;
        end
    end  
      
endmodule
