/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Sat Jan 19 13:20:58 2019
/////////////////////////////////////////////////////////////


module Clock_divider_4 ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n1;

  DFFRPQ_X0P5M_A9TS clk_div_reg ( .D(n1), .CK(clk_fast_i), .R(reset), .Q(
        clk_div_o) );
  INV_X0P8M_A9TS U3 ( .A(clk_div_o), .Y(n1) );
endmodule


module mux_00000020 ( mux_i, mux_control_S, mux_o );
  input [31:0] mux_i;
  output [15:0] mux_o;
  input mux_control_S;
  wire   n1;

  AO22_X0P7M_A9TS U17 ( .A0(mux_control_S), .A1(mux_i[16]), .B0(n1), .B1(
        mux_i[0]), .Y(mux_o[0]) );
  AO22_X0P7M_A9TS U15 ( .A0(mux_control_S), .A1(mux_i[18]), .B0(n1), .B1(
        mux_i[2]), .Y(mux_o[2]) );
  AO22_X0P7M_A9TS U14 ( .A0(mux_control_S), .A1(mux_i[19]), .B0(n1), .B1(
        mux_i[3]), .Y(mux_o[3]) );
  AO22_X0P7M_A9TS U13 ( .A0(mux_control_S), .A1(mux_i[20]), .B0(n1), .B1(
        mux_i[4]), .Y(mux_o[4]) );
  AO22_X0P7M_A9TS U12 ( .A0(mux_control_S), .A1(mux_i[21]), .B0(n1), .B1(
        mux_i[5]), .Y(mux_o[5]) );
  AO22_X0P7M_A9TS U11 ( .A0(mux_control_S), .A1(mux_i[22]), .B0(n1), .B1(
        mux_i[6]), .Y(mux_o[6]) );
  AO22_X0P7M_A9TS U10 ( .A0(mux_control_S), .A1(mux_i[23]), .B0(n1), .B1(
        mux_i[7]), .Y(mux_o[7]) );
  AO22_X0P7M_A9TS U16 ( .A0(mux_control_S), .A1(mux_i[17]), .B0(n1), .B1(
        mux_i[1]), .Y(mux_o[1]) );
  AO22_X0P7M_A9TS U8 ( .A0(mux_control_S), .A1(mux_i[25]), .B0(n1), .B1(
        mux_i[9]), .Y(mux_o[9]) );
  AO22_X0P7M_A9TS U7 ( .A0(mux_control_S), .A1(mux_i[26]), .B0(n1), .B1(
        mux_i[10]), .Y(mux_o[10]) );
  AO22_X0P7M_A9TS U6 ( .A0(mux_control_S), .A1(mux_i[27]), .B0(n1), .B1(
        mux_i[11]), .Y(mux_o[11]) );
  AO22_X0P7M_A9TS U5 ( .A0(mux_control_S), .A1(mux_i[28]), .B0(n1), .B1(
        mux_i[12]), .Y(mux_o[12]) );
  AO22_X0P7M_A9TS U4 ( .A0(mux_control_S), .A1(mux_i[29]), .B0(n1), .B1(
        mux_i[13]), .Y(mux_o[13]) );
  AO22_X0P7M_A9TS U2 ( .A0(mux_control_S), .A1(mux_i[31]), .B0(n1), .B1(
        mux_i[15]), .Y(mux_o[15]) );
  AO22_X0P7M_A9TS U9 ( .A0(mux_control_S), .A1(mux_i[24]), .B0(n1), .B1(
        mux_i[8]), .Y(mux_o[8]) );
  AO22_X0P7M_A9TS U3 ( .A0(mux_control_S), .A1(mux_i[30]), .B0(n1), .B1(
        mux_i[14]), .Y(mux_o[14]) );
  INV_X0P8M_A9TS U1 ( .A(mux_control_S), .Y(n1) );
endmodule


module mux_00000010 ( mux_i, mux_control_S, mux_o );
  input [15:0] mux_i;
  output [7:0] mux_o;
  input mux_control_S;
  wire   n1;

  AO22_X0P7M_A9TS U8 ( .A0(mux_control_S), .A1(mux_i[9]), .B0(n1), .B1(
        mux_i[1]), .Y(mux_o[1]) );
  AO22_X0P7M_A9TS U7 ( .A0(mux_control_S), .A1(mux_i[10]), .B0(n1), .B1(
        mux_i[2]), .Y(mux_o[2]) );
  AO22_X0P7M_A9TS U6 ( .A0(mux_control_S), .A1(mux_i[11]), .B0(n1), .B1(
        mux_i[3]), .Y(mux_o[3]) );
  AO22_X0P7M_A9TS U5 ( .A0(mux_control_S), .A1(mux_i[12]), .B0(n1), .B1(
        mux_i[4]), .Y(mux_o[4]) );
  AO22_X0P7M_A9TS U4 ( .A0(mux_control_S), .A1(mux_i[13]), .B0(n1), .B1(
        mux_i[5]), .Y(mux_o[5]) );
  AO22_X0P7M_A9TS U3 ( .A0(mux_control_S), .A1(mux_i[14]), .B0(n1), .B1(
        mux_i[6]), .Y(mux_o[6]) );
  AO22_X0P7M_A9TS U9 ( .A0(mux_control_S), .A1(mux_i[8]), .B0(n1), .B1(
        mux_i[0]), .Y(mux_o[0]) );
  AO22_X0P7M_A9TS U2 ( .A0(mux_control_S), .A1(mux_i[15]), .B0(n1), .B1(
        mux_i[7]), .Y(mux_o[7]) );
  INV_X0P8M_A9TS U1 ( .A(mux_control_S), .Y(n1) );
endmodule


module mux_00000008 ( mux_i, mux_control_S, mux_o );
  input [7:0] mux_i;
  output [3:0] mux_o;
  input mux_control_S;
  wire   n1;

  AO22_X0P7M_A9TS U5 ( .A0(mux_control_S), .A1(mux_i[4]), .B0(n1), .B1(
        mux_i[0]), .Y(mux_o[0]) );
  AO22_X0P7M_A9TS U4 ( .A0(mux_control_S), .A1(mux_i[5]), .B0(n1), .B1(
        mux_i[1]), .Y(mux_o[1]) );
  AO22_X0P7M_A9TS U3 ( .A0(mux_control_S), .A1(mux_i[6]), .B0(n1), .B1(
        mux_i[2]), .Y(mux_o[2]) );
  AO22_X0P7M_A9TS U2 ( .A0(mux_control_S), .A1(mux_i[7]), .B0(n1), .B1(
        mux_i[3]), .Y(mux_o[3]) );
  INV_X0P8M_A9TS U1 ( .A(mux_control_S), .Y(n1) );
endmodule


module mux_00000004 ( mux_i, mux_control_S, mux_o );
  input [3:0] mux_i;
  output [1:0] mux_o;
  input mux_control_S;
  wire   n1;

  AO22_X0P7M_A9TS U2 ( .A0(mux_control_S), .A1(mux_i[3]), .B0(n1), .B1(
        mux_i[1]), .Y(mux_o[1]) );
  AO22_X0P7M_A9TS U3 ( .A0(mux_control_S), .A1(mux_i[2]), .B0(n1), .B1(
        mux_i[0]), .Y(mux_o[0]) );
  INV_X0P8M_A9TS U1 ( .A(mux_control_S), .Y(n1) );
endmodule


module mux_00000002 ( mux_i, mux_control_S, mux_o );
  input [1:0] mux_i;
  output [0:0] mux_o;
  input mux_control_S;
  wire   n1;

  INV_X0P8M_A9TS U1 ( .A(mux_control_S), .Y(n1) );
  AO22_X0P7M_A9TS U2 ( .A0(mux_control_S), .A1(mux_i[1]), .B0(n1), .B1(
        mux_i[0]), .Y(mux_o[0]) );
endmodule


module Serializer_00000002_00000005_00000004 ( io_clk, io_rst, io_dataIn, 
        io_dataOut );
  input [1:1] io_clk;
  input [1:0] io_dataIn;
  input io_rst;
  output io_dataOut;

  wire   [1:0] reg_SP;

  mux_00000002 mux ( .mux_i(reg_SP), .mux_control_S(io_clk[1]), .mux_o(
        io_dataOut) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(io_clk[1]), .R(
        io_rst), .Q(reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(io_clk[1]), .R(
        io_rst), .Q(reg_SP[0]) );
endmodule


module Serializer_00000004_00000005_00000003 ( io_clk, io_rst, io_dataIn, 
        io_dataOut );
  input [2:1] io_clk;
  input [3:0] io_dataIn;
  input io_rst;
  output io_dataOut;

  wire   [3:0] reg_SP;
  wire   [1:0] dataOut;

  mux_00000004 mux ( .mux_i(reg_SP), .mux_control_S(io_clk[2]), .mux_o(dataOut) );
  Serializer_00000002_00000005_00000004 recursive_serializer ( .io_clk(
        io_clk[1]), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(
        io_dataOut) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_3_ ( .D(io_dataIn[3]), .CK(io_clk[2]), .R(
        io_rst), .Q(reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_2_ ( .D(io_dataIn[2]), .CK(io_clk[2]), .R(
        io_rst), .Q(reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(io_clk[2]), .R(
        io_rst), .Q(reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(io_clk[2]), .R(
        io_rst), .Q(reg_SP[0]) );
endmodule


module Serializer_00000008_00000005_00000002 ( io_clk, io_rst, io_dataIn, 
        io_dataOut );
  input [3:1] io_clk;
  input [7:0] io_dataIn;
  input io_rst;
  output io_dataOut;

  wire   [7:0] reg_SP;
  wire   [3:0] dataOut;

  mux_00000008 mux ( .mux_i(reg_SP), .mux_control_S(io_clk[3]), .mux_o(dataOut) );
  Serializer_00000004_00000005_00000003 recursive_serializer ( .io_clk(
        io_clk[2:1]), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(
        io_dataOut) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_7_ ( .D(io_dataIn[7]), .CK(io_clk[3]), .R(
        io_rst), .Q(reg_SP[7]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_6_ ( .D(io_dataIn[6]), .CK(io_clk[3]), .R(
        io_rst), .Q(reg_SP[6]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_5_ ( .D(io_dataIn[5]), .CK(io_clk[3]), .R(
        io_rst), .Q(reg_SP[5]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_4_ ( .D(io_dataIn[4]), .CK(io_clk[3]), .R(
        io_rst), .Q(reg_SP[4]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_3_ ( .D(io_dataIn[3]), .CK(io_clk[3]), .R(
        io_rst), .Q(reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_2_ ( .D(io_dataIn[2]), .CK(io_clk[3]), .R(
        io_rst), .Q(reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(io_clk[3]), .R(
        io_rst), .Q(reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(io_clk[3]), .R(
        io_rst), .Q(reg_SP[0]) );
endmodule


module Serializer_00000010_00000005_00000001 ( io_clk, io_rst, io_dataIn, 
        io_dataOut );
  input [4:1] io_clk;
  input [15:0] io_dataIn;
  input io_rst;
  output io_dataOut;

  wire   [15:0] reg_SP;
  wire   [7:0] dataOut;

  mux_00000010 mux ( .mux_i(reg_SP), .mux_control_S(io_clk[4]), .mux_o(dataOut) );
  Serializer_00000008_00000005_00000002 recursive_serializer ( .io_clk(
        io_clk[3:1]), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(
        io_dataOut) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_15_ ( .D(io_dataIn[15]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[15]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_14_ ( .D(io_dataIn[14]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[14]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_13_ ( .D(io_dataIn[13]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[13]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_12_ ( .D(io_dataIn[12]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[12]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_11_ ( .D(io_dataIn[11]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[11]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_10_ ( .D(io_dataIn[10]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[10]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_9_ ( .D(io_dataIn[9]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[9]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_8_ ( .D(io_dataIn[8]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[8]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_7_ ( .D(io_dataIn[7]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[7]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_6_ ( .D(io_dataIn[6]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[6]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_5_ ( .D(io_dataIn[5]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[5]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_4_ ( .D(io_dataIn[4]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[4]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_3_ ( .D(io_dataIn[3]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_2_ ( .D(io_dataIn[2]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(io_clk[4]), .R(
        io_rst), .Q(reg_SP[0]) );
endmodule


module Serializer_00000020_00000005_0 ( io_clk, io_rst, io_dataIn, io_dataOut
 );
  input [5:1] io_clk;
  input [31:0] io_dataIn;
  input io_rst;
  output io_dataOut;

  wire   [31:0] reg_SP;
  wire   [15:0] dataOut;

  mux_00000020 mux ( .mux_i(reg_SP), .mux_control_S(io_clk[5]), .mux_o(dataOut) );
  Serializer_00000010_00000005_00000001 recursive_serializer ( .io_clk(
        io_clk[4:1]), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(
        io_dataOut) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_31_ ( .D(io_dataIn[31]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[31]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_30_ ( .D(io_dataIn[30]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[30]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_29_ ( .D(io_dataIn[29]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[29]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_28_ ( .D(io_dataIn[28]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[28]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_27_ ( .D(io_dataIn[27]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[27]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_26_ ( .D(io_dataIn[26]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[26]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_25_ ( .D(io_dataIn[25]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[25]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_24_ ( .D(io_dataIn[24]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[24]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_23_ ( .D(io_dataIn[23]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[23]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_22_ ( .D(io_dataIn[22]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[22]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_21_ ( .D(io_dataIn[21]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[21]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_20_ ( .D(io_dataIn[20]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[20]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_19_ ( .D(io_dataIn[19]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[19]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_18_ ( .D(io_dataIn[18]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[18]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_17_ ( .D(io_dataIn[17]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[17]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_16_ ( .D(io_dataIn[16]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[16]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_15_ ( .D(io_dataIn[15]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[15]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_14_ ( .D(io_dataIn[14]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[14]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_13_ ( .D(io_dataIn[13]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[13]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_12_ ( .D(io_dataIn[12]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[12]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_11_ ( .D(io_dataIn[11]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[11]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_10_ ( .D(io_dataIn[10]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[10]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_9_ ( .D(io_dataIn[9]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[9]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_8_ ( .D(io_dataIn[8]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[8]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_7_ ( .D(io_dataIn[7]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[7]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_6_ ( .D(io_dataIn[6]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[6]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_5_ ( .D(io_dataIn[5]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[5]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_4_ ( .D(io_dataIn[4]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[4]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_3_ ( .D(io_dataIn[3]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_2_ ( .D(io_dataIn[2]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(io_clk[5]), .R(
        io_rst), .Q(reg_SP[0]) );
endmodule


module Clock_divider_0 ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n2;

  DFFRPQ_X1M_A9TS clk_div_reg ( .D(n2), .CK(clk_fast_i), .R(reset), .Q(
        clk_div_o) );
  INV_X0P8M_A9TS U3 ( .A(clk_div_o), .Y(n2) );
endmodule


module Clock_divider_1 ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n2;

  DFFRPQ_X0P5M_A9TS clk_div_reg ( .D(n2), .CK(clk_fast_i), .R(reset), .Q(
        clk_div_o) );
  INV_X0P8M_A9TS U3 ( .A(clk_div_o), .Y(n2) );
endmodule


module Clock_divider_2 ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n2;

  DFFRPQ_X0P5M_A9TS clk_div_reg ( .D(n2), .CK(clk_fast_i), .R(reset), .Q(
        clk_div_o) );
  INV_X0P8M_A9TS U3 ( .A(clk_div_o), .Y(n2) );
endmodule


module Clock_divider_3 ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n2;

  DFFRPQ_X0P5M_A9TS clk_div_reg ( .D(n2), .CK(clk_fast_i), .R(reset), .Q(
        clk_div_o) );
  INV_X0P8M_A9TS U3 ( .A(clk_div_o), .Y(n2) );
endmodule


module toplevel_tree_serializer ( data_i, data_o, clk_i, reset_ni );
  input [31:0] data_i;
  input clk_i, reset_ni;
  output data_o;
  wire   dataOut_SN;
  wire   [5:1] clks;

  Clock_divider_4 clk__1__clock_divider ( .clk_div_o(clks[1]), .clk_fast_i(
        clk_i), .reset(reset_ni) );
  Clock_divider_3 clk__2__clock_divider ( .clk_div_o(clks[2]), .clk_fast_i(
        clks[1]), .reset(reset_ni) );
  Clock_divider_2 clk__3__clock_divider ( .clk_div_o(clks[3]), .clk_fast_i(
        clks[2]), .reset(reset_ni) );
  Clock_divider_1 clk__4__clock_divider ( .clk_div_o(clks[4]), .clk_fast_i(
        clks[3]), .reset(reset_ni) );
  Clock_divider_0 clk__5__clock_divider ( .clk_div_o(clks[5]), .clk_fast_i(
        clks[4]), .reset(reset_ni) );
  Serializer_00000020_00000005_0 Serializer ( .io_clk(clks), .io_rst(reset_ni), 
        .io_dataIn(data_i), .io_dataOut(dataOut_SN) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk_i), .R(reset_ni), 
        .Q(data_o) );
endmodule

