`timescale 1ns / 1ps



module serial_matrix_mult(
            input                   I_sys_clk            ,
            input                   I_sys_rstn           ,
                                                         
            input                   I_mult_ena           ,
            input       [7:0]       I_channela           ,
            input       [7:0]       I_channelb           ,
                                                         
            output        [15:0]      a11                 ,
            output        [15:0]      a12                  ,
            output        [15:0]      a21                  ,
            output        [15:0]      a22                         
                 
    );
    
    
    cell_mult cell_mult_a11(
               .  I_sys_clk                  (I_sys_clk         )      ,
               .  I_sys_rstn                 (I_sys_rstn        )      ,
                                                                       
               .  I_cell_mult_ena            (I_mult_ena   )      ,
               .  I_data1                    (I_channela        )      ,
               .  I_data2                    (I_channela        )      ,
                                                                       
               .  O_mult                     (a11               )      
                
        );
    
        cell_mult cell_mult_a12(
               .  I_sys_clk                  (I_sys_clk         )      ,
               .  I_sys_rstn                 (I_sys_rstn        )      ,
                                                                       
               .  I_cell_mult_ena            (I_mult_ena   )      ,
               .  I_data1                    (I_channela        )      ,
               .  I_data2                    (I_channelb        )      ,
                                                                       
               .  O_mult                     (a12             )      
                
        );
    
        cell_mult cell_mult_a21(
               .  I_sys_clk                  (I_sys_clk         )      ,
               .  I_sys_rstn                 (I_sys_rstn        )      ,
                                                                       
               .  I_cell_mult_ena            (I_mult_ena   )      ,
               .  I_data1                    (I_channelb         )      ,
               .  I_data2                    (I_channela        )      ,
                                                                       
               .  O_mult                     (a21               )      
                
        );
    
        cell_mult cell_mult_a2(
               .  I_sys_clk                  (I_sys_clk         )      ,
               .  I_sys_rstn                 (I_sys_rstn        )      ,
                                                                       
               .  I_cell_mult_ena            (I_mult_ena   )      ,
               .  I_data1                    (I_channelb        )      ,
               .  I_data2                    (I_channelb        )      ,
                                                                       
               .  O_mult                     (a22              )      
                
        );
    
    
    
endmodule
