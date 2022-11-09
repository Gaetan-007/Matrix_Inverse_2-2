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
    ///////////rom����ģ�飬����ʱ�����ڽ��д��ģ����romʹ�ܿ����źźͶ�ȡ��ַ
    rom_control   rom_control_user(
        .   I_sys_clk       (I_sys_clk                                             ),
        .   I_sys_rstn      (I_sys_rstn                                            ),
                                                                                  
        .   O_ena           (total_control_2_two_channel_data_out_ena              ),
        .   O_rom_addr      (total_control_2_two_channel_data_out_rom_addr         )    //��ȡ���ݵĵ�ַ
    );
    
    wire    [7:0]           data_from_channelA                                              ;
    wire    [7:0]           data_from_channelB                                              ;
    wire                    two_channel_data_valid                                          ; 
    ///////////rom��ȡģ�飬��������ĵ�ַ��ʹ���źŶ�ȡrom�ж�Ӧ����ֵ
    two_channel_data_out two_channel_data_out_user(
        .   I_sys_clk                  (I_sys_clk                                        ),
        .   I_sys_rstn                 (I_sys_rstn                                       ),
        .   I_rom_ena                  (total_control_2_two_channel_data_out_ena         ),
        .   I_addr                     (total_control_2_two_channel_data_out_rom_addr    ),
   
        .   O_data_from_channelA       ( data_from_channelA                              ), //ͨ��A����                
        .   O_data_from_channelB       ( data_from_channelB                              ), //ͨ��B����                
        .   O_two_channel_data_valid   ( two_channel_data_valid                          )  //���������Ч�źţ���Чʱ����  
                                                                                        
    );
    /////////rom��ȡģ��        
    
    wire    [15:0]          a11                           ;
    wire    [15:0]          a12                           ;
    wire    [15:0]          a21                           ;
    wire    [15:0]          a22                           ;                                                                   
    
    ///���������˷�ģ�飬ÿ��ʱ�������أ��ֱ������ź���һ��ʱ�̵�˫ͨ����ֵ,�����ǰ���������������Ԫ��ֵ
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
    ///////////////���������˷�ģ��
   
    //����˷����ץȡģ�飬�ڼ�����4096�����ĵľ���˷��󣬽�ֵ��סһ��ʱ��
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
