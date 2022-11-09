// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Oct 24 16:07:31 2022
// Host        : CHINAMI-NFOR6J8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               f:/FPGA_COMPETITION/v3_matrix_inv/v3_matrix_inv.srcs/sources_1/ip/c_addsub_1/c_addsub_1_sim_netlist.v
// Design      : c_addsub_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_1,c_addsub_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module c_addsub_1
   (A,
    B,
    CLK,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [15:0]S;

  wire [15:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [15:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "16" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_1_c_addsub_v12_0_12 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "1" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "16" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000000" *) 
(* C_B_WIDTH = "16" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "16" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_addsub_v12_0_12" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_addsub_1_c_addsub_v12_0_12
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [15:0]A;
  input [15:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [15:0]S;

  wire \<const0> ;
  wire [15:0]A;
  wire [15:0]B;
  wire CE;
  wire CLK;
  wire [15:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "16" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_addsub_1_c_addsub_v12_0_12_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(CE),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
INaBf8vh5mCmDzf2yp77pxZAxQdyEQiT/vG2dEgvrFjseUnGc6ldwH4JvdnpZSpdf/ihioPyMNjl
u6ooyzv5TA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
S5XIZZtuFR/MZffuhwdnvE3H9oRWM4uXoaGZTa/Dyk62O+Wa0v41pjmZELCiR7uodZPFQfykZ6K9
2ZDMu8dB3afQRMs5lnd/53M1b9ke+MNEeZ/wzjUcsJghubnEAwzdWeW/0tlqST1WD9B/KCxYqwH5
Gj6IZTTFHAXcaVhnCT8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CM6IcdzP0PbD6yMSqylmi4JE2qpmxiNeI+prjGwJiD8e3Xsynu3PbGKJAOpOxtR1hT/3mpBcx1Rz
Fkz0QBh4wtE8fiziv1i+xi8T6cqC8ClamjrpZ//sn6dh7NvwSYik14MlwVuei4DZoZJZF63aoPUn
RXkQ13wtK+MkYKBcPVSZMFZmaCU6jMMBYclXzvRG1JqqZoa7mWFTeFZePUTXG7Wo12QaZ8GUi0AV
UIshoN25yn5e2Xr3FyuEtm5AvsZb+iLsgLeHBtKBnsVaHQphicgqwgwv6MQQF6ZNBgU/aACfibDS
3+n/mMMm8k1cj2bW6VCi7a+c8LmCf81NlJuLww==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ehl0CusS7+JNGq6HfhyaBMy68nccIdIGqixoEztEZfkCpXuUYsdqw6G9MIJdWdu0Ck2acV7K6IVg
rzb8/bNaDDVWp48kupToegTkOdwDkCejEqppido4BkJ+iEkjPniz+aJHlOlOwmauETy2hCMuuC57
oWDprzGWlsqbCjqzKrXmPYm6fNdcOa2DiOYstQaMFNbPU2ccrbLJAiYMHNDqtPNqWxKBsD67kiGf
2eOneDOmdmy7YkNsL+cx8MJc3BVUsYBrpAEsGyFMkmX8a8nYz8R/wlFQFGQAd/t5XrfxFNI58mj1
AHXbcAMhGKVq9YdKeU/vSXY/NwMqp12xJ1nUaw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
h/qRAwiPuqY/Zg/QWqbaYm8xWTi9SshYuPzyL0UME9ZDDF+C2CyGAugh9HzMdD0kZmT94TKmBgLR
dKP28nlE8VCCU5rvbjKxfn/wNtNKHCvZ1hns8CF7+pGuelhxGvXNmYKFw5co8+4grYFaDXeoZZR6
S5sjvhqtSVD3+qq4vYWRjT2Y/yes7L9dRsLq2D3iZ4xjgVHuIbOQLT/EUKW+9iYudT9Uy6YTwB+5
mSb0QK3YfZdGwZyXB4S3mdF9vNQHdW/rnACq3yngF+lprNkh3ooQKdGqtxtz8KSQxNZOAFE+koOw
h00o7AKpvDAp3uNguLvnNJH3rugOhh95b8Jatw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
TsA04vIYHDZne2CBj5bWCBFH4MtNoFDCn/3DNEi0BwutuUf+X+lD9kAO3kl352WHjQbF79Ssm+PT
fCYpODgWdxSVbzaHFpITxCQ4HcIJhUeW5PC5tw09Tand68D6eg84qRguH+llbb5jdGJkJeTCf+Mx
pupkkLiDvNyTYWe+nqw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rx9hgQkvaJJTJJcTjGFW1DrrWiT+xanrcMvFn0Z3KRXlZvf+SE7IQgGCiP7ZDA6T5z1Zv5nzS4h5
cVi+CvwC9UMZRWmLDAjzASJ2nx1g9BjbYe2vHAUmyurIiR6LSigTeM/9TlMv+fFwJbqwuH6FJ3/z
Vl4tIMk4NrqkMn/riOG87SjhesepM6kcQOBgDGzLTG14z3qeZG8OPzxgApfyubmX4qdD1oTgGm2u
Q4mQfFxEye6Jqkn4Rzjhifs/ieNYomHlK7R2/72QJj5j0WyYBIhvO+09izz299Z54ZP2ZXaRMfDT
lU4lQNqQU14PX9Yk9p7sy2PnK4vTwwF0CFIgSQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
a8EWMuzy5TH7rdCWoBB9ce++RoDG2MK0nHPuJXPO2FqnLL+TSgmUdDfFGyzcCJFVyoazuzyrQs4J
smvBN2HshrQQph+BVXtbBKi4FUHKfmVq0m2EfUjzUajVRH61Yh3P1lM7HHrzBEz5YiYZPfnL4l5j
cyRTnnD3/nVtpHckSFKoKqrbvuKB+M7wlr2P554cNn3cTkcJK9lr7pThmQkIREMqGPLM1XjM6Hbq
i8kAfLX13cGClvXWeZXV1SB9NCPTbl+JSY4mk1Qpt2RDsNFL0cTbWSkCPzdyK7G7YCOIl1IF6eXM
qBoPSPbWqJlrkxzu6CcgtoREHVqQMsLAP/MsRQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
s5vt/4BHMOpdlqlM/sm9H2Klyf1/LHGTly9kuCrNiRLiR7PJt1bBQatpMJvDTAXigzIOUP81owz8
WSIyunXo2BxA0hBvGV1b/uXvFWGvTgLvAy6Shvi8XTqd8ogbXfymwiWCFwdkxv/vfx10tsS4hJk3
s7hh0xXbIm9S8f5KxmvoVZqW5HiPTnsEgR7vlkVuR4Zdu1P5lHn6QHotpqu771SnBZ4mQdNsvKco
1wH32SGgieIZTIRsVJtd2nYcFAaRKhjlGX1YZMCwak/UlaxU7RqM4iNzpl6MlVv8ZH9oqvyUv5m5
mDep5WK7Q06W75ywXZX8JgnBveDQVATt3Htsmw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13168)
`pragma protect data_block
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
Ug==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
