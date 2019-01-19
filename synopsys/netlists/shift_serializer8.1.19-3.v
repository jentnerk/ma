/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Sat Jan 19 12:12:01 2019
/////////////////////////////////////////////////////////////


module shift_serializer ( data_i, data_o, clk, reset, ready_o );
  input [19:0] data_i;
  output [0:0] data_o;
  input clk, reset;
  output ready_o;
  wire   n14, n6, n7, n8, n9, n10, n11, n12;
  wire   [18:0] Reg_SP;
  wire   [4:0] Counter_SP;
  wire   [4:0] Counter_SN;
  wire   [19:0] Reg_SN;

  DFFRPQ_X0P5M_A9TS Counter_SP_reg_0_ ( .D(Counter_SN[0]), .CK(clk), .R(reset), 
        .Q(Counter_SP[0]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_1_ ( .D(Counter_SN[1]), .CK(clk), .R(reset), 
        .Q(Counter_SP[1]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_2_ ( .D(Counter_SN[2]), .CK(clk), .R(reset), 
        .Q(Counter_SP[2]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_3_ ( .D(Counter_SN[3]), .CK(clk), .R(reset), 
        .Q(Counter_SP[3]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_4_ ( .D(Counter_SN[4]), .CK(clk), .R(reset), 
        .Q(Counter_SP[4]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_0_ ( .D(Reg_SN[0]), .CK(clk), .R(reset), .Q(
        Reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_1_ ( .D(Reg_SN[1]), .CK(clk), .R(reset), .Q(
        Reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_2_ ( .D(Reg_SN[2]), .CK(clk), .R(reset), .Q(
        Reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_3_ ( .D(Reg_SN[3]), .CK(clk), .R(reset), .Q(
        Reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_4_ ( .D(Reg_SN[4]), .CK(clk), .R(reset), .Q(
        Reg_SP[4]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_5_ ( .D(Reg_SN[5]), .CK(clk), .R(reset), .Q(
        Reg_SP[5]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_6_ ( .D(Reg_SN[6]), .CK(clk), .R(reset), .Q(
        Reg_SP[6]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_7_ ( .D(Reg_SN[7]), .CK(clk), .R(reset), .Q(
        Reg_SP[7]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_8_ ( .D(Reg_SN[8]), .CK(clk), .R(reset), .Q(
        Reg_SP[8]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_9_ ( .D(Reg_SN[9]), .CK(clk), .R(reset), .Q(
        Reg_SP[9]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_10_ ( .D(Reg_SN[10]), .CK(clk), .R(reset), .Q(
        Reg_SP[10]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_11_ ( .D(Reg_SN[11]), .CK(clk), .R(reset), .Q(
        Reg_SP[11]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_12_ ( .D(Reg_SN[12]), .CK(clk), .R(reset), .Q(
        Reg_SP[12]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_13_ ( .D(Reg_SN[13]), .CK(clk), .R(reset), .Q(
        Reg_SP[13]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_14_ ( .D(Reg_SN[14]), .CK(clk), .R(reset), .Q(
        Reg_SP[14]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_15_ ( .D(Reg_SN[15]), .CK(clk), .R(reset), .Q(
        Reg_SP[15]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_16_ ( .D(Reg_SN[16]), .CK(clk), .R(reset), .Q(
        Reg_SP[16]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_17_ ( .D(Reg_SN[17]), .CK(clk), .R(reset), .Q(
        Reg_SP[17]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_18_ ( .D(Reg_SN[18]), .CK(clk), .R(reset), .Q(
        Reg_SP[18]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_19_ ( .D(Reg_SN[19]), .CK(clk), .R(reset), .Q(
        n14) );
  INV_X0P8M_A9TS U33 ( .A(Counter_SP[4]), .Y(n7) );
  NOR2_X0P7A_A9TS U34 ( .A(Counter_SP[3]), .B(n10), .Y(n8) );
  INV_X0P8M_A9TS U35 ( .A(Counter_SP[2]), .Y(n11) );
  NAND2_X0P5M_A9TS U36 ( .A(n11), .B(n12), .Y(n10) );
  NOR2_X0P7A_A9TS U37 ( .A(Counter_SP[0]), .B(Counter_SP[1]), .Y(n12) );
  INV_X0P8M_A9TS U38 ( .A(n6), .Y(ready_o) );
  AO22_X0P7M_A9TS U39 ( .A0(ready_o), .A1(data_i[19]), .B0(n6), .B1(Reg_SP[18]), .Y(Reg_SN[19]) );
  AO22_X0P7M_A9TS U40 ( .A0(ready_o), .A1(data_i[18]), .B0(n6), .B1(Reg_SP[17]), .Y(Reg_SN[18]) );
  AO22_X0P7M_A9TS U41 ( .A0(ready_o), .A1(data_i[17]), .B0(n6), .B1(Reg_SP[16]), .Y(Reg_SN[17]) );
  AO22_X0P7M_A9TS U42 ( .A0(ready_o), .A1(data_i[16]), .B0(n6), .B1(Reg_SP[15]), .Y(Reg_SN[16]) );
  AO22_X0P7M_A9TS U43 ( .A0(ready_o), .A1(data_i[15]), .B0(n6), .B1(Reg_SP[14]), .Y(Reg_SN[15]) );
  AO22_X0P7M_A9TS U44 ( .A0(ready_o), .A1(data_i[14]), .B0(n6), .B1(Reg_SP[13]), .Y(Reg_SN[14]) );
  AO22_X0P7M_A9TS U45 ( .A0(ready_o), .A1(data_i[13]), .B0(n6), .B1(Reg_SP[12]), .Y(Reg_SN[13]) );
  AO22_X0P7M_A9TS U46 ( .A0(ready_o), .A1(data_i[12]), .B0(n6), .B1(Reg_SP[11]), .Y(Reg_SN[12]) );
  AO22_X0P7M_A9TS U47 ( .A0(ready_o), .A1(data_i[11]), .B0(n6), .B1(Reg_SP[10]), .Y(Reg_SN[11]) );
  AO22_X0P7M_A9TS U48 ( .A0(ready_o), .A1(data_i[10]), .B0(n6), .B1(Reg_SP[9]), 
        .Y(Reg_SN[10]) );
  AO22_X0P7M_A9TS U49 ( .A0(ready_o), .A1(data_i[9]), .B0(n6), .B1(Reg_SP[8]), 
        .Y(Reg_SN[9]) );
  AO22_X0P7M_A9TS U50 ( .A0(ready_o), .A1(data_i[8]), .B0(n6), .B1(Reg_SP[7]), 
        .Y(Reg_SN[8]) );
  AO22_X0P7M_A9TS U51 ( .A0(ready_o), .A1(data_i[7]), .B0(n6), .B1(Reg_SP[6]), 
        .Y(Reg_SN[7]) );
  AO22_X0P7M_A9TS U52 ( .A0(ready_o), .A1(data_i[6]), .B0(n6), .B1(Reg_SP[5]), 
        .Y(Reg_SN[6]) );
  AO22_X0P7M_A9TS U53 ( .A0(ready_o), .A1(data_i[5]), .B0(n6), .B1(Reg_SP[4]), 
        .Y(Reg_SN[5]) );
  AO22_X0P7M_A9TS U54 ( .A0(ready_o), .A1(data_i[4]), .B0(n6), .B1(Reg_SP[3]), 
        .Y(Reg_SN[4]) );
  AO22_X0P7M_A9TS U55 ( .A0(ready_o), .A1(data_i[3]), .B0(n6), .B1(Reg_SP[2]), 
        .Y(Reg_SN[3]) );
  AO22_X0P7M_A9TS U56 ( .A0(ready_o), .A1(data_i[2]), .B0(n6), .B1(Reg_SP[1]), 
        .Y(Reg_SN[2]) );
  AO22_X0P7M_A9TS U57 ( .A0(ready_o), .A1(data_i[1]), .B0(n6), .B1(Reg_SP[0]), 
        .Y(Reg_SN[1]) );
  AND2_X0P7M_A9TS U58 ( .A(data_i[0]), .B(ready_o), .Y(Reg_SN[0]) );
  OAI21_X0P7M_A9TS U59 ( .A0(n8), .A1(n7), .B0(n6), .Y(Counter_SN[4]) );
  NOR2_X0P7A_A9TS U60 ( .A(n9), .B(ready_o), .Y(Counter_SN[3]) );
  AOI21_X0P7M_A9TS U61 ( .A0(Counter_SP[3]), .A1(n10), .B0(n8), .Y(n9) );
  OA21A1OI2_X0P7M_A9TS U62 ( .A0(n12), .A1(n11), .B0(n10), .C0(ready_o), .Y(
        Counter_SN[2]) );
  INV_X0P8M_A9TS U63 ( .A(Counter_SP[0]), .Y(Counter_SN[0]) );
  BUF_X16B_A9TS U64 ( .A(n14), .Y(data_o[0]) );
  NAND2_X0P5M_A9TS U65 ( .A(n7), .B(n8), .Y(n6) );
  AO21_X1M_A9TS U66 ( .A0(Counter_SP[1]), .A1(Counter_SP[0]), .B0(n12), .Y(
        Counter_SN[1]) );
endmodule

