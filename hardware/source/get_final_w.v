`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 19:15:51
// Design Name: 
// Module Name: get_finnal_w
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


module get_final_w(
            input                   I_sys_clk                   ,
            input                   I_sys_rstn                  ,
            input [31:0]            I_w_1_1_normalize          ,      
            input [31:0]            I_w_2_1_normalize          ,     
          
            output reg        [31:0]          O_w_1_1_final      ,
            output reg        [31:0]          O_w_2_1_final      
                   
    );

    reg  [10:0]      total_control_cnt_1_64                ;
    //全局控制计数器
    always @(posedge I_sys_clk or negedge I_sys_rstn)begin
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
     
    //数据抓取w
    always @(posedge I_sys_clk or posedge I_sys_rstn)begin
            if (!I_sys_rstn) begin
                O_w_1_1_final <= 32'd0;
            end
            else if (total_control_cnt_1_64 == 10'd61) begin
                O_w_1_1_final <= I_w_1_1_normalize;
            end
            else if ((total_control_cnt_1_64 > 10'd61)&& (total_control_cnt_1_64 <= 10'd512)) begin
                O_w_1_1_final <= O_w_1_1_final;
            end
            else
                O_w_1_1_final <= 32'd0;         
     end           
     
    always @(posedge I_sys_clk or posedge I_sys_rstn)begin
            if (!I_sys_rstn) begin
                O_w_2_1_final <= 32'd0;
            end
            else if (total_control_cnt_1_64==10'd61) begin
                O_w_2_1_final <=  I_w_2_1_normalize;
            end
            else if ((total_control_cnt_1_64 > 10'd61 )&& (total_control_cnt_1_64 <= 10'd512)) begin

            O_w_2_1_final <=O_w_2_1_final ;
    
            end
            else
   
            O_w_2_1_final<=32'd0;
  
           
     end           
   
 endmodule               
                
                
                