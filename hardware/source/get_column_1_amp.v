`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 15:36:30
// Design Name: 
// Module Name: get_first_amp
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


module get_column_1_amp(
       input                       I_sys_clk                    ,
       input                       I_sys_rstn                   ,   
       input                       I_a_matrix_ready             , 
       
       input          [15:0]       I_a11                        ,
       input          [15:0]       I_a21                        ,
          
       output         [16:0]       O_column_1_amp               ,//第1列模长
       
       output                      O_amp_valid          
    );
       
       
    //求第1列模长
    get_amp  amp_get_row1(
        .  I_sys_clk                  (I_sys_clk             ),
        .  I_sys_rstn                 (I_sys_rstn            ),
        .  I_amp_get_ena              (I_a_matrix_ready      ),
        .  I_a1                       (I_a11                 ),
        .  I_a2                       (I_a21                 ),
                                                         
        .  O_amp                      (O_column_1_amp             ),
        .  O_amp_valid                (O_amp_valid           )                                                            
    );   
endmodule
