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


module knock_A_inv(
            input                               I_sys_clk                   ,
            input                               I_sys_rstn                  ,
            input               [63:0]          I_A11_inv                     ,
            input               [63:0]          I_A12_inv                     ,
            input               [63:0]          I_A21_inv                     ,
            input               [63:0]          I_A22_inv                     ,
                                  
            output      reg     [63:0]          O_A11_inv_final                          ,       
            output      reg     [63:0]          O_A12_inv_final                          ,       
            output      reg     [63:0]          O_A21_inv_final                          ,       
            output      reg     [63:0]          O_A22_inv_final                          ,
            output      reg                     O_A_inv_valid       
    );
    
    reg    [11:0]      total_control_cnt_1_64                ;
   
    always @(posedge I_sys_clk or negedge I_sys_rstn)begin
        if  (!I_sys_rstn) begin
            total_control_cnt_1_64 <= 11'd0; 
        end
        else if (total_control_cnt_1_64 <=  12'd1024)   begin
            total_control_cnt_1_64 <= total_control_cnt_1_64 + 1'b1;
        end
        else begin
            total_control_cnt_1_64 <= 11'd0;
        end
    end
    
    ///////通过打拍计数，锁住 A_inv，直到下次计算出新的A_inv
    always @(posedge I_sys_clk or negedge I_sys_rstn) begin
        if (!I_sys_rstn) begin
            O_A11_inv_final <= 10'd0;
            O_A12_inv_final <= 10'd0; 
            O_A21_inv_final <= 10'd0; 
            O_A22_inv_final <= 10'd0;
            O_A_inv_valid   <= 1'b0;  
        end
        else if (total_control_cnt_1_64 == 12'd103) begin
            O_A11_inv_final <= I_A11_inv;
            O_A12_inv_final <= I_A12_inv;
            O_A21_inv_final <= I_A21_inv;
            O_A22_inv_final <= I_A22_inv; 
            O_A_inv_valid   <= 1'b1;          
        end
        else if (total_control_cnt_1_64 > 12'd103 && total_control_cnt_1_64 < 12'd1020) begin
            O_A11_inv_final <= O_A11_inv_final;
            O_A12_inv_final <= O_A12_inv_final;
            O_A21_inv_final <= O_A21_inv_final;
            O_A22_inv_final <= O_A22_inv_final;
            O_A_inv_valid   <= O_A_inv_valid;           
        end
        else begin
            O_A11_inv_final <= 32'b0;
            O_A12_inv_final <= 32'b0;
            O_A21_inv_final <= 32'b0;
            O_A22_inv_final <= 32'b0;
            O_A_inv_valid   <= 1'b0;
        end         
    end       
endmodule
