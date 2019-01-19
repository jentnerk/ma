/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Sat Jan 19 13:08:39 2019
/////////////////////////////////////////////////////////////


module shift_serializer ( data_i, data_o, clk, reset, ready_o );
  input [49:0] data_i;
  output [0:0] data_o;
  input clk, reset;
  output ready_o;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n131, n132;
  wire   [48:0] Reg_SP;
  wire   [5:1] Counter_SN;
  wire   [49:0] Reg_SN;

  DFFRPQ_X0P5M_A9TS Reg_SP_reg_0_ ( .D(Reg_SN[0]), .CK(clk), .R(reset), .Q(
        Reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_4_ ( .D(Reg_SN[4]), .CK(clk), .R(reset), .Q(
        Reg_SP[4]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_7_ ( .D(Reg_SN[7]), .CK(clk), .R(reset), .Q(
        Reg_SP[7]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_34_ ( .D(Reg_SN[34]), .CK(clk), .R(reset), .Q(
        Reg_SP[34]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_41_ ( .D(Reg_SN[41]), .CK(clk), .R(reset), .Q(
        Reg_SP[41]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_48_ ( .D(Reg_SN[48]), .CK(clk), .R(reset), .Q(
        Reg_SP[48]) );
  DFFRPQ_X0P5M_A9TS Reg_SP_reg_49_ ( .D(Reg_SN[49]), .CK(clk), .R(reset), .Q(
        data_o[0]) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_39_ ( .D(Reg_SN[39]), .CK(clk), .R(reset), .QN(
        n131) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_40_ ( .D(Reg_SN[40]), .CK(clk), .R(reset), .QN(
        n132) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_45_ ( .D(Reg_SN[45]), .CK(clk), .R(reset), .QN(
        n65) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_3_ ( .D(Reg_SN[3]), .CK(clk), .R(reset), .QN(n63) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_38_ ( .D(Reg_SN[38]), .CK(clk), .R(reset), .QN(
        n62) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_30_ ( .D(Reg_SN[30]), .CK(clk), .R(reset), .QN(
        n58) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_28_ ( .D(Reg_SN[28]), .CK(clk), .R(reset), .QN(
        n57) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_2_ ( .D(Reg_SN[2]), .CK(clk), .R(reset), .QN(n56) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_22_ ( .D(Reg_SN[22]), .CK(clk), .R(reset), .QN(
        n54) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_14_ ( .D(Reg_SN[14]), .CK(clk), .R(reset), .QN(
        n52) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_13_ ( .D(Reg_SN[13]), .CK(clk), .R(reset), .QN(
        n51) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_12_ ( .D(Reg_SN[12]), .CK(clk), .R(reset), .QN(
        n50) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_9_ ( .D(Reg_SN[9]), .CK(clk), .R(reset), .QN(n49) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_5_ ( .D(Reg_SN[5]), .CK(clk), .R(reset), .QN(n48) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_16_ ( .D(Reg_SN[16]), .CK(clk), .R(reset), .QN(
        n47) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_10_ ( .D(Reg_SN[10]), .CK(clk), .R(reset), .QN(
        n46) );
  DFFRPQN_X3M_A9TS Counter_SP_reg_0_ ( .D(n44), .CK(clk), .R(reset), .QN(n44)
         );
  DFFRPQN_X2M_A9TS Reg_SP_reg_43_ ( .D(Reg_SN[43]), .CK(clk), .R(reset), .QN(
        n43) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_46_ ( .D(Reg_SN[46]), .CK(clk), .R(reset), .QN(
        n42) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_8_ ( .D(Reg_SN[8]), .CK(clk), .R(reset), .QN(n41) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_42_ ( .D(Reg_SN[42]), .CK(clk), .R(reset), .QN(
        n40) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_37_ ( .D(Reg_SN[37]), .CK(clk), .R(reset), .QN(
        n39) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_35_ ( .D(Reg_SN[35]), .CK(clk), .R(reset), .QN(
        n38) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_32_ ( .D(Reg_SN[32]), .CK(clk), .R(reset), .QN(
        n37) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_29_ ( .D(Reg_SN[29]), .CK(clk), .R(reset), .QN(
        n36) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_27_ ( .D(Reg_SN[27]), .CK(clk), .R(reset), .QN(
        n35) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_25_ ( .D(Reg_SN[25]), .CK(clk), .R(reset), .QN(
        n34) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_23_ ( .D(Reg_SN[23]), .CK(clk), .R(reset), .QN(
        n33) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_21_ ( .D(Reg_SN[21]), .CK(clk), .R(reset), .QN(
        n32) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_18_ ( .D(Reg_SN[18]), .CK(clk), .R(reset), .QN(
        n31) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_17_ ( .D(Reg_SN[17]), .CK(clk), .R(reset), .QN(
        n30) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_26_ ( .D(Reg_SN[26]), .CK(clk), .R(reset), .QN(
        n29) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_47_ ( .D(Reg_SN[47]), .CK(clk), .R(reset), .QN(
        n28) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_11_ ( .D(Reg_SN[11]), .CK(clk), .R(reset), .QN(
        n27) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_20_ ( .D(Reg_SN[20]), .CK(clk), .R(reset), .QN(
        n26) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_6_ ( .D(Reg_SN[6]), .CK(clk), .R(reset), .QN(n25) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_1_ ( .D(Reg_SN[1]), .CK(clk), .R(reset), .QN(n24) );
  DFFRPQN_X2M_A9TS Reg_SP_reg_15_ ( .D(Reg_SN[15]), .CK(clk), .R(reset), .QN(
        n23) );
  DFFRPQN_X3M_A9TS Counter_SP_reg_5_ ( .D(Counter_SN[5]), .CK(clk), .R(reset), 
        .QN(n22) );
  DFFRPQN_X3M_A9TS Counter_SP_reg_1_ ( .D(Counter_SN[1]), .CK(clk), .R(reset), 
        .QN(n20) );
  DFFRPQN_X3M_A9TS Counter_SP_reg_3_ ( .D(Counter_SN[3]), .CK(clk), .R(reset), 
        .QN(n18) );
  DFFRPQN_X3M_A9TS Counter_SP_reg_4_ ( .D(Counter_SN[4]), .CK(clk), .R(reset), 
        .QN(n16) );
  DFFRPQN_X3M_A9TS Counter_SP_reg_2_ ( .D(Counter_SN[2]), .CK(clk), .R(reset), 
        .QN(n14) );
  DFFRPQN_X1M_A9TS Reg_SP_reg_33_ ( .D(Reg_SN[33]), .CK(clk), .R(reset), .QN(
        n60) );
  DFFRPQN_X1M_A9TS Reg_SP_reg_44_ ( .D(Reg_SN[44]), .CK(clk), .R(reset), .QN(
        n64) );
  DFFRPQN_X1M_A9TS Reg_SP_reg_36_ ( .D(Reg_SN[36]), .CK(clk), .R(reset), .QN(
        n61) );
  DFFRPQN_X1M_A9TS Reg_SP_reg_31_ ( .D(Reg_SN[31]), .CK(clk), .R(reset), .QN(
        n59) );
  DFFRPQN_X1M_A9TS Reg_SP_reg_24_ ( .D(Reg_SN[24]), .CK(clk), .R(reset), .QN(
        n55) );
  DFFRPQN_X1M_A9TS Reg_SP_reg_19_ ( .D(Reg_SN[19]), .CK(clk), .R(reset), .QN(
        n53) );
  INV_X1M_A9TS U64 ( .A(n18), .Y(n19) );
  NAND2_X3A_A9TS U65 ( .A(n22), .B(n6), .Y(n9) );
  XOR2_X1P4M_A9TS U66 ( .A(n123), .B(n19), .Y(n7) );
  NAND2XB_X2M_A9TS U67 ( .BN(n15), .A(n125), .Y(n123) );
  MXIT2_X1P4M_A9TS U68 ( .A(n40), .B(n109), .S0(ready_o), .Y(Reg_SN[43]) );
  INV_X2M_A9TS U69 ( .A(n16), .Y(n17) );
  INV_X1P4B_A9TS U70 ( .A(n20), .Y(n21) );
  NOR2_X2M_A9TS U71 ( .A(n45), .B(n21), .Y(n125) );
  INV_X1M_A9TS U72 ( .A(data_i[39]), .Y(n68) );
  INV_X1M_A9TS U73 ( .A(data_i[40]), .Y(n119) );
  OAI21_X0P7M_A9TS U74 ( .A0(n13), .A1(n16), .B0(n129), .Y(Counter_SN[4]) );
  XOR2_X0P7M_A9TS U75 ( .A(n129), .B(n22), .Y(Counter_SN[5]) );
  NOR2_X0P7A_A9TS U76 ( .A(n19), .B(n45), .Y(n66) );
  INV_X0P8M_A9TS U77 ( .A(n15), .Y(n124) );
  NOR2_X6M_A9TS U78 ( .A(n10), .B(n9), .Y(n8) );
  INV_X1M_A9TS U79 ( .A(data_i[43]), .Y(n109) );
  NAND2_X4A_A9TS U80 ( .A(n18), .B(n14), .Y(n12) );
  NOR2_X6M_A9TS U81 ( .A(n12), .B(n17), .Y(n11) );
  INV_X13M_A9TS U82 ( .A(n5), .Y(ready_o) );
  NAND2_X8A_A9TS U83 ( .A(n8), .B(n11), .Y(n5) );
  MXIT2_X1P4M_A9TS U84 ( .A(n81), .B(n33), .S0(n67), .Y(Reg_SN[24]) );
  MXIT2_X1P4M_A9TS U85 ( .A(n94), .B(n38), .S0(n67), .Y(Reg_SN[36]) );
  MXIT2_X1P4M_A9TS U86 ( .A(n110), .B(n43), .S0(n67), .Y(Reg_SN[44]) );
  MXIT2_X1P4M_A9TS U87 ( .A(n91), .B(n37), .S0(n67), .Y(Reg_SN[33]) );
  MXIT2_X1P4M_A9TS U88 ( .A(n118), .B(n58), .S0(n67), .Y(Reg_SN[31]) );
  MXIT2_X1P4M_A9TS U89 ( .A(n74), .B(n31), .S0(n67), .Y(Reg_SN[19]) );
  MXIT2_X1P4M_A9TS U90 ( .A(n102), .B(n103), .S0(n67), .Y(Reg_SN[49]) );
  MXIT2_X1P4M_A9TS U91 ( .A(n70), .B(n25), .S0(n67), .Y(Reg_SN[7]) );
  MXIT2_X1P4M_A9TS U92 ( .A(n69), .B(n63), .S0(n67), .Y(Reg_SN[4]) );
  NAND2_X3A_A9TS U93 ( .A(n8), .B(n11), .Y(n67) );
  INV_X0P8M_A9TS U94 ( .A(data_i[6]), .Y(n78) );
  INV_X0P8M_A9TS U95 ( .A(data_i[20]), .Y(n88) );
  INV_X0P8M_A9TS U96 ( .A(data_i[11]), .Y(n84) );
  INV_X0P8M_A9TS U97 ( .A(data_i[47]), .Y(n105) );
  INV_X0P8M_A9TS U98 ( .A(data_i[17]), .Y(n72) );
  INV_X0P8M_A9TS U99 ( .A(data_i[29]), .Y(n120) );
  INV_X0P8M_A9TS U100 ( .A(data_i[32]), .Y(n90) );
  INV_X0P8M_A9TS U101 ( .A(data_i[37]), .Y(n95) );
  NOR2_X1A_A9TS U102 ( .A(n21), .B(n15), .Y(n127) );
  INV_X0P8M_A9TS U103 ( .A(data_i[15]), .Y(n107) );
  INV_X0P8M_A9TS U104 ( .A(data_i[1]), .Y(n116) );
  INV_X0P8M_A9TS U105 ( .A(data_i[18]), .Y(n80) );
  INV_X0P8M_A9TS U106 ( .A(data_i[21]), .Y(n75) );
  INV_X0P8M_A9TS U107 ( .A(data_i[23]), .Y(n86) );
  INV_X0P8M_A9TS U108 ( .A(data_i[25]), .Y(n82) );
  INV_X0P8M_A9TS U109 ( .A(data_i[27]), .Y(n122) );
  INV_X0P8M_A9TS U110 ( .A(data_i[35]), .Y(n92) );
  INV_X0P8M_A9TS U111 ( .A(data_i[42]), .Y(n97) );
  INV_X0P8M_A9TS U112 ( .A(data_i[8]), .Y(n111) );
  INV_X0P8M_A9TS U113 ( .A(data_i[46]), .Y(n100) );
  INV_X0P8M_A9TS U114 ( .A(data_i[10]), .Y(n108) );
  INV_X0P8M_A9TS U115 ( .A(data_i[5]), .Y(n76) );
  INV_X0P8M_A9TS U116 ( .A(data_i[13]), .Y(n83) );
  INV_X0P8M_A9TS U117 ( .A(data_i[30]), .Y(n89) );
  INV_X0P8M_A9TS U118 ( .A(data_i[33]), .Y(n91) );
  INV_X0P8M_A9TS U119 ( .A(data_i[38]), .Y(n96) );
  INV_X0P8M_A9TS U120 ( .A(data_i[3]), .Y(n104) );
  INV_X0P8M_A9TS U121 ( .A(data_i[44]), .Y(n110) );
  INV_X0P8M_A9TS U122 ( .A(data_i[49]), .Y(n102) );
  AND2_X0P7M_A9TS U123 ( .A(n127), .B(n66), .Y(n13) );
  NOR2_X1A_A9TS U124 ( .A(ready_o), .B(n7), .Y(Counter_SN[3]) );
  INV_X0P8M_A9TS U125 ( .A(data_i[26]), .Y(n73) );
  INV_X0P8M_A9TS U126 ( .A(data_i[16]), .Y(n106) );
  INV_X0P8M_A9TS U127 ( .A(data_i[9]), .Y(n121) );
  INV_X0P8M_A9TS U128 ( .A(data_i[12]), .Y(n71) );
  INV_X0P8M_A9TS U129 ( .A(data_i[14]), .Y(n87) );
  INV_X0P8M_A9TS U130 ( .A(data_i[19]), .Y(n74) );
  INV_X0P8M_A9TS U131 ( .A(data_i[22]), .Y(n79) );
  INV_X0P8M_A9TS U132 ( .A(data_i[24]), .Y(n81) );
  INV_X0P8M_A9TS U133 ( .A(data_i[2]), .Y(n113) );
  INV_X0P8M_A9TS U134 ( .A(data_i[28]), .Y(n85) );
  INV_X0P8M_A9TS U135 ( .A(data_i[31]), .Y(n118) );
  INV_X0P8M_A9TS U136 ( .A(data_i[36]), .Y(n94) );
  INV_X0P8M_A9TS U137 ( .A(data_i[45]), .Y(n99) );
  INV_X0P8M_A9TS U138 ( .A(data_i[48]), .Y(n101) );
  INV_X0P8M_A9TS U139 ( .A(data_i[41]), .Y(n114) );
  INV_X0P8M_A9TS U140 ( .A(data_i[34]), .Y(n115) );
  INV_X0P8M_A9TS U141 ( .A(data_i[7]), .Y(n70) );
  INV_X0P8M_A9TS U142 ( .A(data_i[4]), .Y(n69) );
  TIEHI_X1M_A9TS U143 ( .Y(n6) );
  NAND2_X4A_A9TS U144 ( .A(n44), .B(n20), .Y(n10) );
  OA21A1OI2_X0P7M_A9TS U145 ( .A0(n20), .A1(n44), .B0(n126), .C0(ready_o), .Y(
        Counter_SN[1]) );
  INV_X1P4B_A9TS U146 ( .A(n14), .Y(n15) );
  INV_X2P5M_A9TS U147 ( .A(n44), .Y(n45) );
  MXIT2_X1P4M_A9TS U148 ( .A(n62), .B(n68), .S0(ready_o), .Y(Reg_SN[39]) );
  MXIT2_X1P4M_A9TS U149 ( .A(n101), .B(n28), .S0(n67), .Y(Reg_SN[48]) );
  MXIT2_X1P4M_A9TS U150 ( .A(n115), .B(n60), .S0(n67), .Y(Reg_SN[34]) );
  MXIT2_X1P4M_A9TS U151 ( .A(n117), .B(n116), .S0(ready_o), .Y(Reg_SN[1]) );
  MXIT2_X1P4M_A9TS U152 ( .A(n57), .B(n120), .S0(ready_o), .Y(Reg_SN[29]) );
  MXIT2_X1P4M_A9TS U153 ( .A(n41), .B(n121), .S0(ready_o), .Y(Reg_SN[9]) );
  MXIT2_X1P4M_A9TS U154 ( .A(n29), .B(n122), .S0(ready_o), .Y(Reg_SN[27]) );
  MXIT2_X1P4M_A9TS U155 ( .A(n131), .B(n119), .S0(ready_o), .Y(Reg_SN[40]) );
  MXIT2_X1P4M_A9TS U156 ( .A(n27), .B(n71), .S0(ready_o), .Y(Reg_SN[12]) );
  MXIT2_X1P4M_A9TS U157 ( .A(n47), .B(n72), .S0(ready_o), .Y(Reg_SN[17]) );
  MXIT2_X1P4M_A9TS U158 ( .A(n34), .B(n73), .S0(ready_o), .Y(Reg_SN[26]) );
  MXIT2_X1P4M_A9TS U159 ( .A(n26), .B(n75), .S0(ready_o), .Y(Reg_SN[21]) );
  INV_X1M_A9TS U160 ( .A(Reg_SP[4]), .Y(n77) );
  MXIT2_X1P4M_A9TS U161 ( .A(n77), .B(n76), .S0(ready_o), .Y(Reg_SN[5]) );
  MXIT2_X1P4M_A9TS U162 ( .A(n48), .B(n78), .S0(ready_o), .Y(Reg_SN[6]) );
  MXIT2_X1P4M_A9TS U163 ( .A(n32), .B(n79), .S0(ready_o), .Y(Reg_SN[22]) );
  MXIT2_X1P4M_A9TS U164 ( .A(n30), .B(n80), .S0(ready_o), .Y(Reg_SN[18]) );
  MXIT2_X1P4M_A9TS U165 ( .A(n55), .B(n82), .S0(ready_o), .Y(Reg_SN[25]) );
  MXIT2_X1P4M_A9TS U166 ( .A(n50), .B(n83), .S0(ready_o), .Y(Reg_SN[13]) );
  MXIT2_X1P4M_A9TS U167 ( .A(n46), .B(n84), .S0(ready_o), .Y(Reg_SN[11]) );
  MXIT2_X1P4M_A9TS U168 ( .A(n35), .B(n85), .S0(ready_o), .Y(Reg_SN[28]) );
  MXIT2_X1P4M_A9TS U169 ( .A(n54), .B(n86), .S0(ready_o), .Y(Reg_SN[23]) );
  MXIT2_X1P4M_A9TS U170 ( .A(n51), .B(n87), .S0(ready_o), .Y(Reg_SN[14]) );
  MXIT2_X1P4M_A9TS U171 ( .A(n53), .B(n88), .S0(ready_o), .Y(Reg_SN[20]) );
  MXIT2_X1P4M_A9TS U172 ( .A(n36), .B(n89), .S0(ready_o), .Y(Reg_SN[30]) );
  MXIT2_X1P4M_A9TS U173 ( .A(n59), .B(n90), .S0(ready_o), .Y(Reg_SN[32]) );
  INV_X1M_A9TS U174 ( .A(Reg_SP[34]), .Y(n93) );
  MXIT2_X1P4M_A9TS U175 ( .A(n93), .B(n92), .S0(ready_o), .Y(Reg_SN[35]) );
  MXIT2_X1P4M_A9TS U176 ( .A(n61), .B(n95), .S0(ready_o), .Y(Reg_SN[37]) );
  MXIT2_X1P4M_A9TS U177 ( .A(n39), .B(n96), .S0(ready_o), .Y(Reg_SN[38]) );
  INV_X1M_A9TS U178 ( .A(Reg_SP[41]), .Y(n98) );
  MXIT2_X1P4M_A9TS U179 ( .A(n98), .B(n97), .S0(ready_o), .Y(Reg_SN[42]) );
  MXIT2_X1P4M_A9TS U180 ( .A(n64), .B(n99), .S0(ready_o), .Y(Reg_SN[45]) );
  MXIT2_X1P4M_A9TS U181 ( .A(n65), .B(n100), .S0(ready_o), .Y(Reg_SN[46]) );
  INV_X1M_A9TS U182 ( .A(Reg_SP[48]), .Y(n103) );
  MXIT2_X1P4M_A9TS U183 ( .A(n56), .B(n104), .S0(ready_o), .Y(Reg_SN[3]) );
  MXIT2_X1P4M_A9TS U184 ( .A(n42), .B(n105), .S0(ready_o), .Y(Reg_SN[47]) );
  MXIT2_X1P4M_A9TS U185 ( .A(n23), .B(n106), .S0(ready_o), .Y(Reg_SN[16]) );
  MXIT2_X1P4M_A9TS U186 ( .A(n52), .B(n107), .S0(ready_o), .Y(Reg_SN[15]) );
  MXIT2_X1P4M_A9TS U187 ( .A(n49), .B(n108), .S0(ready_o), .Y(Reg_SN[10]) );
  INV_X1M_A9TS U188 ( .A(Reg_SP[7]), .Y(n112) );
  MXIT2_X1P4M_A9TS U189 ( .A(n112), .B(n111), .S0(ready_o), .Y(Reg_SN[8]) );
  MXIT2_X1P4M_A9TS U190 ( .A(n24), .B(n113), .S0(ready_o), .Y(Reg_SN[2]) );
  MXIT2_X1P4M_A9TS U191 ( .A(n114), .B(n132), .S0(n67), .Y(Reg_SN[41]) );
  INV_X1M_A9TS U192 ( .A(Reg_SP[0]), .Y(n117) );
  OA21A1OI2_X1M_A9TS U193 ( .A0(n125), .A1(n124), .B0(n123), .C0(ready_o), .Y(
        Counter_SN[2]) );
  INV_X1M_A9TS U194 ( .A(n125), .Y(n126) );
  NOR2XB_X1M_A9TS U195 ( .BN(data_i[0]), .A(n67), .Y(Reg_SN[0]) );
  NOR2_X1A_A9TS U196 ( .A(n45), .B(n17), .Y(n128) );
  NAND3XXB_X1M_A9TS U197 ( .CN(n19), .A(n128), .B(n127), .Y(n129) );
endmodule

