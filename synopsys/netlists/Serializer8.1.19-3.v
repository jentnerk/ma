/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Thu Jan 10 14:14:46 2019
/////////////////////////////////////////////////////////////


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
  INV_X0P8M_A9TS U3 ( .A(io_clk[1]), .Y(n1) );
  AO22_X0P7M_A9TS U4 ( .A0(io_clk[1]), .A1(reg_SP[1]), .B0(n1), .B1(reg_SP[0]), 
        .Y(io_dataOut) );
endmodule


module toplevel ( data_i, data_o, clk, reset );
  input [1:0] data_i;
  input clk, reset;
  output data_o;
  wire   n3, clks_1_, dataOut_SN, n1;

  Serializer_00000002_00000001_0 Serializer ( .io_clk(clks_1_), .io_rst(reset), 
        .io_dataIn(data_i), .io_dataOut(dataOut_SN) );
  INV_X0P8M_A9TS U3 ( .A(clks_1_), .Y(n1) );
  DFFRPQ_X0P5M_A9TS genblk1_0__Clock_divider_clkB_reg ( .D(n1), .CK(clk), .R(
        reset), .Q(clks_1_) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk), .R(reset), .Q(
        n3) );
  BUF_X16B_A9TS U4 ( .A(n3), .Y(data_o) );
endmodule

