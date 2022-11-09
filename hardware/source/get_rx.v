`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 18:43:19
// Design Name: 
// Module Name: get_rx
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


module get_rx(
        input                   I_sys_clk                   ,
        input                   I_sys_rstn                  ,
        output      [15:0]      O_a11_keep                    ,                          
        output      [15:0]      O_a12_keep                    ,                          
        output      [15:0]      O_a21_keep                    ,                          
        output      [15:0]      O_a22_keep                    ,                          
        output                  O_rx_valid                                                
    );
    
    wire                    total_control_2_two_channel_data_out_ena                          ;
    wire    [2:0]           total_control_2_two_channel_data_out_rom_addr                    ; 
    ///////////rom控制模块，根据时钟周期进行打拍，输出rom使能控制信号和读取地址
    rom_control   rom_control_user(
        .   I_sys_clk       (I_sys_clk                                             ),
        .   I_sys_rstn      (I_sys_rstn                                            ),
                                                                                  
        .   O_ena           (total_control_2_two_channel_data_out_ena              ),
        .   O_rom_addr      (total_control_2_two_channel_data_out_rom_addr         )    //读取数据的地址
    );
    
    wire    [7:0]           data_from_channelA                                              ;
    wire    [7:0]           data_from_channelB                                              ;
    wire                    two_channel_data_valid                                          ; 
    ///////////rom读取模块，根据输入的地址和使能信号读取rom中对应的数值
    two_channel_data_out two_channel_data_out_user(
        .   I_sys_clk                  (I_sys_clk                                        ),
        .   I_sys_rstn                 (I_sys_rstn                                       ),
        .   I_rom_ena                  (total_control_2_two_channel_data_out_ena         ),
        .   I_addr                     (total_control_2_two_channel_data_out_rom_addr    ),
   
        .   O_data_from_channelA       ( data_from_channelA                              ), //通道A数据                
        .   O_data_from_channelB       ( data_from_channelB                              ), //通道B数据                
        .   O_two_channel_data_valid   ( two_channel_data_valid                          )  //输出数据有效信号，有效时拉高  
                                                                                        
    );
    /////////rom读取模块        
    
    wire    [15:0]          a11                           ;
    wire    [15:0]          a12                           ;
    wire    [15:0]          a21                           ;
    wire    [15:0]          a22                           ;                                                                   
    
    ///矩阵脉动乘法模块，每个时钟上升沿，分别输入信号在一个时刻的双通道的值,输出当前操作后的输出矩阵各元素值
    serial_matrix_mult serial_matrix_mult_user(
        .   I_sys_clk          (I_sys_clk                     ),
        .   I_sys_rstn         (I_sys_rstn                    ),
                                                                
        .   I_mult_ena         (two_channel_data_valid        ),
        .   I_channela         (data_from_channelA            ),
        .   I_channelb         (data_from_channelB            ),

        .   a11                (a11                           ),
        .   a12                (a12                           ),
        .   a21                (a21                           ),
        .   a22                (a22                           )                
    ); 
    ///////////////矩阵脉动乘法模块
   
    //矩阵乘法结果抓取模块，在计算完4096个快拍的矩阵乘法后，将值锁住一段时间
    rx_capture   rx_capture_user(
        .   I_sys_clk          (I_sys_clk)          ,
        .   I_sys_rstn         (I_sys_rstn)          ,
        .   a11                (a11   )          ,
        .   a12                (a12   )          ,
        .   a21                (a21   )          ,
        .   a22                (a22   )          ,
                                   
        .   a11_keep           (O_a11_keep )       ,
        .   a12_keep           (O_a12_keep )       ,
        .   a21_keep           (O_a21_keep )       ,
        .   a22_keep           (O_a22_keep )       ,
                                
        .   rx_valid           (O_rx_valid )      
    );   
endmodule
