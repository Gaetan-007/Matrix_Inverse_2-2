`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 12:38:49
// Design Name: 
// Module Name: total_control
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


module rom_control(
            input                   I_sys_clk                   ,
            input                   I_sys_rstn                  ,
            
            output                  O_ena                       ,
            output        [2:0]     O_rom_addr                  
    );
    
    reg  [10:0]      total_control_cnt_1_64                ;
    reg             O_ena_reg                             ;
    reg  [2:0]      O_rom_addr_reg                        ;      
    
    
    
                                              
    assign           O_ena=O_ena_reg                      ; 
    assign           O_rom_addr=O_rom_addr_reg            ;
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
    
    //rom_ena
    always @(posedge I_sys_clk or negedge I_sys_rstn) begin
            if (!I_sys_rstn) begin
                O_ena_reg <= 1'b0;
            end
            else if (total_control_cnt_1_64 >= 10'b0 && total_control_cnt_1_64 <= 10'd7) begin
                O_ena_reg <= 1'b1;
            end
            else begin
                O_ena_reg <= 1'b0;
            end
    end
         
    //rom_addr
    always @(posedge I_sys_clk or negedge I_sys_rstn) begin
            if (!I_sys_rstn) begin
                O_rom_addr_reg <= 1'b0;
            end
            else if (total_control_cnt_1_64 >= 10'b1 && total_control_cnt_1_64 <= 10'd8) begin
                O_rom_addr_reg <= O_rom_addr_reg + 1'b1;
            end
            else begin
                O_rom_addr_reg <= 1'b0;
            end
    end
endmodule
