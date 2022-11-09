`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 12:25:45
// Design Name: 
// Module Name: two_channel_data_out
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


module two_channel_data_out(
            input                   I_sys_clk                   ,
            input                   I_sys_rstn                  ,
            input                   I_rom_ena                   ,
            input    [2 : 0]        I_addr                      , 
            
            output   [7 : 0]        O_data_from_channelA        ,
            output   [7 : 0]        O_data_from_channelB        ,
            output   reg            O_two_channel_data_valid    
                      
          
    );
           
    always  @(posedge   I_sys_clk) begin
        if(!I_sys_rstn) begin
            O_two_channel_data_valid <= 1'b0;
        end
        else begin
            O_two_channel_data_valid <= I_rom_ena;
        end
    end        
//    assign  O_two_channel_data_valid=I_rom_ena;
    
    
    channel_A channel_A_user (
        .   clka    (I_sys_clk),    // input wire clka
        .   ena     (I_rom_ena),      // input wire ena
        .   addra   (I_addr),  // input wire [2 : 0] addra
        .   douta   (O_data_from_channelA)  // output wire [7 : 0] douta
    );

    channel_B channel_B_user (
        .   clka    (I_sys_clk),    // input wire clka
        .   ena     (I_rom_ena),      // input wire ena
        .   addra   (I_addr),  // input wire [2 : 0] addra
        .   douta   (O_data_from_channelB)  // output wire [7 : 0] douta
    );

endmodule
