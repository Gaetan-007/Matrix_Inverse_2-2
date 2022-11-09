`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 13:17:45
// Design Name: 
// Module Name: cell_mult
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


module cell_mult(
            input                   I_sys_clk                   ,
            input                   I_sys_rstn                  ,
            
            input                   I_cell_mult_ena             ,
            input       [7:0]       I_data1                     ,
            input       [7:0]       I_data2                     ,

            output reg  [15:0]      O_mult                      
            
    );
    
    wire  [15 : 0]   P;

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
   
    mult_gen_0 your_instance_name (
        .   CLK     (I_sys_clk),    // input wire CLK
        .   A       (I_data1),        // input wire [7 : 0] A
        .   B       (I_data2),        // input wire [7 : 0] B
        .   CE      (I_cell_mult_ena),      // input wire CE
        .   SCLR    (~I_sys_rstn),  // input wire SCLR
        .   P       (P)        // output wire [15 : 0] P
    );
    
   always @(posedge I_sys_clk or negedge I_sys_rstn) begin
        if (!I_sys_rstn) begin
            O_mult <= 15'b0;
        end
        else if (total_control_cnt_1_64 >= 10'd3 && total_control_cnt_1_64 <= 10'd10) begin
            O_mult <= P + O_mult;
        end        
        else begin
            O_mult <= 15'd0;
        end

   end
    
    
    
endmodule
