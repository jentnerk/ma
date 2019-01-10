/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Thu Jan 10 10:37:15 2019
/////////////////////////////////////////////////////////////


module toplevel ( data_i, data_o, valid_i, valid_o, ready_o, clk, reset );
  input [19:0] data_i;
  input valid_i, clk, reset;
  output data_o, valid_o, ready_o;
  wire   clks_2_, valid2_out_SN, dataOut_SN, shift_serializer_Reg_SP_0,
         shift_serializer_Reg_SP_1, shift_serializer_Reg_SP_2,
         shift_serializer_Reg_SP_3, shift_serializer_Reg_SP_5,
         shift_serializer_Reg_SP_6, shift_serializer_Reg_SP_7,
         shift_serializer_Reg_SP_8, shift_serializer_Reg_SP_10,
         shift_serializer_Reg_SP_11, shift_serializer_Reg_SP_12,
         shift_serializer_Reg_SP_13, shift_serializer_State_SP_0_,
         tree_serializer_dataOut_SN, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n56,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107;
  wire   [3:0] shift_o;
  wire   [7:0] shift_serializer_Counter_SN;
  wire   [18:15] shift_serializer_Reg_SP;
  wire   [7:0] shift_serializer_Counter_SP;
  wire   [3:0] tree_serializer_Serializer_reg_SP;
  wire   [1:0] tree_serializer_Serializer_dataOut;
  wire   [1:0] tree_serializer_Serializer_genblk1_Serializer_reg_SP;

  DFFRPQ_X0P5M_A9TS shift_serializer_State_SP_reg_0_ ( .D(n34), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_State_SP_0_) );
  DFFRPQ_X0P5M_A9TS valid2_out_SP_reg ( .D(valid2_out_SN), .CK(clks_2_), .R(
        reset), .Q(valid_o) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_0_ ( .D(shift_o[0]), 
        .CK(clks_2_), .R(reset), .Q(tree_serializer_Serializer_reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_1_ ( .D(shift_o[1]), 
        .CK(clks_2_), .R(reset), .Q(tree_serializer_Serializer_reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_2_ ( .D(shift_o[2]), 
        .CK(clks_2_), .R(reset), .Q(tree_serializer_Serializer_reg_SP[2]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_reg_SP_reg_3_ ( .D(shift_o[3]), 
        .CK(clks_2_), .R(reset), .Q(tree_serializer_Serializer_reg_SP[3]) );
  DFFRPQ_X0P5M_A9TS valid1_out_SP_reg ( .D(shift_serializer_State_SP_0_), .CK(
        clks_2_), .R(reset), .Q(valid2_out_SN) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_3_ ( .D(
        shift_serializer_Counter_SN[3]), .CK(clks_2_), .R(reset), .Q(
        shift_serializer_Counter_SP[3]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_5_ ( .D(
        shift_serializer_Counter_SN[5]), .CK(clks_2_), .R(reset), .Q(
        shift_serializer_Counter_SP[5]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_7_ ( .D(
        shift_serializer_Counter_SN[7]), .CK(clks_2_), .R(reset), .Q(
        shift_serializer_Counter_SP[7]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_19_ ( .D(n35), .CK(clks_2_), 
        .R(reset), .Q(shift_o[3]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_1_ ( .D(n50), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_1) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_3_ ( .D(n42), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_3) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_8_ ( .D(n41), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_8) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_13_ ( .D(n40), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_13) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_2_ ( .D(n46), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_2) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_6_ ( .D(n49), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_6) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_7_ ( .D(n45), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_7) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_11_ ( .D(n48), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_11) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_12_ ( .D(n44), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_12) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_16_ ( .D(n47), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP[16]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_17_ ( .D(n43), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP[17]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_18_ ( .D(n39), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP[18]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_0_ ( .D(n54), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_0) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_5_ ( .D(n53), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_5) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_10_ ( .D(n52), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP_10) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_15_ ( .D(n51), .CK(clks_2_), 
        .R(reset), .Q(shift_serializer_Reg_SP[15]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_4_ ( .D(
        shift_serializer_Counter_SN[4]), .CK(clks_2_), .R(reset), .Q(
        shift_serializer_Counter_SP[4]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_6_ ( .D(
        shift_serializer_Counter_SN[6]), .CK(clks_2_), .R(reset), .Q(
        shift_serializer_Counter_SP[6]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_4_ ( .D(n38), .CK(clks_2_), 
        .R(reset), .Q(shift_o[0]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_9_ ( .D(n37), .CK(clks_2_), 
        .R(reset), .Q(shift_o[1]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Reg_SP_reg_14_ ( .D(n36), .CK(clks_2_), 
        .R(reset), .Q(shift_o[2]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_2_ ( .D(
        shift_serializer_Counter_SN[2]), .CK(clks_2_), .R(reset), .Q(
        shift_serializer_Counter_SP[2]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_1_ ( .D(
        shift_serializer_Counter_SN[1]), .CK(clks_2_), .R(reset), .Q(
        shift_serializer_Counter_SP[1]) );
  DFFRPQ_X0P5M_A9TS shift_serializer_Counter_SP_reg_0_ ( .D(
        shift_serializer_Counter_SN[0]), .CK(clks_2_), .R(reset), .Q(
        shift_serializer_Counter_SP[0]) );
  DFFRPQN_X2M_A9TS tree_serializer_dataOut_SP_reg ( .D(
        tree_serializer_dataOut_SN), .CK(clk), .R(reset), .QN(n105) );
  DFFRPQ_X2M_A9TS genblk1_1__Clock_divider_clkB_reg ( .D(n107), .CK(n106), .R(
        reset), .Q(clks_2_) );
  DFFRPQN_X3M_A9TS genblk1_0__Clock_divider_clkB_reg ( .D(n56), .CK(clk), .R(
        reset), .QN(n59) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_genblk1_Serializer_reg_SP_reg_1_ ( 
        .D(tree_serializer_Serializer_dataOut[1]), .CK(n106), .R(reset), .Q(
        tree_serializer_Serializer_genblk1_Serializer_reg_SP[1]) );
  DFFRPQ_X0P5M_A9TS tree_serializer_Serializer_genblk1_Serializer_reg_SP_reg_0_ ( 
        .D(tree_serializer_Serializer_dataOut[0]), .CK(n106), .R(reset), .Q(
        tree_serializer_Serializer_genblk1_Serializer_reg_SP[0]) );
  DFFRPQ_X0P5M_A9TS dataOut_SP_reg ( .D(dataOut_SN), .CK(clk), .R(reset), .Q(
        data_o) );
  INV_X1P4B_A9TS U74 ( .A(n105), .Y(dataOut_SN) );
  TIELO_X1M_A9TS U75 ( .Y(n58) );
  INV_X1P4B_A9TS U76 ( .A(n59), .Y(n60) );
  INV_X0P8M_A9TS U77 ( .A(
        tree_serializer_Serializer_genblk1_Serializer_reg_SP[0]), .Y(n62) );
  INV_X0P8M_A9TS U78 ( .A(
        tree_serializer_Serializer_genblk1_Serializer_reg_SP[1]), .Y(n61) );
  INV_X1M_A9TS U79 ( .A(n60), .Y(n56) );
  MXIT2_X1P4M_A9TS U80 ( .A(n62), .B(n61), .S0(n60), .Y(
        tree_serializer_dataOut_SN) );
  INV_X0P8M_A9TS U81 ( .A(n56), .Y(n106) );
  INV_X0P8M_A9TS U82 ( .A(shift_serializer_Counter_SP[7]), .Y(n70) );
  INV_X0P8M_A9TS U83 ( .A(shift_serializer_Counter_SP[5]), .Y(n69) );
  INV_X0P8M_A9TS U84 ( .A(shift_serializer_Counter_SP[3]), .Y(n67) );
  NOR3_X0P5A_A9TS U85 ( .A(shift_serializer_Counter_SP[2]), .B(
        shift_serializer_Counter_SP[1]), .C(shift_serializer_Counter_SP[0]), 
        .Y(n68) );
  NAND2_X0P5M_A9TS U86 ( .A(n67), .B(n68), .Y(n89) );
  NOR2_X0P7A_A9TS U87 ( .A(shift_serializer_Counter_SP[4]), .B(n89), .Y(n88)
         );
  NAND2_X0P5M_A9TS U88 ( .A(n69), .B(n88), .Y(n92) );
  NOR2_X0P7A_A9TS U89 ( .A(shift_serializer_Counter_SP[6]), .B(n92), .Y(n91)
         );
  NAND2_X0P5M_A9TS U90 ( .A(n70), .B(n91), .Y(n94) );
  NOR2_X0P7A_A9TS U91 ( .A(n58), .B(n94), .Y(n63) );
  INV_X0P8M_A9TS U92 ( .A(shift_serializer_State_SP_0_), .Y(n64) );
  NAND2_X0P5M_A9TS U93 ( .A(valid_i), .B(n64), .Y(n101) );
  OAI21_X0P7M_A9TS U94 ( .A0(n63), .A1(n64), .B0(n101), .Y(n34) );
  INV_X0P8M_A9TS U95 ( .A(n34), .Y(ready_o) );
  INV_X0P8M_A9TS U96 ( .A(clks_2_), .Y(n107) );
  NAND2_X0P5M_A9TS U97 ( .A(clks_2_), .B(tree_serializer_Serializer_reg_SP[3]), 
        .Y(n65) );
  AO1B2_X0P7M_A9TS U98 ( .B0(tree_serializer_Serializer_reg_SP[1]), .B1(n107), 
        .A0N(n65), .Y(tree_serializer_Serializer_dataOut[1]) );
  NAND2_X0P5M_A9TS U99 ( .A(clks_2_), .B(tree_serializer_Serializer_reg_SP[2]), 
        .Y(n66) );
  AO1B2_X0P7M_A9TS U100 ( .B0(tree_serializer_Serializer_reg_SP[0]), .B1(n107), 
        .A0N(n66), .Y(tree_serializer_Serializer_dataOut[0]) );
  INV_X0P8M_A9TS U101 ( .A(n101), .Y(n97) );
  NOR2_X0P7A_A9TS U102 ( .A(n97), .B(n63), .Y(n100) );
  INV_X0P8M_A9TS U103 ( .A(n100), .Y(n104) );
  OA21A1OI2_X0P7M_A9TS U104 ( .A0(n68), .A1(n67), .B0(n89), .C0(n104), .Y(
        shift_serializer_Counter_SN[3]) );
  OA21A1OI2_X0P7M_A9TS U105 ( .A0(n88), .A1(n69), .B0(n92), .C0(n104), .Y(
        shift_serializer_Counter_SN[5]) );
  OA21A1OI2_X0P7M_A9TS U106 ( .A0(n91), .A1(n70), .B0(n94), .C0(n104), .Y(
        shift_serializer_Counter_SN[7]) );
  NOR2_X0P7A_A9TS U107 ( .A(shift_serializer_State_SP_0_), .B(valid_i), .Y(n99) );
  AOI22_X0P7M_A9TS U108 ( .A0(shift_serializer_Reg_SP[18]), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[19]), .B1(n97), .Y(n71) );
  AO1B2_X0P7M_A9TS U109 ( .B0(n99), .B1(shift_o[3]), .A0N(n71), .Y(n35) );
  AOI22_X0P7M_A9TS U110 ( .A0(shift_serializer_Reg_SP_0), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[4]), .B1(n97), .Y(n72) );
  AO1B2_X0P7M_A9TS U111 ( .B0(n99), .B1(shift_serializer_Reg_SP_1), .A0N(n72), 
        .Y(n50) );
  AOI22_X0P7M_A9TS U112 ( .A0(shift_serializer_Reg_SP_2), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[12]), .B1(n97), .Y(n73) );
  AO1B2_X0P7M_A9TS U113 ( .B0(n99), .B1(shift_serializer_Reg_SP_3), .A0N(n73), 
        .Y(n42) );
  AOI22_X0P7M_A9TS U114 ( .A0(shift_serializer_Reg_SP_7), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[13]), .B1(n97), .Y(n74) );
  AO1B2_X0P7M_A9TS U115 ( .B0(n99), .B1(shift_serializer_Reg_SP_8), .A0N(n74), 
        .Y(n41) );
  AOI22_X0P7M_A9TS U116 ( .A0(shift_serializer_Reg_SP_12), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[14]), .B1(n97), .Y(n75) );
  AO1B2_X0P7M_A9TS U117 ( .B0(n99), .B1(shift_serializer_Reg_SP_13), .A0N(n75), 
        .Y(n40) );
  AOI22_X0P7M_A9TS U118 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_1), .B0(data_i[8]), .B1(n97), .Y(n76) );
  AO1B2_X0P7M_A9TS U119 ( .B0(n99), .B1(shift_serializer_Reg_SP_2), .A0N(n76), 
        .Y(n46) );
  AOI22_X0P7M_A9TS U120 ( .A0(shift_serializer_Reg_SP_5), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[5]), .B1(n97), .Y(n77) );
  AO1B2_X0P7M_A9TS U121 ( .B0(n99), .B1(shift_serializer_Reg_SP_6), .A0N(n77), 
        .Y(n49) );
  AOI22_X0P7M_A9TS U122 ( .A0(shift_serializer_Reg_SP_6), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[9]), .B1(n97), .Y(n78) );
  AO1B2_X0P7M_A9TS U123 ( .B0(n99), .B1(shift_serializer_Reg_SP_7), .A0N(n78), 
        .Y(n45) );
  AOI22_X0P7M_A9TS U124 ( .A0(shift_serializer_Reg_SP_10), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[6]), .B1(n97), .Y(n79) );
  AO1B2_X0P7M_A9TS U125 ( .B0(n99), .B1(shift_serializer_Reg_SP_11), .A0N(n79), 
        .Y(n48) );
  AOI22_X0P7M_A9TS U126 ( .A0(shift_serializer_Reg_SP_11), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[10]), .B1(n97), .Y(n80) );
  AO1B2_X0P7M_A9TS U127 ( .B0(n99), .B1(shift_serializer_Reg_SP_12), .A0N(n80), 
        .Y(n44) );
  AOI22_X0P7M_A9TS U128 ( .A0(n97), .A1(data_i[3]), .B0(n99), .B1(
        shift_serializer_Reg_SP[15]), .Y(n81) );
  AO1B2_X0P7M_A9TS U129 ( .B0(shift_serializer_State_SP_0_), .B1(shift_o[2]), 
        .A0N(n81), .Y(n51) );
  AOI22_X0P7M_A9TS U130 ( .A0(shift_serializer_Reg_SP[15]), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[7]), .B1(n97), .Y(n82) );
  AO1B2_X0P7M_A9TS U131 ( .B0(n99), .B1(shift_serializer_Reg_SP[16]), .A0N(n82), .Y(n47) );
  AOI22_X0P7M_A9TS U132 ( .A0(shift_serializer_Reg_SP[16]), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[11]), .B1(n97), .Y(n83) );
  AO1B2_X0P7M_A9TS U133 ( .B0(n99), .B1(shift_serializer_Reg_SP[17]), .A0N(n83), .Y(n43) );
  AOI22_X0P7M_A9TS U134 ( .A0(shift_serializer_Reg_SP[17]), .A1(
        shift_serializer_State_SP_0_), .B0(data_i[15]), .B1(n97), .Y(n84) );
  AO1B2_X0P7M_A9TS U135 ( .B0(n99), .B1(shift_serializer_Reg_SP[18]), .A0N(n84), .Y(n39) );
  AO22_X0P7M_A9TS U136 ( .A0(shift_serializer_Reg_SP_0), .A1(n99), .B0(
        data_i[0]), .B1(n97), .Y(n54) );
  AOI22_X0P7M_A9TS U137 ( .A0(n97), .A1(data_i[1]), .B0(n99), .B1(
        shift_serializer_Reg_SP_5), .Y(n85) );
  AO1B2_X0P7M_A9TS U138 ( .B0(shift_serializer_State_SP_0_), .B1(shift_o[0]), 
        .A0N(n85), .Y(n53) );
  AOI22_X0P7M_A9TS U139 ( .A0(n97), .A1(data_i[2]), .B0(n99), .B1(
        shift_serializer_Reg_SP_10), .Y(n86) );
  AO1B2_X0P7M_A9TS U140 ( .B0(shift_serializer_State_SP_0_), .B1(shift_o[1]), 
        .A0N(n86), .Y(n52) );
  NOR2_X0P7A_A9TS U141 ( .A(shift_serializer_Counter_SP[1]), .B(
        shift_serializer_Counter_SP[0]), .Y(n103) );
  AOI21_X0P7M_A9TS U142 ( .A0(shift_serializer_Counter_SP[0]), .A1(
        shift_serializer_Counter_SP[1]), .B0(n103), .Y(n87) );
  NOR2_X0P7A_A9TS U143 ( .A(n87), .B(n104), .Y(shift_serializer_Counter_SN[1])
         );
  AOI21_X0P7M_A9TS U144 ( .A0(shift_serializer_Counter_SP[4]), .A1(n89), .B0(
        n88), .Y(n90) );
  NOR2_X0P7A_A9TS U145 ( .A(n90), .B(n104), .Y(shift_serializer_Counter_SN[4])
         );
  AOI21_X0P7M_A9TS U146 ( .A0(shift_serializer_Counter_SP[6]), .A1(n92), .B0(
        n91), .Y(n93) );
  NOR2_X0P7A_A9TS U147 ( .A(n93), .B(n104), .Y(shift_serializer_Counter_SN[6])
         );
  AOI22_X0P7M_A9TS U148 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_3), .B0(n97), .B1(data_i[16]), .Y(n95) );
  AO1B2_X0P7M_A9TS U149 ( .B0(n99), .B1(shift_o[0]), .A0N(n95), .Y(n38) );
  AOI22_X0P7M_A9TS U150 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_8), .B0(n97), .B1(data_i[17]), .Y(n96) );
  AO1B2_X0P7M_A9TS U151 ( .B0(n99), .B1(shift_o[1]), .A0N(n96), .Y(n37) );
  AOI22_X0P7M_A9TS U152 ( .A0(shift_serializer_State_SP_0_), .A1(
        shift_serializer_Reg_SP_13), .B0(n97), .B1(data_i[18]), .Y(n98) );
  AO1B2_X0P7M_A9TS U153 ( .B0(n99), .B1(shift_o[2]), .A0N(n98), .Y(n36) );
  OAI21_X0P7M_A9TS U154 ( .A0(shift_serializer_Counter_SP[2]), .A1(n103), .B0(
        n100), .Y(n102) );
  AO21A1AI2_X0P7M_A9TS U155 ( .A0(shift_serializer_Counter_SP[2]), .A1(n103), 
        .B0(n102), .C0(n101), .Y(shift_serializer_Counter_SN[2]) );
  NOR2_X0P7A_A9TS U156 ( .A(n104), .B(shift_serializer_Counter_SP[0]), .Y(
        shift_serializer_Counter_SN[0]) );
endmodule

