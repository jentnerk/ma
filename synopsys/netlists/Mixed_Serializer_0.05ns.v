/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Sat Jan 19 12:19:50 2019
/////////////////////////////////////////////////////////////


module Clock_divider_1 ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n1;

  DFFRPQ_X0P5M_A9TS clk_div_reg ( .D(n1), .CK(clk_fast_i), .R(reset), .Q(
        clk_div_o) );
  INV_X1M_A9TS U3 ( .A(clk_div_o), .Y(n1) );
endmodule


module shift_serializer_00000014_00000005_00000004 ( data_i, data_o, clk, 
        reset, ready_o );
  input [19:0] data_i;
  output [3:0] data_o;
  input clk, reset;
  output ready_o;
  wire   Reg_SP_13, Reg_SP_12, Reg_SP_11, Reg_SP_10, Reg_SP_8, Reg_SP_7,
         Reg_SP_6, Reg_SP_5, Reg_SP_3, Reg_SP_2, Reg_SP_1, Reg_SP_0, n1, n3,
         n4, n5, n6, n7;
  wire   [18:15] Reg_SP;
  wire   [2:0] Counter_SP;
  wire   [2:0] Counter_SN;
  wire   [19:0] Reg_SN;

  DFFRPQ_X0P5M_A9TS Reg_SP_reg_7_ ( .D(Reg_SN[7]), .CK(clk), .R(reset), .Q(
        Reg_SP_7) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_0_ ( .D(Counter_SN[0]), .CK(clk), .R(reset), 
        .Q(Counter_SP[0]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_2_ ( .D(Counter_SN[2]), .CK(clk), .R(reset), 
        .Q(Counter_SP[2]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_1_ ( .D(Counter_SN[1]), .CK(clk), .R(reset), 
        .Q(Counter_SP[1]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_19_ ( .D(Reg_SN[19]), .CK(clk), .R(reset), .Q(
        data_o[3]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_18_ ( .D(Reg_SN[18]), .CK(clk), .R(reset), .Q(
        Reg_SP[18]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_17_ ( .D(Reg_SN[17]), .CK(clk), .R(reset), .Q(
        Reg_SP[17]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_16_ ( .D(Reg_SN[16]), .CK(clk), .R(reset), .Q(
        Reg_SP[16]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_15_ ( .D(Reg_SN[15]), .CK(clk), .R(reset), .Q(
        Reg_SP[15]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_14_ ( .D(Reg_SN[14]), .CK(clk), .R(reset), .Q(
        data_o[2]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_13_ ( .D(Reg_SN[13]), .CK(clk), .R(reset), .Q(
        Reg_SP_13) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_12_ ( .D(Reg_SN[12]), .CK(clk), .R(reset), .Q(
        Reg_SP_12) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_11_ ( .D(Reg_SN[11]), .CK(clk), .R(reset), .Q(
        Reg_SP_11) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_10_ ( .D(Reg_SN[10]), .CK(clk), .R(reset), .Q(
        Reg_SP_10) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_9_ ( .D(Reg_SN[9]), .CK(clk), .R(reset), .Q(
        data_o[1]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_8_ ( .D(Reg_SN[8]), .CK(clk), .R(reset), .Q(
        Reg_SP_8) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_6_ ( .D(Reg_SN[6]), .CK(clk), .R(reset), .Q(
        Reg_SP_6) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_5_ ( .D(Reg_SN[5]), .CK(clk), .R(reset), .Q(
        Reg_SP_5) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_4_ ( .D(Reg_SN[4]), .CK(clk), .R(reset), .Q(
        data_o[0]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_3_ ( .D(Reg_SN[3]), .CK(clk), .R(reset), .Q(
        Reg_SP_3) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_2_ ( .D(Reg_SN[2]), .CK(clk), .R(reset), .Q(
        Reg_SP_2) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_1_ ( .D(Reg_SN[1]), .CK(clk), .R(reset), .Q(
        Reg_SP_1) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_0_ ( .D(Reg_SN[0]), .CK(clk), .R(reset), .Q(
        Reg_SP_0) );
  NAND3_X0P5A_A9TS U3 ( .A(n6), .B(n5), .C(n4), .Y(n7) );
  TIELO_X1M_A9TS U4 ( .Y(n1) );
  INV_X0P8M_A9TS U5 ( .A(Counter_SP[1]), .Y(n6) );
  INV_X0P8M_A9TS U6 ( .A(Counter_SP[0]), .Y(n5) );
  INV_X0P8M_A9TS U7 ( .A(Counter_SP[2]), .Y(n4) );
  NOR2_X0P7A_A9TS U8 ( .A(n1), .B(n7), .Y(ready_o) );
  INV_X0P8M_A9TS U9 ( .A(ready_o), .Y(n3) );
  AND2_X0P7M_A9TS U10 ( .A(data_i[0]), .B(ready_o), .Y(Reg_SN[0]) );
  AO22_X0P7M_A9TS U11 ( .A0(ready_o), .A1(data_i[19]), .B0(n3), .B1(Reg_SP[18]), .Y(Reg_SN[19]) );
  AO22_X0P7M_A9TS U12 ( .A0(ready_o), .A1(data_i[14]), .B0(n3), .B1(Reg_SP_12), 
        .Y(Reg_SN[13]) );
  AO22_X0P7M_A9TS U13 ( .A0(ready_o), .A1(data_i[15]), .B0(n3), .B1(Reg_SP[17]), .Y(Reg_SN[18]) );
  AO22_X0P7M_A9TS U14 ( .A0(ready_o), .A1(data_i[9]), .B0(n3), .B1(Reg_SP_6), 
        .Y(Reg_SN[7]) );
  AO22_X0P7M_A9TS U15 ( .A0(ready_o), .A1(data_i[11]), .B0(n3), .B1(Reg_SP[16]), .Y(Reg_SN[17]) );
  AO22_X0P7M_A9TS U16 ( .A0(ready_o), .A1(data_i[10]), .B0(n3), .B1(Reg_SP_11), 
        .Y(Reg_SN[12]) );
  AO22_X0P7M_A9TS U17 ( .A0(ready_o), .A1(data_i[7]), .B0(n3), .B1(Reg_SP[15]), 
        .Y(Reg_SN[16]) );
  AO21A1AI2_X0P7M_A9TS U18 ( .A0(n6), .A1(n5), .B0(n4), .C0(n7), .Y(
        Counter_SN[2]) );
  AO22_X0P7M_A9TS U19 ( .A0(ready_o), .A1(data_i[3]), .B0(n3), .B1(data_o[2]), 
        .Y(Reg_SN[15]) );
  AO22_X0P7M_A9TS U20 ( .A0(ready_o), .A1(data_i[12]), .B0(n3), .B1(Reg_SP_2), 
        .Y(Reg_SN[3]) );
  NOR2_X0P7A_A9TS U21 ( .A(Counter_SP[0]), .B(ready_o), .Y(Counter_SN[0]) );
  OA22_X0P7M_A9TS U22 ( .A0(n6), .A1(Counter_SP[0]), .B0(Counter_SN[0]), .B1(
        Counter_SP[1]), .Y(Counter_SN[1]) );
  AO22_X0P7M_A9TS U23 ( .A0(ready_o), .A1(data_i[18]), .B0(n3), .B1(Reg_SP_13), 
        .Y(Reg_SN[14]) );
  AO22_X0P7M_A9TS U24 ( .A0(ready_o), .A1(data_i[1]), .B0(n3), .B1(data_o[0]), 
        .Y(Reg_SN[5]) );
  AO22_X0P7M_A9TS U25 ( .A0(ready_o), .A1(data_i[5]), .B0(n3), .B1(Reg_SP_5), 
        .Y(Reg_SN[6]) );
  AO22_X0P7M_A9TS U26 ( .A0(ready_o), .A1(data_i[6]), .B0(n3), .B1(Reg_SP_10), 
        .Y(Reg_SN[11]) );
  AO22_X0P7M_A9TS U27 ( .A0(ready_o), .A1(data_i[4]), .B0(n3), .B1(Reg_SP_0), 
        .Y(Reg_SN[1]) );
  AO22_X0P7M_A9TS U28 ( .A0(ready_o), .A1(data_i[17]), .B0(n3), .B1(Reg_SP_8), 
        .Y(Reg_SN[9]) );
  AO22_X0P7M_A9TS U29 ( .A0(ready_o), .A1(data_i[8]), .B0(n3), .B1(Reg_SP_1), 
        .Y(Reg_SN[2]) );
  AO22_X0P7M_A9TS U30 ( .A0(ready_o), .A1(data_i[2]), .B0(n3), .B1(data_o[1]), 
        .Y(Reg_SN[10]) );
  AO22_X0P7M_A9TS U31 ( .A0(ready_o), .A1(data_i[16]), .B0(n3), .B1(Reg_SP_3), 
        .Y(Reg_SN[4]) );
  AO22_X0P7M_A9TS U32 ( .A0(ready_o), .A1(data_i[13]), .B0(n3), .B1(Reg_SP_7), 
        .Y(Reg_SN[8]) );
endmodule


module Serializer_00000002_00000002_00000001 ( io_clk, io_rst, io_dataIn, 
        io_dataOut );
  input [1:1] io_clk;
  input [1:0] io_dataIn;
  input io_rst;
  output io_dataOut;
  wire   n1, n2, n3;
  wire   [1:0] reg_SP;

  INV_X1M_A9TS U3 ( .A(io_clk[1]), .Y(n1) );
  AO22_X1P4M_A9TS U4 ( .A0(io_clk[1]), .A1(reg_SP[1]), .B0(n1), .B1(reg_SP[0]), 
        .Y(io_dataOut) );
  DFFRPQN_X3M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(io_clk[1]), .R(io_rst), .QN(n3) );
  DFFRPQN_X3M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(io_clk[1]), .R(io_rst), .QN(n2) );
  INV_X0P8M_A9TS U5 ( .A(n3), .Y(reg_SP[0]) );
  INV_X1P7M_A9TS U6 ( .A(n2), .Y(reg_SP[1]) );
endmodule


module Serializer_00000004_00000002_0 ( io_clk, io_rst, io_dataIn, io_dataOut
 );
  input [2:1] io_clk;
  input [3:0] io_dataIn;
  input io_rst;
  output io_dataOut;
  wire   n1, n2, n3, n4, n5;
  wire   [1:0] dataOut;
  wire   [3:0] reg_SP;

  Serializer_00000002_00000002_00000001 genblk1_Serializer ( .io_clk(io_clk[1]), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(io_dataOut) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(n5), .R(io_rst), .Q(
        reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(n5), .R(io_rst), .Q(
        reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_2_ ( .D(io_dataIn[2]), .CK(n5), .R(io_rst), .Q(
        reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_3_ ( .D(io_dataIn[3]), .CK(n5), .R(io_rst), .Q(
        reg_SP[3]) );
  BUF_X0P7B_A9TS U3 ( .A(io_clk[2]), .Y(n5) );
  INV_X1M_A9TS U4 ( .A(reg_SP[2]), .Y(n1) );
  INV_X1M_A9TS U5 ( .A(reg_SP[0]), .Y(n2) );
  INV_X0P8M_A9TS U6 ( .A(reg_SP[1]), .Y(n4) );
  INV_X0P8M_A9TS U7 ( .A(reg_SP[3]), .Y(n3) );
  MXIT2_X1P4M_A9TS U8 ( .A(n2), .B(n1), .S0(io_clk[2]), .Y(dataOut[0]) );
  MXIT2_X1P4M_A9TS U9 ( .A(n4), .B(n3), .S0(io_clk[2]), .Y(dataOut[1]) );
endmodule


module tree_serializer_00000004_00000002 ( data_i, data_o, clks, reset );
  input [3:0] data_i;
  input [2:0] clks;
  input reset;
  output data_o;
  wire   dataOut_SN;

  Serializer_00000004_00000002_0 Serializer ( .io_clk(clks[2:1]), .io_rst(
        reset), .io_dataIn(data_i), .io_dataOut(dataOut_SN) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clks[0]), .R(reset), 
        .Q(data_o) );
endmodule


module Clock_divider_0 ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n2, n4;

  DFFRPQN_X3M_A9TS clk_div_reg ( .D(n4), .CK(clk_fast_i), .R(reset), .QN(n2)
         );
  INV_X3B_A9TS U3 ( .A(n2), .Y(clk_div_o) );
  INV_X1M_A9TS U4 ( .A(clk_div_o), .Y(n4) );
endmodule


module toplevel_mixed_serializer ( data_i, data_o, ready_o, clk_i, reset_ni );
  input [19:0] data_i;
  input clk_i, reset_ni;
  output data_o, ready_o;
  wire   dataOut_SN, n3, n4;
  wire   [2:1] clks;
  wire   [3:0] shift_o;

  Clock_divider_1 clk__1__clock_divider ( .clk_div_o(clks[1]), .clk_fast_i(
        clk_i), .reset(reset_ni) );
  Clock_divider_0 clk__2__clock_divider ( .clk_div_o(clks[2]), .clk_fast_i(
        clks[1]), .reset(reset_ni) );
  shift_serializer_00000014_00000005_00000004 shift_serializer ( .data_i(
        data_i), .data_o(shift_o), .clk(n4), .reset(reset_ni), .ready_o(
        ready_o) );
  tree_serializer_00000004_00000002 tree_serializer ( .data_i(shift_o), 
        .data_o(dataOut_SN), .clks({clks, clk_i}), .reset(reset_ni) );
  DFFRPQN_X3M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk_i), .R(reset_ni), 
        .QN(n3) );
  INV_X3B_A9TS U5 ( .A(n3), .Y(data_o) );
  BUF_X0P7B_A9TS U6 ( .A(clks[2]), .Y(n4) );
endmodule

