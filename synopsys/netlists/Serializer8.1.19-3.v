/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Tue Jan  8 14:48:47 2019
/////////////////////////////////////////////////////////////


module Clock_divider ( io_clkB, clk, reset );
  input clk, reset;
  output io_clkB;
  wire   n1;

  DFFRPQ_X0P5M_A9TS clkB_reg ( .D(n1), .CK(clk), .R(reset), .Q(io_clkB) );
  INV_X0P8M_A9TS U3 ( .A(io_clkB), .Y(n1) );
endmodule


module Serializer_00000002_00000001_0 ( io_clk, io_rst, io_dataIn, io_dataOut
 );
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


module toplevel ( data_i, data_o, clk, reset );
  input [1:0] data_i;
  input clk, reset;
  output data_o;
  wire   clks_1_, dataOut_SN;

  Clock_divider genblk1_0__Clock_divider ( .io_clkB(clks_1_), .clk(clk), 
        .reset(reset) );
  Serializer_00000002_00000001_0 Serializer ( .io_clk(clks_1_), .io_rst(reset), 
        .io_dataIn(data_i), .io_dataOut(dataOut_SN) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk), .R(reset), .Q(
        data_o) );
endmodule

