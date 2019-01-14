/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Mon Jan 14 11:15:53 2019
/////////////////////////////////////////////////////////////


module toplevel_tree_serializer ( data_i, data_o, clk, reset );
  input [3:0] data_i;
  input clk, reset;
  output data_o;
  wire   n4, dataOut_SN, n1, n2;
  wire   [2:1] clks;
  wire   [3:0] Serializer_reg_SP;
  wire   [1:0] Serializer_dataOut;
  wire   [1:0] Serializer_genblk1_Serializer_reg_SP;

  DFFRPQ_X0P5M_A9TS Serializer_genblk1_Serializer_reg_SP_reg_0_ ( .D(
        Serializer_dataOut[0]), .CK(clks[1]), .R(reset), .Q(
        Serializer_genblk1_Serializer_reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS Serializer_genblk1_Serializer_reg_SP_reg_1_ ( .D(
        Serializer_dataOut[1]), .CK(clks[1]), .R(reset), .Q(
        Serializer_genblk1_Serializer_reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS genblk1_1__Clock_divider_clkB_reg ( .D(n2), .CK(clks[1]), 
        .R(reset), .Q(clks[2]) );
  DFFRPQ_X0P5M_A9TS genblk1_0__Clock_divider_clkB_reg ( .D(n1), .CK(clk), .R(
        reset), .Q(clks[1]) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk), .R(reset), .Q(
        n4) );
  INV_X0P8M_A9TS U3 ( .A(clks[1]), .Y(n1) );
  AO22_X0P7M_A9TS U7 ( .A0(clks[1]), .A1(
        Serializer_genblk1_Serializer_reg_SP[1]), .B0(n1), .B1(
        Serializer_genblk1_Serializer_reg_SP[0]), .Y(dataOut_SN) );
  DFFRPQ_X0P5M_A9TS Serializer_reg_SP_reg_2_ ( .D(data_i[2]), .CK(clks[2]), 
        .R(reset), .Q(Serializer_reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS Serializer_reg_SP_reg_0_ ( .D(data_i[0]), .CK(clks[2]), 
        .R(reset), .Q(Serializer_reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS Serializer_reg_SP_reg_3_ ( .D(data_i[3]), .CK(clks[2]), 
        .R(reset), .Q(Serializer_reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS Serializer_reg_SP_reg_1_ ( .D(data_i[1]), .CK(clks[2]), 
        .R(reset), .Q(Serializer_reg_SP[1]) );
  BUF_X16B_A9TS U8 ( .A(n4), .Y(data_o) );
  INV_X0P8M_A9TS U9 ( .A(clks[2]), .Y(n2) );
  AO22_X0P7M_A9TS U10 ( .A0(clks[2]), .A1(Serializer_reg_SP[2]), .B0(n2), .B1(
        Serializer_reg_SP[0]), .Y(Serializer_dataOut[0]) );
  AO22_X0P7M_A9TS U11 ( .A0(clks[2]), .A1(Serializer_reg_SP[3]), .B0(n2), .B1(
        Serializer_reg_SP[1]), .Y(Serializer_dataOut[1]) );
endmodule

