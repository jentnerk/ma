/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Sat Jan 19 13:08:03 2019
/////////////////////////////////////////////////////////////


module shift_serializer ( data_i, data_o, clk, reset, ready_o );
  input [49:0] data_i;
  output [0:0] data_o;
  input clk, reset;
  output ready_o;
  wire   n5, n6, n7, n8, n9, n10, n11, n13, n14;
  wire   [48:0] Reg_SP;
  wire   [5:0] Counter_SP;
  wire   [5:0] Counter_SN;
  wire   [49:0] Reg_SN;

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
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_5_ ( .D(Counter_SN[5]), .CK(clk), .R(reset), 
        .Q(Counter_SP[5]) );
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
        Reg_SP[19]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_20_ ( .D(Reg_SN[20]), .CK(clk), .R(reset), .Q(
        Reg_SP[20]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_21_ ( .D(Reg_SN[21]), .CK(clk), .R(reset), .Q(
        Reg_SP[21]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_22_ ( .D(Reg_SN[22]), .CK(clk), .R(reset), .Q(
        Reg_SP[22]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_23_ ( .D(Reg_SN[23]), .CK(clk), .R(reset), .Q(
        Reg_SP[23]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_24_ ( .D(Reg_SN[24]), .CK(clk), .R(reset), .Q(
        Reg_SP[24]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_25_ ( .D(Reg_SN[25]), .CK(clk), .R(reset), .Q(
        Reg_SP[25]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_26_ ( .D(Reg_SN[26]), .CK(clk), .R(reset), .Q(
        Reg_SP[26]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_27_ ( .D(Reg_SN[27]), .CK(clk), .R(reset), .Q(
        Reg_SP[27]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_28_ ( .D(Reg_SN[28]), .CK(clk), .R(reset), .Q(
        Reg_SP[28]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_29_ ( .D(Reg_SN[29]), .CK(clk), .R(reset), .Q(
        Reg_SP[29]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_30_ ( .D(Reg_SN[30]), .CK(clk), .R(reset), .Q(
        Reg_SP[30]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_31_ ( .D(Reg_SN[31]), .CK(clk), .R(reset), .Q(
        Reg_SP[31]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_32_ ( .D(Reg_SN[32]), .CK(clk), .R(reset), .Q(
        Reg_SP[32]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_33_ ( .D(Reg_SN[33]), .CK(clk), .R(reset), .Q(
        Reg_SP[33]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_34_ ( .D(Reg_SN[34]), .CK(clk), .R(reset), .Q(
        Reg_SP[34]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_35_ ( .D(Reg_SN[35]), .CK(clk), .R(reset), .Q(
        Reg_SP[35]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_36_ ( .D(Reg_SN[36]), .CK(clk), .R(reset), .Q(
        Reg_SP[36]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_37_ ( .D(Reg_SN[37]), .CK(clk), .R(reset), .Q(
        Reg_SP[37]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_38_ ( .D(Reg_SN[38]), .CK(clk), .R(reset), .Q(
        Reg_SP[38]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_39_ ( .D(Reg_SN[39]), .CK(clk), .R(reset), .Q(
        Reg_SP[39]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_40_ ( .D(Reg_SN[40]), .CK(clk), .R(reset), .Q(
        Reg_SP[40]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_41_ ( .D(Reg_SN[41]), .CK(clk), .R(reset), .Q(
        Reg_SP[41]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_42_ ( .D(Reg_SN[42]), .CK(clk), .R(reset), .Q(
        Reg_SP[42]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_43_ ( .D(Reg_SN[43]), .CK(clk), .R(reset), .Q(
        Reg_SP[43]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_44_ ( .D(Reg_SN[44]), .CK(clk), .R(reset), .Q(
        Reg_SP[44]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_45_ ( .D(Reg_SN[45]), .CK(clk), .R(reset), .Q(
        Reg_SP[45]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_46_ ( .D(Reg_SN[46]), .CK(clk), .R(reset), .Q(
        Reg_SP[46]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_47_ ( .D(Reg_SN[47]), .CK(clk), .R(reset), .Q(
        Reg_SP[47]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_48_ ( .D(Reg_SN[48]), .CK(clk), .R(reset), .Q(
        Reg_SP[48]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_49_ ( .D(Reg_SN[49]), .CK(clk), .R(reset), .Q(
        data_o[0]) );
  NAND2_X1A_A9TS U64 ( .A(n5), .B(n13), .Y(n11) );
  INV_X0P8M_A9TS U65 ( .A(Counter_SP[5]), .Y(n5) );
  NOR2_X0P7A_A9TS U66 ( .A(Counter_SP[4]), .B(n14), .Y(n13) );
  INV_X0P8M_A9TS U67 ( .A(Counter_SP[3]), .Y(n9) );
  NAND2_X0P5M_A9TS U68 ( .A(n9), .B(n10), .Y(n14) );
  NOR3_X0P5A_A9TS U69 ( .A(Counter_SP[2]), .B(Counter_SP[0]), .C(Counter_SP[1]), .Y(n10) );
  INV_X0P8M_A9TS U70 ( .A(Counter_SP[1]), .Y(n8) );
  NAND2_X0P5M_A9TS U71 ( .A(n8), .B(Counter_SN[0]), .Y(n7) );
  INV_X0P8M_A9TS U72 ( .A(n11), .Y(ready_o) );
  AO22_X0P7M_A9TS U73 ( .A0(ready_o), .A1(data_i[49]), .B0(n11), .B1(
        Reg_SP[48]), .Y(Reg_SN[49]) );
  AO22_X0P7M_A9TS U74 ( .A0(ready_o), .A1(data_i[48]), .B0(n11), .B1(
        Reg_SP[47]), .Y(Reg_SN[48]) );
  AO22_X0P7M_A9TS U75 ( .A0(ready_o), .A1(data_i[47]), .B0(n11), .B1(
        Reg_SP[46]), .Y(Reg_SN[47]) );
  AO22_X0P7M_A9TS U76 ( .A0(ready_o), .A1(data_i[46]), .B0(n11), .B1(
        Reg_SP[45]), .Y(Reg_SN[46]) );
  AO22_X0P7M_A9TS U77 ( .A0(ready_o), .A1(data_i[45]), .B0(n11), .B1(
        Reg_SP[44]), .Y(Reg_SN[45]) );
  AO22_X0P7M_A9TS U78 ( .A0(ready_o), .A1(data_i[44]), .B0(n11), .B1(
        Reg_SP[43]), .Y(Reg_SN[44]) );
  AO22_X0P7M_A9TS U79 ( .A0(ready_o), .A1(data_i[43]), .B0(n11), .B1(
        Reg_SP[42]), .Y(Reg_SN[43]) );
  AO22_X0P7M_A9TS U80 ( .A0(ready_o), .A1(data_i[42]), .B0(n11), .B1(
        Reg_SP[41]), .Y(Reg_SN[42]) );
  AO22_X0P7M_A9TS U81 ( .A0(ready_o), .A1(data_i[41]), .B0(n11), .B1(
        Reg_SP[40]), .Y(Reg_SN[41]) );
  AO22_X0P7M_A9TS U82 ( .A0(ready_o), .A1(data_i[40]), .B0(n11), .B1(
        Reg_SP[39]), .Y(Reg_SN[40]) );
  AO22_X0P7M_A9TS U83 ( .A0(ready_o), .A1(data_i[39]), .B0(n11), .B1(
        Reg_SP[38]), .Y(Reg_SN[39]) );
  AO22_X0P7M_A9TS U84 ( .A0(ready_o), .A1(data_i[38]), .B0(n11), .B1(
        Reg_SP[37]), .Y(Reg_SN[38]) );
  AO22_X0P7M_A9TS U85 ( .A0(ready_o), .A1(data_i[37]), .B0(n11), .B1(
        Reg_SP[36]), .Y(Reg_SN[37]) );
  AO22_X0P7M_A9TS U86 ( .A0(ready_o), .A1(data_i[36]), .B0(n11), .B1(
        Reg_SP[35]), .Y(Reg_SN[36]) );
  AO22_X0P7M_A9TS U87 ( .A0(ready_o), .A1(data_i[35]), .B0(n11), .B1(
        Reg_SP[34]), .Y(Reg_SN[35]) );
  AO22_X0P7M_A9TS U88 ( .A0(ready_o), .A1(data_i[34]), .B0(n11), .B1(
        Reg_SP[33]), .Y(Reg_SN[34]) );
  AO22_X0P7M_A9TS U89 ( .A0(ready_o), .A1(data_i[33]), .B0(n11), .B1(
        Reg_SP[32]), .Y(Reg_SN[33]) );
  AO22_X0P7M_A9TS U90 ( .A0(ready_o), .A1(data_i[32]), .B0(n11), .B1(
        Reg_SP[31]), .Y(Reg_SN[32]) );
  AO22_X0P7M_A9TS U91 ( .A0(ready_o), .A1(data_i[31]), .B0(n11), .B1(
        Reg_SP[30]), .Y(Reg_SN[31]) );
  AO22_X0P7M_A9TS U92 ( .A0(ready_o), .A1(data_i[30]), .B0(n11), .B1(
        Reg_SP[29]), .Y(Reg_SN[30]) );
  AO22_X0P7M_A9TS U93 ( .A0(ready_o), .A1(data_i[29]), .B0(n11), .B1(
        Reg_SP[28]), .Y(Reg_SN[29]) );
  AO22_X0P7M_A9TS U94 ( .A0(ready_o), .A1(data_i[28]), .B0(n11), .B1(
        Reg_SP[27]), .Y(Reg_SN[28]) );
  AO22_X0P7M_A9TS U95 ( .A0(ready_o), .A1(data_i[27]), .B0(n11), .B1(
        Reg_SP[26]), .Y(Reg_SN[27]) );
  AO22_X0P7M_A9TS U96 ( .A0(ready_o), .A1(data_i[26]), .B0(n11), .B1(
        Reg_SP[25]), .Y(Reg_SN[26]) );
  AO22_X0P7M_A9TS U97 ( .A0(ready_o), .A1(data_i[25]), .B0(n11), .B1(
        Reg_SP[24]), .Y(Reg_SN[25]) );
  AO22_X0P7M_A9TS U98 ( .A0(ready_o), .A1(data_i[24]), .B0(n11), .B1(
        Reg_SP[23]), .Y(Reg_SN[24]) );
  AO22_X0P7M_A9TS U99 ( .A0(ready_o), .A1(data_i[23]), .B0(n11), .B1(
        Reg_SP[22]), .Y(Reg_SN[23]) );
  AO22_X0P7M_A9TS U100 ( .A0(ready_o), .A1(data_i[22]), .B0(n11), .B1(
        Reg_SP[21]), .Y(Reg_SN[22]) );
  AO22_X0P7M_A9TS U101 ( .A0(ready_o), .A1(data_i[21]), .B0(n11), .B1(
        Reg_SP[20]), .Y(Reg_SN[21]) );
  AO22_X0P7M_A9TS U102 ( .A0(ready_o), .A1(data_i[20]), .B0(n11), .B1(
        Reg_SP[19]), .Y(Reg_SN[20]) );
  AO22_X0P7M_A9TS U103 ( .A0(ready_o), .A1(data_i[19]), .B0(n11), .B1(
        Reg_SP[18]), .Y(Reg_SN[19]) );
  AO22_X0P7M_A9TS U104 ( .A0(ready_o), .A1(data_i[18]), .B0(n11), .B1(
        Reg_SP[17]), .Y(Reg_SN[18]) );
  AO22_X0P7M_A9TS U105 ( .A0(ready_o), .A1(data_i[17]), .B0(n11), .B1(
        Reg_SP[16]), .Y(Reg_SN[17]) );
  AO22_X0P7M_A9TS U106 ( .A0(ready_o), .A1(data_i[16]), .B0(n11), .B1(
        Reg_SP[15]), .Y(Reg_SN[16]) );
  AO22_X0P7M_A9TS U107 ( .A0(ready_o), .A1(data_i[15]), .B0(n11), .B1(
        Reg_SP[14]), .Y(Reg_SN[15]) );
  AO22_X0P7M_A9TS U108 ( .A0(ready_o), .A1(data_i[14]), .B0(n11), .B1(
        Reg_SP[13]), .Y(Reg_SN[14]) );
  AO22_X0P7M_A9TS U109 ( .A0(ready_o), .A1(data_i[13]), .B0(n11), .B1(
        Reg_SP[12]), .Y(Reg_SN[13]) );
  AO22_X0P7M_A9TS U110 ( .A0(ready_o), .A1(data_i[12]), .B0(n11), .B1(
        Reg_SP[11]), .Y(Reg_SN[12]) );
  AO22_X0P7M_A9TS U111 ( .A0(ready_o), .A1(data_i[11]), .B0(n11), .B1(
        Reg_SP[10]), .Y(Reg_SN[11]) );
  AO22_X0P7M_A9TS U112 ( .A0(ready_o), .A1(data_i[10]), .B0(n11), .B1(
        Reg_SP[9]), .Y(Reg_SN[10]) );
  AO22_X0P7M_A9TS U113 ( .A0(ready_o), .A1(data_i[9]), .B0(n11), .B1(Reg_SP[8]), .Y(Reg_SN[9]) );
  AO22_X0P7M_A9TS U114 ( .A0(ready_o), .A1(data_i[8]), .B0(n11), .B1(Reg_SP[7]), .Y(Reg_SN[8]) );
  AO22_X0P7M_A9TS U115 ( .A0(ready_o), .A1(data_i[7]), .B0(n11), .B1(Reg_SP[6]), .Y(Reg_SN[7]) );
  AO22_X0P7M_A9TS U116 ( .A0(ready_o), .A1(data_i[6]), .B0(n11), .B1(Reg_SP[5]), .Y(Reg_SN[6]) );
  AO22_X0P7M_A9TS U117 ( .A0(ready_o), .A1(data_i[5]), .B0(n11), .B1(Reg_SP[4]), .Y(Reg_SN[5]) );
  AO22_X0P7M_A9TS U118 ( .A0(ready_o), .A1(data_i[4]), .B0(n11), .B1(Reg_SP[3]), .Y(Reg_SN[4]) );
  AO22_X0P7M_A9TS U119 ( .A0(ready_o), .A1(data_i[3]), .B0(n11), .B1(Reg_SP[2]), .Y(Reg_SN[3]) );
  AO22_X0P7M_A9TS U120 ( .A0(ready_o), .A1(data_i[2]), .B0(n11), .B1(Reg_SP[1]), .Y(Reg_SN[2]) );
  AO22_X0P7M_A9TS U121 ( .A0(ready_o), .A1(data_i[1]), .B0(n11), .B1(Reg_SP[0]), .Y(Reg_SN[1]) );
  AND2_X0P7M_A9TS U122 ( .A(data_i[0]), .B(ready_o), .Y(Reg_SN[0]) );
  OAI21_X0P7M_A9TS U123 ( .A0(n13), .A1(n5), .B0(n11), .Y(Counter_SN[5]) );
  OA21A1OI2_X0P7M_A9TS U124 ( .A0(n10), .A1(n9), .B0(n14), .C0(ready_o), .Y(
        Counter_SN[3]) );
  NOR2_X0P7A_A9TS U125 ( .A(n6), .B(ready_o), .Y(Counter_SN[2]) );
  AOI21_X0P7M_A9TS U126 ( .A0(Counter_SP[2]), .A1(n7), .B0(n10), .Y(n6) );
  OA21A1OI2_X0P7M_A9TS U127 ( .A0(n8), .A1(Counter_SN[0]), .B0(n7), .C0(
        ready_o), .Y(Counter_SN[1]) );
  INV_X0P8M_A9TS U128 ( .A(Counter_SP[0]), .Y(Counter_SN[0]) );
  AO21_X1M_A9TS U129 ( .A0(Counter_SP[4]), .A1(n14), .B0(n13), .Y(
        Counter_SN[4]) );
endmodule

