// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Oct 24 16:07:31 2022
// Host        : CHINAMI-NFOR6J8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/FPGA_COMPETITION/v3_matrix_inv/v3_matrix_inv.srcs/sources_1/ip/c_addsub_1/c_addsub_1_stub.v
// Design      : c_addsub_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_12,Vivado 2018.3" *)
module c_addsub_1(A, B, CLK, CE, S)
/* synthesis syn_black_box black_box_pad_pin="A[15:0],B[15:0],CLK,CE,S[15:0]" */;
  input [15:0]A;
  input [15:0]B;
  input CLK;
  input CE;
  output [15:0]S;
endmodule
