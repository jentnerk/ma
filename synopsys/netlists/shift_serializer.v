/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Fri Dec 21 14:44:00 2018
/////////////////////////////////////////////////////////////


module shift_serializer ( data_i, data_o, clk, reset, valid_i, valid_o, 
        ready_o );
  input [15:0] data_i;
  input clk, reset, valid_i;
  output data_o, valid_o, ready_o;
  wire   n27, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71;
  wire   [3:0] Counter_SP;
  wire   [14:0] Reg_SP;
  wire   [4:0] Counter_SN;

  DFFRPQ_X0P5M_A9TS Counter_SP_reg_0_ ( .D(Counter_SN[0]), .CK(clk), .R(reset), 
        .Q(Counter_SP[0]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_1_ ( .D(Counter_SN[1]), .CK(clk), .R(reset), 
        .Q(Counter_SP[1]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_2_ ( .D(Counter_SN[2]), .CK(clk), .R(reset), 
        .Q(Counter_SP[2]) );
  DFFRPQ_X0P5M_A9TS Counter_SP_reg_3_ ( .D(Counter_SN[3]), .CK(clk), .R(reset), 
        .Q(Counter_SP[3]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_0_ ( .D(n44), .CK(clk), .R(reset), .Q(Reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_1_ ( .D(n29), .CK(clk), .R(reset), .Q(Reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_2_ ( .D(n30), .CK(clk), .R(reset), .Q(Reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_3_ ( .D(n31), .CK(clk), .R(reset), .Q(Reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_4_ ( .D(n32), .CK(clk), .R(reset), .Q(Reg_SP[4]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_5_ ( .D(n33), .CK(clk), .R(reset), .Q(Reg_SP[5]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_6_ ( .D(n34), .CK(clk), .R(reset), .Q(Reg_SP[6]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_7_ ( .D(n35), .CK(clk), .R(reset), .Q(Reg_SP[7]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_8_ ( .D(n36), .CK(clk), .R(reset), .Q(Reg_SP[8]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_9_ ( .D(n37), .CK(clk), .R(reset), .Q(Reg_SP[9]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_10_ ( .D(n38), .CK(clk), .R(reset), .Q(
        Reg_SP[10]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_11_ ( .D(n39), .CK(clk), .R(reset), .Q(
        Reg_SP[11]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_12_ ( .D(n40), .CK(clk), .R(reset), .Q(
        Reg_SP[12]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_13_ ( .D(n41), .CK(clk), .R(reset), .Q(
        Reg_SP[13]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_14_ ( .D(n42), .CK(clk), .R(reset), .Q(
        Reg_SP[14]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_15_ ( .D(n43), .CK(clk), .R(reset), .Q(data_o)
         );
  DFFRPQ_X0P5M_A9TS State_SP_reg_0_ ( .D(n27), .CK(clk), .R(reset), .Q(valid_o) );
  DFFRPQN_X1M_A9TS Counter_SP_reg_4_ ( .D(Counter_SN[4]), .CK(clk), .R(reset), 
        .QN(n71) );
  NOR2_X0P7A_A9TS U48 ( .A(valid_o), .B(valid_i), .Y(n69) );
  INV_X0P8M_A9TS U49 ( .A(n61), .Y(n70) );
  NOR2_X0P7A_A9TS U50 ( .A(Counter_SP[3]), .B(n66), .Y(n60) );
  INV_X0P8M_A9TS U51 ( .A(Counter_SP[2]), .Y(n67) );
  NOR2_X0P7A_A9TS U52 ( .A(Counter_SP[0]), .B(Counter_SP[1]), .Y(n68) );
  AOI21_X0P7M_A9TS U53 ( .A0(valid_o), .A1(n62), .B0(n70), .Y(ready_o) );
  OAI21_X0P7M_A9TS U54 ( .A0(n60), .A1(n71), .B0(n61), .Y(Counter_SN[4]) );
  INV_X0P8M_A9TS U55 ( .A(ready_o), .Y(n27) );
  INV_X0P8M_A9TS U56 ( .A(n45), .Y(n43) );
  AOI222_X0P7M_A9TS U57 ( .A0(valid_o), .A1(Reg_SP[14]), .B0(n70), .B1(
        data_i[15]), .C0(n69), .C1(data_o), .Y(n45) );
  INV_X0P8M_A9TS U58 ( .A(n59), .Y(n42) );
  AOI222_X0P7M_A9TS U59 ( .A0(valid_o), .A1(Reg_SP[13]), .B0(n70), .B1(
        data_i[14]), .C0(n69), .C1(Reg_SP[14]), .Y(n59) );
  INV_X0P8M_A9TS U60 ( .A(n58), .Y(n41) );
  AOI222_X0P7M_A9TS U61 ( .A0(valid_o), .A1(Reg_SP[12]), .B0(n70), .B1(
        data_i[13]), .C0(n69), .C1(Reg_SP[13]), .Y(n58) );
  INV_X0P8M_A9TS U62 ( .A(n50), .Y(n40) );
  AOI222_X0P7M_A9TS U63 ( .A0(valid_o), .A1(Reg_SP[11]), .B0(n70), .B1(
        data_i[12]), .C0(n69), .C1(Reg_SP[12]), .Y(n50) );
  INV_X0P8M_A9TS U64 ( .A(n57), .Y(n39) );
  AOI222_X0P7M_A9TS U65 ( .A0(valid_o), .A1(Reg_SP[10]), .B0(n70), .B1(
        data_i[11]), .C0(n69), .C1(Reg_SP[11]), .Y(n57) );
  INV_X0P8M_A9TS U66 ( .A(n56), .Y(n38) );
  AOI222_X0P7M_A9TS U67 ( .A0(valid_o), .A1(Reg_SP[9]), .B0(n70), .B1(
        data_i[10]), .C0(n69), .C1(Reg_SP[10]), .Y(n56) );
  INV_X0P8M_A9TS U68 ( .A(n55), .Y(n37) );
  AOI222_X0P7M_A9TS U69 ( .A0(valid_o), .A1(Reg_SP[8]), .B0(n70), .B1(
        data_i[9]), .C0(n69), .C1(Reg_SP[9]), .Y(n55) );
  INV_X0P8M_A9TS U70 ( .A(n54), .Y(n36) );
  AOI222_X0P7M_A9TS U71 ( .A0(valid_o), .A1(Reg_SP[7]), .B0(n70), .B1(
        data_i[8]), .C0(n69), .C1(Reg_SP[8]), .Y(n54) );
  INV_X0P8M_A9TS U72 ( .A(n53), .Y(n35) );
  AOI222_X0P7M_A9TS U73 ( .A0(valid_o), .A1(Reg_SP[6]), .B0(n70), .B1(
        data_i[7]), .C0(n69), .C1(Reg_SP[7]), .Y(n53) );
  INV_X0P8M_A9TS U74 ( .A(n52), .Y(n34) );
  AOI222_X0P7M_A9TS U75 ( .A0(valid_o), .A1(Reg_SP[5]), .B0(n70), .B1(
        data_i[6]), .C0(n69), .C1(Reg_SP[6]), .Y(n52) );
  INV_X0P8M_A9TS U76 ( .A(n51), .Y(n33) );
  AOI222_X0P7M_A9TS U77 ( .A0(valid_o), .A1(Reg_SP[4]), .B0(n70), .B1(
        data_i[5]), .C0(n69), .C1(Reg_SP[5]), .Y(n51) );
  INV_X0P8M_A9TS U78 ( .A(n49), .Y(n32) );
  AOI222_X0P7M_A9TS U79 ( .A0(valid_o), .A1(Reg_SP[3]), .B0(n70), .B1(
        data_i[4]), .C0(n69), .C1(Reg_SP[4]), .Y(n49) );
  INV_X0P8M_A9TS U80 ( .A(n48), .Y(n31) );
  AOI222_X0P7M_A9TS U81 ( .A0(valid_o), .A1(Reg_SP[2]), .B0(n70), .B1(
        data_i[3]), .C0(n69), .C1(Reg_SP[3]), .Y(n48) );
  INV_X0P8M_A9TS U82 ( .A(n47), .Y(n30) );
  AOI222_X0P7M_A9TS U83 ( .A0(valid_o), .A1(Reg_SP[1]), .B0(n70), .B1(
        data_i[2]), .C0(n69), .C1(Reg_SP[2]), .Y(n47) );
  INV_X0P8M_A9TS U84 ( .A(n46), .Y(n29) );
  AOI222_X0P7M_A9TS U85 ( .A0(valid_o), .A1(Reg_SP[0]), .B0(n70), .B1(
        data_i[1]), .C0(n69), .C1(Reg_SP[1]), .Y(n46) );
  AO22_X0P7M_A9TS U86 ( .A0(n70), .A1(data_i[0]), .B0(n69), .B1(Reg_SP[0]), 
        .Y(n44) );
  NOR2_X0P7A_A9TS U87 ( .A(n63), .B(n65), .Y(Counter_SN[3]) );
  AOI21_X0P7M_A9TS U88 ( .A0(Counter_SP[3]), .A1(n66), .B0(n60), .Y(n63) );
  OA21A1OI2_X0P7M_A9TS U89 ( .A0(n68), .A1(n67), .B0(n66), .C0(n65), .Y(
        Counter_SN[2]) );
  NOR2_X0P7A_A9TS U90 ( .A(n64), .B(n65), .Y(Counter_SN[1]) );
  AOI21_X0P7M_A9TS U91 ( .A0(Counter_SP[1]), .A1(Counter_SP[0]), .B0(n68), .Y(
        n64) );
  NOR2_X0P7A_A9TS U92 ( .A(Counter_SP[0]), .B(n65), .Y(Counter_SN[0]) );
  NAND2_X0P5M_A9TS U93 ( .A(n67), .B(n68), .Y(n66) );
  NAND2_X0P5M_A9TS U94 ( .A(n71), .B(n60), .Y(n62) );
  NAND2XB_X1M_A9TS U95 ( .BN(valid_o), .A(valid_i), .Y(n61) );
  NAND2_X0P5M_A9TS U96 ( .A(n62), .B(n61), .Y(n65) );
endmodule

