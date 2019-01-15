/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Tue Jan 15 10:58:41 2019
/////////////////////////////////////////////////////////////


module Clock_divider ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n1;

  DFFRPQ_X0P5M_A9TS clk_div_reg ( .D(n1), .CK(clk_fast_i), .R(reset), .Q(
        clk_div_o) );
  INV_X0P8M_A9TS U3 ( .A(clk_div_o), .Y(n1) );
endmodule


module mux_00000002 ( mux_i, mux_control_S, mux_o );
  input [1:0] mux_i;
  output [0:0] mux_o;
  input mux_control_S;
  wire   n1;

  INV_X1M_A9TS U1 ( .A(mux_control_S), .Y(n1) );
  AO22_X1P4M_A9TS U2 ( .A0(mux_control_S), .A1(mux_i[1]), .B0(n1), .B1(
        mux_i[0]), .Y(mux_o[0]) );
endmodule


module Serializer_00000002_00000001_0 ( io_clk, io_rst, io_dataIn, io_dataOut
 );
  input [1:1] io_clk;
  input [1:0] io_dataIn;
  input io_rst;
  output io_dataOut;
  wire   n2, n3, n4, n5;

  mux_00000002 mux ( .mux_i({n5, n3}), .mux_control_S(io_clk[1]), .mux_o(
        io_dataOut) );
  DFFQN_X3M_A9TS reg_SP_reg_1_ ( .D(io_dataIn[1]), .CK(io_clk[1]), .QN(n4) );
  DFFQN_X3M_A9TS reg_SP_reg_0_ ( .D(io_dataIn[0]), .CK(io_clk[1]), .QN(n2) );
  INV_X1M_A9TS U3 ( .A(n2), .Y(n3) );
  INV_X1P7M_A9TS U4 ( .A(n4), .Y(n5) );
endmodule


module toplevel_tree_serializer ( data_i, data_o, clk_i, reset_ni );
  input [1:0] data_i;
  input clk_i, reset_ni;
  output data_o;
  wire   clks_1_, net419, dataOut_SN, n4;

  Clock_divider clk__1__clock_divider ( .clk_div_o(clks_1_), .clk_fast_i(clk_i), .reset(reset_ni) );
  Serializer_00000002_00000001_0 Serializer ( .io_clk(clks_1_), .io_rst(net419), .io_dataIn(data_i), .io_dataOut(dataOut_SN) );
  DFFRPQN_X2M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk_i), .R(net419), 
        .QN(n4) );
  INV_X0P8M_A9TS U6 ( .A(n4), .Y(data_o) );
  TIELO_X1M_A9TS U7 ( .Y(net419) );
endmodule

