// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Oct 24 21:45:13 2022
// Host        : CHINAMI-NFOR6J8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top get_tmult_of_H1H2 -prefix
//               get_tmult_of_H1H2_ multiplier_stub.v
// Design      : multiplier
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *)
module get_tmult_of_H1H2(CLK, A, B, CE, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[15:0],B[15:0],CE,P[15:0]" */;
  input CLK;
  input [15:0]A;
  input [15:0]B;
  input CE;
  output [15:0]P;
endmodule
