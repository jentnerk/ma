/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Sat Jan 19 13:00:56 2019
/////////////////////////////////////////////////////////////


module Clock_divider ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n1;

  DFFRPQ_X0P5M_A9TS clk_div_reg ( .D(n1), .CK(clk_fast_i), .R(reset), .Q(
        clk_div_o) );
  INV_X0P8M_A9TS U3 ( .A(clk_div_o), .Y(n1) );
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
  INV_X0P8M_A9TS U3 ( .A(io_clk[1]), .Y(n1) );
  AO22_X0P7M_A9TS U4 ( .A0(io_clk[1]), .A1(reg_SP[1]), .B0(n1), .B1(reg_SP[0]), 
        .Y(io_dataOut) );
endmodule


module toplevel_tree_serializer ( data_i, data_o, clk_i, reset_ni );
  input [1:0] data_i;
  input clk_i, reset_ni;
  output data_o;
  wire   clks_1_, dataOut_SN;

  Clock_divider clk__1__clock_divider ( .clk_div_o(clks_1_), .clk_fast_i(clk_i), .reset(reset_ni) );
  Serializer_00000002_00000001_0 Serializer ( .io_clk(clks_1_), .io_rst(
        reset_ni), .io_dataIn(data_i), .io_dataOut(dataOut_SN) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk_i), .R(reset_ni), 
        .Q(data_o) );
endmodule

