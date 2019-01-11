/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Fri Jan 11 14:09:57 2019
/////////////////////////////////////////////////////////////


module toplevel ( data_i, data_o, valid_i, valid_o, ready_o, clk, reset );
  input [23:0] data_i;
  input valid_i, clk, reset;
  output data_o, valid_o, ready_o;
  wire   n110, valid2_out_SN, dataOut_SN, shift_serializer_Reg_SP_0,
         shift_serializer_Reg_SP_1, shift_serializer_Reg_SP_3,
         shift_serializer_Reg_SP_4, shift_serializer_Reg_SP_6,
         shift_serializer_Reg_SP_7, shift_serializer_Reg_SP_9,
         shift_serializer_Reg_SP_10, shift_serializer_Reg_SP_12,
         shift_serializer_Reg_SP_13, shift_serializer_Reg_SP_15,
         shift_serializer_Reg_SP_16, shift_serializer_Reg_SP_18,
         shift_serializer_Reg_SP_19, shift_serializer_State_SP_0_,
         tree_serializer_dataOut_SN, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n70, n71, n72, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109;
  wire   [3:1] clks;
  wire   [7:0] shift_o;
  wire   [1:0] shift_serializer_Counter_SN;
  wire   [22:21] shift_serializer_Reg_SP;
  wire   [1:0] shift_serializer_Counter_SP;
  wire   [7:0] tree_serializer_Serializer_reg_SP;
  wire   [3:0] tree_serializer_Serializer_dataOut;
  wire   [3:0] tree_serializer_Serializer_genblk1_Serializer_reg_SP;
  wire   [1:0] tree_serializer_Serializer_genblk1_Serializer_dataOut;
  wire  
         [1:0] tree_serializer_Serializer_genblk1_Serializer_genblk1_Serializer_reg_SP
;

  DFFRPQ_X0P5M_A9TS genblk1_0__Clock_divider_clkB_reg ( .D(n70), .CK(clk), .R(
        reset), .Q(clks[1]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_dataOut_SP_reg ( .D(
        tree_serializer_dataOut_SN), .CK(clk), .R(reset), .Q(dataOut_SN) );
  DFFRPQ_X0P5M_A9TS valid2_out_SP_reg ( .D(valid2_out_SN), .CK(clks[3]), .R(
        reset), .Q(valid_o) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_genblk1_Serializer_genblk1_Serializer_reg_SP_reg_1_ ( 
        .D(tree_serializer_Serializer_genblk1_Serializer_dataOut[1]), .CK(
        clks[1]), .R(reset), .Q(
        tree_serializer_Serializer_genblk1_Serializer_genblk1_Serializer_reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_4_ ( .D(shift_o[4]), 
        .CK(clks[3]), .R(reset), .Q(tree_serializer_Serializer_reg_SP[4]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_5_ ( .D(shift_o[5]), 
        .CK(clks[3]), .R(reset), .Q(tree_serializer_Serializer_reg_SP[5]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_6_ ( .D(shift_o[6]), 
        .CK(clks[3]), .R(reset), .Q(tree_serializer_Serializer_reg_SP[6]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_7_ ( .D(shift_o[7]), 
        .CK(clks[3]), .R(reset), .Q(tree_serializer_Serializer_reg_SP[7]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_genblk1_Serializer_reg_SP_reg_2_ ( 
        .D(tree_serializer_Serializer_dataOut[2]), .CK(clks[2]), .R(reset), 
        .Q(tree_serializer_Serializer_genblk1_Serializer_reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_genblk1_Serializer_reg_SP_reg_3_ ( 
        .D(tree_serializer_Serializer_dataOut[3]), .CK(clks[2]), .R(reset), 
        .Q(tree_serializer_Serializer_genblk1_Serializer_reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_genblk1_Serializer_genblk1_Serializer_reg_SP_reg_0_ ( 
        .D(tree_serializer_Serializer_genblk1_Serializer_dataOut[0]), .CK(
        clks[1]), .R(reset), .Q(
        tree_serializer_Serializer_genblk1_Serializer_genblk1_Serializer_reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_0_ ( .D(shift_o[0]), 
        .CK(clks[3]), .R(reset), .Q(tree_serializer_Serializer_reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_1_ ( .D(shift_o[1]), 
        .CK(clks[3]), .R(reset), .Q(tree_serializer_Serializer_reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_2_ ( .D(shift_o[2]), 
        .CK(clks[3]), .R(reset), .Q(tree_serializer_Serializer_reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_3_ ( .D(shift_o[3]), 
        .CK(clks[3]), .R(reset), .Q(tree_serializer_Serializer_reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_genblk1_Serializer_reg_SP_reg_0_ ( 
        .D(tree_serializer_Serializer_dataOut[0]), .CK(clks[2]), .R(reset), 
        .Q(tree_serializer_Serializer_genblk1_Serializer_reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_genblk1_Serializer_reg_SP_reg_1_ ( 
        .D(tree_serializer_Serializer_dataOut[1]), .CK(clks[2]), .R(reset), 
        .Q(tree_serializer_Serializer_genblk1_Serializer_reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS valid1_out_SP_reg ( .D(shift_serializer_State_SP_0_), .CK(
        clks[3]), .R(reset), .Q(valid2_out_SN) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_1_ ( .D(
        shift_serializer_Counter_SN[1]), .CK(clks[3]), .R(reset), .Q(
        shift_serializer_Counter_SP[1]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_23_ ( .D(n45), .CK(clks[3]), 
        .R(reset), .Q(shift_o[7]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_0_ ( .D(n68), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_0) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_22_ ( .D(n53), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP[22]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_1_ ( .D(n60), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_1) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_4_ ( .D(n59), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_4) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_7_ ( .D(n58), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_7) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_10_ ( .D(n57), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_10) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_13_ ( .D(n56), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_13) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_16_ ( .D(n55), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_16) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_19_ ( .D(n54), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_19) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_3_ ( .D(n67), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_3) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_6_ ( .D(n66), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_6) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_9_ ( .D(n65), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_9) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_12_ ( .D(n64), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_12) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_15_ ( .D(n63), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_15) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_18_ ( .D(n62), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP_18) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_21_ ( .D(n61), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_Reg_SP[21]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_2_ ( .D(n52), .CK(clks[3]), 
        .R(reset), .Q(shift_o[0]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_5_ ( .D(n51), .CK(clks[3]), 
        .R(reset), .Q(shift_o[1]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_8_ ( .D(n50), .CK(clks[3]), 
        .R(reset), .Q(shift_o[2]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_11_ ( .D(n49), .CK(clks[3]), 
        .R(reset), .Q(shift_o[3]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_14_ ( .D(n48), .CK(clks[3]), 
        .R(reset), .Q(shift_o[4]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_17_ ( .D(n47), .CK(clks[3]), 
        .R(reset), .Q(shift_o[5]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_20_ ( .D(n46), .CK(clks[3]), 
        .R(reset), .Q(shift_o[6]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_0_ ( .D(
        shift_serializer_Counter_SN[0]), .CK(clks[3]), .R(reset), .Q(
        shift_serializer_Counter_SP[0]) );
  DFFRPQ_X0P5M_A9TS genblk1_1__Clock_divider_clkB_reg ( .D(n72), .CK(clks[1]), 
        .R(reset), .Q(clks[2]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_State_SP_reg_0_ ( .D(n44), .CK(clks[3]), 
        .R(reset), .Q(shift_serializer_State_SP_0_) );
  DFFRPQ_X2M_A9TS genblk1_2__Clock_divider_clkB_reg ( .D(n71), .CK(clks[2]), 
        .R(reset), .Q(clks[3]) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk), .R(reset), .Q(
        n110) );
  AO22_X0P7M_A9TS U86 ( .A0(clks[1]), .A1(
        tree_serializer_Serializer_genblk1_Serializer_genblk1_Serializer_reg_SP[1]), .B0(n70), .B1(
        tree_serializer_Serializer_genblk1_Serializer_genblk1_Serializer_reg_SP[0]), .Y(tree_serializer_dataOut_SN) );
  INV_X0P8M_A9TS U87 ( .A(clks[1]), .Y(n70) );
  BUF_X16B_A9TS U88 ( .A(n110), .Y(data_o) );
  NOR2XB_X1M_A9TS U89 ( .BN(valid_i), .A(shift_serializer_State_SP_0_), .Y(
        n106) );
  NOR2_X0P7A_A9TS U90 ( .A(shift_serializer_State_SP_0_), .B(valid_i), .Y(n92)
         );
  AOI222_X0P7M_A9TS U91 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP[22]), .B0(n106), .B1(data_i[23]), .C0(n92), 
        .C1(shift_o[7]), .Y(n74) );
  INV_X0P8M_A9TS U92 ( .A(n74), .Y(n45) );
  AOI222_X0P7M_A9TS U93 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP[21]), .B0(n106), .B1(data_i[15]), .C0(n92), 
        .C1(shift_serializer_Reg_SP[22]), .Y(n75) );
  INV_X0P8M_A9TS U94 ( .A(n75), .Y(n53) );
  AOI222_X0P7M_A9TS U95 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_0), .B0(n106), .B1(data_i[8]), .C0(n92), .C1(
        shift_serializer_Reg_SP_1), .Y(n76) );
  INV_X0P8M_A9TS U96 ( .A(n76), .Y(n60) );
  AOI222_X0P7M_A9TS U97 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_3), .B0(n106), .B1(data_i[9]), .C0(n92), .C1(
        shift_serializer_Reg_SP_4), .Y(n77) );
  INV_X0P8M_A9TS U98 ( .A(n77), .Y(n59) );
  AOI222_X0P7M_A9TS U99 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_6), .B0(n106), .B1(data_i[10]), .C0(n92), .C1(
        shift_serializer_Reg_SP_7), .Y(n78) );
  INV_X0P8M_A9TS U100 ( .A(n78), .Y(n58) );
  AOI222_X0P7M_A9TS U101 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_9), .B0(n106), .B1(data_i[11]), .C0(n92), .C1(
        shift_serializer_Reg_SP_10), .Y(n79) );
  INV_X0P8M_A9TS U102 ( .A(n79), .Y(n57) );
  AOI222_X0P7M_A9TS U103 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_12), .B0(n106), .B1(data_i[12]), .C0(n92), 
        .C1(shift_serializer_Reg_SP_13), .Y(n80) );
  INV_X0P8M_A9TS U104 ( .A(n80), .Y(n56) );
  AOI222_X0P7M_A9TS U105 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_15), .B0(n106), .B1(data_i[13]), .C0(n92), 
        .C1(shift_serializer_Reg_SP_16), .Y(n81) );
  INV_X0P8M_A9TS U106 ( .A(n81), .Y(n55) );
  AOI222_X0P7M_A9TS U107 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_18), .B0(n106), .B1(data_i[14]), .C0(n92), 
        .C1(shift_serializer_Reg_SP_19), .Y(n82) );
  INV_X0P8M_A9TS U108 ( .A(n82), .Y(n54) );
  NOR2_X0P7A_A9TS U109 ( .A(shift_serializer_Counter_SP[1]), .B(
        shift_serializer_Counter_SP[0]), .Y(n101) );
  AOI21_X0P7M_A9TS U110 ( .A0(n101), .A1(shift_serializer_State_SP_0_), .B0(
        n92), .Y(n44) );
  INV_X0P8M_A9TS U111 ( .A(n44), .Y(ready_o) );
  INV_X0P8M_A9TS U112 ( .A(clks[3]), .Y(n71) );
  INV_X0P8M_A9TS U113 ( .A(clks[2]), .Y(n72) );
  AO22_X0P7M_A9TS U114 ( .A0(clks[2]), .A1(
        tree_serializer_Serializer_genblk1_Serializer_reg_SP[3]), .B0(n72), 
        .B1(tree_serializer_Serializer_genblk1_Serializer_reg_SP[1]), .Y(
        tree_serializer_Serializer_genblk1_Serializer_dataOut[1]) );
  AO22_X0P7M_A9TS U115 ( .A0(clks[3]), .A1(
        tree_serializer_Serializer_reg_SP[6]), .B0(n71), .B1(
        tree_serializer_Serializer_reg_SP[2]), .Y(
        tree_serializer_Serializer_dataOut[2]) );
  AO22_X0P7M_A9TS U116 ( .A0(clks[3]), .A1(
        tree_serializer_Serializer_reg_SP[7]), .B0(n71), .B1(
        tree_serializer_Serializer_reg_SP[3]), .Y(
        tree_serializer_Serializer_dataOut[3]) );
  AO22_X0P7M_A9TS U117 ( .A0(clks[2]), .A1(
        tree_serializer_Serializer_genblk1_Serializer_reg_SP[2]), .B0(n72), 
        .B1(tree_serializer_Serializer_genblk1_Serializer_reg_SP[0]), .Y(
        tree_serializer_Serializer_genblk1_Serializer_dataOut[0]) );
  AO22_X0P7M_A9TS U118 ( .A0(clks[3]), .A1(
        tree_serializer_Serializer_reg_SP[4]), .B0(n71), .B1(
        tree_serializer_Serializer_reg_SP[0]), .Y(
        tree_serializer_Serializer_dataOut[0]) );
  INV_X0P8M_A9TS U119 ( .A(n106), .Y(n83) );
  AO1B2_X0P7M_A9TS U120 ( .B0(shift_serializer_Counter_SP[1]), .B1(
        shift_serializer_Counter_SP[0]), .A0N(n83), .Y(
        shift_serializer_Counter_SN[1]) );
  AO22_X0P7M_A9TS U121 ( .A0(n106), .A1(data_i[0]), .B0(n92), .B1(
        shift_serializer_Reg_SP_0), .Y(n68) );
  INV_X0P8M_A9TS U122 ( .A(shift_serializer_State_SP_0_), .Y(n91) );
  INV_X0P8M_A9TS U123 ( .A(shift_o[0]), .Y(n94) );
  AOI22_X0P7M_A9TS U124 ( .A0(n106), .A1(data_i[1]), .B0(n92), .B1(
        shift_serializer_Reg_SP_3), .Y(n84) );
  OAI21_X0P7M_A9TS U125 ( .A0(n91), .A1(n94), .B0(n84), .Y(n67) );
  AO22_X0P7M_A9TS U126 ( .A0(clks[3]), .A1(
        tree_serializer_Serializer_reg_SP[5]), .B0(n71), .B1(
        tree_serializer_Serializer_reg_SP[1]), .Y(
        tree_serializer_Serializer_dataOut[1]) );
  INV_X0P8M_A9TS U127 ( .A(shift_o[1]), .Y(n96) );
  AOI22_X0P7M_A9TS U128 ( .A0(n106), .A1(data_i[2]), .B0(n92), .B1(
        shift_serializer_Reg_SP_6), .Y(n85) );
  OAI21_X0P7M_A9TS U129 ( .A0(n91), .A1(n96), .B0(n85), .Y(n66) );
  INV_X0P8M_A9TS U130 ( .A(shift_o[2]), .Y(n98) );
  AOI22_X0P7M_A9TS U131 ( .A0(n106), .A1(data_i[3]), .B0(n92), .B1(
        shift_serializer_Reg_SP_9), .Y(n86) );
  OAI21_X0P7M_A9TS U132 ( .A0(n91), .A1(n98), .B0(n86), .Y(n65) );
  INV_X0P8M_A9TS U133 ( .A(shift_o[3]), .Y(n100) );
  AOI22_X0P7M_A9TS U134 ( .A0(n106), .A1(data_i[4]), .B0(n92), .B1(
        shift_serializer_Reg_SP_12), .Y(n87) );
  OAI21_X0P7M_A9TS U135 ( .A0(n91), .A1(n100), .B0(n87), .Y(n64) );
  INV_X0P8M_A9TS U136 ( .A(shift_o[4]), .Y(n103) );
  AOI22_X0P7M_A9TS U137 ( .A0(n106), .A1(data_i[5]), .B0(n92), .B1(
        shift_serializer_Reg_SP_15), .Y(n88) );
  OAI21_X0P7M_A9TS U138 ( .A0(n91), .A1(n103), .B0(n88), .Y(n63) );
  INV_X0P8M_A9TS U139 ( .A(shift_o[5]), .Y(n105) );
  AOI22_X0P7M_A9TS U140 ( .A0(n106), .A1(data_i[6]), .B0(n92), .B1(
        shift_serializer_Reg_SP_18), .Y(n89) );
  OAI21_X0P7M_A9TS U141 ( .A0(n91), .A1(n105), .B0(n89), .Y(n62) );
  INV_X0P8M_A9TS U142 ( .A(shift_o[6]), .Y(n108) );
  AOI22_X0P7M_A9TS U143 ( .A0(n106), .A1(data_i[7]), .B0(n92), .B1(
        shift_serializer_Reg_SP[21]), .Y(n90) );
  OAI21_X0P7M_A9TS U144 ( .A0(n91), .A1(n108), .B0(n90), .Y(n61) );
  INV_X0P8M_A9TS U145 ( .A(n92), .Y(n109) );
  AOI22_X0P7M_A9TS U146 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_1), .B0(n106), .B1(data_i[16]), .Y(n93) );
  OAI21_X0P7M_A9TS U147 ( .A0(n109), .A1(n94), .B0(n93), .Y(n52) );
  AOI22_X0P7M_A9TS U148 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_4), .B0(n106), .B1(data_i[17]), .Y(n95) );
  OAI21_X0P7M_A9TS U149 ( .A0(n109), .A1(n96), .B0(n95), .Y(n51) );
  AOI22_X0P7M_A9TS U150 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_7), .B0(n106), .B1(data_i[18]), .Y(n97) );
  OAI21_X0P7M_A9TS U151 ( .A0(n109), .A1(n98), .B0(n97), .Y(n50) );
  AOI22_X0P7M_A9TS U152 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_10), .B0(n106), .B1(data_i[19]), .Y(n99) );
  OAI21_X0P7M_A9TS U153 ( .A0(n109), .A1(n100), .B0(n99), .Y(n49) );
  NOR3_X0P5A_A9TS U154 ( .A(n106), .B(shift_serializer_Counter_SP[0]), .C(n101), .Y(shift_serializer_Counter_SN[0]) );
  AOI22_X0P7M_A9TS U155 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_13), .B0(n106), .B1(data_i[20]), .Y(n102) );
  OAI21_X0P7M_A9TS U156 ( .A0(n109), .A1(n103), .B0(n102), .Y(n48) );
  AOI22_X0P7M_A9TS U157 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_16), .B0(n106), .B1(data_i[21]), .Y(n104) );
  OAI21_X0P7M_A9TS U158 ( .A0(n109), .A1(n105), .B0(n104), .Y(n47) );
  AOI22_X0P7M_A9TS U159 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_19), .B0(n106), .B1(data_i[22]), .Y(n107) );
  OAI21_X0P7M_A9TS U160 ( .A0(n109), .A1(n108), .B0(n107), .Y(n46) );
endmodule

