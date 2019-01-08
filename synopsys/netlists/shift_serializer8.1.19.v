/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : N-2017.09
// Date      : Tue Jan  8 13:43:01 2019
/////////////////////////////////////////////////////////////


module shift_serializer ( data_i, data_o, clk, reset );
  input data_i, clk, reset;
  output data_o;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198;
  wire   [98:33] Reg_SN;

  DFFRPQN_X3M_A9TS Reg_SP_reg_97_ ( .D(n196), .CK(clk), .R(reset), .QN(n198)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_32_ ( .D(n70), .CK(clk), .R(reset), .QN(n197) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_96_ ( .D(n194), .CK(clk), .R(reset), .QN(n195)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_95_ ( .D(n192), .CK(clk), .R(reset), .QN(n193)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_94_ ( .D(n190), .CK(clk), .R(reset), .QN(n191)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_93_ ( .D(n188), .CK(clk), .R(reset), .QN(n189)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_92_ ( .D(n186), .CK(clk), .R(reset), .QN(n187)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_91_ ( .D(n184), .CK(clk), .R(reset), .QN(n185)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_90_ ( .D(n182), .CK(clk), .R(reset), .QN(n183)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_89_ ( .D(n180), .CK(clk), .R(reset), .QN(n181)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_88_ ( .D(n178), .CK(clk), .R(reset), .QN(n179)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_87_ ( .D(n176), .CK(clk), .R(reset), .QN(n177)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_86_ ( .D(n174), .CK(clk), .R(reset), .QN(n175)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_85_ ( .D(n172), .CK(clk), .R(reset), .QN(n173)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_84_ ( .D(n170), .CK(clk), .R(reset), .QN(n171)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_83_ ( .D(n168), .CK(clk), .R(reset), .QN(n169)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_82_ ( .D(n166), .CK(clk), .R(reset), .QN(n167)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_81_ ( .D(n164), .CK(clk), .R(reset), .QN(n165)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_80_ ( .D(n162), .CK(clk), .R(reset), .QN(n163)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_79_ ( .D(n160), .CK(clk), .R(reset), .QN(n161)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_78_ ( .D(n158), .CK(clk), .R(reset), .QN(n159)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_77_ ( .D(n156), .CK(clk), .R(reset), .QN(n157)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_76_ ( .D(n154), .CK(clk), .R(reset), .QN(n155)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_75_ ( .D(n152), .CK(clk), .R(reset), .QN(n153)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_74_ ( .D(n150), .CK(clk), .R(reset), .QN(n151)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_73_ ( .D(n148), .CK(clk), .R(reset), .QN(n149)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_72_ ( .D(n146), .CK(clk), .R(reset), .QN(n147)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_71_ ( .D(n144), .CK(clk), .R(reset), .QN(n145)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_70_ ( .D(n142), .CK(clk), .R(reset), .QN(n143)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_69_ ( .D(n140), .CK(clk), .R(reset), .QN(n141)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_68_ ( .D(n138), .CK(clk), .R(reset), .QN(n139)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_67_ ( .D(n136), .CK(clk), .R(reset), .QN(n137)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_66_ ( .D(n134), .CK(clk), .R(reset), .QN(n135)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_65_ ( .D(n132), .CK(clk), .R(reset), .QN(n133)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_64_ ( .D(n130), .CK(clk), .R(reset), .QN(n131)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_63_ ( .D(n128), .CK(clk), .R(reset), .QN(n129)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_62_ ( .D(n126), .CK(clk), .R(reset), .QN(n127)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_61_ ( .D(n124), .CK(clk), .R(reset), .QN(n125)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_60_ ( .D(n122), .CK(clk), .R(reset), .QN(n123)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_59_ ( .D(n120), .CK(clk), .R(reset), .QN(n121)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_58_ ( .D(n118), .CK(clk), .R(reset), .QN(n119)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_57_ ( .D(n116), .CK(clk), .R(reset), .QN(n117)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_56_ ( .D(n114), .CK(clk), .R(reset), .QN(n115)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_55_ ( .D(n112), .CK(clk), .R(reset), .QN(n113)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_54_ ( .D(n110), .CK(clk), .R(reset), .QN(n111)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_53_ ( .D(n108), .CK(clk), .R(reset), .QN(n109)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_52_ ( .D(n106), .CK(clk), .R(reset), .QN(n107)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_51_ ( .D(n104), .CK(clk), .R(reset), .QN(n105)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_50_ ( .D(n102), .CK(clk), .R(reset), .QN(n103)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_49_ ( .D(n100), .CK(clk), .R(reset), .QN(n101)
         );
  DFFRPQN_X3M_A9TS Reg_SP_reg_48_ ( .D(n98), .CK(clk), .R(reset), .QN(n99) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_47_ ( .D(n96), .CK(clk), .R(reset), .QN(n97) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_46_ ( .D(n94), .CK(clk), .R(reset), .QN(n95) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_45_ ( .D(n92), .CK(clk), .R(reset), .QN(n93) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_44_ ( .D(n90), .CK(clk), .R(reset), .QN(n91) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_43_ ( .D(n88), .CK(clk), .R(reset), .QN(n89) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_42_ ( .D(n86), .CK(clk), .R(reset), .QN(n87) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_41_ ( .D(n84), .CK(clk), .R(reset), .QN(n85) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_40_ ( .D(n82), .CK(clk), .R(reset), .QN(n83) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_39_ ( .D(n80), .CK(clk), .R(reset), .QN(n81) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_38_ ( .D(n78), .CK(clk), .R(reset), .QN(n79) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_37_ ( .D(n76), .CK(clk), .R(reset), .QN(n77) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_36_ ( .D(n74), .CK(clk), .R(reset), .QN(n75) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_35_ ( .D(n72), .CK(clk), .R(reset), .QN(n73) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_34_ ( .D(n8), .CK(clk), .R(reset), .QN(n71) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_31_ ( .D(n68), .CK(clk), .R(reset), .QN(n69) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_30_ ( .D(n66), .CK(clk), .R(reset), .QN(n67) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_29_ ( .D(n64), .CK(clk), .R(reset), .QN(n65) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_28_ ( .D(n62), .CK(clk), .R(reset), .QN(n63) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_27_ ( .D(n60), .CK(clk), .R(reset), .QN(n61) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_26_ ( .D(n58), .CK(clk), .R(reset), .QN(n59) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_25_ ( .D(n56), .CK(clk), .R(reset), .QN(n57) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_24_ ( .D(n54), .CK(clk), .R(reset), .QN(n55) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_23_ ( .D(n52), .CK(clk), .R(reset), .QN(n53) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_22_ ( .D(n50), .CK(clk), .R(reset), .QN(n51) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_21_ ( .D(n48), .CK(clk), .R(reset), .QN(n49) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_20_ ( .D(n46), .CK(clk), .R(reset), .QN(n47) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_19_ ( .D(n44), .CK(clk), .R(reset), .QN(n45) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_18_ ( .D(n42), .CK(clk), .R(reset), .QN(n43) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_17_ ( .D(n40), .CK(clk), .R(reset), .QN(n41) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_16_ ( .D(n38), .CK(clk), .R(reset), .QN(n39) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_15_ ( .D(n36), .CK(clk), .R(reset), .QN(n37) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_14_ ( .D(n34), .CK(clk), .R(reset), .QN(n35) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_13_ ( .D(n32), .CK(clk), .R(reset), .QN(n33) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_12_ ( .D(n30), .CK(clk), .R(reset), .QN(n31) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_11_ ( .D(n28), .CK(clk), .R(reset), .QN(n29) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_10_ ( .D(n26), .CK(clk), .R(reset), .QN(n27) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_9_ ( .D(n24), .CK(clk), .R(reset), .QN(n25) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_8_ ( .D(n22), .CK(clk), .R(reset), .QN(n23) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_7_ ( .D(n20), .CK(clk), .R(reset), .QN(n21) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_6_ ( .D(n18), .CK(clk), .R(reset), .QN(n19) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_5_ ( .D(n16), .CK(clk), .R(reset), .QN(n17) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_4_ ( .D(n14), .CK(clk), .R(reset), .QN(n15) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_3_ ( .D(n12), .CK(clk), .R(reset), .QN(n13) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_2_ ( .D(n10), .CK(clk), .R(reset), .QN(n11) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_1_ ( .D(n6), .CK(clk), .R(reset), .QN(n9) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_33_ ( .D(Reg_SN[33]), .CK(clk), .R(reset), .QN(
        n7) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_0_ ( .D(data_i), .CK(clk), .R(reset), .QN(n5) );
  DFFRPQN_X3M_A9TS Reg_SP_reg_98_ ( .D(Reg_SN[98]), .CK(clk), .R(reset), .QN(
        n3) );
  DFFRPQ_X3M_A9TS Reg_SP_reg_99_ ( .D(n4), .CK(clk), .R(reset), .Q(data_o) );
  INV_X2M_A9TS U5 ( .A(n3), .Y(n4) );
  INV_X1P7M_A9TS U6 ( .A(n133), .Y(n134) );
  INV_X1P7M_A9TS U7 ( .A(n73), .Y(n74) );
  INV_X1P7M_A9TS U8 ( .A(n13), .Y(n14) );
  INV_X1P7M_A9TS U9 ( .A(n7), .Y(n8) );
  INV_X1P7M_A9TS U10 ( .A(n9), .Y(n10) );
  INV_X1P7M_A9TS U11 ( .A(n11), .Y(n12) );
  INV_X1P7M_A9TS U12 ( .A(n15), .Y(n16) );
  INV_X1P7M_A9TS U13 ( .A(n17), .Y(n18) );
  INV_X1P7M_A9TS U14 ( .A(n19), .Y(n20) );
  INV_X1P7M_A9TS U15 ( .A(n21), .Y(n22) );
  INV_X1P7M_A9TS U16 ( .A(n23), .Y(n24) );
  INV_X1P7M_A9TS U17 ( .A(n25), .Y(n26) );
  INV_X1P7M_A9TS U18 ( .A(n27), .Y(n28) );
  INV_X1P7M_A9TS U19 ( .A(n29), .Y(n30) );
  INV_X1P7M_A9TS U20 ( .A(n31), .Y(n32) );
  INV_X1P7M_A9TS U21 ( .A(n33), .Y(n34) );
  INV_X1P7M_A9TS U22 ( .A(n35), .Y(n36) );
  INV_X1P7M_A9TS U23 ( .A(n37), .Y(n38) );
  INV_X1P7M_A9TS U24 ( .A(n39), .Y(n40) );
  INV_X1P7M_A9TS U25 ( .A(n41), .Y(n42) );
  INV_X1P7M_A9TS U26 ( .A(n43), .Y(n44) );
  INV_X1P7M_A9TS U27 ( .A(n45), .Y(n46) );
  INV_X1P7M_A9TS U28 ( .A(n47), .Y(n48) );
  INV_X1P7M_A9TS U29 ( .A(n49), .Y(n50) );
  INV_X1P7M_A9TS U30 ( .A(n51), .Y(n52) );
  INV_X1P7M_A9TS U31 ( .A(n53), .Y(n54) );
  INV_X1P7M_A9TS U32 ( .A(n55), .Y(n56) );
  INV_X1P7M_A9TS U33 ( .A(n57), .Y(n58) );
  INV_X1P7M_A9TS U34 ( .A(n59), .Y(n60) );
  INV_X1P7M_A9TS U35 ( .A(n61), .Y(n62) );
  INV_X1P7M_A9TS U36 ( .A(n63), .Y(n64) );
  INV_X1P7M_A9TS U37 ( .A(n65), .Y(n66) );
  INV_X1P7M_A9TS U38 ( .A(n67), .Y(n68) );
  INV_X1P7M_A9TS U39 ( .A(n69), .Y(n70) );
  INV_X1P7M_A9TS U40 ( .A(n71), .Y(n72) );
  INV_X1P7M_A9TS U41 ( .A(n75), .Y(n76) );
  INV_X1P7M_A9TS U42 ( .A(n77), .Y(n78) );
  INV_X1P7M_A9TS U43 ( .A(n79), .Y(n80) );
  INV_X1P7M_A9TS U44 ( .A(n81), .Y(n82) );
  INV_X1P7M_A9TS U45 ( .A(n83), .Y(n84) );
  INV_X1P7M_A9TS U46 ( .A(n85), .Y(n86) );
  INV_X1P7M_A9TS U47 ( .A(n87), .Y(n88) );
  INV_X1P7M_A9TS U48 ( .A(n89), .Y(n90) );
  INV_X1P7M_A9TS U49 ( .A(n91), .Y(n92) );
  INV_X1P7M_A9TS U50 ( .A(n93), .Y(n94) );
  INV_X1P7M_A9TS U51 ( .A(n95), .Y(n96) );
  INV_X1P7M_A9TS U52 ( .A(n97), .Y(n98) );
  INV_X1P7M_A9TS U53 ( .A(n99), .Y(n100) );
  INV_X1P7M_A9TS U54 ( .A(n101), .Y(n102) );
  INV_X1P7M_A9TS U55 ( .A(n103), .Y(n104) );
  INV_X1P7M_A9TS U56 ( .A(n105), .Y(n106) );
  INV_X1P7M_A9TS U57 ( .A(n107), .Y(n108) );
  INV_X1P7M_A9TS U58 ( .A(n109), .Y(n110) );
  INV_X1P7M_A9TS U59 ( .A(n111), .Y(n112) );
  INV_X1P7M_A9TS U60 ( .A(n113), .Y(n114) );
  INV_X1P7M_A9TS U61 ( .A(n115), .Y(n116) );
  INV_X1P7M_A9TS U62 ( .A(n117), .Y(n118) );
  INV_X1P7M_A9TS U63 ( .A(n119), .Y(n120) );
  INV_X1P7M_A9TS U64 ( .A(n121), .Y(n122) );
  INV_X1P7M_A9TS U65 ( .A(n123), .Y(n124) );
  INV_X1P7M_A9TS U66 ( .A(n125), .Y(n126) );
  INV_X1P7M_A9TS U67 ( .A(n127), .Y(n128) );
  INV_X1P7M_A9TS U68 ( .A(n129), .Y(n130) );
  INV_X1P7M_A9TS U69 ( .A(n131), .Y(n132) );
  INV_X1P7M_A9TS U70 ( .A(n135), .Y(n136) );
  INV_X1P7M_A9TS U71 ( .A(n137), .Y(n138) );
  INV_X1P7M_A9TS U72 ( .A(n139), .Y(n140) );
  INV_X1P7M_A9TS U73 ( .A(n141), .Y(n142) );
  INV_X1P7M_A9TS U74 ( .A(n143), .Y(n144) );
  INV_X1P7M_A9TS U75 ( .A(n145), .Y(n146) );
  INV_X1P7M_A9TS U76 ( .A(n147), .Y(n148) );
  INV_X1P7M_A9TS U77 ( .A(n149), .Y(n150) );
  INV_X1P7M_A9TS U78 ( .A(n151), .Y(n152) );
  INV_X1P7M_A9TS U79 ( .A(n153), .Y(n154) );
  INV_X1P7M_A9TS U80 ( .A(n155), .Y(n156) );
  INV_X1P7M_A9TS U81 ( .A(n157), .Y(n158) );
  INV_X1P7M_A9TS U82 ( .A(n159), .Y(n160) );
  INV_X1P7M_A9TS U83 ( .A(n161), .Y(n162) );
  INV_X1P7M_A9TS U84 ( .A(n163), .Y(n164) );
  INV_X1P7M_A9TS U85 ( .A(n165), .Y(n166) );
  INV_X1P7M_A9TS U86 ( .A(n167), .Y(n168) );
  INV_X1P7M_A9TS U87 ( .A(n169), .Y(n170) );
  INV_X1P7M_A9TS U88 ( .A(n171), .Y(n172) );
  INV_X1P7M_A9TS U89 ( .A(n173), .Y(n174) );
  INV_X1P7M_A9TS U90 ( .A(n175), .Y(n176) );
  INV_X1P7M_A9TS U91 ( .A(n177), .Y(n178) );
  INV_X1P7M_A9TS U92 ( .A(n179), .Y(n180) );
  INV_X1P7M_A9TS U93 ( .A(n181), .Y(n182) );
  INV_X1P7M_A9TS U94 ( .A(n183), .Y(n184) );
  INV_X1P7M_A9TS U95 ( .A(n185), .Y(n186) );
  INV_X1P7M_A9TS U96 ( .A(n187), .Y(n188) );
  INV_X1P7M_A9TS U97 ( .A(n189), .Y(n190) );
  INV_X1P7M_A9TS U98 ( .A(n191), .Y(n192) );
  INV_X1P7M_A9TS U99 ( .A(n193), .Y(n194) );
  INV_X1P7M_A9TS U100 ( .A(n195), .Y(n196) );
  INV_X1P7M_A9TS U101 ( .A(n5), .Y(n6) );
  INV_X1P7M_A9TS U102 ( .A(n197), .Y(Reg_SN[33]) );
  INV_X1P7M_A9TS U103 ( .A(n198), .Y(Reg_SN[98]) );
endmodule

