`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 12:59:53
// Design Name: 
// Module Name: test_bench_top
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


module test_bench_top(

    );
    
    reg  I_sys_clk      ;
    reg  I_sys_rstn     ;
    
   
   initial begin
        I_sys_clk     =     1'b1;
        I_sys_rstn    =     1'b0;
        #20 I_sys_rstn  =     1'b1;
    end
    
    always #10 I_sys_clk     =     ~I_sys_clk ;
    
     top top_user(
            .                   I_sys_clk              (I_sys_clk    )     ,
            .                   I_sys_rstn             (I_sys_rstn   )                  

    );
    
endmodule
