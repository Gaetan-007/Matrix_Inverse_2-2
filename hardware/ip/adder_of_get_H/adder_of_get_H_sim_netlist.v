// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Mon Oct 24 16:24:51 2022
// Host        : CHINAMI-NFOR6J8 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top adder_of_get_H -prefix
//               adder_of_get_H_ c_addsub_0_sim_netlist.v
// Design      : c_addsub_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_addsub_0,c_addsub_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_12,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module adder_of_get_H
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
  (* c_add_mode = "0" *) 
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
  adder_of_get_H_c_addsub_v12_0_12 U0
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

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "16" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000000" *) 
(* C_B_WIDTH = "16" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "16" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module adder_of_get_H_c_addsub_v12_0_12
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
  (* c_add_mode = "0" *) 
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
  adder_of_get_H_c_addsub_v12_0_12_viv xst_addsub
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
ETUgvSlkeO0XcvdzJ3HTtsXQ8IP3/3NeGAihRnLix0ykdGmdnXLmex8Fn/PgfWa9jUm3mCNdYE/R
D2ghWifliSeDHxapXt59+amhcEmTk22hD+kqDrZRlap7FAjKgsplJM1NYs5phM0PToKoV+ahJyY4
64rOHa5SfJEFMc7RFKMSFHd6xfyBWJkeT1QUywlPOalt+7YuXppbGUkixi90jiMzrqnYX6wVNLRO
bF5e07N44KOmzRZRITZI3aZY6idmhawG4XawvlYWCyEjlEZNSeSnowiJmeVrP/gR3l1tPd9lNtlj
N4oYhPjGJzVq3Zh3WAOM4WE11xx+QSU3js5FHw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ge59L/B+5hXvWcfuY2Y4qxSIkDGgutflO78PFwMBYuNai7Qcg5/VF9w/QxewoCGGdRpgOGQh9gtz
fjtAAgT3Dz8lSnTROQkikA2+fxI7MJb4tLGXBBX/3rUiq0F59qi8BDciOMl6CmQQpjnN0aPufM05
sw2qYXbxUv/FdpEPjXYL1BP+8sEudcZP5d6hPhE9mMdME6PG/gheEFJNXuVl3X6aFGv3t3VopLsB
30mleCFrgjDHDmeb9f/q5xqysLDHHvANyOlJC4tfYmWuUZqOLlfZ9pEozDEfmZjNZPFCwbCyPfuq
m9W/gUpjEw52F2i0yKi4zo+OeJEJmZCatmzSwA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 13184)
`pragma protect data_block
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
FYoE5xk=
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
