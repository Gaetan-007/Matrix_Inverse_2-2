`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/25 18:47:40
// Design Name: 
// Module Name: knock_R_inv
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


module knock_R_inv(
            input                               I_sys_clk                   ,
            input                               I_sys_rstn                  ,
            input               [31:0]          I_R11_inv                     ,
            input               [31:0]          I_R12_inv                     ,
            input               [31:0]          I_R21_inv                     ,
            input               [31:0]          I_R22_inv                     ,
                      
            output      reg     [31:0]          O_R11_inv_final                          ,       
            output      reg     [31:0]          O_R12_inv_final                          ,       
            output      reg     [31:0]          O_R21_inv_final                          ,       
            output      reg     [31:0]          O_R22_inv_final                                          
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
    
    ///////通过打拍计数，锁住 R_inv，直到下次计算出新的R_inv
    always @(posedge I_sys_clk or negedge I_sys_rstn) begin
        if (!I_sys_rstn) begin
            O_R11_inv_final <= 10'd0;
            O_R12_inv_final <= 10'd0; 
            O_R21_inv_final <= 10'd0; 
            O_R22_inv_final <= 10'd0;  
        end
        else if (total_control_cnt_1_64 == 10'd100) begin
            O_R11_inv_final <= I_R11_inv;
            O_R12_inv_final <= I_R12_inv;
            O_R21_inv_final <= I_R21_inv;
            O_R22_inv_final <= I_R22_inv;           
        end
        else if (total_control_cnt_1_64 > 10'd100 && total_control_cnt_1_64 < 10'd1020) begin
            O_R11_inv_final <= O_R11_inv_final;
            O_R12_inv_final <= O_R12_inv_final;
            O_R21_inv_final <= O_R21_inv_final;
            O_R22_inv_final <= O_R22_inv_final;           
        end
        else begin
            O_R11_inv_final <= 32'b0;
            O_R12_inv_final <= 32'b0;
            O_R21_inv_final <= 32'b0;
            O_R22_inv_final <= 32'b0;
        end         
    end       
endmodule
