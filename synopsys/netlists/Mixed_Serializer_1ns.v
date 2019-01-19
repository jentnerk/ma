/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Sat Jan 19 13:27:56 2019
/////////////////////////////////////////////////////////////


module Clock_divider_3 ( clk_div_o, clk_fast_i, reset );
  input clk_fast_i, reset;
  output clk_div_o;
  wire   n1;

  DFFRPQ_X0P5M_A9TS clk_div_reg ( .D(n1), .CK(clk_fast_i), .R(reset), .Q(
        clk_div_o) );
  INV_X0P8M_A9TS U3 ( .A(clk_div_o), .Y(n1) );
endmodule


module shift_serializer_00000020_00000005_00000010 ( data_i, data_o, clk, 
        reset, ready_o );
  input [31:0] data_i;
  output [15:0] data_o;
  input clk, reset;
  output ready_o;
  wire   Reg_SP_30_, Reg_SP_28, Reg_SP_26, Reg_SP_24, Reg_SP_22, Reg_SP_20,
         Reg_SP_18, Reg_SP_16, Reg_SP_14, Reg_SP_12, Reg_SP_10, Reg_SP_8,
         Reg_SP_6, Reg_SP_4, Reg_SP_2, Reg_SP_0, Counter_SP_0_;
  wire   [31:0] Reg_SN;

  DFFRPQ_X0P5M_A9TS Reg_SP_reg_0_ ( .D(Reg_SN[0]), .CK(clk), .R(reset), .Q(
        Reg_SP_0) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_1_ ( .D(Reg_SN[1]), .CK(clk), .R(reset), .Q(
        data_o[0]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_2_ ( .D(Reg_SN[2]), .CK(clk), .R(reset), .Q(
        Reg_SP_2) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_3_ ( .D(Reg_SN[3]), .CK(clk), .R(reset), .Q(
        data_o[1]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_4_ ( .D(Reg_SN[4]), .CK(clk), .R(reset), .Q(
        Reg_SP_4) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_5_ ( .D(Reg_SN[5]), .CK(clk), .R(reset), .Q(
        data_o[2]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_6_ ( .D(Reg_SN[6]), .CK(clk), .R(reset), .Q(
        Reg_SP_6) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_7_ ( .D(Reg_SN[7]), .CK(clk), .R(reset), .Q(
        data_o[3]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_8_ ( .D(Reg_SN[8]), .CK(clk), .R(reset), .Q(
        Reg_SP_8) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_9_ ( .D(Reg_SN[9]), .CK(clk), .R(reset), .Q(
        data_o[4]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_10_ ( .D(Reg_SN[10]), .CK(clk), .R(reset), .Q(
        Reg_SP_10) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_11_ ( .D(Reg_SN[11]), .CK(clk), .R(reset), .Q(
        data_o[5]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_12_ ( .D(Reg_SN[12]), .CK(clk), .R(reset), .Q(
        Reg_SP_12) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_13_ ( .D(Reg_SN[13]), .CK(clk), .R(reset), .Q(
        data_o[6]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_14_ ( .D(Reg_SN[14]), .CK(clk), .R(reset), .Q(
        Reg_SP_14) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_15_ ( .D(Reg_SN[15]), .CK(clk), .R(reset), .Q(
        data_o[7]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_16_ ( .D(Reg_SN[16]), .CK(clk), .R(reset), .Q(
        Reg_SP_16) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_17_ ( .D(Reg_SN[17]), .CK(clk), .R(reset), .Q(
        data_o[8]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_18_ ( .D(Reg_SN[18]), .CK(clk), .R(reset), .Q(
        Reg_SP_18) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_19_ ( .D(Reg_SN[19]), .CK(clk), .R(reset), .Q(
        data_o[9]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_20_ ( .D(Reg_SN[20]), .CK(clk), .R(reset), .Q(
        Reg_SP_20) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_21_ ( .D(Reg_SN[21]), .CK(clk), .R(reset), .Q(
        data_o[10]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_22_ ( .D(Reg_SN[22]), .CK(clk), .R(reset), .Q(
        Reg_SP_22) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_23_ ( .D(Reg_SN[23]), .CK(clk), .R(reset), .Q(
        data_o[11]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_24_ ( .D(Reg_SN[24]), .CK(clk), .R(reset), .Q(
        Reg_SP_24) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_25_ ( .D(Reg_SN[25]), .CK(clk), .R(reset), .Q(
        data_o[12]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_26_ ( .D(Reg_SN[26]), .CK(clk), .R(reset), .Q(
        Reg_SP_26) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_27_ ( .D(Reg_SN[27]), .CK(clk), .R(reset), .Q(
        data_o[13]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_28_ ( .D(Reg_SN[28]), .CK(clk), .R(reset), .Q(
        Reg_SP_28) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_29_ ( .D(Reg_SN[29]), .CK(clk), .R(reset), .Q(
        data_o[14]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_30_ ( .D(Reg_SN[30]), .CK(clk), .R(reset), .Q(
        Reg_SP_30_) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_31_ ( .D(Reg_SN[31]), .CK(clk), .R(reset), .Q(
        data_o[15]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_0_ ( .D(ready_o), .CK(clk), .R(reset), .Q(
        Counter_SP_0_) );
  INV_X0P8M_A9TS U3 ( .A(Counter_SP_0_), .Y(ready_o) );
  AND2_X0P7M_A9TS U4 ( .A(data_i[0]), .B(ready_o), .Y(Reg_SN[0]) );
  AO22_X0P7M_A9TS U5 ( .A0(Counter_SP_0_), .A1(data_o[0]), .B0(ready_o), .B1(
        data_i[1]), .Y(Reg_SN[2]) );
  AO22_X0P7M_A9TS U6 ( .A0(Counter_SP_0_), .A1(Reg_SP_2), .B0(ready_o), .B1(
        data_i[17]), .Y(Reg_SN[3]) );
  AO22_X0P7M_A9TS U7 ( .A0(Counter_SP_0_), .A1(Reg_SP_0), .B0(ready_o), .B1(
        data_i[16]), .Y(Reg_SN[1]) );
  AO22_X0P7M_A9TS U8 ( .A0(Counter_SP_0_), .A1(Reg_SP_4), .B0(ready_o), .B1(
        data_i[18]), .Y(Reg_SN[5]) );
  AO22_X0P7M_A9TS U9 ( .A0(Counter_SP_0_), .A1(data_o[2]), .B0(ready_o), .B1(
        data_i[3]), .Y(Reg_SN[6]) );
  AO22_X0P7M_A9TS U10 ( .A0(Counter_SP_0_), .A1(Reg_SP_6), .B0(ready_o), .B1(
        data_i[19]), .Y(Reg_SN[7]) );
  AO22_X0P7M_A9TS U11 ( .A0(Counter_SP_0_), .A1(data_o[3]), .B0(ready_o), .B1(
        data_i[4]), .Y(Reg_SN[8]) );
  AO22_X0P7M_A9TS U12 ( .A0(Counter_SP_0_), .A1(Reg_SP_8), .B0(ready_o), .B1(
        data_i[20]), .Y(Reg_SN[9]) );
  AO22_X0P7M_A9TS U13 ( .A0(Counter_SP_0_), .A1(data_o[1]), .B0(ready_o), .B1(
        data_i[2]), .Y(Reg_SN[4]) );
  AO22_X0P7M_A9TS U14 ( .A0(Counter_SP_0_), .A1(Reg_SP_10), .B0(ready_o), .B1(
        data_i[21]), .Y(Reg_SN[11]) );
  AO22_X0P7M_A9TS U15 ( .A0(Counter_SP_0_), .A1(data_o[5]), .B0(ready_o), .B1(
        data_i[6]), .Y(Reg_SN[12]) );
  AO22_X0P7M_A9TS U16 ( .A0(Counter_SP_0_), .A1(Reg_SP_12), .B0(ready_o), .B1(
        data_i[22]), .Y(Reg_SN[13]) );
  AO22_X0P7M_A9TS U17 ( .A0(Counter_SP_0_), .A1(data_o[6]), .B0(ready_o), .B1(
        data_i[7]), .Y(Reg_SN[14]) );
  AO22_X0P7M_A9TS U18 ( .A0(Counter_SP_0_), .A1(Reg_SP_14), .B0(ready_o), .B1(
        data_i[23]), .Y(Reg_SN[15]) );
  AO22_X0P7M_A9TS U19 ( .A0(Counter_SP_0_), .A1(data_o[7]), .B0(ready_o), .B1(
        data_i[8]), .Y(Reg_SN[16]) );
  AO22_X0P7M_A9TS U20 ( .A0(Counter_SP_0_), .A1(Reg_SP_16), .B0(ready_o), .B1(
        data_i[24]), .Y(Reg_SN[17]) );
  AO22_X0P7M_A9TS U21 ( .A0(Counter_SP_0_), .A1(data_o[4]), .B0(ready_o), .B1(
        data_i[5]), .Y(Reg_SN[10]) );
  AO22_X0P7M_A9TS U22 ( .A0(Counter_SP_0_), .A1(data_o[8]), .B0(ready_o), .B1(
        data_i[9]), .Y(Reg_SN[18]) );
  AO22_X0P7M_A9TS U23 ( .A0(Counter_SP_0_), .A1(Reg_SP_18), .B0(ready_o), .B1(
        data_i[25]), .Y(Reg_SN[19]) );
  AO22_X0P7M_A9TS U24 ( .A0(Counter_SP_0_), .A1(data_o[9]), .B0(ready_o), .B1(
        data_i[10]), .Y(Reg_SN[20]) );
  AO22_X0P7M_A9TS U25 ( .A0(Counter_SP_0_), .A1(Reg_SP_20), .B0(ready_o), .B1(
        data_i[26]), .Y(Reg_SN[21]) );
  AO22_X0P7M_A9TS U26 ( .A0(Counter_SP_0_), .A1(data_o[10]), .B0(ready_o), 
        .B1(data_i[11]), .Y(Reg_SN[22]) );
  AO22_X0P7M_A9TS U27 ( .A0(Counter_SP_0_), .A1(Reg_SP_22), .B0(ready_o), .B1(
        data_i[27]), .Y(Reg_SN[23]) );
  AO22_X0P7M_A9TS U28 ( .A0(Counter_SP_0_), .A1(data_o[11]), .B0(ready_o), 
        .B1(data_i[12]), .Y(Reg_SN[24]) );
  AO22_X0P7M_A9TS U29 ( .A0(Counter_SP_0_), .A1(Reg_SP_24), .B0(ready_o), .B1(
        data_i[28]), .Y(Reg_SN[25]) );
  AO22_X0P7M_A9TS U30 ( .A0(Counter_SP_0_), .A1(data_o[12]), .B0(ready_o), 
        .B1(data_i[13]), .Y(Reg_SN[26]) );
  AO22_X0P7M_A9TS U31 ( .A0(Counter_SP_0_), .A1(Reg_SP_26), .B0(ready_o), .B1(
        data_i[29]), .Y(Reg_SN[27]) );
  AO22_X0P7M_A9TS U32 ( .A0(Counter_SP_0_), .A1(data_o[13]), .B0(ready_o), 
        .B1(data_i[14]), .Y(Reg_SN[28]) );
  AO22_X0P7M_A9TS U33 ( .A0(Counter_SP_0_), .A1(Reg_SP_28), .B0(ready_o), .B1(
        data_i[30]), .Y(Reg_SN[29]) );
  AO22_X0P7M_A9TS U34 ( .A0(Counter_SP_0_), .A1(data_o[14]), .B0(ready_o), 
        .B1(data_i[15]), .Y(Reg_SN[30]) );
  AO22_X0P7M_A9TS U35 ( .A0(Counter_SP_0_), .A1(Reg_SP_30_), .B0(ready_o), 
        .B1(data_i[31]), .Y(Reg_SN[31]) );
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
  INV_X0P8M_A9TS U3 ( .A(io_clk[1]), .Y(n1) );
  AO22_X0P7M_A9TS U4 ( .A0(io_clk[1]), .A1(reg_SP[1]), .B0(n1), .B1(reg_SP[0]), 
        .Y(io_dataOut) );
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
  AO22_X0P7M_A9TS U4 ( .A0(io_clk[2]), .A1(reg_SP[3]), .B0(n1), .B1(reg_SP[1]), 
        .Y(dataOut[1]) );
  AO22_X0P7M_A9TS U5 ( .A0(io_clk[2]), .A1(reg_SP[2]), .B0(n1), .B1(reg_SP[0]), 
        .Y(dataOut[0]) );
  INV_X0P8M_A9TS U3 ( .A(io_clk[2]), .Y(n1) );
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
  AO22_X0P7M_A9TS U4 ( .A0(io_clk[3]), .A1(reg_SP[7]), .B0(n1), .B1(reg_SP[3]), 
        .Y(dataOut[3]) );
  AO22_X0P7M_A9TS U6 ( .A0(io_clk[3]), .A1(reg_SP[5]), .B0(n1), .B1(reg_SP[1]), 
        .Y(dataOut[1]) );
  AO22_X0P7M_A9TS U5 ( .A0(io_clk[3]), .A1(reg_SP[6]), .B0(n1), .B1(reg_SP[2]), 
        .Y(dataOut[2]) );
  AO22_X0P7M_A9TS U7 ( .A0(io_clk[3]), .A1(reg_SP[4]), .B0(n1), .B1(reg_SP[0]), 
        .Y(dataOut[0]) );
  INV_X0P8M_A9TS U3 ( .A(io_clk[3]), .Y(n1) );
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
  AO22_X0P7M_A9TS U4 ( .A0(io_clk[4]), .A1(reg_SP[15]), .B0(n1), .B1(reg_SP[7]), .Y(dataOut[7]) );
  AO22_X0P7M_A9TS U10 ( .A0(io_clk[4]), .A1(reg_SP[9]), .B0(n1), .B1(reg_SP[1]), .Y(dataOut[1]) );
  AO22_X0P7M_A9TS U8 ( .A0(io_clk[4]), .A1(reg_SP[11]), .B0(n1), .B1(reg_SP[3]), .Y(dataOut[3]) );
  AO22_X0P7M_A9TS U7 ( .A0(io_clk[4]), .A1(reg_SP[12]), .B0(n1), .B1(reg_SP[4]), .Y(dataOut[4]) );
  AO22_X0P7M_A9TS U6 ( .A0(io_clk[4]), .A1(reg_SP[13]), .B0(n1), .B1(reg_SP[5]), .Y(dataOut[5]) );
  AO22_X0P7M_A9TS U9 ( .A0(io_clk[4]), .A1(reg_SP[10]), .B0(n1), .B1(reg_SP[2]), .Y(dataOut[2]) );
  AO22_X0P7M_A9TS U11 ( .A0(io_clk[4]), .A1(reg_SP[8]), .B0(n1), .B1(reg_SP[0]), .Y(dataOut[0]) );
  AO22_X0P7M_A9TS U5 ( .A0(io_clk[4]), .A1(reg_SP[14]), .B0(n1), .B1(reg_SP[6]), .Y(dataOut[6]) );
  INV_X0P8M_A9TS U3 ( .A(io_clk[4]), .Y(n1) );
endmodule


module tree_serializer_00000010_00000004 ( data_i, data_o, clks, reset );
  input [15:0] data_i;
  input [4:0] clks;
  input reset;
  output data_o;
  wire   dataOut_SN;

  Serializer_00000010_00000004_0 Serializer ( .io_clk(clks[4:1]), .io_rst(
        reset), .io_dataIn(data_i), .io_dataOut(dataOut_SN) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clks[0]), .R(reset), 
        .Q(data_o) );
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


module toplevel_mixed_serializer ( data_i, data_o, ready_o, clk_i, reset_ni );
  input [31:0] data_i;
  input clk_i, reset_ni;
  output data_o, ready_o;
  wire   dataOut_SN;
  wire   [4:1] clks;
  wire   [15:0] shift_o;

  Clock_divider_3 clk__1__clock_divider ( .clk_div_o(clks[1]), .clk_fast_i(
        clk_i), .reset(reset_ni) );
  Clock_divider_2 clk__2__clock_divider ( .clk_div_o(clks[2]), .clk_fast_i(
        clks[1]), .reset(reset_ni) );
  Clock_divider_1 clk__3__clock_divider ( .clk_div_o(clks[3]), .clk_fast_i(
        clks[2]), .reset(reset_ni) );
  Clock_divider_0 clk__4__clock_divider ( .clk_div_o(clks[4]), .clk_fast_i(
        clks[3]), .reset(reset_ni) );
  shift_serializer_00000020_00000005_00000010 shift_serializer ( .data_i(
        data_i), .data_o(shift_o), .clk(clks[4]), .reset(reset_ni), .ready_o(
        ready_o) );
  tree_serializer_00000010_00000004 tree_serializer ( .data_i(shift_o), 
        .data_o(dataOut_SN), .clks({clks, clk_i}), .reset(reset_ni) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk_i), .R(reset_ni), 
        .Q(data_o) );
endmodule

