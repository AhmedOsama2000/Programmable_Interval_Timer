
module pit_top ( wb_dat_o, wb_ack_o, wb_clk_i, wb_rst_i, arst_i, wb_adr_i, 
        wb_dat_i, wb_we_i, wb_stb_i, wb_cyc_i, wb_sel_i, pit_o, pit_irq_o, 
        cnt_flag_o, cnt_sync_o, ext_sync_i );
  output [15:0] wb_dat_o;
  input [2:0] wb_adr_i;
  input [15:0] wb_dat_i;
  input [1:0] wb_sel_i;
  input wb_clk_i, wb_rst_i, arst_i, wb_we_i, wb_stb_i, wb_cyc_i, ext_sync_i;
  output wb_ack_o, pit_o, pit_irq_o, cnt_flag_o, cnt_sync_o;
  wire   n403, pit_slave, pit_ien, pit_flg_clr, wishbone_N20,
         wishbone_address_1_, wishbone_address_2_, wishbone_bus_wait_state,
         regs_N89, prescale_N59, prescale_N58, prescale_N57, prescale_N56,
         prescale_N55, prescale_N54, prescale_N53, prescale_N52, prescale_N51,
         prescale_N50, prescale_N49, prescale_N48, prescale_N47, prescale_N46,
         prescale_N45, prescale_cnt_n_0_, prescale_cnt_n_1_, prescale_cnt_n_2_,
         prescale_cnt_n_3_, prescale_cnt_n_4_, prescale_cnt_n_5_,
         prescale_cnt_n_6_, prescale_cnt_n_7_, prescale_cnt_n_8_,
         prescale_cnt_n_9_, prescale_cnt_n_10_, prescale_cnt_n_11_,
         prescale_cnt_n_12_, prescale_cnt_n_13_, prescale_cnt_n_14_,
         counter_N45, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n26, n402, n394, n393, n392,
         n391, n390, n401, n400, n399, n398, n397, n396, n395, n43, n45, n46,
         n47, n49, n52, n53, n54, n56, n57, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n75, n76, n96, n97, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n116, n119, n120, n121, n122, n123, n124, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, DP_OP_56J2_124_736_n27, DP_OP_56J2_124_736_n26,
         DP_OP_56J2_124_736_n25, DP_OP_56J2_124_736_n23,
         DP_OP_56J2_124_736_n22, DP_OP_56J2_124_736_n21,
         DP_OP_56J2_124_736_n20, DP_OP_56J2_124_736_n19,
         DP_OP_56J2_124_736_n18, DP_OP_56J2_124_736_n16,
         DP_OP_56J2_124_736_n13, DP_OP_56J2_124_736_n12,
         DP_OP_56J2_124_736_n11, DP_OP_56J2_124_736_n10, DP_OP_56J2_124_736_n9,
         DP_OP_56J2_124_736_n8, DP_OP_56J2_124_736_n7, DP_OP_56J2_124_736_n6,
         DP_OP_56J2_124_736_n4, DP_OP_56J2_124_736_n2, DP_OP_56J2_124_736_n1,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n228, n230, n232, n234, n236, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389;
  wire   [15:0] cnt_n;
  wire   [15:1] mod_value;
  wire   [3:0] pit_pre_scl;

  DFF_X1 wishbone_addr_latch_reg_0_ ( .D(n7), .CK(wb_clk_i), .Q(n274), .QN(n43) );
  DFF_X1 wishbone_addr_latch_reg_1_ ( .D(n6), .CK(wb_clk_i), .Q(
        wishbone_address_1_) );
  DFF_X1 wishbone_addr_latch_reg_2_ ( .D(n5), .CK(wb_clk_i), .Q(
        wishbone_address_2_), .QN(n273) );
  DFFR_X1 regs_mod_value_reg_0_ ( .D(n197), .CK(wb_clk_i), .RN(arst_i), .QN(
        n56) );
  DFFR_X1 regs_mod_value_reg_3_ ( .D(n194), .CK(wb_clk_i), .RN(arst_i), .QN(
        n60) );
  DFFR_X1 regs_mod_value_reg_4_ ( .D(n193), .CK(wb_clk_i), .RN(arst_i), .QN(
        n61) );
  DFFR_X1 regs_mod_value_reg_5_ ( .D(n192), .CK(wb_clk_i), .RN(arst_i), .QN(
        n62) );
  DFFR_X1 regs_mod_value_reg_10_ ( .D(n187), .CK(wb_clk_i), .RN(arst_i), .QN(
        n67) );
  DFFR_X1 regs_mod_value_reg_11_ ( .D(n186), .CK(wb_clk_i), .RN(arst_i), .QN(
        n68) );
  DFFR_X1 regs_mod_value_reg_12_ ( .D(n185), .CK(wb_clk_i), .RN(arst_i), .QN(
        n69) );
  DFFR_X1 regs_mod_value_reg_13_ ( .D(n184), .CK(wb_clk_i), .RN(arst_i), .QN(
        n70) );
  DFFS_X1 counter_cnt_n_reg_15_ ( .D(n116), .CK(wb_clk_i), .SN(arst_i), .Q(
        n272), .QN(cnt_n[15]) );
  DFFS_X1 counter_cnt_n_reg_14_ ( .D(n97), .CK(wb_clk_i), .SN(arst_i), .Q(n265), .QN(cnt_n[14]) );
  DFFS_X1 counter_cnt_n_reg_12_ ( .D(n101), .CK(wb_clk_i), .SN(arst_i), .Q(
        n267), .QN(cnt_n[12]) );
  DFFS_X1 counter_cnt_n_reg_11_ ( .D(n102), .CK(wb_clk_i), .SN(arst_i), .Q(
        n264), .QN(cnt_n[11]) );
  DFFS_X1 counter_cnt_n_reg_10_ ( .D(n103), .CK(wb_clk_i), .SN(arst_i), .Q(
        n270), .QN(cnt_n[10]) );
  DFFS_X1 counter_cnt_n_reg_9_ ( .D(n104), .CK(wb_clk_i), .SN(arst_i), .Q(n262), .QN(cnt_n[9]) );
  DFFS_X1 counter_cnt_n_reg_8_ ( .D(n105), .CK(wb_clk_i), .SN(arst_i), .Q(n271), .QN(cnt_n[8]) );
  DFFS_X1 counter_cnt_n_reg_6_ ( .D(n107), .CK(wb_clk_i), .SN(arst_i), .Q(n268), .QN(cnt_n[6]) );
  DFFS_X1 counter_cnt_n_reg_4_ ( .D(n109), .CK(wb_clk_i), .SN(arst_i), .Q(n269), .QN(cnt_n[4]) );
  DFFS_X1 counter_cnt_n_reg_2_ ( .D(n111), .CK(wb_clk_i), .SN(arst_i), .Q(n263), .QN(cnt_n[2]) );
  DFFS_X1 counter_cnt_n_reg_1_ ( .D(n112), .CK(wb_clk_i), .SN(arst_i), .Q(n266), .QN(cnt_n[1]) );
  NOR3_X1 U49 ( .A1(wb_rst_i), .A2(wishbone_bus_wait_state), .A3(n76), .ZN(
        wishbone_N20) );
  NOR3_X1 U68 ( .A1(wb_rst_i), .A2(n75), .A3(n46), .ZN(regs_N89) );
  OAI22_X1 U89 ( .A1(n72), .A2(n119), .B1(n9), .B2(n120), .ZN(n182) );
  OAI22_X1 U90 ( .A1(n71), .A2(n119), .B1(n120), .B2(n10), .ZN(n183) );
  OAI22_X1 U91 ( .A1(n70), .A2(n119), .B1(n120), .B2(n11), .ZN(n184) );
  OAI22_X1 U92 ( .A1(n69), .A2(n119), .B1(n120), .B2(n12), .ZN(n185) );
  OAI22_X1 U93 ( .A1(n68), .A2(n119), .B1(n13), .B2(n120), .ZN(n186) );
  OAI22_X1 U94 ( .A1(n67), .A2(n119), .B1(n14), .B2(n120), .ZN(n187) );
  OAI22_X1 U95 ( .A1(n66), .A2(n119), .B1(n15), .B2(n120), .ZN(n188) );
  OAI22_X1 U96 ( .A1(n65), .A2(n119), .B1(n16), .B2(n120), .ZN(n189) );
  OAI22_X1 U97 ( .A1(n64), .A2(n119), .B1(n120), .B2(n17), .ZN(n190) );
  OAI22_X1 U98 ( .A1(n63), .A2(n119), .B1(n120), .B2(n18), .ZN(n191) );
  OAI22_X1 U99 ( .A1(n62), .A2(n119), .B1(n120), .B2(n19), .ZN(n192) );
  OAI22_X1 U100 ( .A1(n61), .A2(n119), .B1(n120), .B2(n20), .ZN(n193) );
  OAI22_X1 U101 ( .A1(n60), .A2(n119), .B1(n120), .B2(n21), .ZN(n194) );
  OAI22_X1 U102 ( .A1(n59), .A2(n119), .B1(n120), .B2(n22), .ZN(n195) );
  OAI22_X1 U103 ( .A1(n57), .A2(n119), .B1(n23), .B2(n120), .ZN(n196) );
  OAI22_X1 U104 ( .A1(n56), .A2(n119), .B1(n24), .B2(n120), .ZN(n197) );
  OAI22_X1 U107 ( .A1(n239), .A2(n122), .B1(n123), .B2(n9), .ZN(n198) );
  OAI22_X1 U108 ( .A1(n54), .A2(n122), .B1(n123), .B2(n13), .ZN(n199) );
  OAI22_X1 U109 ( .A1(n53), .A2(n122), .B1(n123), .B2(n14), .ZN(n200) );
  OAI22_X1 U110 ( .A1(n52), .A2(n122), .B1(n123), .B2(n15), .ZN(n201) );
  OAI22_X1 U111 ( .A1(n49), .A2(n122), .B1(n123), .B2(n16), .ZN(n202) );
  OAI22_X1 U112 ( .A1(n47), .A2(n122), .B1(n123), .B2(n24), .ZN(n203) );
  OAI22_X1 U113 ( .A1(n23), .A2(n123), .B1(n122), .B2(n46), .ZN(n204) );
  NAND2_X1 U114 ( .A1(n8), .A2(n122), .ZN(n123) );
  OAI33_X1 U115 ( .A1(n121), .A2(n45), .A3(n122), .B1(n22), .B2(n124), .B3(
        wb_rst_i), .ZN(n205) );
  NAND2_X1 U116 ( .A1(n8), .A2(n124), .ZN(n122) );
  NOR3_X1 U123 ( .A1(n219), .A2(n96), .A3(wb_rst_i), .ZN(counter_N45) );
  NAND2_X1 U105 ( .A1(n8), .A2(n119), .ZN(n120) );
  NAND2_X1 U106 ( .A1(n8), .A2(n121), .ZN(n119) );
  HA_X1 DP_OP_56J2_124_736_U13 ( .A(DP_OP_56J2_124_736_n13), .B(
        DP_OP_56J2_124_736_n27), .CO(DP_OP_56J2_124_736_n12), .S(prescale_N47)
         );
  HA_X1 DP_OP_56J2_124_736_U12 ( .A(DP_OP_56J2_124_736_n12), .B(
        DP_OP_56J2_124_736_n26), .CO(DP_OP_56J2_124_736_n11), .S(prescale_N48)
         );
  HA_X1 DP_OP_56J2_124_736_U11 ( .A(DP_OP_56J2_124_736_n11), .B(
        DP_OP_56J2_124_736_n25), .CO(DP_OP_56J2_124_736_n10), .S(prescale_N49)
         );
  HA_X1 DP_OP_56J2_124_736_U9 ( .A(DP_OP_56J2_124_736_n9), .B(
        DP_OP_56J2_124_736_n23), .CO(DP_OP_56J2_124_736_n8), .S(prescale_N51)
         );
  HA_X1 DP_OP_56J2_124_736_U8 ( .A(DP_OP_56J2_124_736_n8), .B(
        DP_OP_56J2_124_736_n22), .CO(DP_OP_56J2_124_736_n7), .S(prescale_N52)
         );
  HA_X1 DP_OP_56J2_124_736_U7 ( .A(DP_OP_56J2_124_736_n7), .B(
        DP_OP_56J2_124_736_n21), .CO(DP_OP_56J2_124_736_n6), .S(prescale_N53)
         );
  HA_X1 DP_OP_56J2_124_736_U5 ( .A(n251), .B(DP_OP_56J2_124_736_n19), .CO(
        DP_OP_56J2_124_736_n4), .S(prescale_N55) );
  HA_X1 DP_OP_56J2_124_736_U2 ( .A(DP_OP_56J2_124_736_n2), .B(
        DP_OP_56J2_124_736_n16), .CO(DP_OP_56J2_124_736_n1), .S(prescale_N58)
         );
  INV_X1 U11 ( .A(wb_rst_i), .ZN(n8) );
  DFFS_X1 prescale_cnt_n_reg_0_ ( .D(prescale_N45), .CK(wb_clk_i), .SN(arst_i), 
        .Q(prescale_cnt_n_0_), .QN(n242) );
  DFFS_X1 counter_cnt_n_reg_13_ ( .D(n100), .CK(wb_clk_i), .SN(arst_i), .Q(
        n385), .QN(cnt_n[13]) );
  DFFS_X1 counter_cnt_n_reg_7_ ( .D(n106), .CK(wb_clk_i), .SN(arst_i), .Q(n379), .QN(cnt_n[7]) );
  DFFS_X1 counter_cnt_n_reg_5_ ( .D(n108), .CK(wb_clk_i), .SN(arst_i), .Q(n380), .QN(cnt_n[5]) );
  DFFS_X1 counter_cnt_n_reg_3_ ( .D(n110), .CK(wb_clk_i), .SN(arst_i), .Q(n381), .QN(cnt_n[3]) );
  DFFR_X1 counter_cnt_n_reg_0_ ( .D(n113), .CK(wb_clk_i), .RN(arst_i), .Q(n387), .QN(cnt_n[0]) );
  DFFR_X1 regs_pit_irq_o_reg ( .D(regs_N89), .CK(wb_clk_i), .RN(arst_i), .Q(
        pit_irq_o) );
  DFFR_X1 prescale_cnt_n_reg_1_ ( .D(prescale_N46), .CK(wb_clk_i), .RN(arst_i), 
        .Q(prescale_cnt_n_1_) );
  DFFR_X1 prescale_cnt_n_reg_2_ ( .D(prescale_N47), .CK(wb_clk_i), .RN(arst_i), 
        .Q(prescale_cnt_n_2_), .QN(n259) );
  DFFR_X1 prescale_cnt_n_reg_3_ ( .D(prescale_N48), .CK(wb_clk_i), .RN(arst_i), 
        .Q(prescale_cnt_n_3_), .QN(n258) );
  DFFR_X1 counter_pit_o_reg ( .D(counter_N45), .CK(wb_clk_i), .RN(arst_i), .Q(
        pit_o) );
  DFFR_X1 prescale_cnt_n_reg_5_ ( .D(prescale_N50), .CK(wb_clk_i), .RN(arst_i), 
        .Q(prescale_cnt_n_5_), .QN(n256) );
  DFFR_X1 prescale_cnt_n_reg_6_ ( .D(prescale_N51), .CK(wb_clk_i), .RN(arst_i), 
        .Q(prescale_cnt_n_6_), .QN(n255) );
  DFFR_X1 prescale_cnt_n_reg_7_ ( .D(prescale_N52), .CK(wb_clk_i), .RN(arst_i), 
        .Q(prescale_cnt_n_7_), .QN(n254) );
  DFFR_X1 prescale_cnt_n_reg_8_ ( .D(prescale_N53), .CK(wb_clk_i), .RN(arst_i), 
        .Q(prescale_cnt_n_8_), .QN(n253) );
  DFFR_X1 prescale_cnt_n_reg_9_ ( .D(prescale_N54), .CK(wb_clk_i), .RN(arst_i), 
        .Q(prescale_cnt_n_9_), .QN(n252) );
  DFFR_X1 prescale_cnt_n_reg_10_ ( .D(prescale_N55), .CK(wb_clk_i), .RN(arst_i), .Q(prescale_cnt_n_10_) );
  DFFR_X1 prescale_cnt_n_reg_11_ ( .D(prescale_N56), .CK(wb_clk_i), .RN(arst_i), .Q(prescale_cnt_n_11_) );
  DFFR_X1 prescale_cnt_n_reg_12_ ( .D(prescale_N57), .CK(wb_clk_i), .RN(arst_i), .Q(prescale_cnt_n_12_) );
  DFFR_X1 wishbone_bus_wait_state_reg ( .D(wishbone_N20), .CK(wb_clk_i), .RN(
        arst_i), .Q(wishbone_bus_wait_state), .QN(n276) );
  DFFR_X1 regs_pit_flg_clr_reg ( .D(n205), .CK(wb_clk_i), .RN(arst_i), .Q(
        pit_flg_clr), .QN(n45) );
  DFFR_X1 counter_cnt_flag_o_reg ( .D(n181), .CK(wb_clk_i), .RN(arst_i), .Q(
        cnt_flag_o), .QN(n75) );
  DFFR_X1 regs_pit_ien_reg ( .D(n204), .CK(wb_clk_i), .RN(arst_i), .Q(pit_ien), 
        .QN(n46) );
  DFFR_X1 regs_pit_slave_reg ( .D(n198), .CK(wb_clk_i), .RN(arst_i), .Q(
        pit_slave), .QN(n239) );
  DFFR_X1 regs_pit_pre_reg_3_ ( .D(n199), .CK(wb_clk_i), .RN(arst_i), .Q(
        pit_pre_scl[3]), .QN(n54) );
  DFFR_X1 regs_pit_pre_reg_2_ ( .D(n200), .CK(wb_clk_i), .RN(arst_i), .Q(
        pit_pre_scl[2]), .QN(n53) );
  DFFR_X1 regs_pit_pre_reg_1_ ( .D(n201), .CK(wb_clk_i), .RN(arst_i), .Q(
        pit_pre_scl[1]), .QN(n52) );
  DFFR_X1 regs_pit_pre_reg_0_ ( .D(n202), .CK(wb_clk_i), .RN(arst_i), .Q(
        pit_pre_scl[0]), .QN(n49) );
  DFFR_X1 regs_cnt_sync_o_reg ( .D(n203), .CK(wb_clk_i), .RN(arst_i), .Q(
        cnt_sync_o), .QN(n47) );
  DFFR_X1 prescale_cnt_n_reg_4_ ( .D(prescale_N49), .CK(wb_clk_i), .RN(arst_i), 
        .Q(prescale_cnt_n_4_), .QN(n257) );
  DFFR_X1 regs_mod_value_reg_14_ ( .D(n183), .CK(wb_clk_i), .RN(arst_i), .Q(
        mod_value[14]), .QN(n71) );
  DFFR_X1 regs_mod_value_reg_7_ ( .D(n190), .CK(wb_clk_i), .RN(arst_i), .Q(
        mod_value[7]), .QN(n64) );
  DFFR_X1 regs_mod_value_reg_6_ ( .D(n191), .CK(wb_clk_i), .RN(arst_i), .Q(
        mod_value[6]), .QN(n63) );
  DFFR_X1 regs_mod_value_reg_2_ ( .D(n195), .CK(wb_clk_i), .RN(arst_i), .Q(
        mod_value[2]), .QN(n59) );
  DFFR_X1 regs_mod_value_reg_15_ ( .D(n182), .CK(wb_clk_i), .RN(arst_i), .Q(
        mod_value[15]), .QN(n72) );
  DFFR_X1 regs_mod_value_reg_9_ ( .D(n188), .CK(wb_clk_i), .RN(arst_i), .Q(
        mod_value[9]), .QN(n66) );
  DFFR_X1 regs_mod_value_reg_8_ ( .D(n189), .CK(wb_clk_i), .RN(arst_i), .Q(
        mod_value[8]), .QN(n65) );
  DFFR_X1 regs_mod_value_reg_1_ ( .D(n196), .CK(wb_clk_i), .RN(arst_i), .Q(
        mod_value[1]), .QN(n57) );
  DFFR_X1 prescale_cnt_n_reg_13_ ( .D(prescale_N58), .CK(wb_clk_i), .RN(arst_i), .Q(prescale_cnt_n_13_), .QN(n73) );
  DFFR_X1 prescale_cnt_n_reg_14_ ( .D(prescale_N59), .CK(wb_clk_i), .RN(arst_i), .Q(prescale_cnt_n_14_), .QN(n322) );
  BUF_X1 U184 ( .A(n403), .Z(wb_ack_o) );
  NAND4_X1 U185 ( .A1(n326), .A2(n329), .A3(n327), .A4(n328), .ZN(n244) );
  NAND2_X1 U186 ( .A1(DP_OP_56J2_124_736_n18), .A2(DP_OP_56J2_124_736_n4), 
        .ZN(n207) );
  NAND2_X1 U187 ( .A1(prescale_cnt_n_12_), .A2(n250), .ZN(n208) );
  XOR2_X1 U188 ( .A(n207), .B(n208), .Z(prescale_N57) );
  NOR2_X1 U189 ( .A1(n207), .A2(n208), .ZN(DP_OP_56J2_124_736_n2) );
  OAI21_X1 U190 ( .B1(pit_pre_scl[1]), .B2(n49), .A(n317), .ZN(n209) );
  NOR2_X1 U191 ( .A1(n247), .A2(n304), .ZN(n210) );
  NOR2_X1 U192 ( .A1(n310), .A2(n210), .ZN(n211) );
  OAI22_X1 U193 ( .A1(prescale_cnt_n_3_), .A2(n209), .B1(prescale_cnt_n_6_), 
        .B2(n211), .ZN(n212) );
  AOI221_X1 U194 ( .B1(n209), .B2(prescale_cnt_n_3_), .C1(prescale_cnt_n_6_), 
        .C2(n211), .A(n212), .ZN(n329) );
  INV_X1 U195 ( .A(n239), .ZN(n213) );
  AOI21_X1 U196 ( .B1(ext_sync_i), .B2(n213), .A(n275), .ZN(n214) );
  NOR2_X1 U197 ( .A1(n240), .A2(n214), .ZN(n215) );
  NAND2_X1 U198 ( .A1(n243), .A2(n215), .ZN(n238) );
  NAND3_X1 U199 ( .A1(DP_OP_56J2_124_736_n19), .A2(n245), .A3(
        DP_OP_56J2_124_736_n20), .ZN(n216) );
  XNOR2_X1 U200 ( .A(n216), .B(DP_OP_56J2_124_736_n18), .ZN(prescale_N56) );
  NOR2_X1 U201 ( .A1(n260), .A2(n256), .ZN(n217) );
  XOR2_X1 U202 ( .A(DP_OP_56J2_124_736_n10), .B(n217), .Z(prescale_N50) );
  AND2_X1 U203 ( .A1(DP_OP_56J2_124_736_n10), .A2(n217), .ZN(
        DP_OP_56J2_124_736_n9) );
  NAND3_X1 U204 ( .A1(n243), .A2(n244), .A3(prescale_cnt_n_1_), .ZN(n218) );
  XNOR2_X1 U205 ( .A(n218), .B(n261), .ZN(prescale_N46) );
  NAND2_X1 U206 ( .A1(n313), .A2(n54), .ZN(n277) );
  NOR3_X1 U207 ( .A1(n241), .A2(n219), .A3(n242), .ZN(n261) );
  BUF_X1 U208 ( .A(n26), .Z(n219) );
  OAI21_X2 U209 ( .B1(n265), .B2(n386), .A(n378), .ZN(wb_dat_o[14]) );
  AOI21_X1 U210 ( .B1(ext_sync_i), .B2(pit_slave), .A(n275), .ZN(n26) );
  INV_X1 U211 ( .A(n244), .ZN(n241) );
  OR2_X2 U212 ( .A1(n246), .A2(n26), .ZN(n248) );
  BUF_X1 U213 ( .A(n392), .Z(wb_dat_o[12]) );
  BUF_X1 U214 ( .A(n397), .Z(wb_dat_o[6]) );
  BUF_X1 U215 ( .A(n401), .Z(wb_dat_o[1]) );
  BUF_X1 U216 ( .A(n398), .Z(wb_dat_o[5]) );
  BUF_X1 U217 ( .A(n400), .Z(wb_dat_o[3]) );
  BUF_X1 U218 ( .A(n391), .Z(wb_dat_o[13]) );
  BUF_X1 U219 ( .A(n396), .Z(wb_dat_o[7]) );
  BUF_X1 U220 ( .A(n399), .Z(wb_dat_o[4]) );
  NAND2_X1 U221 ( .A1(prescale_cnt_n_0_), .A2(prescale_cnt_n_1_), .ZN(n240) );
  INV_X1 U222 ( .A(n383), .ZN(n388) );
  INV_X1 U223 ( .A(n395), .ZN(n228) );
  INV_X1 U224 ( .A(n228), .ZN(wb_dat_o[9]) );
  INV_X1 U225 ( .A(n402), .ZN(n230) );
  INV_X1 U226 ( .A(n230), .ZN(wb_dat_o[0]) );
  INV_X1 U227 ( .A(n390), .ZN(n232) );
  INV_X1 U228 ( .A(n232), .ZN(wb_dat_o[15]) );
  INV_X1 U229 ( .A(n393), .ZN(n234) );
  INV_X1 U230 ( .A(n234), .ZN(wb_dat_o[11]) );
  INV_X1 U231 ( .A(n394), .ZN(n236) );
  INV_X1 U232 ( .A(n236), .ZN(wb_dat_o[10]) );
  NOR3_X4 U233 ( .A1(n333), .A2(n219), .A3(n335), .ZN(n377) );
  OAI222_X4 U234 ( .A1(n386), .A2(n263), .B1(n389), .B2(n75), .C1(n59), .C2(
        n388), .ZN(wb_dat_o[2]) );
  NOR2_X1 U235 ( .A1(n241), .A2(n238), .ZN(DP_OP_56J2_124_736_n13) );
  INV_X1 U236 ( .A(n26), .ZN(n243) );
  BUF_X1 U237 ( .A(DP_OP_56J2_124_736_n6), .Z(n245) );
  AND4_X1 U238 ( .A1(n326), .A2(n329), .A3(n327), .A4(n328), .ZN(n246) );
  BUF_X1 U239 ( .A(pit_pre_scl[0]), .Z(n247) );
  AND2_X1 U240 ( .A1(n250), .A2(prescale_cnt_n_13_), .ZN(
        DP_OP_56J2_124_736_n16) );
  NAND2_X1 U241 ( .A1(prescale_cnt_n_14_), .A2(n250), .ZN(n249) );
  XOR2_X1 U242 ( .A(n245), .B(DP_OP_56J2_124_736_n20), .Z(prescale_N54) );
  NOR2_X1 U243 ( .A1(n260), .A2(n252), .ZN(DP_OP_56J2_124_736_n20) );
  BUF_X2 U244 ( .A(n248), .Z(n260) );
  XNOR2_X1 U245 ( .A(DP_OP_56J2_124_736_n1), .B(n249), .ZN(prescale_N59) );
  NOR2_X1 U246 ( .A1(n248), .A2(n259), .ZN(DP_OP_56J2_124_736_n27) );
  NOR2_X1 U247 ( .A1(n248), .A2(n258), .ZN(DP_OP_56J2_124_736_n26) );
  NOR2_X1 U248 ( .A1(n260), .A2(n257), .ZN(DP_OP_56J2_124_736_n25) );
  NOR2_X1 U249 ( .A1(n260), .A2(n255), .ZN(DP_OP_56J2_124_736_n23) );
  NOR2_X1 U250 ( .A1(n260), .A2(n254), .ZN(DP_OP_56J2_124_736_n22) );
  NOR2_X1 U251 ( .A1(n260), .A2(n253), .ZN(DP_OP_56J2_124_736_n21) );
  AND2_X1 U252 ( .A1(n250), .A2(prescale_cnt_n_10_), .ZN(
        DP_OP_56J2_124_736_n19) );
  AND2_X1 U253 ( .A1(n250), .A2(prescale_cnt_n_11_), .ZN(
        DP_OP_56J2_124_736_n18) );
  INV_X1 U254 ( .A(n260), .ZN(n250) );
  AND2_X1 U255 ( .A1(DP_OP_56J2_124_736_n6), .A2(DP_OP_56J2_124_736_n20), .ZN(
        n251) );
  INV_X1 U256 ( .A(n261), .ZN(prescale_N45) );
  OAI222_X4 U257 ( .A1(n386), .A2(n271), .B1(n389), .B2(n49), .C1(n65), .C2(
        n388), .ZN(wb_dat_o[8]) );
  INV_X1 U258 ( .A(n339), .ZN(n372) );
  OAI222_X1 U259 ( .A1(n386), .A2(n262), .B1(n389), .B2(n52), .C1(n66), .C2(
        n388), .ZN(n395) );
  OAI21_X1 U260 ( .B1(n266), .B2(n386), .A(n384), .ZN(n401) );
  OAI22_X1 U261 ( .A1(n62), .A2(n388), .B1(n380), .B2(n386), .ZN(n398) );
  OAI22_X1 U262 ( .A1(n61), .A2(n388), .B1(n269), .B2(n386), .ZN(n399) );
  OAI22_X1 U263 ( .A1(n70), .A2(n388), .B1(n385), .B2(n386), .ZN(n391) );
  OAI22_X1 U264 ( .A1(n60), .A2(n388), .B1(n381), .B2(n386), .ZN(n400) );
  OAI22_X1 U265 ( .A1(n64), .A2(n388), .B1(n379), .B2(n386), .ZN(n396) );
  OAI22_X1 U266 ( .A1(n63), .A2(n388), .B1(n268), .B2(n386), .ZN(n397) );
  OAI22_X1 U267 ( .A1(n69), .A2(n388), .B1(n267), .B2(n386), .ZN(n392) );
  OAI222_X1 U268 ( .A1(n47), .A2(n389), .B1(n388), .B2(n56), .C1(n387), .C2(
        n386), .ZN(n402) );
  OAI222_X1 U269 ( .A1(n386), .A2(n272), .B1(n389), .B2(n239), .C1(n72), .C2(
        n388), .ZN(n390) );
  OAI222_X1 U270 ( .A1(n386), .A2(n264), .B1(n389), .B2(n54), .C1(n68), .C2(
        n388), .ZN(n393) );
  OAI222_X1 U271 ( .A1(n386), .A2(n270), .B1(n389), .B2(n53), .C1(n67), .C2(
        n388), .ZN(n394) );
  AND2_X1 U272 ( .A1(pit_pre_scl[1]), .A2(pit_pre_scl[2]), .ZN(n313) );
  NAND2_X1 U273 ( .A1(n335), .A2(n372), .ZN(n373) );
  INV_X1 U274 ( .A(n382), .ZN(n389) );
  NAND3_X1 U275 ( .A1(wishbone_address_1_), .A2(n43), .A3(n273), .ZN(n386) );
  NOR3_X1 U276 ( .A1(n43), .A2(wishbone_address_1_), .A3(wishbone_address_2_), 
        .ZN(n383) );
  AND2_X1 U277 ( .A1(n239), .A2(cnt_sync_o), .ZN(n275) );
  INV_X1 U278 ( .A(wb_dat_i[2]), .ZN(n22) );
  INV_X1 U279 ( .A(wb_dat_i[8]), .ZN(n16) );
  INV_X1 U280 ( .A(wb_dat_i[1]), .ZN(n23) );
  INV_X1 U281 ( .A(wb_dat_i[9]), .ZN(n15) );
  INV_X1 U282 ( .A(wb_dat_i[10]), .ZN(n14) );
  INV_X1 U283 ( .A(wb_dat_i[11]), .ZN(n13) );
  INV_X1 U284 ( .A(wb_dat_i[15]), .ZN(n9) );
  INV_X1 U285 ( .A(wb_dat_i[0]), .ZN(n24) );
  AOI221_X1 U286 ( .B1(n277), .B2(prescale_cnt_n_8_), .C1(n303), .C2(
        prescale_cnt_n_9_), .A(n302), .ZN(n328) );
  OR2_X1 U287 ( .A1(n304), .A2(n247), .ZN(n280) );
  NAND3_X1 U288 ( .A1(pit_pre_scl[1]), .A2(pit_pre_scl[2]), .A3(n54), .ZN(n304) );
  BUF_X1 U289 ( .A(pit_pre_scl[3]), .Z(n279) );
  INV_X1 U290 ( .A(n246), .ZN(n332) );
  NAND4_X1 U291 ( .A1(n69), .A2(n70), .A3(n72), .A4(n57), .ZN(n284) );
  NAND4_X1 U292 ( .A1(n59), .A2(n60), .A3(n61), .A4(n62), .ZN(n283) );
  NOR4_X1 U293 ( .A1(mod_value[6]), .A2(mod_value[7]), .A3(mod_value[8]), .A4(
        mod_value[9]), .ZN(n281) );
  NAND4_X1 U294 ( .A1(n281), .A2(n67), .A3(n68), .A4(n71), .ZN(n282) );
  NOR3_X1 U295 ( .A1(n284), .A2(n283), .A3(n282), .ZN(n333) );
  AOI22_X1 U296 ( .A1(n62), .A2(cnt_n[5]), .B1(n61), .B2(cnt_n[4]), .ZN(n285)
         );
  OAI221_X1 U297 ( .B1(n62), .B2(cnt_n[5]), .C1(n61), .C2(cnt_n[4]), .A(n285), 
        .ZN(n301) );
  AOI22_X1 U298 ( .A1(n64), .A2(cnt_n[7]), .B1(n63), .B2(cnt_n[6]), .ZN(n286)
         );
  OAI221_X1 U299 ( .B1(n64), .B2(cnt_n[7]), .C1(n63), .C2(cnt_n[6]), .A(n286), 
        .ZN(n300) );
  AOI22_X1 U300 ( .A1(n60), .A2(cnt_n[3]), .B1(n57), .B2(cnt_n[1]), .ZN(n287)
         );
  OAI221_X1 U301 ( .B1(n60), .B2(cnt_n[3]), .C1(n57), .C2(cnt_n[1]), .A(n287), 
        .ZN(n288) );
  AOI221_X1 U302 ( .B1(mod_value[15]), .B2(n272), .C1(n72), .C2(cnt_n[15]), 
        .A(n288), .ZN(n289) );
  OAI221_X1 U303 ( .B1(mod_value[2]), .B2(n263), .C1(n59), .C2(cnt_n[2]), .A(
        n289), .ZN(n299) );
  OAI22_X1 U304 ( .A1(n71), .A2(cnt_n[14]), .B1(n69), .B2(cnt_n[12]), .ZN(n290) );
  AOI221_X1 U305 ( .B1(n71), .B2(cnt_n[14]), .C1(cnt_n[12]), .C2(n69), .A(n290), .ZN(n297) );
  OAI22_X1 U306 ( .A1(n70), .A2(cnt_n[13]), .B1(n56), .B2(cnt_n[0]), .ZN(n291)
         );
  AOI221_X1 U307 ( .B1(n70), .B2(cnt_n[13]), .C1(cnt_n[0]), .C2(n56), .A(n291), 
        .ZN(n296) );
  OAI22_X1 U308 ( .A1(n67), .A2(cnt_n[10]), .B1(n65), .B2(cnt_n[8]), .ZN(n292)
         );
  AOI221_X1 U309 ( .B1(n67), .B2(cnt_n[10]), .C1(cnt_n[8]), .C2(n65), .A(n292), 
        .ZN(n295) );
  OAI22_X1 U310 ( .A1(n68), .A2(cnt_n[11]), .B1(n66), .B2(cnt_n[9]), .ZN(n293)
         );
  AOI221_X1 U311 ( .B1(n68), .B2(cnt_n[11]), .C1(cnt_n[9]), .C2(n66), .A(n293), 
        .ZN(n294) );
  NAND4_X1 U312 ( .A1(n297), .A2(n296), .A3(n295), .A4(n294), .ZN(n298) );
  NOR4_X1 U313 ( .A1(n301), .A2(n300), .A3(n299), .A4(n298), .ZN(n331) );
  NOR3_X1 U314 ( .A1(pit_pre_scl[2]), .A2(pit_pre_scl[3]), .A3(n247), .ZN(n311) );
  NAND2_X1 U315 ( .A1(n311), .A2(n52), .ZN(n330) );
  AOI221_X1 U316 ( .B1(pit_pre_scl[2]), .B2(pit_pre_scl[0]), .C1(n53), .C2(n49), .A(pit_pre_scl[3]), .ZN(n317) );
  NOR3_X1 U317 ( .A1(n49), .A2(n53), .A3(pit_pre_scl[1]), .ZN(n312) );
  AND2_X1 U318 ( .A1(n54), .A2(n312), .ZN(n310) );
  NOR2_X1 U319 ( .A1(n279), .A2(n313), .ZN(n303) );
  OAI22_X1 U320 ( .A1(n277), .A2(prescale_cnt_n_8_), .B1(prescale_cnt_n_9_), 
        .B2(n303), .ZN(n302) );
  NOR2_X1 U321 ( .A1(n49), .A2(n277), .ZN(n325) );
  INV_X1 U322 ( .A(n325), .ZN(n309) );
  XNOR2_X1 U323 ( .A(prescale_cnt_n_0_), .B(n330), .ZN(n308) );
  AOI21_X1 U324 ( .B1(n247), .B2(n313), .A(n279), .ZN(n306) );
  AOI22_X1 U325 ( .A1(prescale_cnt_n_10_), .A2(n306), .B1(n280), .B2(
        prescale_cnt_n_7_), .ZN(n305) );
  OAI221_X1 U326 ( .B1(prescale_cnt_n_10_), .B2(n306), .C1(n280), .C2(
        prescale_cnt_n_7_), .A(n305), .ZN(n307) );
  AOI211_X1 U327 ( .C1(n309), .C2(prescale_cnt_n_13_), .A(n308), .B(n307), 
        .ZN(n327) );
  AOI21_X1 U328 ( .B1(pit_pre_scl[1]), .B2(n311), .A(n310), .ZN(n316) );
  AOI211_X1 U329 ( .C1(n313), .C2(n49), .A(n279), .B(n312), .ZN(n315) );
  AOI22_X1 U330 ( .A1(n316), .A2(prescale_cnt_n_2_), .B1(prescale_cnt_n_5_), 
        .B2(n315), .ZN(n314) );
  OAI221_X1 U331 ( .B1(n316), .B2(prescale_cnt_n_2_), .C1(prescale_cnt_n_5_), 
        .C2(n315), .A(n314), .ZN(n324) );
  NAND2_X1 U332 ( .A1(n317), .A2(n52), .ZN(n320) );
  AOI22_X1 U333 ( .A1(n73), .A2(prescale_cnt_n_4_), .B1(prescale_cnt_n_11_), 
        .B2(n54), .ZN(n318) );
  OAI21_X1 U334 ( .B1(n320), .B2(prescale_cnt_n_1_), .A(n318), .ZN(n319) );
  AOI211_X1 U335 ( .C1(n320), .C2(prescale_cnt_n_1_), .A(prescale_cnt_n_12_), 
        .B(n319), .ZN(n321) );
  OAI221_X1 U336 ( .B1(prescale_cnt_n_14_), .B2(n54), .C1(n322), .C2(
        prescale_cnt_n_11_), .A(n321), .ZN(n323) );
  AOI211_X1 U337 ( .C1(n325), .C2(n257), .A(n324), .B(n323), .ZN(n326) );
  OAI21_X1 U338 ( .B1(n330), .B2(n239), .A(n332), .ZN(n335) );
  OAI21_X1 U339 ( .B1(n333), .B2(n331), .A(n335), .ZN(n96) );
  NAND2_X1 U340 ( .A1(wb_cyc_i), .A2(wb_stb_i), .ZN(n76) );
  NOR2_X1 U341 ( .A1(n76), .A2(n276), .ZN(n403) );
  NAND3_X1 U342 ( .A1(n383), .A2(n403), .A3(wb_we_i), .ZN(n121) );
  NOR3_X1 U343 ( .A1(wishbone_address_1_), .A2(wishbone_address_2_), .A3(n274), 
        .ZN(n382) );
  NAND3_X1 U344 ( .A1(n382), .A2(n403), .A3(wb_we_i), .ZN(n124) );
  NOR2_X1 U345 ( .A1(n333), .A2(n219), .ZN(n334) );
  NAND2_X1 U346 ( .A1(n334), .A2(n96), .ZN(n339) );
  INV_X1 U347 ( .A(n373), .ZN(n337) );
  NAND3_X1 U348 ( .A1(cnt_n[0]), .A2(cnt_n[2]), .A3(cnt_n[1]), .ZN(n345) );
  NOR2_X1 U349 ( .A1(n381), .A2(n345), .ZN(n344) );
  NAND2_X1 U350 ( .A1(cnt_n[4]), .A2(n344), .ZN(n350) );
  NOR2_X1 U351 ( .A1(n380), .A2(n350), .ZN(n349) );
  NAND2_X1 U352 ( .A1(cnt_n[6]), .A2(n349), .ZN(n355) );
  NOR2_X1 U353 ( .A1(n379), .A2(n355), .ZN(n354) );
  NAND2_X1 U354 ( .A1(cnt_n[8]), .A2(n354), .ZN(n360) );
  NOR2_X1 U355 ( .A1(n262), .A2(n360), .ZN(n359) );
  NAND2_X1 U356 ( .A1(cnt_n[10]), .A2(n359), .ZN(n365) );
  NOR2_X1 U357 ( .A1(n264), .A2(n365), .ZN(n364) );
  NAND2_X1 U358 ( .A1(cnt_n[12]), .A2(n364), .ZN(n370) );
  NOR2_X1 U359 ( .A1(n385), .A2(n370), .ZN(n369) );
  NAND2_X1 U360 ( .A1(cnt_n[14]), .A2(n369), .ZN(n375) );
  XNOR2_X1 U361 ( .A(cnt_n[15]), .B(n375), .ZN(n336) );
  AOI22_X1 U362 ( .A1(cnt_n[15]), .A2(n377), .B1(n337), .B2(n336), .ZN(n116)
         );
  INV_X1 U363 ( .A(n377), .ZN(n338) );
  NAND2_X1 U364 ( .A1(cnt_n[0]), .A2(n337), .ZN(n340) );
  OAI21_X1 U365 ( .B1(cnt_n[0]), .B2(n338), .A(n340), .ZN(n113) );
  NAND2_X1 U366 ( .A1(cnt_n[0]), .A2(cnt_n[1]), .ZN(n342) );
  AOI21_X1 U367 ( .B1(n266), .B2(n340), .A(n339), .ZN(n341) );
  OAI21_X1 U368 ( .B1(n377), .B2(n342), .A(n341), .ZN(n112) );
  AOI21_X1 U369 ( .B1(n263), .B2(n342), .A(n373), .ZN(n343) );
  AOI22_X1 U370 ( .A1(cnt_n[2]), .A2(n377), .B1(n343), .B2(n345), .ZN(n111) );
  INV_X1 U371 ( .A(n344), .ZN(n347) );
  OAI21_X1 U372 ( .B1(n373), .B2(n345), .A(n381), .ZN(n346) );
  OAI211_X1 U373 ( .C1(n377), .C2(n347), .A(n372), .B(n346), .ZN(n110) );
  AOI21_X1 U374 ( .B1(n269), .B2(n347), .A(n373), .ZN(n348) );
  AOI22_X1 U375 ( .A1(cnt_n[4]), .A2(n377), .B1(n348), .B2(n350), .ZN(n109) );
  INV_X1 U376 ( .A(n349), .ZN(n352) );
  OAI21_X1 U377 ( .B1(n373), .B2(n350), .A(n380), .ZN(n351) );
  OAI211_X1 U378 ( .C1(n377), .C2(n352), .A(n372), .B(n351), .ZN(n108) );
  AOI21_X1 U379 ( .B1(n268), .B2(n352), .A(n373), .ZN(n353) );
  AOI22_X1 U380 ( .A1(cnt_n[6]), .A2(n377), .B1(n353), .B2(n355), .ZN(n107) );
  INV_X1 U381 ( .A(n354), .ZN(n357) );
  OAI21_X1 U382 ( .B1(n373), .B2(n355), .A(n379), .ZN(n356) );
  OAI211_X1 U383 ( .C1(n377), .C2(n357), .A(n372), .B(n356), .ZN(n106) );
  AOI21_X1 U384 ( .B1(n271), .B2(n357), .A(n373), .ZN(n358) );
  AOI22_X1 U385 ( .A1(cnt_n[8]), .A2(n377), .B1(n358), .B2(n360), .ZN(n105) );
  INV_X1 U386 ( .A(n359), .ZN(n362) );
  OAI21_X1 U387 ( .B1(n373), .B2(n360), .A(n262), .ZN(n361) );
  OAI211_X1 U388 ( .C1(n377), .C2(n362), .A(n372), .B(n361), .ZN(n104) );
  AOI21_X1 U389 ( .B1(n270), .B2(n362), .A(n373), .ZN(n363) );
  AOI22_X1 U390 ( .A1(cnt_n[10]), .A2(n377), .B1(n363), .B2(n365), .ZN(n103)
         );
  INV_X1 U391 ( .A(n364), .ZN(n367) );
  OAI21_X1 U392 ( .B1(n373), .B2(n365), .A(n264), .ZN(n366) );
  OAI211_X1 U393 ( .C1(n377), .C2(n367), .A(n372), .B(n366), .ZN(n102) );
  AOI21_X1 U394 ( .B1(n267), .B2(n367), .A(n373), .ZN(n368) );
  AOI22_X1 U395 ( .A1(cnt_n[12]), .A2(n377), .B1(n368), .B2(n370), .ZN(n101)
         );
  INV_X1 U396 ( .A(n369), .ZN(n374) );
  OAI21_X1 U397 ( .B1(n373), .B2(n370), .A(n385), .ZN(n371) );
  OAI211_X1 U398 ( .C1(n377), .C2(n374), .A(n372), .B(n371), .ZN(n100) );
  AOI21_X1 U399 ( .B1(n265), .B2(n374), .A(n373), .ZN(n376) );
  AOI22_X1 U400 ( .A1(cnt_n[14]), .A2(n377), .B1(n376), .B2(n375), .ZN(n97) );
  AOI211_X1 U401 ( .C1(n75), .C2(n96), .A(pit_flg_clr), .B(n219), .ZN(n181) );
  AOI21_X1 U402 ( .B1(mod_value[14]), .B2(n383), .A(n382), .ZN(n378) );
  AOI22_X1 U403 ( .A1(mod_value[1]), .A2(n383), .B1(n382), .B2(pit_ien), .ZN(
        n384) );
  INV_X1 U404 ( .A(wb_dat_i[3]), .ZN(n21) );
  INV_X1 U405 ( .A(wb_dat_i[4]), .ZN(n20) );
  INV_X1 U406 ( .A(wb_dat_i[5]), .ZN(n19) );
  INV_X1 U407 ( .A(wb_dat_i[6]), .ZN(n18) );
  INV_X1 U408 ( .A(wb_dat_i[7]), .ZN(n17) );
  INV_X1 U409 ( .A(wb_dat_i[12]), .ZN(n12) );
  INV_X1 U410 ( .A(wb_dat_i[13]), .ZN(n11) );
  INV_X1 U411 ( .A(wb_dat_i[14]), .ZN(n10) );
  MUX2_X1 U412 ( .A(wb_adr_i[2]), .B(wishbone_address_2_), .S(n76), .Z(n5) );
  MUX2_X1 U413 ( .A(wb_adr_i[1]), .B(wishbone_address_1_), .S(n76), .Z(n6) );
  MUX2_X1 U414 ( .A(wb_adr_i[0]), .B(n274), .S(n76), .Z(n7) );
endmodule
