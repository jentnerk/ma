/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Mon Dec 17 16:40:33 2018
/////////////////////////////////////////////////////////////


module Clock_divider_3 ( io_clkB, clk, reset );
  input clk, reset;
  output io_clkB;
  wire   n1;

  DFFRPQ_X0P5M_A9TS clkB_reg ( .D(n1), .CK(clk), .R(reset), .Q(io_clkB) );
  INV_X0P8M_A9TS U3 ( .A(io_clkB), .Y(n1) );
endmodule


module Serializer_00000002_00000004_00000003 ( io_clk, io_rst, io_dataIn, 
        io_dataOut );
  input [1:1] io_clk;
  input [1:0] io_dataIn;
  input io_rst;
  output io_dataOut;
  wire   n1;
  wire   [1:0] reg_SP;

  DFFRPQ_X0P5M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(io_clk[1]), .R(
        io_rst), .Q(reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(io_clk[1]), .R(
        io_rst), .Q(reg_SP[0]) );
  AO22_X0P7M_A9TS U3 ( .A0(io_clk[1]), .A1(reg_SP[1]), .B0(n1), .B1(reg_SP[0]), 
        .Y(io_dataOut) );
  INV_X0P8M_A9TS U4 ( .A(io_clk[1]), .Y(n1) );
endmodule


module Serializer_00000004_00000004_00000002 ( io_clk, io_rst, io_dataIn, 
        io_dataOut );
  input [2:1] io_clk;
  input [3:0] io_dataIn;
  input io_rst;
  output io_dataOut;
  wire   n1;
  wire   [1:0] dataOut;
  wire   [3:0] reg_SP;

  Serializer_00000002_00000004_00000003 genblk1_Serializer ( .io_clk(io_clk[1]), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(io_dataOut) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_3_ ( .D(io_dataIn[3]), .CK(io_clk[2]), .R(
        io_rst), .Q(reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_2_ ( .D(io_dataIn[2]), .CK(io_clk[2]), .R(
        io_rst), .Q(reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(io_clk[2]), .R(
        io_rst), .Q(reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(io_clk[2]), .R(
        io_rst), .Q(reg_SP[0]) );
  INV_X0P8M_A9TS U3 ( .A(io_clk[2]), .Y(n1) );
  AO22_X0P7M_A9TS U4 ( .A0(io_clk[2]), .A1(reg_SP[3]), .B0(n1), .B1(reg_SP[1]), 
        .Y(dataOut[1]) );
  AO22_X0P7M_A9TS U5 ( .A0(io_clk[2]), .A1(reg_SP[2]), .B0(n1), .B1(reg_SP[0]), 
        .Y(dataOut[0]) );
endmodule


module Serializer_00000008_00000004_00000001 ( io_clk, io_rst, io_dataIn, 
        io_dataOut );
  input [3:1] io_clk;
  input [7:0] io_dataIn;
  input io_rst;
  output io_dataOut;
  wire   n1;
  wire   [3:0] dataOut;
  wire   [7:0] reg_SP;

  Serializer_00000004_00000004_00000002 genblk1_Serializer ( .io_clk(
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
  INV_X0P8M_A9TS U3 ( .A(io_clk[3]), .Y(n1) );
  AO22_X0P7M_A9TS U4 ( .A0(io_clk[3]), .A1(reg_SP[7]), .B0(n1), .B1(reg_SP[3]), 
        .Y(dataOut[3]) );
  AO22_X0P7M_A9TS U5 ( .A0(io_clk[3]), .A1(reg_SP[6]), .B0(n1), .B1(reg_SP[2]), 
        .Y(dataOut[2]) );
  AO22_X0P7M_A9TS U6 ( .A0(io_clk[3]), .A1(reg_SP[5]), .B0(n1), .B1(reg_SP[1]), 
        .Y(dataOut[1]) );
  AO22_X0P7M_A9TS U7 ( .A0(io_clk[3]), .A1(reg_SP[4]), .B0(n1), .B1(reg_SP[0]), 
        .Y(dataOut[0]) );
endmodule


module Serializer_00000010_00000004_0 ( io_clk, io_rst, io_dataIn, io_dataOut
 );
  input [4:1] io_clk;
  input [15:0] io_dataIn;
  input io_rst;
  output io_dataOut;
  wire   n1;
  wire   [7:0] dataOut;
  wire   [15:0] reg_SP;

  Serializer_00000008_00000004_00000001 genblk1_Serializer ( .io_clk(
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
  INV_X0P8M_A9TS U3 ( .A(io_clk[4]), .Y(n1) );
  AO22_X0P7M_A9TS U4 ( .A0(io_clk[4]), .A1(reg_SP[15]), .B0(n1), .B1(reg_SP[7]), .Y(dataOut[7]) );
  AO22_X0P7M_A9TS U5 ( .A0(io_clk[4]), .A1(reg_SP[14]), .B0(n1), .B1(reg_SP[6]), .Y(dataOut[6]) );
  AO22_X0P7M_A9TS U6 ( .A0(io_clk[4]), .A1(reg_SP[12]), .B0(n1), .B1(reg_SP[4]), .Y(dataOut[4]) );
  AO22_X0P7M_A9TS U7 ( .A0(io_clk[4]), .A1(reg_SP[11]), .B0(n1), .B1(reg_SP[3]), .Y(dataOut[3]) );
  AO22_X0P7M_A9TS U8 ( .A0(io_clk[4]), .A1(reg_SP[10]), .B0(n1), .B1(reg_SP[2]), .Y(dataOut[2]) );
  AO22_X0P7M_A9TS U9 ( .A0(io_clk[4]), .A1(reg_SP[9]), .B0(n1), .B1(reg_SP[1]), 
        .Y(dataOut[1]) );
  AO22_X0P7M_A9TS U10 ( .A0(io_clk[4]), .A1(reg_SP[8]), .B0(n1), .B1(reg_SP[0]), .Y(dataOut[0]) );
  AO22_X0P7M_A9TS U11 ( .A0(io_clk[4]), .A1(reg_SP[13]), .B0(n1), .B1(
        reg_SP[5]), .Y(dataOut[5]) );
endmodule


module Clock_divider_0 ( io_clkB, clk, reset );
  input clk, reset;
  output io_clkB;
  wire   n2;

  DFFRPQ_X1M_A9TS clkB_reg ( .D(n2), .CK(clk), .R(reset), .Q(io_clkB) );
  INV_X0P8M_A9TS U3 ( .A(io_clkB), .Y(n2) );
endmodule


module Clock_divider_1 ( io_clkB, clk, reset );
  input clk, reset;
  output io_clkB;
  wire   n2;

  DFFRPQ_X0P5M_A9TS clkB_reg ( .D(n2), .CK(clk), .R(reset), .Q(io_clkB) );
  INV_X0P8M_A9TS U3 ( .A(io_clkB), .Y(n2) );
endmodule


module Clock_divider_2 ( io_clkB, clk, reset );
  input clk, reset;
  output io_clkB;
  wire   n2;

  DFFRPQ_X0P5M_A9TS clkB_reg ( .D(n2), .CK(clk), .R(reset), .Q(io_clkB) );
  INV_X0P8M_A9TS U3 ( .A(io_clkB), .Y(n2) );
endmodule


module toplevel ( data_i, data_o, clk, reset );
  input [15:0] data_i;
  input clk, reset;
  output data_o;
  wire   dataOut_SN;
  wire   [4:1] clks;

  Clock_divider_3 genblk1_0__Clock_divider ( .io_clkB(clks[1]), .clk(clk), 
        .reset(reset) );
  Clock_divider_2 genblk1_1__Clock_divider ( .io_clkB(clks[2]), .clk(clks[1]), 
        .reset(reset) );
  Clock_divider_1 genblk1_2__Clock_divider ( .io_clkB(clks[3]), .clk(clks[2]), 
        .reset(reset) );
  Clock_divider_0 genblk1_3__Clock_divider ( .io_clkB(clks[4]), .clk(clks[3]), 
        .reset(reset) );
  Serializer_00000010_00000004_0 Serializer ( .io_clk(clks), .io_rst(reset), 
        .io_dataIn(data_i), .io_dataOut(dataOut_SN) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk), .R(reset), .Q(
        data_o) );
endmodule

