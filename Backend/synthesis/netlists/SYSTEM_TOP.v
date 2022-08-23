/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Tue Aug 23 04:02:18 2022
/////////////////////////////////////////////////////////////


module RST_SYNC_0 ( RSTSYNC_CLK, RSTSYNC_RST, RSTSYNC_OUT );
  input RSTSYNC_CLK, RSTSYNC_RST;
  output RSTSYNC_OUT;
  wire   \FFSTAGES[0] ;

  DFFRQX2M \FFSTAGES_reg[1]  ( .D(\FFSTAGES[0] ), .CK(RSTSYNC_CLK), .RN(
        RSTSYNC_RST), .Q(RSTSYNC_OUT) );
  DFFRQX2M \FFSTAGES_reg[0]  ( .D(1'b1), .CK(RSTSYNC_CLK), .RN(RSTSYNC_RST), 
        .Q(\FFSTAGES[0] ) );
endmodule


module RST_SYNC_1 ( RSTSYNC_CLK, RSTSYNC_RST, RSTSYNC_OUT );
  input RSTSYNC_CLK, RSTSYNC_RST;
  output RSTSYNC_OUT;
  wire   \FFSTAGES[0] ;

  DFFRQX2M \FFSTAGES_reg[1]  ( .D(\FFSTAGES[0] ), .CK(RSTSYNC_CLK), .RN(
        RSTSYNC_RST), .Q(RSTSYNC_OUT) );
  DFFRQX2M \FFSTAGES_reg[0]  ( .D(1'b1), .CK(RSTSYNC_CLK), .RN(RSTSYNC_RST), 
        .Q(\FFSTAGES[0] ) );
endmodule


module DATA_SYNC_0 ( DataSync_unsync_bus, DataSync_bus_enable, DataSync_CLK, 
        DataSync_RST, DataSync_sync_bus, DataSync_enable_pulse );
  input [7:0] DataSync_unsync_bus;
  output [7:0] DataSync_sync_bus;
  input DataSync_bus_enable, DataSync_CLK, DataSync_RST;
  output DataSync_enable_pulse;
  wire   PulseGenFF, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] FFSTAGES;

  DFFRQX2M PulseGenFF_reg ( .D(FFSTAGES[1]), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(PulseGenFF) );
  DFFRQX2M \FFSTAGES_reg[1]  ( .D(FFSTAGES[0]), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(FFSTAGES[1]) );
  DFFRQX2M \DataSync_sync_bus_reg[6]  ( .D(n8), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[6]) );
  DFFRQX2M \DataSync_sync_bus_reg[2]  ( .D(n4), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[2]) );
  DFFRQX2M \DataSync_sync_bus_reg[3]  ( .D(n5), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[3]) );
  DFFRQX2M \DataSync_sync_bus_reg[7]  ( .D(n9), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[7]) );
  DFFRQX2M \DataSync_sync_bus_reg[4]  ( .D(n6), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[4]) );
  DFFRQX2M \DataSync_sync_bus_reg[0]  ( .D(n2), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[0]) );
  DFFRQX2M \DataSync_sync_bus_reg[5]  ( .D(n7), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[5]) );
  DFFRQX2M \DataSync_sync_bus_reg[1]  ( .D(n3), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[1]) );
  DFFRQX2M DataSync_enable_pulse_reg ( .D(n10), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_enable_pulse) );
  DFFRQX2M \FFSTAGES_reg[0]  ( .D(DataSync_bus_enable), .CK(DataSync_CLK), 
        .RN(DataSync_RST), .Q(FFSTAGES[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(PulseGenFF), .B(FFSTAGES[1]), .Y(n1) );
  AO22X1M U5 ( .A0(DataSync_unsync_bus[0]), .A1(n10), .B0(DataSync_sync_bus[0]), .B1(n1), .Y(n2) );
  AO22X1M U6 ( .A0(DataSync_unsync_bus[1]), .A1(n10), .B0(DataSync_sync_bus[1]), .B1(n1), .Y(n3) );
  AO22X1M U7 ( .A0(DataSync_unsync_bus[2]), .A1(n10), .B0(DataSync_sync_bus[2]), .B1(n1), .Y(n4) );
  AO22X1M U8 ( .A0(DataSync_unsync_bus[3]), .A1(n10), .B0(DataSync_sync_bus[3]), .B1(n1), .Y(n5) );
  AO22X1M U9 ( .A0(DataSync_unsync_bus[4]), .A1(n10), .B0(DataSync_sync_bus[4]), .B1(n1), .Y(n6) );
  AO22X1M U10 ( .A0(DataSync_unsync_bus[5]), .A1(n10), .B0(
        DataSync_sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(DataSync_unsync_bus[6]), .A1(n10), .B0(
        DataSync_sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(DataSync_unsync_bus[7]), .A1(n10), .B0(
        DataSync_sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module DATA_SYNC_1 ( DataSync_unsync_bus, DataSync_bus_enable, DataSync_CLK, 
        DataSync_RST, DataSync_sync_bus, DataSync_enable_pulse );
  input [7:0] DataSync_unsync_bus;
  output [7:0] DataSync_sync_bus;
  input DataSync_bus_enable, DataSync_CLK, DataSync_RST;
  output DataSync_enable_pulse;
  wire   PulseGenFF, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  wire   [1:0] FFSTAGES;

  DFFRQX2M PulseGenFF_reg ( .D(FFSTAGES[1]), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(PulseGenFF) );
  DFFRQX2M \DataSync_sync_bus_reg[1]  ( .D(n17), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[1]) );
  DFFRQX2M \DataSync_sync_bus_reg[0]  ( .D(n18), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[0]) );
  DFFRQX2M DataSync_enable_pulse_reg ( .D(n10), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_enable_pulse) );
  DFFRQX2M \DataSync_sync_bus_reg[7]  ( .D(n11), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[7]) );
  DFFRQX2M \DataSync_sync_bus_reg[3]  ( .D(n15), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[3]) );
  DFFRQX2M \FFSTAGES_reg[1]  ( .D(FFSTAGES[0]), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(FFSTAGES[1]) );
  DFFRQX2M \DataSync_sync_bus_reg[2]  ( .D(n16), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[2]) );
  DFFRQX2M \DataSync_sync_bus_reg[5]  ( .D(n13), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[5]) );
  DFFRQX2M \DataSync_sync_bus_reg[4]  ( .D(n14), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[4]) );
  DFFRQX2M \DataSync_sync_bus_reg[6]  ( .D(n12), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(DataSync_sync_bus[6]) );
  DFFRQX2M \FFSTAGES_reg[0]  ( .D(DataSync_bus_enable), .CK(DataSync_CLK), 
        .RN(DataSync_RST), .Q(FFSTAGES[0]) );
  INVX2M U3 ( .A(n19), .Y(n10) );
  NAND2BX2M U4 ( .AN(PulseGenFF), .B(FFSTAGES[1]), .Y(n19) );
  AO22X1M U5 ( .A0(DataSync_unsync_bus[0]), .A1(n10), .B0(DataSync_sync_bus[0]), .B1(n19), .Y(n18) );
  AO22X1M U6 ( .A0(DataSync_unsync_bus[1]), .A1(n10), .B0(DataSync_sync_bus[1]), .B1(n19), .Y(n17) );
  AO22X1M U7 ( .A0(DataSync_unsync_bus[2]), .A1(n10), .B0(DataSync_sync_bus[2]), .B1(n19), .Y(n16) );
  AO22X1M U8 ( .A0(DataSync_unsync_bus[3]), .A1(n10), .B0(DataSync_sync_bus[3]), .B1(n19), .Y(n15) );
  AO22X1M U9 ( .A0(DataSync_unsync_bus[4]), .A1(n10), .B0(DataSync_sync_bus[4]), .B1(n19), .Y(n14) );
  AO22X1M U10 ( .A0(DataSync_unsync_bus[5]), .A1(n10), .B0(
        DataSync_sync_bus[5]), .B1(n19), .Y(n13) );
  AO22X1M U11 ( .A0(DataSync_unsync_bus[6]), .A1(n10), .B0(
        DataSync_sync_bus[6]), .B1(n19), .Y(n12) );
  AO22X1M U12 ( .A0(DataSync_unsync_bus[7]), .A1(n10), .B0(
        DataSync_sync_bus[7]), .B1(n19), .Y(n11) );
endmodule


module BIT_SYNC ( BitSync_ASYNC, BitSync_CLK, BitSync_RST, BitSync_SYNC );
  input [0:0] BitSync_ASYNC;
  output [0:0] BitSync_SYNC;
  input BitSync_CLK, BitSync_RST;
  wire   \FFSTAGES[0][0] ;

  DFFRQX2M \FFSTAGES_reg[0][1]  ( .D(\FFSTAGES[0][0] ), .CK(BitSync_CLK), .RN(
        BitSync_RST), .Q(BitSync_SYNC[0]) );
  DFFRQX2M \FFSTAGES_reg[0][0]  ( .D(BitSync_ASYNC[0]), .CK(BitSync_CLK), .RN(
        BitSync_RST), .Q(\FFSTAGES[0][0] ) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module ClkDiv ( i_div_ratio, i_ref_clk, i_rst_en, i_clk_en, o_div_clk );
  input [3:0] i_div_ratio;
  input i_ref_clk, i_rst_en, i_clk_en;
  output o_div_clk;
  wire   N5, i_clk_en_c, div_clk, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n1, n2, n3, n4, n5, n6, n7;
  wire   [3:0] count;
  wire   [3:0] count_comb;
  assign N5 = i_clk_en;

  DFFRQX2M div_clk_reg ( .D(n38), .CK(i_ref_clk), .RN(i_rst_en), .Q(div_clk)
         );
  DFFRQX2M i_clk_en_c_reg ( .D(N5), .CK(i_ref_clk), .RN(i_rst_en), .Q(
        i_clk_en_c) );
  DFFRQX2M \count_reg[3]  ( .D(count_comb[3]), .CK(i_ref_clk), .RN(i_rst_en), 
        .Q(count[3]) );
  DFFRQX2M \count_reg[0]  ( .D(count_comb[0]), .CK(i_ref_clk), .RN(i_rst_en), 
        .Q(count[0]) );
  DFFRQX2M \count_reg[1]  ( .D(count_comb[1]), .CK(i_ref_clk), .RN(i_rst_en), 
        .Q(count[1]) );
  DFFRQX2M \count_reg[2]  ( .D(count_comb[2]), .CK(i_ref_clk), .RN(i_rst_en), 
        .Q(count[2]) );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N5), .Y(o_div_clk) );
  OAI32X1M U4 ( .A0(n24), .A1(n4), .A2(n25), .B0(n26), .B1(n6), .Y(
        count_comb[3]) );
  NAND3X2M U5 ( .A(count[2]), .B(n6), .C(count[1]), .Y(n24) );
  OA21X2M U6 ( .A0(n25), .A1(count[2]), .B0(n27), .Y(n26) );
  NAND3X2M U7 ( .A(N5), .B(n16), .C(i_clk_en_c), .Y(n25) );
  XOR3XLM U8 ( .A(i_div_ratio[2]), .B(n5), .C(n36), .Y(n30) );
  NAND4X2M U9 ( .A(n30), .B(n31), .C(n32), .D(n33), .Y(n16) );
  CLKXOR2X2M U10 ( .A(count[3]), .B(n34), .Y(n33) );
  CLKXOR2X2M U11 ( .A(count[1]), .B(n37), .Y(n32) );
  CLKXOR2X2M U12 ( .A(i_div_ratio[0]), .B(count[0]), .Y(n31) );
  AOI2BB1X2M U13 ( .A0N(count[1]), .A1N(n25), .B0(count_comb[0]), .Y(n27) );
  INVX2M U14 ( .A(count[2]), .Y(n5) );
  OAI32X1M U15 ( .A0(n28), .A1(n4), .A2(n25), .B0(n27), .B1(n5), .Y(
        count_comb[2]) );
  NAND2X2M U16 ( .A(count[1]), .B(n5), .Y(n28) );
  OAI32X1M U17 ( .A0(n1), .A1(div_clk), .A2(n2), .B0(n14), .B1(n7), .Y(n38) );
  INVX2M U18 ( .A(N5), .Y(n1) );
  INVX2M U19 ( .A(div_clk), .Y(n7) );
  INVX2M U20 ( .A(n14), .Y(n2) );
  XOR3XLM U21 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .C(count[1]), .Y(n19)
         );
  NOR2X2M U22 ( .A(n25), .B(count[0]), .Y(count_comb[0]) );
  NAND3X2M U23 ( .A(n15), .B(n16), .C(N5), .Y(n14) );
  NAND4X2M U24 ( .A(n17), .B(n18), .C(n19), .D(n20), .Y(n15) );
  CLKXOR2X2M U25 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n18) );
  CLKXOR2X2M U26 ( .A(n22), .B(n6), .Y(n17) );
  NOR2X2M U27 ( .A(n29), .B(n25), .Y(count_comb[1]) );
  CLKXOR2X2M U28 ( .A(n4), .B(count[1]), .Y(n29) );
  INVX2M U29 ( .A(count[0]), .Y(n4) );
  INVX2M U30 ( .A(count[3]), .Y(n6) );
  CLKXOR2X2M U31 ( .A(n5), .B(n21), .Y(n20) );
  NAND2BX2M U32 ( .AN(n22), .B(n23), .Y(n21) );
  OAI21X2M U33 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0(i_div_ratio[3]), 
        .Y(n23) );
  NOR3X2M U34 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), 
        .Y(n22) );
  AOI21X2M U35 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[0]), .B0(n36), .Y(n37)
         );
  AOI2B1X1M U36 ( .A1N(i_div_ratio[0]), .A0(n22), .B0(n35), .Y(n34) );
  AOI2B1X1M U37 ( .A1N(i_div_ratio[2]), .A0(n36), .B0(n3), .Y(n35) );
  INVX2M U38 ( .A(i_div_ratio[3]), .Y(n3) );
  NOR2X2M U39 ( .A(i_div_ratio[1]), .B(i_div_ratio[0]), .Y(n36) );
endmodule


module Register_File ( RF_WrData, RF_Addr, RF_Wr_en, RF_Rd_en, RF_CLK, RF_RST, 
        RF_RdData, REG0, REG1, REG2, REG3, RF_Rd_Data_Valid );
  input [7:0] RF_WrData;
  input [7:0] RF_Addr;
  output [7:0] RF_RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input RF_Wr_en, RF_Rd_en, RF_CLK, RF_RST;
  output RF_Rd_Data_Valid;
  wire   N11, N12, N13, N14, \registers[15][7] , \registers[15][6] ,
         \registers[15][5] , \registers[15][4] , \registers[15][3] ,
         \registers[15][2] , \registers[15][1] , \registers[15][0] ,
         \registers[14][7] , \registers[14][6] , \registers[14][5] ,
         \registers[14][4] , \registers[14][3] , \registers[14][2] ,
         \registers[14][1] , \registers[14][0] , \registers[13][7] ,
         \registers[13][6] , \registers[13][5] , \registers[13][4] ,
         \registers[13][3] , \registers[13][2] , \registers[13][1] ,
         \registers[13][0] , \registers[12][7] , \registers[12][6] ,
         \registers[12][5] , \registers[12][4] , \registers[12][3] ,
         \registers[12][2] , \registers[12][1] , \registers[12][0] ,
         \registers[11][7] , \registers[11][6] , \registers[11][5] ,
         \registers[11][4] , \registers[11][3] , \registers[11][2] ,
         \registers[11][1] , \registers[11][0] , \registers[10][7] ,
         \registers[10][6] , \registers[10][5] , \registers[10][4] ,
         \registers[10][3] , \registers[10][2] , \registers[10][1] ,
         \registers[10][0] , \registers[9][7] , \registers[9][6] ,
         \registers[9][5] , \registers[9][4] , \registers[9][3] ,
         \registers[9][2] , \registers[9][1] , \registers[9][0] ,
         \registers[8][7] , \registers[8][6] , \registers[8][5] ,
         \registers[8][4] , \registers[8][3] , \registers[8][2] ,
         \registers[8][1] , \registers[8][0] , \registers[7][7] ,
         \registers[7][6] , \registers[7][5] , \registers[7][4] ,
         \registers[7][3] , \registers[7][2] , \registers[7][1] ,
         \registers[7][0] , \registers[6][7] , \registers[6][6] ,
         \registers[6][5] , \registers[6][4] , \registers[6][3] ,
         \registers[6][2] , \registers[6][1] , \registers[6][0] ,
         \registers[5][7] , \registers[5][6] , \registers[5][5] ,
         \registers[5][4] , \registers[5][3] , \registers[5][2] ,
         \registers[5][1] , \registers[5][0] , \registers[4][7] ,
         \registers[4][6] , \registers[4][5] , \registers[4][4] ,
         \registers[4][3] , \registers[4][2] , \registers[4][1] ,
         \registers[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, N61, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228;
  assign N11 = RF_Addr[0];
  assign N12 = RF_Addr[1];
  assign N13 = RF_Addr[2];
  assign N14 = RF_Addr[3];

  DFFRQX2M \RF_RdData_reg[7]  ( .D(n48), .CK(RF_CLK), .RN(n205), .Q(
        RF_RdData[7]) );
  DFFRQX2M \RF_RdData_reg[6]  ( .D(n47), .CK(RF_CLK), .RN(n205), .Q(
        RF_RdData[6]) );
  DFFRQX2M \RF_RdData_reg[5]  ( .D(n46), .CK(RF_CLK), .RN(n205), .Q(
        RF_RdData[5]) );
  DFFRQX2M \RF_RdData_reg[4]  ( .D(n45), .CK(RF_CLK), .RN(n205), .Q(
        RF_RdData[4]) );
  DFFRQX2M \RF_RdData_reg[3]  ( .D(n44), .CK(RF_CLK), .RN(n205), .Q(
        RF_RdData[3]) );
  DFFRQX2M \RF_RdData_reg[2]  ( .D(n43), .CK(RF_CLK), .RN(n206), .Q(
        RF_RdData[2]) );
  DFFRQX2M \RF_RdData_reg[1]  ( .D(n42), .CK(RF_CLK), .RN(n205), .Q(
        RF_RdData[1]) );
  DFFRQX2M \RF_RdData_reg[0]  ( .D(n41), .CK(RF_CLK), .RN(n209), .Q(
        RF_RdData[0]) );
  DFFRQX2M RF_Rd_Data_Valid_reg ( .D(N61), .CK(RF_CLK), .RN(n205), .Q(
        RF_Rd_Data_Valid) );
  DFFSQX2M \registers_reg[2][2]  ( .D(n67), .CK(RF_CLK), .SN(n205), .Q(REG2[2]) );
  DFFRQX2M \registers_reg[13][7]  ( .D(n160), .CK(RF_CLK), .RN(n213), .Q(
        \registers[13][7] ) );
  DFFRQX2M \registers_reg[13][6]  ( .D(n159), .CK(RF_CLK), .RN(n213), .Q(
        \registers[13][6] ) );
  DFFRQX2M \registers_reg[13][5]  ( .D(n158), .CK(RF_CLK), .RN(n213), .Q(
        \registers[13][5] ) );
  DFFRQX2M \registers_reg[13][4]  ( .D(n157), .CK(RF_CLK), .RN(n212), .Q(
        \registers[13][4] ) );
  DFFRQX2M \registers_reg[13][3]  ( .D(n156), .CK(RF_CLK), .RN(n212), .Q(
        \registers[13][3] ) );
  DFFRQX2M \registers_reg[13][2]  ( .D(n155), .CK(RF_CLK), .RN(n212), .Q(
        \registers[13][2] ) );
  DFFRQX2M \registers_reg[13][1]  ( .D(n154), .CK(RF_CLK), .RN(n212), .Q(
        \registers[13][1] ) );
  DFFRQX2M \registers_reg[13][0]  ( .D(n153), .CK(RF_CLK), .RN(n212), .Q(
        \registers[13][0] ) );
  DFFRQX2M \registers_reg[9][7]  ( .D(n128), .CK(RF_CLK), .RN(n211), .Q(
        \registers[9][7] ) );
  DFFRQX2M \registers_reg[9][6]  ( .D(n127), .CK(RF_CLK), .RN(n210), .Q(
        \registers[9][6] ) );
  DFFRQX2M \registers_reg[9][5]  ( .D(n126), .CK(RF_CLK), .RN(n210), .Q(
        \registers[9][5] ) );
  DFFRQX2M \registers_reg[9][4]  ( .D(n125), .CK(RF_CLK), .RN(n210), .Q(
        \registers[9][4] ) );
  DFFRQX2M \registers_reg[9][3]  ( .D(n124), .CK(RF_CLK), .RN(n210), .Q(
        \registers[9][3] ) );
  DFFRQX2M \registers_reg[9][2]  ( .D(n123), .CK(RF_CLK), .RN(n210), .Q(
        \registers[9][2] ) );
  DFFRQX2M \registers_reg[9][1]  ( .D(n122), .CK(RF_CLK), .RN(n210), .Q(
        \registers[9][1] ) );
  DFFRQX2M \registers_reg[9][0]  ( .D(n121), .CK(RF_CLK), .RN(n210), .Q(
        \registers[9][0] ) );
  DFFRQX2M \registers_reg[5][7]  ( .D(n96), .CK(RF_CLK), .RN(n208), .Q(
        \registers[5][7] ) );
  DFFRQX2M \registers_reg[5][6]  ( .D(n95), .CK(RF_CLK), .RN(n208), .Q(
        \registers[5][6] ) );
  DFFRQX2M \registers_reg[5][5]  ( .D(n94), .CK(RF_CLK), .RN(n208), .Q(
        \registers[5][5] ) );
  DFFRQX2M \registers_reg[5][4]  ( .D(n93), .CK(RF_CLK), .RN(n208), .Q(
        \registers[5][4] ) );
  DFFRQX2M \registers_reg[5][3]  ( .D(n92), .CK(RF_CLK), .RN(n208), .Q(
        \registers[5][3] ) );
  DFFRQX2M \registers_reg[5][2]  ( .D(n91), .CK(RF_CLK), .RN(n208), .Q(
        \registers[5][2] ) );
  DFFRQX2M \registers_reg[5][1]  ( .D(n90), .CK(RF_CLK), .RN(n208), .Q(
        \registers[5][1] ) );
  DFFRQX2M \registers_reg[5][0]  ( .D(n89), .CK(RF_CLK), .RN(n208), .Q(
        \registers[5][0] ) );
  DFFRQX2M \registers_reg[15][7]  ( .D(n176), .CK(RF_CLK), .RN(n205), .Q(
        \registers[15][7] ) );
  DFFRQX2M \registers_reg[15][6]  ( .D(n175), .CK(RF_CLK), .RN(n214), .Q(
        \registers[15][6] ) );
  DFFRQX2M \registers_reg[15][5]  ( .D(n174), .CK(RF_CLK), .RN(n214), .Q(
        \registers[15][5] ) );
  DFFRQX2M \registers_reg[15][4]  ( .D(n173), .CK(RF_CLK), .RN(n214), .Q(
        \registers[15][4] ) );
  DFFRQX2M \registers_reg[15][3]  ( .D(n172), .CK(RF_CLK), .RN(n213), .Q(
        \registers[15][3] ) );
  DFFRQX2M \registers_reg[15][2]  ( .D(n171), .CK(RF_CLK), .RN(n213), .Q(
        \registers[15][2] ) );
  DFFRQX2M \registers_reg[15][1]  ( .D(n170), .CK(RF_CLK), .RN(n213), .Q(
        \registers[15][1] ) );
  DFFRQX2M \registers_reg[15][0]  ( .D(n169), .CK(RF_CLK), .RN(n213), .Q(
        \registers[15][0] ) );
  DFFRQX2M \registers_reg[11][7]  ( .D(n144), .CK(RF_CLK), .RN(n212), .Q(
        \registers[11][7] ) );
  DFFRQX2M \registers_reg[11][6]  ( .D(n143), .CK(RF_CLK), .RN(n212), .Q(
        \registers[11][6] ) );
  DFFRQX2M \registers_reg[11][5]  ( .D(n142), .CK(RF_CLK), .RN(n211), .Q(
        \registers[11][5] ) );
  DFFRQX2M \registers_reg[11][4]  ( .D(n141), .CK(RF_CLK), .RN(n211), .Q(
        \registers[11][4] ) );
  DFFRQX2M \registers_reg[11][3]  ( .D(n140), .CK(RF_CLK), .RN(n211), .Q(
        \registers[11][3] ) );
  DFFRQX2M \registers_reg[11][2]  ( .D(n139), .CK(RF_CLK), .RN(n211), .Q(
        \registers[11][2] ) );
  DFFRQX2M \registers_reg[11][1]  ( .D(n138), .CK(RF_CLK), .RN(n211), .Q(
        \registers[11][1] ) );
  DFFRQX2M \registers_reg[11][0]  ( .D(n137), .CK(RF_CLK), .RN(n211), .Q(
        \registers[11][0] ) );
  DFFRQX2M \registers_reg[7][7]  ( .D(n112), .CK(RF_CLK), .RN(n209), .Q(
        \registers[7][7] ) );
  DFFRQX2M \registers_reg[7][6]  ( .D(n111), .CK(RF_CLK), .RN(n209), .Q(
        \registers[7][6] ) );
  DFFRQX2M \registers_reg[7][5]  ( .D(n110), .CK(RF_CLK), .RN(n209), .Q(
        \registers[7][5] ) );
  DFFRQX2M \registers_reg[7][4]  ( .D(n109), .CK(RF_CLK), .RN(n209), .Q(
        \registers[7][4] ) );
  DFFRQX2M \registers_reg[7][3]  ( .D(n108), .CK(RF_CLK), .RN(n209), .Q(
        \registers[7][3] ) );
  DFFRQX2M \registers_reg[7][2]  ( .D(n107), .CK(RF_CLK), .RN(n209), .Q(
        \registers[7][2] ) );
  DFFRQX2M \registers_reg[7][1]  ( .D(n106), .CK(RF_CLK), .RN(n209), .Q(
        \registers[7][1] ) );
  DFFRQX2M \registers_reg[7][0]  ( .D(n105), .CK(RF_CLK), .RN(n209), .Q(
        \registers[7][0] ) );
  DFFRQX2M \registers_reg[3][7]  ( .D(n80), .CK(RF_CLK), .RN(n207), .Q(REG3[7]) );
  DFFRQX2M \registers_reg[3][6]  ( .D(n79), .CK(RF_CLK), .RN(n207), .Q(REG3[6]) );
  DFFRQX2M \registers_reg[3][5]  ( .D(n78), .CK(RF_CLK), .RN(n207), .Q(REG3[5]) );
  DFFRQX2M \registers_reg[3][4]  ( .D(n77), .CK(RF_CLK), .RN(n207), .Q(REG3[4]) );
  DFFRQX2M \registers_reg[14][7]  ( .D(n168), .CK(RF_CLK), .RN(n213), .Q(
        \registers[14][7] ) );
  DFFRQX2M \registers_reg[14][6]  ( .D(n167), .CK(RF_CLK), .RN(n213), .Q(
        \registers[14][6] ) );
  DFFRQX2M \registers_reg[14][5]  ( .D(n166), .CK(RF_CLK), .RN(n213), .Q(
        \registers[14][5] ) );
  DFFRQX2M \registers_reg[14][4]  ( .D(n165), .CK(RF_CLK), .RN(n213), .Q(
        \registers[14][4] ) );
  DFFRQX2M \registers_reg[14][3]  ( .D(n164), .CK(RF_CLK), .RN(n213), .Q(
        \registers[14][3] ) );
  DFFRQX2M \registers_reg[14][2]  ( .D(n163), .CK(RF_CLK), .RN(n213), .Q(
        \registers[14][2] ) );
  DFFRQX2M \registers_reg[14][1]  ( .D(n162), .CK(RF_CLK), .RN(n213), .Q(
        \registers[14][1] ) );
  DFFRQX2M \registers_reg[14][0]  ( .D(n161), .CK(RF_CLK), .RN(n213), .Q(
        \registers[14][0] ) );
  DFFRQX2M \registers_reg[10][7]  ( .D(n136), .CK(RF_CLK), .RN(n211), .Q(
        \registers[10][7] ) );
  DFFRQX2M \registers_reg[10][6]  ( .D(n135), .CK(RF_CLK), .RN(n211), .Q(
        \registers[10][6] ) );
  DFFRQX2M \registers_reg[10][5]  ( .D(n134), .CK(RF_CLK), .RN(n211), .Q(
        \registers[10][5] ) );
  DFFRQX2M \registers_reg[10][4]  ( .D(n133), .CK(RF_CLK), .RN(n211), .Q(
        \registers[10][4] ) );
  DFFRQX2M \registers_reg[10][3]  ( .D(n132), .CK(RF_CLK), .RN(n211), .Q(
        \registers[10][3] ) );
  DFFRQX2M \registers_reg[10][2]  ( .D(n131), .CK(RF_CLK), .RN(n211), .Q(
        \registers[10][2] ) );
  DFFRQX2M \registers_reg[10][1]  ( .D(n130), .CK(RF_CLK), .RN(n211), .Q(
        \registers[10][1] ) );
  DFFRQX2M \registers_reg[10][0]  ( .D(n129), .CK(RF_CLK), .RN(n211), .Q(
        \registers[10][0] ) );
  DFFRQX2M \registers_reg[6][7]  ( .D(n104), .CK(RF_CLK), .RN(n209), .Q(
        \registers[6][7] ) );
  DFFRQX2M \registers_reg[6][6]  ( .D(n103), .CK(RF_CLK), .RN(n209), .Q(
        \registers[6][6] ) );
  DFFRQX2M \registers_reg[6][5]  ( .D(n102), .CK(RF_CLK), .RN(n209), .Q(
        \registers[6][5] ) );
  DFFRQX2M \registers_reg[6][4]  ( .D(n101), .CK(RF_CLK), .RN(n209), .Q(
        \registers[6][4] ) );
  DFFRQX2M \registers_reg[6][3]  ( .D(n100), .CK(RF_CLK), .RN(n209), .Q(
        \registers[6][3] ) );
  DFFRQX2M \registers_reg[6][2]  ( .D(n99), .CK(RF_CLK), .RN(n209), .Q(
        \registers[6][2] ) );
  DFFRQX2M \registers_reg[6][1]  ( .D(n98), .CK(RF_CLK), .RN(n208), .Q(
        \registers[6][1] ) );
  DFFRQX2M \registers_reg[6][0]  ( .D(n97), .CK(RF_CLK), .RN(n208), .Q(
        \registers[6][0] ) );
  DFFRQX2M \registers_reg[2][7]  ( .D(n72), .CK(RF_CLK), .RN(n207), .Q(REG2[7]) );
  DFFRQX2M \registers_reg[12][7]  ( .D(n152), .CK(RF_CLK), .RN(n212), .Q(
        \registers[12][7] ) );
  DFFRQX2M \registers_reg[12][6]  ( .D(n151), .CK(RF_CLK), .RN(n212), .Q(
        \registers[12][6] ) );
  DFFRQX2M \registers_reg[12][5]  ( .D(n150), .CK(RF_CLK), .RN(n212), .Q(
        \registers[12][5] ) );
  DFFRQX2M \registers_reg[12][4]  ( .D(n149), .CK(RF_CLK), .RN(n212), .Q(
        \registers[12][4] ) );
  DFFRQX2M \registers_reg[12][3]  ( .D(n148), .CK(RF_CLK), .RN(n212), .Q(
        \registers[12][3] ) );
  DFFRQX2M \registers_reg[12][2]  ( .D(n147), .CK(RF_CLK), .RN(n212), .Q(
        \registers[12][2] ) );
  DFFRQX2M \registers_reg[12][1]  ( .D(n146), .CK(RF_CLK), .RN(n212), .Q(
        \registers[12][1] ) );
  DFFRQX2M \registers_reg[12][0]  ( .D(n145), .CK(RF_CLK), .RN(n212), .Q(
        \registers[12][0] ) );
  DFFRQX2M \registers_reg[8][7]  ( .D(n120), .CK(RF_CLK), .RN(n210), .Q(
        \registers[8][7] ) );
  DFFRQX2M \registers_reg[8][6]  ( .D(n119), .CK(RF_CLK), .RN(n210), .Q(
        \registers[8][6] ) );
  DFFRQX2M \registers_reg[8][5]  ( .D(n118), .CK(RF_CLK), .RN(n210), .Q(
        \registers[8][5] ) );
  DFFRQX2M \registers_reg[8][4]  ( .D(n117), .CK(RF_CLK), .RN(n210), .Q(
        \registers[8][4] ) );
  DFFRQX2M \registers_reg[8][3]  ( .D(n116), .CK(RF_CLK), .RN(n210), .Q(
        \registers[8][3] ) );
  DFFRQX2M \registers_reg[8][2]  ( .D(n115), .CK(RF_CLK), .RN(n210), .Q(
        \registers[8][2] ) );
  DFFRQX2M \registers_reg[8][1]  ( .D(n114), .CK(RF_CLK), .RN(n210), .Q(
        \registers[8][1] ) );
  DFFRQX2M \registers_reg[8][0]  ( .D(n113), .CK(RF_CLK), .RN(n210), .Q(
        \registers[8][0] ) );
  DFFRQX2M \registers_reg[4][7]  ( .D(n88), .CK(RF_CLK), .RN(n208), .Q(
        \registers[4][7] ) );
  DFFRQX2M \registers_reg[4][6]  ( .D(n87), .CK(RF_CLK), .RN(n208), .Q(
        \registers[4][6] ) );
  DFFRQX2M \registers_reg[4][5]  ( .D(n86), .CK(RF_CLK), .RN(n208), .Q(
        \registers[4][5] ) );
  DFFRQX2M \registers_reg[4][4]  ( .D(n85), .CK(RF_CLK), .RN(n208), .Q(
        \registers[4][4] ) );
  DFFRQX2M \registers_reg[4][3]  ( .D(n84), .CK(RF_CLK), .RN(n208), .Q(
        \registers[4][3] ) );
  DFFRQX2M \registers_reg[4][2]  ( .D(n83), .CK(RF_CLK), .RN(n207), .Q(
        \registers[4][2] ) );
  DFFRQX2M \registers_reg[4][1]  ( .D(n82), .CK(RF_CLK), .RN(n207), .Q(
        \registers[4][1] ) );
  DFFRQX2M \registers_reg[4][0]  ( .D(n81), .CK(RF_CLK), .RN(n207), .Q(
        \registers[4][0] ) );
  DFFRQX2M \registers_reg[2][0]  ( .D(n65), .CK(RF_CLK), .RN(n206), .Q(REG2[0]) );
  DFFRQX2M \registers_reg[2][1]  ( .D(n66), .CK(RF_CLK), .RN(n206), .Q(REG2[1]) );
  DFFSQX2M \registers_reg[3][3]  ( .D(n76), .CK(RF_CLK), .SN(n205), .Q(REG3[3]) );
  DFFRQX2M \registers_reg[3][2]  ( .D(n75), .CK(RF_CLK), .RN(n207), .Q(REG3[2]) );
  DFFRQX2M \registers_reg[3][0]  ( .D(n73), .CK(RF_CLK), .RN(n207), .Q(REG3[0]) );
  DFFRQX2M \registers_reg[3][1]  ( .D(n74), .CK(RF_CLK), .RN(n207), .Q(REG3[1]) );
  DFFSQX2M \registers_reg[2][3]  ( .D(n68), .CK(RF_CLK), .SN(n205), .Q(REG2[3]) );
  DFFRQX2M \registers_reg[2][6]  ( .D(n71), .CK(RF_CLK), .RN(n207), .Q(REG2[6]) );
  DFFRQX2M \registers_reg[2][5]  ( .D(n70), .CK(RF_CLK), .RN(n207), .Q(REG2[5]) );
  DFFSQX2M \registers_reg[2][4]  ( .D(n69), .CK(RF_CLK), .SN(n205), .Q(REG2[4]) );
  DFFRQX2M \registers_reg[0][1]  ( .D(n50), .CK(RF_CLK), .RN(n205), .Q(REG0[1]) );
  DFFRQX2M \registers_reg[0][0]  ( .D(n49), .CK(RF_CLK), .RN(n205), .Q(REG0[0]) );
  DFFRQX2M \registers_reg[0][2]  ( .D(n51), .CK(RF_CLK), .RN(n206), .Q(REG0[2]) );
  DFFRQX2M \registers_reg[0][3]  ( .D(n52), .CK(RF_CLK), .RN(n206), .Q(REG0[3]) );
  DFFRQX2M \registers_reg[0][4]  ( .D(n53), .CK(RF_CLK), .RN(n206), .Q(REG0[4]) );
  DFFRQX2M \registers_reg[0][5]  ( .D(n54), .CK(RF_CLK), .RN(n206), .Q(REG0[5]) );
  DFFRQX2M \registers_reg[0][7]  ( .D(n56), .CK(RF_CLK), .RN(n206), .Q(REG0[7]) );
  DFFRQX2M \registers_reg[0][6]  ( .D(n55), .CK(RF_CLK), .RN(n207), .Q(REG0[6]) );
  DFFRQX2M \registers_reg[1][6]  ( .D(n63), .CK(RF_CLK), .RN(n206), .Q(REG1[6]) );
  DFFRQX2M \registers_reg[1][7]  ( .D(n64), .CK(RF_CLK), .RN(n206), .Q(REG1[7]) );
  DFFRQX2M \registers_reg[1][5]  ( .D(n62), .CK(RF_CLK), .RN(n207), .Q(REG1[5]) );
  DFFRQX2M \registers_reg[1][4]  ( .D(n61), .CK(RF_CLK), .RN(n206), .Q(REG1[4]) );
  DFFRQX2M \registers_reg[1][1]  ( .D(n58), .CK(RF_CLK), .RN(n206), .Q(REG1[1]) );
  DFFRQX2M \registers_reg[1][3]  ( .D(n60), .CK(RF_CLK), .RN(n206), .Q(REG1[3]) );
  DFFRQX2M \registers_reg[1][2]  ( .D(n59), .CK(RF_CLK), .RN(n206), .Q(REG1[2]) );
  DFFRQX2M \registers_reg[1][0]  ( .D(n57), .CK(RF_CLK), .RN(n206), .Q(REG1[0]) );
  NOR2X2M U3 ( .A(n204), .B(N13), .Y(n19) );
  NOR2X2M U4 ( .A(n199), .B(N13), .Y(n14) );
  INVX2M U5 ( .A(n200), .Y(n201) );
  INVX2M U6 ( .A(n198), .Y(n199) );
  INVX2M U7 ( .A(n200), .Y(n202) );
  BUFX2M U8 ( .A(n203), .Y(n200) );
  BUFX2M U9 ( .A(n204), .Y(n198) );
  NAND2X2M U10 ( .A(n19), .B(n15), .Y(n18) );
  NAND2X2M U11 ( .A(n19), .B(n17), .Y(n20) );
  NAND2X2M U12 ( .A(n22), .B(n15), .Y(n21) );
  NAND2X2M U13 ( .A(n22), .B(n17), .Y(n23) );
  NAND2X2M U14 ( .A(n25), .B(n15), .Y(n24) );
  NAND2X2M U15 ( .A(n25), .B(n17), .Y(n27) );
  NAND2X2M U16 ( .A(n30), .B(n22), .Y(n35) );
  NAND2X2M U17 ( .A(n32), .B(n22), .Y(n36) );
  NAND2X2M U18 ( .A(n30), .B(n25), .Y(n37) );
  NAND2X2M U19 ( .A(n32), .B(n25), .Y(n39) );
  NAND2X2M U20 ( .A(n17), .B(n14), .Y(n16) );
  NAND2X2M U21 ( .A(n30), .B(n14), .Y(n29) );
  NAND2X2M U22 ( .A(n32), .B(n14), .Y(n31) );
  NAND2X2M U23 ( .A(n30), .B(n19), .Y(n33) );
  NAND2X2M U24 ( .A(n32), .B(n19), .Y(n34) );
  NAND2X2M U25 ( .A(n14), .B(n15), .Y(n13) );
  AND2X2M U26 ( .A(n26), .B(N11), .Y(n17) );
  AND2X2M U27 ( .A(n38), .B(N11), .Y(n32) );
  NOR2BX2M U28 ( .AN(n28), .B(N14), .Y(n26) );
  AND2X2M U29 ( .A(N13), .B(n204), .Y(n22) );
  AND2X2M U30 ( .A(N13), .B(n199), .Y(n25) );
  AND2X2M U31 ( .A(n26), .B(n203), .Y(n15) );
  AND2X2M U32 ( .A(n38), .B(n203), .Y(n30) );
  AND2X2M U33 ( .A(N14), .B(n28), .Y(n38) );
  BUFX2M U34 ( .A(n219), .Y(n206) );
  BUFX2M U35 ( .A(n218), .Y(n207) );
  BUFX2M U36 ( .A(n218), .Y(n208) );
  BUFX2M U37 ( .A(n217), .Y(n209) );
  BUFX2M U38 ( .A(n217), .Y(n210) );
  BUFX2M U39 ( .A(n216), .Y(n211) );
  BUFX2M U40 ( .A(n216), .Y(n212) );
  BUFX2M U41 ( .A(n215), .Y(n213) );
  BUFX2M U42 ( .A(n219), .Y(n205) );
  BUFX2M U43 ( .A(n215), .Y(n214) );
  INVX2M U44 ( .A(N11), .Y(n203) );
  NOR4X1M U45 ( .A(RF_Addr[5]), .B(RF_Addr[4]), .C(n228), .D(n40), .Y(n28) );
  OR3X2M U46 ( .A(RF_Rd_en), .B(RF_Addr[7]), .C(RF_Addr[6]), .Y(n40) );
  INVX2M U47 ( .A(N12), .Y(n204) );
  INVX2M U48 ( .A(RF_Wr_en), .Y(n228) );
  INVX2M U49 ( .A(RF_WrData[0]), .Y(n227) );
  INVX2M U50 ( .A(RF_WrData[1]), .Y(n226) );
  INVX2M U51 ( .A(RF_WrData[2]), .Y(n225) );
  INVX2M U52 ( .A(RF_WrData[3]), .Y(n224) );
  INVX2M U53 ( .A(RF_WrData[4]), .Y(n223) );
  INVX2M U54 ( .A(RF_WrData[5]), .Y(n222) );
  INVX2M U55 ( .A(RF_WrData[6]), .Y(n221) );
  INVX2M U56 ( .A(RF_WrData[7]), .Y(n220) );
  NOR2X2M U57 ( .A(n228), .B(RF_Rd_en), .Y(n12) );
  AND2X2M U58 ( .A(RF_Rd_en), .B(n228), .Y(N61) );
  BUFX2M U59 ( .A(RF_RST), .Y(n218) );
  BUFX2M U60 ( .A(RF_RST), .Y(n217) );
  BUFX2M U61 ( .A(RF_RST), .Y(n216) );
  BUFX2M U62 ( .A(RF_RST), .Y(n215) );
  BUFX2M U63 ( .A(RF_RST), .Y(n219) );
  MX4X1M U64 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n201), 
        .S1(n199), .Y(n8) );
  MX4X1M U65 ( .A(\registers[4][0] ), .B(\registers[5][0] ), .C(
        \registers[6][0] ), .D(\registers[7][0] ), .S0(N11), .S1(n199), .Y(n3)
         );
  MX4X1M U66 ( .A(\registers[4][1] ), .B(\registers[5][1] ), .C(
        \registers[6][1] ), .D(\registers[7][1] ), .S0(n201), .S1(n199), .Y(n7) );
  MX4X1M U67 ( .A(\registers[4][2] ), .B(\registers[5][2] ), .C(
        \registers[6][2] ), .D(\registers[7][2] ), .S0(n201), .S1(N12), .Y(n11) );
  MX4X1M U68 ( .A(\registers[4][3] ), .B(\registers[5][3] ), .C(
        \registers[6][3] ), .D(\registers[7][3] ), .S0(n201), .S1(N12), .Y(
        n180) );
  MX4X1M U69 ( .A(\registers[4][4] ), .B(\registers[5][4] ), .C(
        \registers[6][4] ), .D(\registers[7][4] ), .S0(n201), .S1(N12), .Y(
        n184) );
  MX4X1M U70 ( .A(\registers[4][5] ), .B(\registers[5][5] ), .C(
        \registers[6][5] ), .D(\registers[7][5] ), .S0(n202), .S1(N12), .Y(
        n188) );
  MX4X1M U71 ( .A(\registers[4][6] ), .B(\registers[5][6] ), .C(
        \registers[6][6] ), .D(\registers[7][6] ), .S0(n202), .S1(N12), .Y(
        n192) );
  MX4X1M U72 ( .A(\registers[4][7] ), .B(\registers[5][7] ), .C(
        \registers[6][7] ), .D(\registers[7][7] ), .S0(n202), .S1(N12), .Y(
        n196) );
  MX4X1M U73 ( .A(\registers[12][0] ), .B(\registers[13][0] ), .C(
        \registers[14][0] ), .D(\registers[15][0] ), .S0(n202), .S1(n199), .Y(
        n1) );
  MX4X1M U74 ( .A(\registers[12][2] ), .B(\registers[13][2] ), .C(
        \registers[14][2] ), .D(\registers[15][2] ), .S0(n201), .S1(n199), .Y(
        n9) );
  MX4X1M U75 ( .A(\registers[12][3] ), .B(\registers[13][3] ), .C(
        \registers[14][3] ), .D(\registers[15][3] ), .S0(n201), .S1(n199), .Y(
        n178) );
  MX4X1M U76 ( .A(\registers[12][4] ), .B(\registers[13][4] ), .C(
        \registers[14][4] ), .D(\registers[15][4] ), .S0(n201), .S1(N12), .Y(
        n182) );
  MX4X1M U77 ( .A(\registers[12][5] ), .B(\registers[13][5] ), .C(
        \registers[14][5] ), .D(\registers[15][5] ), .S0(n202), .S1(n199), .Y(
        n186) );
  MX4X1M U78 ( .A(\registers[12][6] ), .B(\registers[13][6] ), .C(
        \registers[14][6] ), .D(\registers[15][6] ), .S0(n202), .S1(n199), .Y(
        n190) );
  MX4X1M U79 ( .A(\registers[12][7] ), .B(\registers[13][7] ), .C(
        \registers[14][7] ), .D(\registers[15][7] ), .S0(n202), .S1(n199), .Y(
        n194) );
  AO22X1M U80 ( .A0(RF_RdData[0]), .A1(n12), .B0(N43), .B1(N61), .Y(n41) );
  MX4X1M U81 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U82 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n199), .Y(n4) );
  MX4X1M U83 ( .A(\registers[8][0] ), .B(\registers[9][0] ), .C(
        \registers[10][0] ), .D(\registers[11][0] ), .S0(N11), .S1(n199), .Y(
        n2) );
  AO22X1M U84 ( .A0(RF_RdData[1]), .A1(n12), .B0(N42), .B1(N61), .Y(n42) );
  MX4X1M U85 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U86 ( .A(\registers[8][1] ), .B(\registers[9][1] ), .C(
        \registers[10][1] ), .D(\registers[11][1] ), .S0(N11), .S1(n199), .Y(
        n6) );
  MX4X1M U87 ( .A(\registers[12][1] ), .B(\registers[13][1] ), .C(
        \registers[14][1] ), .D(\registers[15][1] ), .S0(n201), .S1(n199), .Y(
        n5) );
  AO22X1M U88 ( .A0(RF_RdData[2]), .A1(n12), .B0(N41), .B1(N61), .Y(n43) );
  MX4X1M U89 ( .A(n177), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N41)
         );
  MX4X1M U90 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n201), 
        .S1(N12), .Y(n177) );
  MX4X1M U91 ( .A(\registers[8][2] ), .B(\registers[9][2] ), .C(
        \registers[10][2] ), .D(\registers[11][2] ), .S0(n201), .S1(N12), .Y(
        n10) );
  AO22X1M U92 ( .A0(RF_RdData[3]), .A1(n12), .B0(N40), .B1(N61), .Y(n44) );
  MX4X1M U93 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), .Y(
        N40) );
  MX4X1M U94 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n201), 
        .S1(N12), .Y(n181) );
  MX4X1M U95 ( .A(\registers[8][3] ), .B(\registers[9][3] ), .C(
        \registers[10][3] ), .D(\registers[11][3] ), .S0(n201), .S1(N12), .Y(
        n179) );
  AO22X1M U96 ( .A0(RF_RdData[4]), .A1(n12), .B0(N39), .B1(N61), .Y(n45) );
  MX4X1M U97 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), .Y(
        N39) );
  MX4X1M U98 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n202), 
        .S1(N12), .Y(n185) );
  MX4X1M U99 ( .A(\registers[8][4] ), .B(\registers[9][4] ), .C(
        \registers[10][4] ), .D(\registers[11][4] ), .S0(n201), .S1(N12), .Y(
        n183) );
  AO22X1M U100 ( .A0(RF_RdData[5]), .A1(n12), .B0(N38), .B1(N61), .Y(n46) );
  MX4X1M U101 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U102 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n202), 
        .S1(N12), .Y(n189) );
  MX4X1M U103 ( .A(\registers[8][5] ), .B(\registers[9][5] ), .C(
        \registers[10][5] ), .D(\registers[11][5] ), .S0(n202), .S1(N12), .Y(
        n187) );
  AO22X1M U104 ( .A0(RF_RdData[6]), .A1(n12), .B0(N37), .B1(N61), .Y(n47) );
  MX4X1M U105 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U106 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n202), 
        .S1(N12), .Y(n193) );
  MX4X1M U107 ( .A(\registers[8][6] ), .B(\registers[9][6] ), .C(
        \registers[10][6] ), .D(\registers[11][6] ), .S0(n202), .S1(N12), .Y(
        n191) );
  AO22X1M U108 ( .A0(RF_RdData[7]), .A1(n12), .B0(N36), .B1(N61), .Y(n48) );
  MX4X1M U109 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U110 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n202), 
        .S1(N12), .Y(n197) );
  MX4X1M U111 ( .A(\registers[8][7] ), .B(\registers[9][7] ), .C(
        \registers[10][7] ), .D(\registers[11][7] ), .S0(n202), .S1(N12), .Y(
        n195) );
  OAI2BB2X1M U112 ( .B0(n13), .B1(n227), .A0N(REG0[0]), .A1N(n13), .Y(n49) );
  OAI2BB2X1M U113 ( .B0(n13), .B1(n226), .A0N(REG0[1]), .A1N(n13), .Y(n50) );
  OAI2BB2X1M U114 ( .B0(n13), .B1(n225), .A0N(REG0[2]), .A1N(n13), .Y(n51) );
  OAI2BB2X1M U115 ( .B0(n13), .B1(n224), .A0N(REG0[3]), .A1N(n13), .Y(n52) );
  OAI2BB2X1M U116 ( .B0(n13), .B1(n223), .A0N(REG0[4]), .A1N(n13), .Y(n53) );
  OAI2BB2X1M U117 ( .B0(n13), .B1(n222), .A0N(REG0[5]), .A1N(n13), .Y(n54) );
  OAI2BB2X1M U118 ( .B0(n13), .B1(n221), .A0N(REG0[6]), .A1N(n13), .Y(n55) );
  OAI2BB2X1M U119 ( .B0(n13), .B1(n220), .A0N(REG0[7]), .A1N(n13), .Y(n56) );
  OAI2BB2X1M U120 ( .B0(n227), .B1(n18), .A0N(REG2[0]), .A1N(n18), .Y(n65) );
  OAI2BB2X1M U121 ( .B0(n226), .B1(n18), .A0N(REG2[1]), .A1N(n18), .Y(n66) );
  OAI2BB2X1M U122 ( .B0(n222), .B1(n18), .A0N(REG2[5]), .A1N(n18), .Y(n70) );
  OAI2BB2X1M U123 ( .B0(n221), .B1(n18), .A0N(REG2[6]), .A1N(n18), .Y(n71) );
  OAI2BB2X1M U124 ( .B0(n220), .B1(n18), .A0N(REG2[7]), .A1N(n18), .Y(n72) );
  OAI2BB2X1M U125 ( .B0(n227), .B1(n20), .A0N(REG3[0]), .A1N(n20), .Y(n73) );
  OAI2BB2X1M U126 ( .B0(n226), .B1(n20), .A0N(REG3[1]), .A1N(n20), .Y(n74) );
  OAI2BB2X1M U127 ( .B0(n225), .B1(n20), .A0N(REG3[2]), .A1N(n20), .Y(n75) );
  OAI2BB2X1M U128 ( .B0(n223), .B1(n20), .A0N(REG3[4]), .A1N(n20), .Y(n77) );
  OAI2BB2X1M U129 ( .B0(n222), .B1(n20), .A0N(REG3[5]), .A1N(n20), .Y(n78) );
  OAI2BB2X1M U130 ( .B0(n221), .B1(n20), .A0N(REG3[6]), .A1N(n20), .Y(n79) );
  OAI2BB2X1M U131 ( .B0(n220), .B1(n20), .A0N(REG3[7]), .A1N(n20), .Y(n80) );
  OAI2BB2X1M U132 ( .B0(n227), .B1(n16), .A0N(REG1[0]), .A1N(n16), .Y(n57) );
  OAI2BB2X1M U133 ( .B0(n226), .B1(n16), .A0N(REG1[1]), .A1N(n16), .Y(n58) );
  OAI2BB2X1M U134 ( .B0(n225), .B1(n16), .A0N(REG1[2]), .A1N(n16), .Y(n59) );
  OAI2BB2X1M U135 ( .B0(n224), .B1(n16), .A0N(REG1[3]), .A1N(n16), .Y(n60) );
  OAI2BB2X1M U136 ( .B0(n223), .B1(n16), .A0N(REG1[4]), .A1N(n16), .Y(n61) );
  OAI2BB2X1M U137 ( .B0(n222), .B1(n16), .A0N(REG1[5]), .A1N(n16), .Y(n62) );
  OAI2BB2X1M U138 ( .B0(n221), .B1(n16), .A0N(REG1[6]), .A1N(n16), .Y(n63) );
  OAI2BB2X1M U139 ( .B0(n220), .B1(n16), .A0N(REG1[7]), .A1N(n16), .Y(n64) );
  OAI2BB2X1M U140 ( .B0(n227), .B1(n29), .A0N(\registers[8][0] ), .A1N(n29), 
        .Y(n113) );
  OAI2BB2X1M U141 ( .B0(n226), .B1(n29), .A0N(\registers[8][1] ), .A1N(n29), 
        .Y(n114) );
  OAI2BB2X1M U142 ( .B0(n225), .B1(n29), .A0N(\registers[8][2] ), .A1N(n29), 
        .Y(n115) );
  OAI2BB2X1M U143 ( .B0(n224), .B1(n29), .A0N(\registers[8][3] ), .A1N(n29), 
        .Y(n116) );
  OAI2BB2X1M U144 ( .B0(n223), .B1(n29), .A0N(\registers[8][4] ), .A1N(n29), 
        .Y(n117) );
  OAI2BB2X1M U145 ( .B0(n222), .B1(n29), .A0N(\registers[8][5] ), .A1N(n29), 
        .Y(n118) );
  OAI2BB2X1M U146 ( .B0(n221), .B1(n29), .A0N(\registers[8][6] ), .A1N(n29), 
        .Y(n119) );
  OAI2BB2X1M U147 ( .B0(n220), .B1(n29), .A0N(\registers[8][7] ), .A1N(n29), 
        .Y(n120) );
  OAI2BB2X1M U148 ( .B0(n227), .B1(n31), .A0N(\registers[9][0] ), .A1N(n31), 
        .Y(n121) );
  OAI2BB2X1M U149 ( .B0(n226), .B1(n31), .A0N(\registers[9][1] ), .A1N(n31), 
        .Y(n122) );
  OAI2BB2X1M U150 ( .B0(n225), .B1(n31), .A0N(\registers[9][2] ), .A1N(n31), 
        .Y(n123) );
  OAI2BB2X1M U151 ( .B0(n224), .B1(n31), .A0N(\registers[9][3] ), .A1N(n31), 
        .Y(n124) );
  OAI2BB2X1M U152 ( .B0(n223), .B1(n31), .A0N(\registers[9][4] ), .A1N(n31), 
        .Y(n125) );
  OAI2BB2X1M U153 ( .B0(n222), .B1(n31), .A0N(\registers[9][5] ), .A1N(n31), 
        .Y(n126) );
  OAI2BB2X1M U154 ( .B0(n221), .B1(n31), .A0N(\registers[9][6] ), .A1N(n31), 
        .Y(n127) );
  OAI2BB2X1M U155 ( .B0(n220), .B1(n31), .A0N(\registers[9][7] ), .A1N(n31), 
        .Y(n128) );
  OAI2BB2X1M U156 ( .B0(n227), .B1(n33), .A0N(\registers[10][0] ), .A1N(n33), 
        .Y(n129) );
  OAI2BB2X1M U157 ( .B0(n226), .B1(n33), .A0N(\registers[10][1] ), .A1N(n33), 
        .Y(n130) );
  OAI2BB2X1M U158 ( .B0(n225), .B1(n33), .A0N(\registers[10][2] ), .A1N(n33), 
        .Y(n131) );
  OAI2BB2X1M U159 ( .B0(n224), .B1(n33), .A0N(\registers[10][3] ), .A1N(n33), 
        .Y(n132) );
  OAI2BB2X1M U160 ( .B0(n223), .B1(n33), .A0N(\registers[10][4] ), .A1N(n33), 
        .Y(n133) );
  OAI2BB2X1M U161 ( .B0(n222), .B1(n33), .A0N(\registers[10][5] ), .A1N(n33), 
        .Y(n134) );
  OAI2BB2X1M U162 ( .B0(n221), .B1(n33), .A0N(\registers[10][6] ), .A1N(n33), 
        .Y(n135) );
  OAI2BB2X1M U163 ( .B0(n220), .B1(n33), .A0N(\registers[10][7] ), .A1N(n33), 
        .Y(n136) );
  OAI2BB2X1M U164 ( .B0(n227), .B1(n34), .A0N(\registers[11][0] ), .A1N(n34), 
        .Y(n137) );
  OAI2BB2X1M U165 ( .B0(n226), .B1(n34), .A0N(\registers[11][1] ), .A1N(n34), 
        .Y(n138) );
  OAI2BB2X1M U166 ( .B0(n225), .B1(n34), .A0N(\registers[11][2] ), .A1N(n34), 
        .Y(n139) );
  OAI2BB2X1M U167 ( .B0(n224), .B1(n34), .A0N(\registers[11][3] ), .A1N(n34), 
        .Y(n140) );
  OAI2BB2X1M U168 ( .B0(n223), .B1(n34), .A0N(\registers[11][4] ), .A1N(n34), 
        .Y(n141) );
  OAI2BB2X1M U169 ( .B0(n222), .B1(n34), .A0N(\registers[11][5] ), .A1N(n34), 
        .Y(n142) );
  OAI2BB2X1M U170 ( .B0(n221), .B1(n34), .A0N(\registers[11][6] ), .A1N(n34), 
        .Y(n143) );
  OAI2BB2X1M U171 ( .B0(n220), .B1(n34), .A0N(\registers[11][7] ), .A1N(n34), 
        .Y(n144) );
  OAI2BB2X1M U172 ( .B0(n227), .B1(n21), .A0N(\registers[4][0] ), .A1N(n21), 
        .Y(n81) );
  OAI2BB2X1M U173 ( .B0(n226), .B1(n21), .A0N(\registers[4][1] ), .A1N(n21), 
        .Y(n82) );
  OAI2BB2X1M U174 ( .B0(n225), .B1(n21), .A0N(\registers[4][2] ), .A1N(n21), 
        .Y(n83) );
  OAI2BB2X1M U175 ( .B0(n224), .B1(n21), .A0N(\registers[4][3] ), .A1N(n21), 
        .Y(n84) );
  OAI2BB2X1M U176 ( .B0(n223), .B1(n21), .A0N(\registers[4][4] ), .A1N(n21), 
        .Y(n85) );
  OAI2BB2X1M U177 ( .B0(n222), .B1(n21), .A0N(\registers[4][5] ), .A1N(n21), 
        .Y(n86) );
  OAI2BB2X1M U178 ( .B0(n221), .B1(n21), .A0N(\registers[4][6] ), .A1N(n21), 
        .Y(n87) );
  OAI2BB2X1M U179 ( .B0(n220), .B1(n21), .A0N(\registers[4][7] ), .A1N(n21), 
        .Y(n88) );
  OAI2BB2X1M U180 ( .B0(n227), .B1(n23), .A0N(\registers[5][0] ), .A1N(n23), 
        .Y(n89) );
  OAI2BB2X1M U181 ( .B0(n226), .B1(n23), .A0N(\registers[5][1] ), .A1N(n23), 
        .Y(n90) );
  OAI2BB2X1M U182 ( .B0(n225), .B1(n23), .A0N(\registers[5][2] ), .A1N(n23), 
        .Y(n91) );
  OAI2BB2X1M U183 ( .B0(n224), .B1(n23), .A0N(\registers[5][3] ), .A1N(n23), 
        .Y(n92) );
  OAI2BB2X1M U184 ( .B0(n223), .B1(n23), .A0N(\registers[5][4] ), .A1N(n23), 
        .Y(n93) );
  OAI2BB2X1M U185 ( .B0(n222), .B1(n23), .A0N(\registers[5][5] ), .A1N(n23), 
        .Y(n94) );
  OAI2BB2X1M U186 ( .B0(n221), .B1(n23), .A0N(\registers[5][6] ), .A1N(n23), 
        .Y(n95) );
  OAI2BB2X1M U187 ( .B0(n220), .B1(n23), .A0N(\registers[5][7] ), .A1N(n23), 
        .Y(n96) );
  OAI2BB2X1M U188 ( .B0(n227), .B1(n24), .A0N(\registers[6][0] ), .A1N(n24), 
        .Y(n97) );
  OAI2BB2X1M U189 ( .B0(n226), .B1(n24), .A0N(\registers[6][1] ), .A1N(n24), 
        .Y(n98) );
  OAI2BB2X1M U190 ( .B0(n225), .B1(n24), .A0N(\registers[6][2] ), .A1N(n24), 
        .Y(n99) );
  OAI2BB2X1M U191 ( .B0(n224), .B1(n24), .A0N(\registers[6][3] ), .A1N(n24), 
        .Y(n100) );
  OAI2BB2X1M U192 ( .B0(n223), .B1(n24), .A0N(\registers[6][4] ), .A1N(n24), 
        .Y(n101) );
  OAI2BB2X1M U193 ( .B0(n222), .B1(n24), .A0N(\registers[6][5] ), .A1N(n24), 
        .Y(n102) );
  OAI2BB2X1M U194 ( .B0(n221), .B1(n24), .A0N(\registers[6][6] ), .A1N(n24), 
        .Y(n103) );
  OAI2BB2X1M U195 ( .B0(n220), .B1(n24), .A0N(\registers[6][7] ), .A1N(n24), 
        .Y(n104) );
  OAI2BB2X1M U196 ( .B0(n227), .B1(n27), .A0N(\registers[7][0] ), .A1N(n27), 
        .Y(n105) );
  OAI2BB2X1M U197 ( .B0(n226), .B1(n27), .A0N(\registers[7][1] ), .A1N(n27), 
        .Y(n106) );
  OAI2BB2X1M U198 ( .B0(n225), .B1(n27), .A0N(\registers[7][2] ), .A1N(n27), 
        .Y(n107) );
  OAI2BB2X1M U199 ( .B0(n224), .B1(n27), .A0N(\registers[7][3] ), .A1N(n27), 
        .Y(n108) );
  OAI2BB2X1M U200 ( .B0(n223), .B1(n27), .A0N(\registers[7][4] ), .A1N(n27), 
        .Y(n109) );
  OAI2BB2X1M U201 ( .B0(n222), .B1(n27), .A0N(\registers[7][5] ), .A1N(n27), 
        .Y(n110) );
  OAI2BB2X1M U202 ( .B0(n221), .B1(n27), .A0N(\registers[7][6] ), .A1N(n27), 
        .Y(n111) );
  OAI2BB2X1M U203 ( .B0(n220), .B1(n27), .A0N(\registers[7][7] ), .A1N(n27), 
        .Y(n112) );
  OAI2BB2X1M U204 ( .B0(n227), .B1(n35), .A0N(\registers[12][0] ), .A1N(n35), 
        .Y(n145) );
  OAI2BB2X1M U205 ( .B0(n226), .B1(n35), .A0N(\registers[12][1] ), .A1N(n35), 
        .Y(n146) );
  OAI2BB2X1M U206 ( .B0(n225), .B1(n35), .A0N(\registers[12][2] ), .A1N(n35), 
        .Y(n147) );
  OAI2BB2X1M U207 ( .B0(n224), .B1(n35), .A0N(\registers[12][3] ), .A1N(n35), 
        .Y(n148) );
  OAI2BB2X1M U208 ( .B0(n223), .B1(n35), .A0N(\registers[12][4] ), .A1N(n35), 
        .Y(n149) );
  OAI2BB2X1M U209 ( .B0(n222), .B1(n35), .A0N(\registers[12][5] ), .A1N(n35), 
        .Y(n150) );
  OAI2BB2X1M U210 ( .B0(n221), .B1(n35), .A0N(\registers[12][6] ), .A1N(n35), 
        .Y(n151) );
  OAI2BB2X1M U211 ( .B0(n220), .B1(n35), .A0N(\registers[12][7] ), .A1N(n35), 
        .Y(n152) );
  OAI2BB2X1M U212 ( .B0(n227), .B1(n36), .A0N(\registers[13][0] ), .A1N(n36), 
        .Y(n153) );
  OAI2BB2X1M U213 ( .B0(n226), .B1(n36), .A0N(\registers[13][1] ), .A1N(n36), 
        .Y(n154) );
  OAI2BB2X1M U214 ( .B0(n225), .B1(n36), .A0N(\registers[13][2] ), .A1N(n36), 
        .Y(n155) );
  OAI2BB2X1M U215 ( .B0(n224), .B1(n36), .A0N(\registers[13][3] ), .A1N(n36), 
        .Y(n156) );
  OAI2BB2X1M U216 ( .B0(n223), .B1(n36), .A0N(\registers[13][4] ), .A1N(n36), 
        .Y(n157) );
  OAI2BB2X1M U217 ( .B0(n222), .B1(n36), .A0N(\registers[13][5] ), .A1N(n36), 
        .Y(n158) );
  OAI2BB2X1M U218 ( .B0(n221), .B1(n36), .A0N(\registers[13][6] ), .A1N(n36), 
        .Y(n159) );
  OAI2BB2X1M U219 ( .B0(n220), .B1(n36), .A0N(\registers[13][7] ), .A1N(n36), 
        .Y(n160) );
  OAI2BB2X1M U220 ( .B0(n227), .B1(n37), .A0N(\registers[14][0] ), .A1N(n37), 
        .Y(n161) );
  OAI2BB2X1M U221 ( .B0(n226), .B1(n37), .A0N(\registers[14][1] ), .A1N(n37), 
        .Y(n162) );
  OAI2BB2X1M U222 ( .B0(n225), .B1(n37), .A0N(\registers[14][2] ), .A1N(n37), 
        .Y(n163) );
  OAI2BB2X1M U223 ( .B0(n224), .B1(n37), .A0N(\registers[14][3] ), .A1N(n37), 
        .Y(n164) );
  OAI2BB2X1M U224 ( .B0(n223), .B1(n37), .A0N(\registers[14][4] ), .A1N(n37), 
        .Y(n165) );
  OAI2BB2X1M U225 ( .B0(n222), .B1(n37), .A0N(\registers[14][5] ), .A1N(n37), 
        .Y(n166) );
  OAI2BB2X1M U226 ( .B0(n221), .B1(n37), .A0N(\registers[14][6] ), .A1N(n37), 
        .Y(n167) );
  OAI2BB2X1M U227 ( .B0(n220), .B1(n37), .A0N(\registers[14][7] ), .A1N(n37), 
        .Y(n168) );
  OAI2BB2X1M U228 ( .B0(n227), .B1(n39), .A0N(\registers[15][0] ), .A1N(n39), 
        .Y(n169) );
  OAI2BB2X1M U229 ( .B0(n226), .B1(n39), .A0N(\registers[15][1] ), .A1N(n39), 
        .Y(n170) );
  OAI2BB2X1M U230 ( .B0(n225), .B1(n39), .A0N(\registers[15][2] ), .A1N(n39), 
        .Y(n171) );
  OAI2BB2X1M U231 ( .B0(n224), .B1(n39), .A0N(\registers[15][3] ), .A1N(n39), 
        .Y(n172) );
  OAI2BB2X1M U232 ( .B0(n223), .B1(n39), .A0N(\registers[15][4] ), .A1N(n39), 
        .Y(n173) );
  OAI2BB2X1M U233 ( .B0(n222), .B1(n39), .A0N(\registers[15][5] ), .A1N(n39), 
        .Y(n174) );
  OAI2BB2X1M U234 ( .B0(n221), .B1(n39), .A0N(\registers[15][6] ), .A1N(n39), 
        .Y(n175) );
  OAI2BB2X1M U235 ( .B0(n220), .B1(n39), .A0N(\registers[15][7] ), .A1N(n39), 
        .Y(n176) );
  OAI2BB2X1M U236 ( .B0(n225), .B1(n18), .A0N(REG2[2]), .A1N(n18), .Y(n67) );
  OAI2BB2X1M U237 ( .B0(n224), .B1(n18), .A0N(REG2[3]), .A1N(n18), .Y(n68) );
  OAI2BB2X1M U238 ( .B0(n223), .B1(n18), .A0N(REG2[4]), .A1N(n18), .Y(n69) );
  OAI2BB2X1M U239 ( .B0(n224), .B1(n20), .A0N(REG3[3]), .A1N(n20), .Y(n76) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n19), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n19), .Y(n5) );
  NAND2X2M U15 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n8) );
  INVX2M U17 ( .A(n19), .Y(n7) );
  NAND2X2M U18 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U19 ( .A(a[2]), .Y(n9) );
  NAND2X2M U20 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U21 ( .A(a[1]), .Y(n10) );
  NAND2X2M U22 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U23 ( .A(a[0]), .Y(n11) );
  NAND2X2M U24 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U25 ( .A(a[6]), .Y(n2) );
  INVX2M U26 ( .A(n19), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n13) );
  XNOR2X2M U28 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U29 ( .A(b[1]), .Y(n18) );
  INVX2M U30 ( .A(b[2]), .Y(n17) );
  INVX2M U31 ( .A(b[3]), .Y(n16) );
  INVX2M U32 ( .A(b[4]), .Y(n15) );
  INVX2M U33 ( .A(b[5]), .Y(n14) );
  INVX2M U34 ( .A(b[7]), .Y(n12) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  INVX2M U2 ( .A(A[0]), .Y(n1) );
  XNOR2X2M U3 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U4 ( .A(B[0]), .Y(n9) );
  INVX2M U5 ( .A(B[2]), .Y(n7) );
  INVX2M U6 ( .A(B[3]), .Y(n6) );
  INVX2M U7 ( .A(B[4]), .Y(n5) );
  INVX2M U8 ( .A(B[5]), .Y(n4) );
  INVX2M U9 ( .A(B[1]), .Y(n8) );
  NAND2X2M U10 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  INVX2M U4 ( .A(A[6]), .Y(n9) );
  XNOR2X2M U5 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U6 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U7 ( .A(B[7]), .Y(n8) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n12, n11, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n7), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n6), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n5), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U14 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U15 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U16 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U17 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U23 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U24 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U25 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U32 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U39 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(A[3]), .Y(n36) );
  INVX2M U42 ( .A(A[4]), .Y(n35) );
  INVX2M U43 ( .A(A[6]), .Y(n33) );
  INVX2M U44 ( .A(A[7]), .Y(n32) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[5]), .Y(n26) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[7]), .Y(n24) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU ( A, B, ALU_en, ALU_CLK, ALU_RST, ALU_FUN, ALU_OUT, ALU_Valid );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input ALU_en, ALU_CLK, ALU_RST;
  output ALU_Valid;
  wire   N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N126, N127, N128, N153, N154, N155, n10, n11, n12,
         n13, n14, n16, n17, n19, n20, n21, n22, n24, n28, n30, n31, n32, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n50,
         n51, n52, n53, n54, n56, n58, n59, n60, n61, n62, n64, n66, n67, n68,
         n69, n70, n72, n74, n75, n76, n77, n78, n80, n82, n83, n84, n85, n86,
         n88, n90, n92, n93, n94, n95, n97, n99, n100, n101, n104, n105, n106,
         n107, n108, n109, n110, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n135, n3, n4,
         n5, n6, n7, n8, n9, n15, n18, n23, n25, n26, n27, n29, n33, n48, n49,
         n55, n57, n63, n65, n71, n73, n79, n81, n87, n89, n91, n96, n98, n102,
         n103, n111, n128, n129, n130, n131, n132, n133, n134, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167;

  ALU_DW_div_uns_0 div_48 ( .a({n25, n23, n18, n15, n9, n8, n7, n6}), .b({B[7], 
        n5, B[5:0]}), .quotient({N128, N127, N126, N125, N124, N123, N122, 
        N121}) );
  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n25, n23, n18, n15, n9, n8, n7, n6}), .B({
        1'b0, B[7], n5, B[5:0]}), .CI(1'b0), .DIFF({N104, N103, N102, N101, 
        N100, N99, N98, N97, N96}) );
  ALU_DW01_add_0 add_45 ( .A({1'b0, n25, n23, n18, n15, n9, n8, n7, n6}), .B({
        1'b0, B[7], n5, B[5:0]}), .CI(1'b0), .SUM({N95, N94, N93, N92, N91, 
        N90, N89, N88, N87}) );
  ALU_DW02_mult_0 mult_47 ( .A({n25, n23, n18, n15, n9, n8, n7, n6}), .B({B[7], 
        n5, B[5:0]}), .TC(1'b0), .PRODUCT({N120, N119, N118, N117, N116, N115, 
        N114, N113, N112, N111, N110, N109, N108, N107, N106, N105}) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(n127), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(n141), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(n142), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(n143), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(n144), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(n145), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(n146), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(n147), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(n126), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(n125), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(n124), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(n123), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(n122), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(n121), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M ALU_Valid_reg ( .D(n135), .CK(ALU_CLK), .RN(ALU_RST), .Q(ALU_Valid)
         );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(n120), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(n119), .CK(ALU_CLK), .RN(ALU_RST), .Q(
        ALU_OUT[0]) );
  NOR4X1M U3 ( .A(n99), .B(n158), .C(n4), .D(ALU_FUN[3]), .Y(n32) );
  NOR4X1M U4 ( .A(n157), .B(n43), .C(n158), .D(ALU_FUN[3]), .Y(n35) );
  BUFX2M U7 ( .A(ALU_FUN[0]), .Y(n4) );
  BUFX2M U8 ( .A(A[6]), .Y(n23) );
  NOR3BX2M U9 ( .AN(n97), .B(n156), .C(n157), .Y(n31) );
  INVX2M U10 ( .A(n32), .Y(n152) );
  INVX2M U11 ( .A(n35), .Y(n150) );
  INVX2M U12 ( .A(n90), .Y(n154) );
  INVX2M U13 ( .A(n24), .Y(n153) );
  NOR3X2M U14 ( .A(n43), .B(n45), .C(n157), .Y(n30) );
  NOR2BX2M U15 ( .AN(n17), .B(n99), .Y(n40) );
  INVX2M U16 ( .A(n19), .Y(n149) );
  AOI222X1M U17 ( .A0(N112), .A1(n3), .B0(N128), .B1(n31), .C0(n32), .C1(n133), 
        .Y(n95) );
  NOR3X2M U18 ( .A(n158), .B(n4), .C(n105), .Y(n90) );
  NOR2BX2M U19 ( .AN(n109), .B(n4), .Y(n14) );
  NOR3X2M U20 ( .A(ALU_FUN[2]), .B(ALU_FUN[3]), .C(n158), .Y(n97) );
  NAND3X2M U21 ( .A(ALU_en), .B(n118), .C(n4), .Y(n24) );
  OAI21X2M U22 ( .A0(ALU_FUN[3]), .A1(n99), .B0(n105), .Y(n118) );
  INVX2M U23 ( .A(n106), .Y(n148) );
  INVX2M U24 ( .A(ALU_en), .Y(n158) );
  NOR2BX2M U25 ( .AN(n97), .B(ALU_FUN[1]), .Y(n109) );
  AND2X2M U26 ( .A(n109), .B(n4), .Y(n21) );
  AND4X2M U27 ( .A(N153), .B(ALU_FUN[1]), .C(n17), .D(n155), .Y(n16) );
  BUFX2M U28 ( .A(n34), .Y(n3) );
  NOR3BX2M U29 ( .AN(n97), .B(n156), .C(n4), .Y(n34) );
  NAND2X2M U30 ( .A(n42), .B(n19), .Y(n41) );
  NAND4X2M U31 ( .A(N154), .B(n4), .C(n44), .D(ALU_FUN[1]), .Y(n42) );
  NOR2X2M U32 ( .A(ALU_FUN[2]), .B(n45), .Y(n44) );
  NAND3BX2M U33 ( .AN(n43), .B(n17), .C(N155), .Y(n19) );
  NAND2X2M U34 ( .A(ALU_FUN[1]), .B(ALU_FUN[2]), .Y(n99) );
  NAND2X2M U35 ( .A(ALU_en), .B(ALU_FUN[3]), .Y(n45) );
  NAND2X2M U36 ( .A(ALU_FUN[2]), .B(n156), .Y(n43) );
  NAND2X2M U37 ( .A(ALU_en), .B(n104), .Y(n28) );
  OAI22X1M U38 ( .A0(n157), .A1(n105), .B0(ALU_FUN[3]), .B1(n43), .Y(n104) );
  NAND3X2M U39 ( .A(n156), .B(n155), .C(ALU_FUN[3]), .Y(n105) );
  NOR2X2M U40 ( .A(n45), .B(n4), .Y(n17) );
  INVX2M U41 ( .A(ALU_FUN[1]), .Y(n156) );
  INVX2M U42 ( .A(ALU_FUN[2]), .Y(n155) );
  INVX2M U43 ( .A(n4), .Y(n157) );
  AOI222X1M U44 ( .A0(n7), .A1(n30), .B0(N121), .B1(n31), .C0(n32), .C1(n167), 
        .Y(n11) );
  AOI222X1M U45 ( .A0(n8), .A1(n30), .B0(N122), .B1(n31), .C0(n32), .C1(n132), 
        .Y(n37) );
  AOI222X1M U46 ( .A0(N111), .A1(n3), .B0(n32), .B1(n162), .C0(n25), .C1(n30), 
        .Y(n83) );
  INVX2M U47 ( .A(n5), .Y(n140) );
  AOI211X2M U48 ( .A0(N104), .A1(n21), .B0(n153), .C0(n32), .Y(n106) );
  OAI221X1M U49 ( .A0(n6), .A1(n24), .B0(n154), .B1(n167), .C0(n152), .Y(n22)
         );
  OAI221X1M U50 ( .A0(n7), .A1(n24), .B0(n154), .B1(n132), .C0(n152), .Y(n47)
         );
  OAI221X1M U51 ( .A0(n23), .A1(n24), .B0(n154), .B1(n162), .C0(n152), .Y(n86)
         );
  OAI221X1M U52 ( .A0(n167), .A1(n28), .B0(n6), .B1(n154), .C0(n150), .Y(n20)
         );
  OAI221X1M U53 ( .A0(n28), .A1(n132), .B0(n7), .B1(n154), .C0(n150), .Y(n46)
         );
  OAI221X1M U54 ( .A0(n28), .A1(n162), .B0(n23), .B1(n154), .C0(n150), .Y(n88)
         );
  INVX2M U55 ( .A(n7), .Y(n132) );
  AOI221XLM U56 ( .A0(n25), .A1(n90), .B0(n153), .B1(n133), .C0(n32), .Y(n101)
         );
  AOI221XLM U57 ( .A0(n90), .A1(n133), .B0(n25), .B1(n151), .C0(n35), .Y(n100)
         );
  INVX2M U58 ( .A(n28), .Y(n151) );
  INVX2M U59 ( .A(n25), .Y(n133) );
  INVX2M U60 ( .A(n23), .Y(n162) );
  INVX2M U61 ( .A(n6), .Y(n167) );
  INVX2M U62 ( .A(n8), .Y(n166) );
  INVX2M U63 ( .A(n9), .Y(n165) );
  INVX2M U64 ( .A(n15), .Y(n164) );
  INVX2M U65 ( .A(n18), .Y(n163) );
  NAND4X2M U66 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(n119) );
  AOI222X1M U67 ( .A0(ALU_OUT[0]), .A1(n158), .B0(N105), .B1(n3), .C0(n35), 
        .C1(n6), .Y(n10) );
  AOI222X1M U68 ( .A0(B[0]), .A1(n20), .B0(N96), .B1(n21), .C0(n22), .C1(n134), 
        .Y(n12) );
  AOI211X2M U69 ( .A0(N87), .A1(n14), .B0(n149), .C0(n16), .Y(n13) );
  BUFX2M U70 ( .A(B[6]), .Y(n5) );
  BUFX2M U71 ( .A(A[7]), .Y(n25) );
  NAND4X2M U72 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n120) );
  AOI222X1M U73 ( .A0(ALU_OUT[1]), .A1(n158), .B0(N106), .B1(n3), .C0(n35), 
        .C1(n7), .Y(n36) );
  AOI222X1M U74 ( .A0(B[1]), .A1(n46), .B0(N97), .B1(n21), .C0(n47), .C1(n161), 
        .Y(n38) );
  AOI221XLM U75 ( .A0(n40), .A1(n6), .B0(N88), .B1(n14), .C0(n41), .Y(n39) );
  BUFX2M U76 ( .A(A[5]), .Y(n18) );
  BUFX2M U77 ( .A(A[4]), .Y(n15) );
  AOI222X1M U78 ( .A0(N123), .A1(n31), .B0(n54), .B1(n137), .C0(B[2]), .C1(n56), .Y(n52) );
  OAI221X1M U79 ( .A0(n8), .A1(n24), .B0(n154), .B1(n166), .C0(n152), .Y(n54)
         );
  OAI221X1M U80 ( .A0(n28), .A1(n166), .B0(n8), .B1(n154), .C0(n150), .Y(n56)
         );
  NAND4X2M U81 ( .A(n50), .B(n51), .C(n52), .D(n53), .Y(n121) );
  AOI22X1M U82 ( .A0(n8), .A1(n35), .B0(ALU_OUT[2]), .B1(n158), .Y(n50) );
  AOI222X1M U83 ( .A0(N107), .A1(n3), .B0(n32), .B1(n166), .C0(n9), .C1(n30), 
        .Y(n51) );
  AOI222X1M U84 ( .A0(N98), .A1(n21), .B0(n40), .B1(n7), .C0(N89), .C1(n14), 
        .Y(n53) );
  BUFX2M U85 ( .A(A[3]), .Y(n9) );
  AOI222X1M U86 ( .A0(N124), .A1(n31), .B0(n62), .B1(n139), .C0(B[3]), .C1(n64), .Y(n60) );
  OAI221X1M U87 ( .A0(n9), .A1(n24), .B0(n154), .B1(n165), .C0(n152), .Y(n62)
         );
  OAI221X1M U88 ( .A0(n28), .A1(n165), .B0(n9), .B1(n154), .C0(n150), .Y(n64)
         );
  NAND4X2M U89 ( .A(n58), .B(n59), .C(n60), .D(n61), .Y(n122) );
  AOI22X1M U90 ( .A0(n9), .A1(n35), .B0(ALU_OUT[3]), .B1(n158), .Y(n58) );
  AOI222X1M U91 ( .A0(N108), .A1(n3), .B0(n32), .B1(n165), .C0(n15), .C1(n30), 
        .Y(n59) );
  AOI222X1M U92 ( .A0(N99), .A1(n21), .B0(n8), .B1(n40), .C0(N90), .C1(n14), 
        .Y(n61) );
  BUFX2M U93 ( .A(A[2]), .Y(n8) );
  INVX2M U94 ( .A(n116), .Y(n142) );
  AOI221XLM U95 ( .A0(N119), .A1(n3), .B0(ALU_OUT[14]), .B1(n158), .C0(n148), 
        .Y(n116) );
  INVX2M U96 ( .A(n117), .Y(n141) );
  AOI221XLM U97 ( .A0(N120), .A1(n3), .B0(ALU_OUT[15]), .B1(n158), .C0(n148), 
        .Y(n117) );
  BUFX2M U98 ( .A(A[1]), .Y(n7) );
  BUFX2M U99 ( .A(A[0]), .Y(n6) );
  AOI222X1M U100 ( .A0(N125), .A1(n31), .B0(n70), .B1(n160), .C0(B[4]), .C1(
        n72), .Y(n68) );
  INVX2M U101 ( .A(B[4]), .Y(n160) );
  OAI221X1M U102 ( .A0(n15), .A1(n24), .B0(n154), .B1(n164), .C0(n152), .Y(n70) );
  OAI221X1M U103 ( .A0(n28), .A1(n164), .B0(n15), .B1(n154), .C0(n150), .Y(n72) );
  INVX2M U104 ( .A(n113), .Y(n145) );
  AOI221XLM U105 ( .A0(N116), .A1(n3), .B0(ALU_OUT[11]), .B1(n158), .C0(n148), 
        .Y(n113) );
  INVX2M U106 ( .A(n114), .Y(n144) );
  AOI221XLM U107 ( .A0(N117), .A1(n3), .B0(ALU_OUT[12]), .B1(n158), .C0(n148), 
        .Y(n114) );
  INVX2M U108 ( .A(n115), .Y(n143) );
  AOI221XLM U109 ( .A0(N118), .A1(n3), .B0(ALU_OUT[13]), .B1(n158), .C0(n148), 
        .Y(n115) );
  NAND4X2M U110 ( .A(n66), .B(n67), .C(n68), .D(n69), .Y(n123) );
  AOI22X1M U111 ( .A0(n15), .A1(n35), .B0(ALU_OUT[4]), .B1(n158), .Y(n66) );
  AOI222X1M U112 ( .A0(N100), .A1(n21), .B0(n9), .B1(n40), .C0(N91), .C1(n14), 
        .Y(n69) );
  AOI222X1M U113 ( .A0(N109), .A1(n3), .B0(n32), .B1(n164), .C0(n18), .C1(n30), 
        .Y(n67) );
  AOI222X1M U114 ( .A0(N126), .A1(n31), .B0(n78), .B1(n159), .C0(B[5]), .C1(
        n80), .Y(n76) );
  INVX2M U115 ( .A(B[5]), .Y(n159) );
  OAI221X1M U116 ( .A0(n18), .A1(n24), .B0(n154), .B1(n163), .C0(n152), .Y(n78) );
  OAI221X1M U117 ( .A0(n28), .A1(n163), .B0(n18), .B1(n154), .C0(n150), .Y(n80) );
  INVX2M U118 ( .A(n112), .Y(n146) );
  AOI221XLM U119 ( .A0(N115), .A1(n3), .B0(ALU_OUT[10]), .B1(n158), .C0(n148), 
        .Y(n112) );
  INVX2M U120 ( .A(n110), .Y(n147) );
  AOI221XLM U121 ( .A0(N114), .A1(n3), .B0(ALU_OUT[9]), .B1(n158), .C0(n148), 
        .Y(n110) );
  OAI2B11X2M U122 ( .A1N(ALU_OUT[8]), .A0(ALU_en), .B0(n106), .C0(n107), .Y(
        n127) );
  AOI221XLM U123 ( .A0(N113), .A1(n3), .B0(N95), .B1(n14), .C0(n108), .Y(n107)
         );
  NOR4X1M U124 ( .A(n4), .B(n158), .C(n99), .D(n133), .Y(n108) );
  NAND4X2M U125 ( .A(n74), .B(n75), .C(n76), .D(n77), .Y(n124) );
  AOI22X1M U126 ( .A0(n18), .A1(n35), .B0(ALU_OUT[5]), .B1(n158), .Y(n74) );
  AOI222X1M U127 ( .A0(N101), .A1(n21), .B0(n15), .B1(n40), .C0(N92), .C1(n14), 
        .Y(n77) );
  AOI222X1M U128 ( .A0(N110), .A1(n3), .B0(n32), .B1(n163), .C0(n23), .C1(n30), 
        .Y(n75) );
  NAND4X2M U129 ( .A(n82), .B(n83), .C(n84), .D(n85), .Y(n125) );
  AOI22X1M U130 ( .A0(n23), .A1(n35), .B0(ALU_OUT[6]), .B1(n158), .Y(n82) );
  AOI222X1M U131 ( .A0(N127), .A1(n31), .B0(n86), .B1(n140), .C0(n5), .C1(n88), 
        .Y(n84) );
  AOI222X1M U132 ( .A0(N102), .A1(n21), .B0(n18), .B1(n40), .C0(N93), .C1(n14), 
        .Y(n85) );
  NAND4BX1M U133 ( .AN(n92), .B(n93), .C(n94), .D(n95), .Y(n126) );
  AOI22X1M U134 ( .A0(n25), .A1(n35), .B0(ALU_OUT[7]), .B1(n158), .Y(n94) );
  OAI2B2X1M U135 ( .A1N(B[7]), .A0(n100), .B0(B[7]), .B1(n101), .Y(n92) );
  AOI222X1M U136 ( .A0(N103), .A1(n21), .B0(n23), .B1(n40), .C0(N94), .C1(n14), 
        .Y(n93) );
  INVX2M U137 ( .A(n26), .Y(n136) );
  INVX2M U138 ( .A(n73), .Y(n138) );
  INVX2M U139 ( .A(B[0]), .Y(n134) );
  INVX2M U140 ( .A(B[2]), .Y(n137) );
  INVX2M U141 ( .A(B[3]), .Y(n139) );
  OR2X2M U142 ( .A(ALU_Valid), .B(ALU_en), .Y(n135) );
  INVX2M U143 ( .A(B[1]), .Y(n161) );
  NOR2X1M U144 ( .A(n133), .B(B[7]), .Y(n128) );
  NAND2BX1M U145 ( .AN(B[4]), .B(n15), .Y(n89) );
  NAND2BX1M U146 ( .AN(n15), .B(B[4]), .Y(n48) );
  CLKNAND2X2M U147 ( .A(n89), .B(n48), .Y(n96) );
  NOR2X1M U148 ( .A(n139), .B(n9), .Y(n79) );
  NOR2X1M U149 ( .A(n137), .B(n8), .Y(n33) );
  NOR2X1M U150 ( .A(n134), .B(n6), .Y(n26) );
  CLKNAND2X2M U151 ( .A(n8), .B(n137), .Y(n87) );
  NAND2BX1M U152 ( .AN(n33), .B(n87), .Y(n65) );
  AOI21X1M U153 ( .A0(n26), .A1(n132), .B0(B[1]), .Y(n27) );
  AOI211X1M U154 ( .A0(n7), .A1(n136), .B0(n65), .C0(n27), .Y(n29) );
  CLKNAND2X2M U155 ( .A(n9), .B(n139), .Y(n81) );
  OAI31X1M U156 ( .A0(n79), .A1(n33), .A2(n29), .B0(n81), .Y(n49) );
  NAND2BX1M U157 ( .AN(n18), .B(B[5]), .Y(n103) );
  OAI211X1M U158 ( .A0(n96), .A1(n49), .B0(n48), .C0(n103), .Y(n55) );
  NAND2BX1M U159 ( .AN(B[5]), .B(n18), .Y(n91) );
  XNOR2X1M U160 ( .A(n23), .B(n5), .Y(n102) );
  AOI32X1M U161 ( .A0(n55), .A1(n91), .A2(n102), .B0(n5), .B1(n162), .Y(n57)
         );
  CLKNAND2X2M U162 ( .A(B[7]), .B(n133), .Y(n129) );
  OAI21X1M U163 ( .A0(n128), .A1(n57), .B0(n129), .Y(N155) );
  CLKNAND2X2M U164 ( .A(n6), .B(n134), .Y(n71) );
  OA21X1M U165 ( .A0(n71), .A1(n132), .B0(B[1]), .Y(n63) );
  AOI211X1M U166 ( .A0(n71), .A1(n132), .B0(n65), .C0(n63), .Y(n73) );
  AOI31X1M U167 ( .A0(n138), .A1(n87), .A2(n81), .B0(n79), .Y(n98) );
  OAI2B11X1M U168 ( .A1N(n98), .A0(n96), .B0(n91), .C0(n89), .Y(n111) );
  AOI32X1M U169 ( .A0(n111), .A1(n103), .A2(n102), .B0(n23), .B1(n140), .Y(
        n130) );
  AOI2B1X1M U170 ( .A1N(n130), .A0(n129), .B0(n128), .Y(n131) );
  CLKINVX1M U171 ( .A(n131), .Y(N154) );
  NOR2X1M U172 ( .A(N155), .B(N154), .Y(N153) );
endmodule


module RX_Controller ( RXCont_Pdata, RXCont_Data_Valid, RXCont_CLK, RXCont_RST, 
        RXCont_Out_Data, RXCont_Out_Addr, RXCont_Out_command );
  input [7:0] RXCont_Pdata;
  output [7:0] RXCont_Out_Data;
  output [7:0] RXCont_Out_Addr;
  output [2:0] RXCont_Out_command;
  input RXCont_Data_Valid, RXCont_CLK, RXCont_RST;
  wire   count, n10, n13, n14, n15, n16, n17, n18, n19, n20, n21, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n77;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;
  wire   [7:0] command;

  DFFRQX2M count_reg ( .D(n76), .CK(RXCont_CLK), .RN(RXCont_RST), .Q(count) );
  DFFRX1M \addr_reg[0]  ( .D(n67), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(n21)
         );
  DFFRX1M \addr_reg[7]  ( .D(n60), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(n14)
         );
  DFFRX1M \addr_reg[6]  ( .D(n61), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(n15)
         );
  DFFRX1M \addr_reg[5]  ( .D(n62), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(n16)
         );
  DFFRX1M \addr_reg[4]  ( .D(n63), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(n17)
         );
  DFFRX1M \addr_reg[3]  ( .D(n64), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(n18)
         );
  DFFRX1M \addr_reg[2]  ( .D(n65), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(n19)
         );
  DFFRX1M \addr_reg[1]  ( .D(n66), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(n20)
         );
  DFFRQX2M \command_reg[7]  ( .D(n68), .CK(RXCont_CLK), .RN(RXCont_RST), .Q(
        command[7]) );
  DFFRQX2M \command_reg[3]  ( .D(n72), .CK(RXCont_CLK), .RN(RXCont_RST), .Q(
        command[3]) );
  DFFRX1M \command_reg[4]  ( .D(n71), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(
        n10) );
  DFFRX1M \command_reg[0]  ( .D(n75), .CK(RXCont_CLK), .RN(RXCont_RST), .QN(
        n13) );
  DFFRQX2M \Current_State_reg[0]  ( .D(Next_State[0]), .CK(RXCont_CLK), .RN(
        RXCont_RST), .Q(Current_State[0]) );
  DFFRQX2M \command_reg[6]  ( .D(n69), .CK(RXCont_CLK), .RN(RXCont_RST), .Q(
        command[6]) );
  DFFRQX2M \command_reg[5]  ( .D(n70), .CK(RXCont_CLK), .RN(RXCont_RST), .Q(
        command[5]) );
  DFFRQX2M \command_reg[2]  ( .D(n73), .CK(RXCont_CLK), .RN(RXCont_RST), .Q(
        command[2]) );
  DFFRQX2M \command_reg[1]  ( .D(n74), .CK(RXCont_CLK), .RN(RXCont_RST), .Q(
        command[1]) );
  DFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .CK(RXCont_CLK), .RN(
        RXCont_RST), .Q(Current_State[1]) );
  DFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .CK(RXCont_CLK), .RN(
        RXCont_RST), .Q(Current_State[2]) );
  NOR3X2M U3 ( .A(Current_State[1]), .B(Current_State[2]), .C(n22), .Y(n32) );
  NAND2X2M U4 ( .A(n1), .B(n41), .Y(n36) );
  NAND2X2M U5 ( .A(n39), .B(n35), .Y(RXCont_Out_command[0]) );
  NAND2X2M U6 ( .A(n35), .B(n36), .Y(RXCont_Out_command[1]) );
  INVX2M U7 ( .A(n41), .Y(n7) );
  NOR2X2M U8 ( .A(RXCont_Out_command[0]), .B(RXCont_Out_command[2]), .Y(n37)
         );
  INVX2M U9 ( .A(n1), .Y(n3) );
  NAND2X2M U10 ( .A(n7), .B(n34), .Y(n39) );
  NAND3X2M U11 ( .A(n43), .B(n44), .C(n34), .Y(n35) );
  NAND2X2M U12 ( .A(n44), .B(n50), .Y(n41) );
  BUFX2M U13 ( .A(n31), .Y(n1) );
  NOR2X2M U14 ( .A(n23), .B(n4), .Y(n31) );
  INVX2M U15 ( .A(n49), .Y(n4) );
  NOR2X2M U16 ( .A(n38), .B(n23), .Y(RXCont_Out_command[2]) );
  NOR2X2M U17 ( .A(n37), .B(n27), .Y(RXCont_Out_Data[4]) );
  NOR2X2M U18 ( .A(n37), .B(n26), .Y(RXCont_Out_Data[5]) );
  NOR2X2M U19 ( .A(n37), .B(n25), .Y(RXCont_Out_Data[6]) );
  NOR2X2M U20 ( .A(n37), .B(n24), .Y(RXCont_Out_Data[7]) );
  NOR2X2M U21 ( .A(n37), .B(n77), .Y(RXCont_Out_Data[0]) );
  NOR2X2M U22 ( .A(n37), .B(n30), .Y(RXCont_Out_Data[1]) );
  NOR2X2M U23 ( .A(n37), .B(n29), .Y(RXCont_Out_Data[2]) );
  NOR2X2M U24 ( .A(n37), .B(n28), .Y(RXCont_Out_Data[3]) );
  OAI31X1M U25 ( .A0(n54), .A1(n27), .A2(n77), .B0(n55), .Y(n52) );
  OAI22X1M U26 ( .A0(n32), .A1(n12), .B0(n30), .B1(n5), .Y(n74) );
  OAI22X1M U27 ( .A0(n32), .A1(n11), .B0(n29), .B1(n5), .Y(n73) );
  OAI22X1M U28 ( .A0(n32), .A1(n9), .B0(n26), .B1(n5), .Y(n70) );
  OAI22X1M U29 ( .A0(n32), .A1(n8), .B0(n25), .B1(n5), .Y(n69) );
  INVX2M U30 ( .A(n32), .Y(n5) );
  NOR2X2M U31 ( .A(n28), .B(n5), .Y(n53) );
  NAND3X2M U32 ( .A(n77), .B(n27), .C(n59), .Y(n55) );
  NOR4X1M U33 ( .A(n11), .B(n8), .C(command[1]), .D(command[5]), .Y(n43) );
  NOR4X1M U34 ( .A(n12), .B(n9), .C(command[2]), .D(command[6]), .Y(n50) );
  NOR3X2M U35 ( .A(n22), .B(Current_State[2]), .C(n6), .Y(n49) );
  NOR3X2M U36 ( .A(Current_State[0]), .B(Current_State[2]), .C(n6), .Y(n33) );
  AND4X2M U37 ( .A(command[3]), .B(command[7]), .C(n13), .D(n10), .Y(n44) );
  INVX2M U38 ( .A(Current_State[0]), .Y(n22) );
  INVX2M U39 ( .A(Current_State[1]), .Y(n6) );
  INVX2M U40 ( .A(RXCont_Data_Valid), .Y(n23) );
  AND2X2M U41 ( .A(n33), .B(RXCont_Data_Valid), .Y(n34) );
  INVX2M U42 ( .A(command[1]), .Y(n12) );
  INVX2M U43 ( .A(command[2]), .Y(n11) );
  INVX2M U44 ( .A(command[5]), .Y(n9) );
  INVX2M U45 ( .A(command[6]), .Y(n8) );
  OAI221X1M U46 ( .A0(n77), .A1(n36), .B0(n21), .B1(n39), .C0(n40), .Y(
        RXCont_Out_Addr[0]) );
  OAI22X1M U47 ( .A0(n20), .A1(n39), .B0(n30), .B1(n36), .Y(RXCont_Out_Addr[1]) );
  OAI22X1M U48 ( .A0(n19), .A1(n39), .B0(n29), .B1(n36), .Y(RXCont_Out_Addr[2]) );
  OAI22X1M U49 ( .A0(n18), .A1(n39), .B0(n28), .B1(n36), .Y(RXCont_Out_Addr[3]) );
  OAI22X1M U50 ( .A0(n17), .A1(n39), .B0(n27), .B1(n36), .Y(RXCont_Out_Addr[4]) );
  OAI22X1M U51 ( .A0(n16), .A1(n39), .B0(n26), .B1(n36), .Y(RXCont_Out_Addr[5]) );
  OAI22X1M U52 ( .A0(n15), .A1(n39), .B0(n25), .B1(n36), .Y(RXCont_Out_Addr[6]) );
  OAI22X1M U53 ( .A0(n14), .A1(n39), .B0(n24), .B1(n36), .Y(RXCont_Out_Addr[7]) );
  NAND3X2M U54 ( .A(Current_State[1]), .B(n22), .C(Current_State[2]), .Y(n38)
         );
  OAI31X1M U55 ( .A0(n54), .A1(RXCont_Pdata[4]), .A2(RXCont_Pdata[0]), .B0(n45), .Y(n51) );
  NOR4X1M U56 ( .A(n29), .B(n25), .C(RXCont_Pdata[1]), .D(RXCont_Pdata[5]), 
        .Y(n59) );
  OAI221X1M U57 ( .A0(RXCont_Data_Valid), .A1(n4), .B0(n56), .B1(n5), .C0(n57), 
        .Y(Next_State[0]) );
  NAND4X2M U58 ( .A(RXCont_Data_Valid), .B(n58), .C(n22), .D(n2), .Y(n57) );
  AOI211X2M U59 ( .A0(n55), .A1(n45), .B0(n28), .C0(n24), .Y(n56) );
  OAI211X2M U60 ( .A0(n43), .A1(n50), .B0(Current_State[1]), .C0(n44), .Y(n58)
         );
  OAI211X2M U61 ( .A0(n6), .A1(n46), .B0(n47), .C0(n48), .Y(Next_State[1]) );
  OAI21X2M U62 ( .A0(n22), .A1(n2), .B0(n23), .Y(n46) );
  AOI32X1M U63 ( .A0(n44), .A1(n33), .A2(n43), .B0(n7), .B1(n49), .Y(n48) );
  OAI211X2M U64 ( .A0(n51), .A1(n52), .B0(RXCont_Pdata[7]), .C0(n53), .Y(n47)
         );
  OAI22X1M U65 ( .A0(n32), .A1(n13), .B0(n77), .B1(n5), .Y(n75) );
  OAI22X1M U66 ( .A0(n32), .A1(n10), .B0(n27), .B1(n5), .Y(n71) );
  OAI22X1M U67 ( .A0(n3), .A1(n77), .B0(n1), .B1(n21), .Y(n67) );
  OAI22X1M U68 ( .A0(n3), .A1(n30), .B0(n1), .B1(n20), .Y(n66) );
  OAI22X1M U69 ( .A0(n3), .A1(n29), .B0(n1), .B1(n19), .Y(n65) );
  OAI22X1M U70 ( .A0(n3), .A1(n28), .B0(n1), .B1(n18), .Y(n64) );
  OAI22X1M U71 ( .A0(n3), .A1(n27), .B0(n1), .B1(n17), .Y(n63) );
  OAI22X1M U72 ( .A0(n3), .A1(n26), .B0(n1), .B1(n16), .Y(n62) );
  OAI22X1M U73 ( .A0(n3), .A1(n25), .B0(n1), .B1(n15), .Y(n61) );
  OAI22X1M U74 ( .A0(n3), .A1(n24), .B0(n1), .B1(n14), .Y(n60) );
  OAI211X2M U75 ( .A0(RXCont_Data_Valid), .A1(n38), .B0(n42), .C0(n40), .Y(
        Next_State[2]) );
  NAND4BX1M U76 ( .AN(n45), .B(n32), .C(RXCont_Pdata[3]), .D(RXCont_Pdata[7]), 
        .Y(n42) );
  INVX2M U77 ( .A(RXCont_Pdata[2]), .Y(n29) );
  INVX2M U78 ( .A(RXCont_Pdata[6]), .Y(n25) );
  OAI2BB2X1M U79 ( .B0(n28), .B1(n5), .A0N(n5), .A1N(command[3]), .Y(n72) );
  OAI2BB2X1M U80 ( .B0(n24), .B1(n5), .A0N(n5), .A1N(command[7]), .Y(n68) );
  NAND4X2M U81 ( .A(RXCont_Pdata[1]), .B(RXCont_Pdata[5]), .C(n29), .D(n25), 
        .Y(n54) );
  INVX2M U82 ( .A(RXCont_Pdata[4]), .Y(n27) );
  INVX2M U83 ( .A(RXCont_Pdata[3]), .Y(n28) );
  INVX2M U84 ( .A(RXCont_Pdata[0]), .Y(n77) );
  INVX2M U85 ( .A(RXCont_Pdata[1]), .Y(n30) );
  INVX2M U86 ( .A(RXCont_Pdata[5]), .Y(n26) );
  INVX2M U87 ( .A(RXCont_Pdata[7]), .Y(n24) );
  INVX2M U88 ( .A(Current_State[2]), .Y(n2) );
  NAND3X2M U89 ( .A(RXCont_Pdata[0]), .B(RXCont_Pdata[4]), .C(n59), .Y(n45) );
  NAND2BX2M U90 ( .AN(n35), .B(count), .Y(n40) );
  AO21XLM U91 ( .A0(n33), .A1(count), .B0(n34), .Y(n76) );
endmodule


module TX_Controller ( TXCont_ALU_Out, TXCont_Pdata, TXCont_RdData, 
        TXCont_Addr, TXCont_command, TXCont_ALU_valid, TXCont_RF_Valid, 
        TXCont_Busy, TXCont_CLK, TXCont_RST, TXCont_Addr_Out, 
        TXCont_TXPdata_Out, TXCont_RFWr_Data, TXCont_ALU_Fun, TXCont_ALU_en, 
        TXCont_CLK_en, TXCont_Rd_en, TXCont_Wr_en, TXCont_Data_Valid, 
        TXCont_CLK_Div_en );
  input [15:0] TXCont_ALU_Out;
  input [7:0] TXCont_Pdata;
  input [7:0] TXCont_RdData;
  input [7:0] TXCont_Addr;
  input [2:0] TXCont_command;
  output [7:0] TXCont_Addr_Out;
  output [7:0] TXCont_TXPdata_Out;
  output [7:0] TXCont_RFWr_Data;
  output [3:0] TXCont_ALU_Fun;
  input TXCont_ALU_valid, TXCont_RF_Valid, TXCont_Busy, TXCont_CLK, TXCont_RST;
  output TXCont_ALU_en, TXCont_CLK_en, TXCont_Rd_en, TXCont_Wr_en,
         TXCont_Data_Valid, TXCont_CLK_Div_en;
  wire   n21, n23, n24, n26, n27, n29, n30, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n43, n46, n47, n48, n49, n50, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n22, n25, n28, n31, n42, n44, n45, n51, n69, n70;
  wire   [7:0] TXCont_Pdata_c;
  wire   [7:0] TXCont_Addr_c;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;

  DFFRQX2M \TXCont_Pdata_c_reg[7]  ( .D(n67), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Pdata_c[7]) );
  DFFRQX2M \TXCont_Pdata_c_reg[6]  ( .D(n66), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Pdata_c[6]) );
  DFFRQX2M \TXCont_Pdata_c_reg[5]  ( .D(n65), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Pdata_c[5]) );
  DFFRQX2M \TXCont_Pdata_c_reg[4]  ( .D(n64), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Pdata_c[4]) );
  DFFRQX2M \TXCont_Addr_c_reg[5]  ( .D(n57), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Addr_c[5]) );
  DFFRQX2M \TXCont_Addr_c_reg[4]  ( .D(n56), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Addr_c[4]) );
  DFFRQX2M \TXCont_Addr_c_reg[3]  ( .D(n55), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Addr_c[3]) );
  DFFRQX2M \TXCont_Addr_c_reg[2]  ( .D(n54), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Addr_c[2]) );
  DFFRQX2M \TXCont_Pdata_c_reg[3]  ( .D(n63), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Pdata_c[3]) );
  DFFRQX2M \TXCont_Pdata_c_reg[2]  ( .D(n62), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Pdata_c[2]) );
  DFFRQX2M \TXCont_Pdata_c_reg[1]  ( .D(n61), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Pdata_c[1]) );
  DFFRQX2M \TXCont_Pdata_c_reg[0]  ( .D(n60), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Pdata_c[0]) );
  DFFRQX2M \TXCont_Addr_c_reg[7]  ( .D(n59), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Addr_c[7]) );
  DFFRQX2M \TXCont_Addr_c_reg[6]  ( .D(n58), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Addr_c[6]) );
  DFFRQX2M \TXCont_Addr_c_reg[1]  ( .D(n53), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Addr_c[1]) );
  DFFRQX2M \TXCont_Addr_c_reg[0]  ( .D(n52), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(TXCont_Addr_c[0]) );
  DFFRQX2M \Current_State_reg[0]  ( .D(n68), .CK(TXCont_CLK), .RN(TXCont_RST), 
        .Q(Current_State[0]) );
  DFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .CK(TXCont_CLK), .RN(
        TXCont_RST), .Q(Current_State[2]) );
  DFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .CK(TXCont_CLK), .RN(
        TXCont_RST), .Q(Current_State[1]) );
  INVX2M U3 ( .A(1'b0), .Y(TXCont_CLK_Div_en) );
  NAND3X2M U5 ( .A(n44), .B(n51), .C(n45), .Y(n3) );
  NOR2X2M U6 ( .A(n46), .B(n17), .Y(TXCont_Addr_Out[2]) );
  NOR2X2M U7 ( .A(n8), .B(n41), .Y(TXCont_ALU_Fun[3]) );
  NOR2X2M U8 ( .A(n9), .B(n41), .Y(TXCont_ALU_Fun[2]) );
  NOR2X2M U9 ( .A(n10), .B(n41), .Y(TXCont_ALU_Fun[1]) );
  INVX2M U10 ( .A(TXCont_Wr_en), .Y(n22) );
  NOR3X2M U11 ( .A(Current_State[0]), .B(Current_State[2]), .C(n31), .Y(
        TXCont_Rd_en) );
  INVX2M U12 ( .A(TXCont_command[0]), .Y(n45) );
  INVX2M U13 ( .A(TXCont_command[1]), .Y(n44) );
  OR2X2M U14 ( .A(TXCont_ALU_en), .B(n40), .Y(TXCont_CLK_en) );
  INVX2M U15 ( .A(TXCont_command[2]), .Y(n51) );
  INVX2M U16 ( .A(n39), .Y(n20) );
  NOR2X2M U17 ( .A(TXCont_Rd_en), .B(TXCont_Wr_en), .Y(n46) );
  NAND2X2M U18 ( .A(n41), .B(n47), .Y(TXCont_ALU_en) );
  NAND4X2M U19 ( .A(TXCont_command[2]), .B(n26), .C(n45), .D(n44), .Y(n47) );
  NOR2X2M U20 ( .A(n46), .B(n19), .Y(TXCont_Addr_Out[0]) );
  NOR2X4M U21 ( .A(n46), .B(n16), .Y(TXCont_Addr_Out[3]) );
  NOR2X2M U22 ( .A(n46), .B(n14), .Y(TXCont_Addr_Out[5]) );
  NOR2X2M U23 ( .A(n46), .B(n15), .Y(TXCont_Addr_Out[4]) );
  NOR2X2M U24 ( .A(n11), .B(n41), .Y(TXCont_ALU_Fun[0]) );
  OAI2BB2X1M U25 ( .B0(n3), .B1(n7), .A0N(TXCont_Pdata[4]), .A1N(n3), .Y(n64)
         );
  OAI2BB2X1M U26 ( .B0(n3), .B1(n6), .A0N(TXCont_Pdata[5]), .A1N(n3), .Y(n65)
         );
  OAI2BB2X1M U27 ( .B0(n3), .B1(n5), .A0N(TXCont_Pdata[6]), .A1N(n3), .Y(n66)
         );
  OAI2BB2X1M U28 ( .B0(n3), .B1(n4), .A0N(TXCont_Pdata[7]), .A1N(n3), .Y(n67)
         );
  OAI2BB2X1M U29 ( .B0(n3), .B1(n11), .A0N(TXCont_Pdata[0]), .A1N(n3), .Y(n60)
         );
  OAI2BB2X1M U30 ( .B0(n3), .B1(n10), .A0N(TXCont_Pdata[1]), .A1N(n3), .Y(n61)
         );
  OAI2BB2X1M U31 ( .B0(n3), .B1(n9), .A0N(TXCont_Pdata[2]), .A1N(n3), .Y(n62)
         );
  OAI2BB2X1M U32 ( .B0(n3), .B1(n8), .A0N(TXCont_Pdata[3]), .A1N(n3), .Y(n63)
         );
  NOR2X2M U33 ( .A(n46), .B(n18), .Y(TXCont_Addr_Out[1]) );
  NOR2X2M U34 ( .A(n46), .B(n13), .Y(TXCont_Addr_Out[6]) );
  NOR2X2M U35 ( .A(n46), .B(n12), .Y(TXCont_Addr_Out[7]) );
  NOR2X2M U36 ( .A(n11), .B(n22), .Y(TXCont_RFWr_Data[0]) );
  NOR2X2M U37 ( .A(n10), .B(n22), .Y(TXCont_RFWr_Data[1]) );
  NOR2X2M U38 ( .A(n9), .B(n22), .Y(TXCont_RFWr_Data[2]) );
  NOR2X2M U39 ( .A(n8), .B(n22), .Y(TXCont_RFWr_Data[3]) );
  NOR2X2M U40 ( .A(n7), .B(n22), .Y(TXCont_RFWr_Data[4]) );
  NOR2X2M U41 ( .A(n6), .B(n22), .Y(TXCont_RFWr_Data[5]) );
  NOR2X2M U42 ( .A(n5), .B(n22), .Y(TXCont_RFWr_Data[6]) );
  NOR2X2M U43 ( .A(n4), .B(n22), .Y(TXCont_RFWr_Data[7]) );
  OAI221X1M U44 ( .A0(n21), .A1(n45), .B0(n42), .B1(n23), .C0(n24), .Y(n68) );
  AOI31X2M U45 ( .A0(n42), .A1(n70), .A2(n26), .B0(n27), .Y(n21) );
  NOR2X2M U46 ( .A(n42), .B(n25), .Y(n40) );
  NOR2X2M U47 ( .A(n31), .B(n22), .Y(n27) );
  NAND2X2M U48 ( .A(n40), .B(n70), .Y(n24) );
  OAI2B2X1M U49 ( .A1N(n40), .A0(n23), .B0(n41), .B1(n69), .Y(n30) );
  OAI211X2M U50 ( .A0(n41), .A1(n69), .B0(n39), .C0(n43), .Y(TXCont_Data_Valid) );
  NAND2X2M U51 ( .A(n40), .B(n23), .Y(n39) );
  INVX2M U52 ( .A(n43), .Y(n28) );
  INVX2M U53 ( .A(Current_State[1]), .Y(n31) );
  NOR2X2M U54 ( .A(n25), .B(Current_State[2]), .Y(TXCont_Wr_en) );
  NAND2X2M U55 ( .A(n26), .B(Current_State[2]), .Y(n41) );
  NOR2X2M U56 ( .A(Current_State[0]), .B(Current_State[1]), .Y(n26) );
  OAI211X2M U57 ( .A0(n49), .A1(n44), .B0(n50), .C0(n24), .Y(Next_State[1]) );
  OAI2BB1X2M U58 ( .A0N(TXCont_Busy), .A1N(TXCont_RF_Valid), .B0(TXCont_Rd_en), 
        .Y(n50) );
  AOI31X2M U59 ( .A0(n42), .A1(n70), .A2(n25), .B0(n27), .Y(n49) );
  OAI2BB2X1M U60 ( .B0(n3), .B1(n19), .A0N(TXCont_Addr[0]), .A1N(n3), .Y(n52)
         );
  OAI2BB2X1M U61 ( .B0(n3), .B1(n18), .A0N(TXCont_Addr[1]), .A1N(n3), .Y(n53)
         );
  OAI2BB2X1M U62 ( .B0(n3), .B1(n17), .A0N(TXCont_Addr[2]), .A1N(n3), .Y(n54)
         );
  OAI2BB2X1M U63 ( .B0(n3), .B1(n16), .A0N(TXCont_Addr[3]), .A1N(n3), .Y(n55)
         );
  OAI2BB2X1M U64 ( .B0(n3), .B1(n15), .A0N(TXCont_Addr[4]), .A1N(n3), .Y(n56)
         );
  OAI2BB2X1M U65 ( .B0(n3), .B1(n14), .A0N(TXCont_Addr[5]), .A1N(n3), .Y(n57)
         );
  OAI2BB2X1M U66 ( .B0(n3), .B1(n13), .A0N(TXCont_Addr[6]), .A1N(n3), .Y(n58)
         );
  OAI2BB2X1M U67 ( .B0(n3), .B1(n12), .A0N(TXCont_Addr[7]), .A1N(n3), .Y(n59)
         );
  INVX2M U68 ( .A(Current_State[0]), .Y(n25) );
  INVX2M U69 ( .A(TXCont_Pdata_c[0]), .Y(n11) );
  INVX2M U70 ( .A(TXCont_Pdata_c[1]), .Y(n10) );
  INVX2M U71 ( .A(TXCont_Pdata_c[2]), .Y(n9) );
  INVX2M U72 ( .A(TXCont_Pdata_c[3]), .Y(n8) );
  INVX2M U73 ( .A(TXCont_Addr_c[6]), .Y(n13) );
  INVX2M U74 ( .A(TXCont_Addr_c[7]), .Y(n12) );
  INVX2M U75 ( .A(TXCont_Addr_c[1]), .Y(n18) );
  INVX2M U76 ( .A(TXCont_Addr_c[0]), .Y(n19) );
  OAI221X1M U77 ( .A0(n48), .A1(n51), .B0(Current_State[1]), .B1(n42), .C0(n24), .Y(Next_State[2]) );
  AOI21X2M U78 ( .A0(n26), .A1(n70), .B0(n27), .Y(n48) );
  NAND2X2M U79 ( .A(TXCont_Busy), .B(n31), .Y(n23) );
  INVX2M U80 ( .A(Current_State[2]), .Y(n42) );
  INVX2M U81 ( .A(TXCont_Busy), .Y(n70) );
  INVX2M U82 ( .A(TXCont_Pdata_c[4]), .Y(n7) );
  INVX2M U83 ( .A(TXCont_Pdata_c[5]), .Y(n6) );
  INVX2M U84 ( .A(TXCont_Pdata_c[6]), .Y(n5) );
  INVX2M U85 ( .A(TXCont_Pdata_c[7]), .Y(n4) );
  INVX2M U86 ( .A(TXCont_Addr_c[4]), .Y(n15) );
  INVX2M U87 ( .A(TXCont_Addr_c[5]), .Y(n14) );
  INVX2M U88 ( .A(TXCont_Addr_c[3]), .Y(n16) );
  INVX2M U89 ( .A(TXCont_Addr_c[2]), .Y(n17) );
  OAI2BB1X2M U90 ( .A0N(TXCont_RdData[0]), .A1N(n28), .B0(n38), .Y(
        TXCont_TXPdata_Out[0]) );
  AOI22X1M U91 ( .A0(TXCont_ALU_Out[0]), .A1(n30), .B0(TXCont_ALU_Out[8]), 
        .B1(n20), .Y(n38) );
  OAI2BB1X2M U92 ( .A0N(TXCont_RdData[1]), .A1N(n28), .B0(n37), .Y(
        TXCont_TXPdata_Out[1]) );
  AOI22X1M U93 ( .A0(TXCont_ALU_Out[1]), .A1(n30), .B0(TXCont_ALU_Out[9]), 
        .B1(n20), .Y(n37) );
  OAI2BB1X2M U94 ( .A0N(TXCont_RdData[2]), .A1N(n28), .B0(n36), .Y(
        TXCont_TXPdata_Out[2]) );
  AOI22X1M U95 ( .A0(TXCont_ALU_Out[2]), .A1(n30), .B0(TXCont_ALU_Out[10]), 
        .B1(n20), .Y(n36) );
  OAI2BB1X2M U96 ( .A0N(TXCont_RdData[3]), .A1N(n28), .B0(n35), .Y(
        TXCont_TXPdata_Out[3]) );
  AOI22X1M U97 ( .A0(TXCont_ALU_Out[3]), .A1(n30), .B0(TXCont_ALU_Out[11]), 
        .B1(n20), .Y(n35) );
  OAI2BB1X2M U98 ( .A0N(TXCont_RdData[4]), .A1N(n28), .B0(n34), .Y(
        TXCont_TXPdata_Out[4]) );
  AOI22X1M U99 ( .A0(TXCont_ALU_Out[4]), .A1(n30), .B0(TXCont_ALU_Out[12]), 
        .B1(n20), .Y(n34) );
  OAI2BB1X2M U100 ( .A0N(TXCont_RdData[5]), .A1N(n28), .B0(n33), .Y(
        TXCont_TXPdata_Out[5]) );
  AOI22X1M U101 ( .A0(TXCont_ALU_Out[5]), .A1(n30), .B0(TXCont_ALU_Out[13]), 
        .B1(n20), .Y(n33) );
  OAI2BB1X2M U102 ( .A0N(TXCont_RdData[6]), .A1N(n28), .B0(n32), .Y(
        TXCont_TXPdata_Out[6]) );
  AOI22X1M U103 ( .A0(TXCont_ALU_Out[6]), .A1(n30), .B0(TXCont_ALU_Out[14]), 
        .B1(n20), .Y(n32) );
  OAI2BB1X2M U104 ( .A0N(TXCont_RdData[7]), .A1N(n28), .B0(n29), .Y(
        TXCont_TXPdata_Out[7]) );
  AOI22X1M U105 ( .A0(TXCont_ALU_Out[7]), .A1(n30), .B0(TXCont_ALU_Out[15]), 
        .B1(n20), .Y(n29) );
  NAND2X2M U106 ( .A(TXCont_RF_Valid), .B(TXCont_Rd_en), .Y(n43) );
  INVX2M U107 ( .A(TXCont_ALU_valid), .Y(n69) );
endmodule


module SYS_Controller ( SYSCont_ALU_Out, SYSCont_RXPdata, SYSCont_RdData, 
        SYSCont_ALU_Valid, SYSCont_RX_Data_Valid, SYSCont_Rf_Data_Valid, 
        SYSCont_Busy, SYSCont_CLK, SYSCont_RST, SYSCont_TXPdata, 
        SYSCont_WrData, SYSCont_Addr, SYSCont_ALU_Fun, SYSCont_ALU_en, 
        SYSCont_CLK_en, SYSCont_Rd_en, SYSCont_Wr_en, SYSCont_TX_Data_Valid, 
        SYSCont_CLK_div_en );
  input [15:0] SYSCont_ALU_Out;
  input [7:0] SYSCont_RXPdata;
  input [7:0] SYSCont_RdData;
  output [7:0] SYSCont_TXPdata;
  output [7:0] SYSCont_WrData;
  output [7:0] SYSCont_Addr;
  output [3:0] SYSCont_ALU_Fun;
  input SYSCont_ALU_Valid, SYSCont_RX_Data_Valid, SYSCont_Rf_Data_Valid,
         SYSCont_Busy, SYSCont_CLK, SYSCont_RST;
  output SYSCont_ALU_en, SYSCont_CLK_en, SYSCont_Rd_en, SYSCont_Wr_en,
         SYSCont_TX_Data_Valid, SYSCont_CLK_div_en;
  wire   n3, n4;
  wire   [7:0] Recieved_Addr;
  wire   [7:0] Recieved_Data;
  wire   [2:0] Recieved_Command;

  RX_Controller U0_RX_Controller ( .RXCont_Pdata(SYSCont_RXPdata), 
        .RXCont_Data_Valid(SYSCont_RX_Data_Valid), .RXCont_CLK(SYSCont_CLK), 
        .RXCont_RST(n3), .RXCont_Out_Data(Recieved_Data), .RXCont_Out_Addr(
        Recieved_Addr), .RXCont_Out_command(Recieved_Command) );
  TX_Controller U0_TX_Controller ( .TXCont_ALU_Out(SYSCont_ALU_Out), 
        .TXCont_Pdata(Recieved_Data), .TXCont_RdData(SYSCont_RdData), 
        .TXCont_Addr(Recieved_Addr), .TXCont_command(Recieved_Command), 
        .TXCont_ALU_valid(SYSCont_ALU_Valid), .TXCont_RF_Valid(
        SYSCont_Rf_Data_Valid), .TXCont_Busy(SYSCont_Busy), .TXCont_CLK(
        SYSCont_CLK), .TXCont_RST(n3), .TXCont_Addr_Out(SYSCont_Addr), 
        .TXCont_TXPdata_Out(SYSCont_TXPdata), .TXCont_RFWr_Data(SYSCont_WrData), .TXCont_ALU_Fun(SYSCont_ALU_Fun), .TXCont_ALU_en(SYSCont_ALU_en), 
        .TXCont_CLK_en(SYSCont_CLK_en), .TXCont_Rd_en(SYSCont_Rd_en), 
        .TXCont_Wr_en(SYSCont_Wr_en), .TXCont_Data_Valid(SYSCont_TX_Data_Valid) );
  INVX2M U1 ( .A(1'b0), .Y(SYSCont_CLK_div_en) );
  INVX4M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(SYSCont_RST), .Y(n4) );
endmodule


module RXFSM ( RXFSM_bit_cnt, RXFSM_RX_IN, RXFSM_par_err, RXFSM_strt_glitch, 
        RXFSM_stp_err, RXFSM_PAR_EN, RXFSM_FINISH, RXFSM_EdgeFinish, RXFSM_CLK, 
        RXFSM_RST, RXFSM_data_samp_en, RXFSM_deser_en, RXFSM_edge_cnt_enable, 
        RXFSM_bit_cnt_enable, RXFSM_data_valid, RXFSM_par_chk_en, 
        RXFSM_strt_chk_en, RXFSM_stp_chk );
  input [2:0] RXFSM_bit_cnt;
  input RXFSM_RX_IN, RXFSM_par_err, RXFSM_strt_glitch, RXFSM_stp_err,
         RXFSM_PAR_EN, RXFSM_FINISH, RXFSM_EdgeFinish, RXFSM_CLK, RXFSM_RST;
  output RXFSM_data_samp_en, RXFSM_deser_en, RXFSM_edge_cnt_enable,
         RXFSM_bit_cnt_enable, RXFSM_data_valid, RXFSM_par_chk_en,
         RXFSM_strt_chk_en, RXFSM_stp_chk;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n2, n3, n4, n5,
         n6, n7;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;

  DFFRQX2M \Current_State_reg[0]  ( .D(Next_State[0]), .CK(RXFSM_CLK), .RN(
        RXFSM_RST), .Q(Current_State[0]) );
  DFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .CK(RXFSM_CLK), .RN(
        RXFSM_RST), .Q(Current_State[1]) );
  DFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .CK(RXFSM_CLK), .RN(
        RXFSM_RST), .Q(Current_State[2]) );
  INVX2M U3 ( .A(n8), .Y(RXFSM_stp_chk) );
  NOR3BX2M U4 ( .AN(RXFSM_FINISH), .B(RXFSM_stp_err), .C(n8), .Y(
        RXFSM_data_valid) );
  OAI211X2M U5 ( .A0(RXFSM_FINISH), .A1(n8), .B0(n13), .C0(n14), .Y(
        Next_State[1]) );
  AOI211X2M U6 ( .A0(n15), .A1(RXFSM_strt_chk_en), .B0(RXFSM_par_chk_en), .C0(
        RXFSM_bit_cnt_enable), .Y(n14) );
  NOR2X2M U7 ( .A(RXFSM_strt_glitch), .B(n3), .Y(n15) );
  INVX2M U8 ( .A(RXFSM_EdgeFinish), .Y(n3) );
  AOI32X1M U9 ( .A0(n18), .A1(Current_State[1]), .A2(Current_State[2]), .B0(
        RXFSM_stp_chk), .B1(RXFSM_stp_err), .Y(n13) );
  NOR2XLM U10 ( .A(n6), .B(RXFSM_EdgeFinish), .Y(n18) );
  OAI2B11X2M U11 ( .A1N(RXFSM_par_chk_en), .A0(n3), .B0(n10), .C0(n2), .Y(
        Next_State[2]) );
  INVX2M U12 ( .A(n11), .Y(n2) );
  OAI32X1M U13 ( .A0(n12), .A1(RXFSM_PAR_EN), .A2(n5), .B0(n8), .B1(
        RXFSM_FINISH), .Y(n11) );
  INVX2M U14 ( .A(RXFSM_bit_cnt_enable), .Y(n5) );
  OAI2B11X2M U15 ( .A1N(RXFSM_strt_chk_en), .A0(RXFSM_strt_glitch), .B0(n10), 
        .C0(n16), .Y(Next_State[0]) );
  AOI32X1M U16 ( .A0(n6), .A1(n7), .A2(n17), .B0(RXFSM_bit_cnt_enable), .B1(
        n12), .Y(n16) );
  NOR2X2M U17 ( .A(RXFSM_RX_IN), .B(Current_State[2]), .Y(n17) );
  AOI21BX2M U18 ( .A0(RXFSM_par_err), .A1(RXFSM_par_chk_en), .B0N(n13), .Y(n10) );
  OAI211X2M U19 ( .A0(RXFSM_RX_IN), .A1(Current_State[2]), .B0(n4), .C0(n7), 
        .Y(RXFSM_edge_cnt_enable) );
  INVX2M U20 ( .A(RXFSM_data_samp_en), .Y(n4) );
  NAND4XLM U21 ( .A(RXFSM_bit_cnt[2]), .B(RXFSM_bit_cnt[1]), .C(
        RXFSM_bit_cnt[0]), .D(RXFSM_EdgeFinish), .Y(n12) );
  OAI211X2M U22 ( .A0(Current_State[2]), .A1(n6), .B0(n8), .C0(n9), .Y(
        RXFSM_data_samp_en) );
  NAND3X2M U23 ( .A(Current_State[1]), .B(n6), .C(Current_State[2]), .Y(n8) );
  INVX2M U24 ( .A(Current_State[0]), .Y(n6) );
  OR2X2M U25 ( .A(Current_State[2]), .B(n7), .Y(n9) );
  INVX2M U26 ( .A(Current_State[1]), .Y(n7) );
  NOR3X2M U27 ( .A(Current_State[1]), .B(Current_State[2]), .C(n6), .Y(
        RXFSM_strt_chk_en) );
  NOR2X2M U28 ( .A(n9), .B(Current_State[0]), .Y(RXFSM_par_chk_en) );
  BUFX2M U29 ( .A(RXFSM_bit_cnt_enable), .Y(RXFSM_deser_en) );
  NOR2X2M U30 ( .A(n9), .B(n6), .Y(RXFSM_bit_cnt_enable) );
endmodule


module edge_bit_counter ( Cnt_prescale, Cnt_edge_cnt_enable, 
        Cnt_bit_cnt_enable, Cnt_CLK, Cnt_RST, Cnt_edge_cnt, Cnt_bit_cnt, 
        Cnt_EdgeFinish );
  input [4:0] Cnt_prescale;
  output [4:0] Cnt_edge_cnt;
  output [2:0] Cnt_bit_cnt;
  input Cnt_edge_cnt_enable, Cnt_bit_cnt_enable, Cnt_CLK, Cnt_RST;
  output Cnt_EdgeFinish;
  wire   N11, N12, N13, n7, n8, n9, n10, n11, n12, n13, n14, \add_50/carry[4] ,
         \add_50/carry[3] , \add_50/carry[2] , n1, n2, n3, n4, n5, n6, n15,
         n16, n17, n18, n19, n20, n21;
  wire   [4:0] EdgeCounter_comb;

  DFFRQX2M \Cnt_bit_cnt_reg[2]  ( .D(n12), .CK(Cnt_CLK), .RN(Cnt_RST), .Q(
        Cnt_bit_cnt[2]) );
  DFFRQX2M \Cnt_bit_cnt_reg[1]  ( .D(n13), .CK(Cnt_CLK), .RN(Cnt_RST), .Q(
        Cnt_bit_cnt[1]) );
  DFFRQX2M \Cnt_bit_cnt_reg[0]  ( .D(n14), .CK(Cnt_CLK), .RN(Cnt_RST), .Q(
        Cnt_bit_cnt[0]) );
  DFFRQX2M \Cnt_edge_cnt_reg[4]  ( .D(EdgeCounter_comb[4]), .CK(Cnt_CLK), .RN(
        Cnt_RST), .Q(Cnt_edge_cnt[4]) );
  DFFRQX2M \Cnt_edge_cnt_reg[0]  ( .D(EdgeCounter_comb[0]), .CK(Cnt_CLK), .RN(
        Cnt_RST), .Q(Cnt_edge_cnt[0]) );
  DFFRQX2M \Cnt_edge_cnt_reg[3]  ( .D(EdgeCounter_comb[3]), .CK(Cnt_CLK), .RN(
        Cnt_RST), .Q(Cnt_edge_cnt[3]) );
  DFFRQX2M \Cnt_edge_cnt_reg[1]  ( .D(EdgeCounter_comb[1]), .CK(Cnt_CLK), .RN(
        Cnt_RST), .Q(Cnt_edge_cnt[1]) );
  DFFRQX2M \Cnt_edge_cnt_reg[2]  ( .D(EdgeCounter_comb[2]), .CK(Cnt_CLK), .RN(
        Cnt_RST), .Q(Cnt_edge_cnt[2]) );
  INVX2M U3 ( .A(n10), .Y(n18) );
  INVX2M U4 ( .A(Cnt_bit_cnt_enable), .Y(n21) );
  NOR2BX2M U5 ( .AN(N11), .B(n11), .Y(EdgeCounter_comb[1]) );
  NOR2BX2M U6 ( .AN(N12), .B(n11), .Y(EdgeCounter_comb[2]) );
  NOR2BX2M U7 ( .AN(N13), .B(n11), .Y(EdgeCounter_comb[3]) );
  NOR2X2M U8 ( .A(n21), .B(Cnt_EdgeFinish), .Y(n10) );
  NAND2BX1M U9 ( .AN(Cnt_EdgeFinish), .B(Cnt_edge_cnt_enable), .Y(n11) );
  NOR2X2M U10 ( .A(n1), .B(n11), .Y(EdgeCounter_comb[4]) );
  XNOR2X2M U11 ( .A(\add_50/carry[4] ), .B(Cnt_edge_cnt[4]), .Y(n1) );
  NOR2X2M U12 ( .A(Cnt_edge_cnt[0]), .B(n11), .Y(EdgeCounter_comb[0]) );
  NOR2X2M U13 ( .A(n7), .B(n21), .Y(n12) );
  CLKXOR2X2M U14 ( .A(n8), .B(Cnt_bit_cnt[2]), .Y(n7) );
  NAND3XLM U15 ( .A(Cnt_bit_cnt[1]), .B(Cnt_bit_cnt[0]), .C(Cnt_EdgeFinish), 
        .Y(n8) );
  OAI32X1M U16 ( .A0(n21), .A1(Cnt_bit_cnt[0]), .A2(n10), .B0(n19), .B1(n18), 
        .Y(n14) );
  OAI22X1M U17 ( .A0(n20), .A1(n18), .B0(n9), .B1(n21), .Y(n13) );
  AOI32X1M U18 ( .A0(n18), .A1(n20), .A2(Cnt_bit_cnt[0]), .B0(Cnt_bit_cnt[1]), 
        .B1(n19), .Y(n9) );
  INVX2M U19 ( .A(Cnt_bit_cnt[1]), .Y(n20) );
  INVX2M U20 ( .A(Cnt_bit_cnt[0]), .Y(n19) );
  ADDHX1M U21 ( .A(Cnt_edge_cnt[2]), .B(\add_50/carry[2] ), .CO(
        \add_50/carry[3] ), .S(N12) );
  ADDHX1M U22 ( .A(Cnt_edge_cnt[1]), .B(Cnt_edge_cnt[0]), .CO(
        \add_50/carry[2] ), .S(N11) );
  ADDHX1M U23 ( .A(Cnt_edge_cnt[3]), .B(\add_50/carry[3] ), .CO(
        \add_50/carry[4] ), .S(N13) );
  CLKXOR2X2M U24 ( .A(Cnt_prescale[2]), .B(Cnt_edge_cnt[2]), .Y(n17) );
  NOR2BX1M U25 ( .AN(Cnt_prescale[0]), .B(Cnt_edge_cnt[0]), .Y(n2) );
  OAI2B2X1M U26 ( .A1N(Cnt_edge_cnt[1]), .A0(n2), .B0(Cnt_prescale[1]), .B1(n2), .Y(n5) );
  NOR2BX1M U27 ( .AN(Cnt_edge_cnt[0]), .B(Cnt_prescale[0]), .Y(n3) );
  OAI2B2X1M U28 ( .A1N(Cnt_prescale[1]), .A0(n3), .B0(Cnt_edge_cnt[1]), .B1(n3), .Y(n4) );
  CLKNAND2X2M U29 ( .A(n5), .B(n4), .Y(n16) );
  CLKXOR2X2M U30 ( .A(Cnt_prescale[3]), .B(Cnt_edge_cnt[3]), .Y(n15) );
  CLKXOR2X2M U31 ( .A(Cnt_prescale[4]), .B(Cnt_edge_cnt[4]), .Y(n6) );
  NOR4X1M U32 ( .A(n17), .B(n16), .C(n15), .D(n6), .Y(Cnt_EdgeFinish) );
endmodule


module Data_Sampler ( Sampler_edge_cnt, Sampler_prescale, Sampler_data_samp_en, 
        Sampler_RX_IN, Sampler_CLK, Sampler_RST, Sampler_sample, 
        Sampler_Sample_Valid );
  input [4:0] Sampler_edge_cnt;
  input [4:0] Sampler_prescale;
  input Sampler_data_samp_en, Sampler_RX_IN, Sampler_CLK, Sampler_RST;
  output Sampler_sample, Sampler_Sample_Valid;
  wire   N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, \add_75/carry[3] ,
         \add_75/carry[2] , \add_76/carry[3] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23;
  wire   [1:0] Ones_Num;
  wire   [1:0] Ones_Num_comb;
  assign N18 = Sampler_prescale[1];

  DFFRQX2M \Ones_Num_reg[1]  ( .D(Ones_Num_comb[1]), .CK(Sampler_CLK), .RN(
        Sampler_RST), .Q(Ones_Num[1]) );
  DFFRQX2M \Ones_Num_reg[0]  ( .D(Ones_Num_comb[0]), .CK(Sampler_CLK), .RN(
        Sampler_RST), .Q(Ones_Num[0]) );
  INVX2M U3 ( .A(Sampler_prescale[2]), .Y(N19) );
  ADDHX1M U4 ( .A(Sampler_prescale[2]), .B(N18), .CO(\add_75/carry[2] ), .S(
        N14) );
  ADDHX1M U5 ( .A(Sampler_prescale[3]), .B(\add_75/carry[2] ), .CO(
        \add_75/carry[3] ), .S(N15) );
  ADDHX1M U6 ( .A(Sampler_prescale[4]), .B(\add_75/carry[3] ), .CO(N17), .S(
        N16) );
  AND2X1M U7 ( .A(\add_76/carry[3] ), .B(Sampler_prescale[4]), .Y(N22) );
  CLKXOR2X2M U8 ( .A(Sampler_prescale[4]), .B(\add_76/carry[3] ), .Y(N21) );
  AND2X1M U9 ( .A(Sampler_prescale[2]), .B(Sampler_prescale[3]), .Y(
        \add_76/carry[3] ) );
  CLKXOR2X2M U10 ( .A(Sampler_prescale[3]), .B(Sampler_prescale[2]), .Y(N20)
         );
  CLKINVX1M U11 ( .A(N18), .Y(N13) );
  NOR2X1M U12 ( .A(n1), .B(n2), .Y(Sampler_sample) );
  NOR2X1M U13 ( .A(n3), .B(n1), .Y(Ones_Num_comb[1]) );
  CLKXOR2X2M U14 ( .A(n4), .B(Ones_Num[1]), .Y(n1) );
  CLKNAND2X2M U15 ( .A(Sampler_RX_IN), .B(Ones_Num[0]), .Y(n4) );
  NOR2X1M U16 ( .A(n3), .B(n5), .Y(Ones_Num_comb[0]) );
  XNOR2X1M U17 ( .A(Ones_Num[0]), .B(Sampler_RX_IN), .Y(n5) );
  AOI2B1X1M U18 ( .A1N(n6), .A0(Sampler_data_samp_en), .B0(
        Sampler_Sample_Valid), .Y(n3) );
  CLKINVX1M U19 ( .A(n2), .Y(Sampler_Sample_Valid) );
  NAND4X1M U20 ( .A(n7), .B(Sampler_data_samp_en), .C(n8), .D(n9), .Y(n2) );
  NOR3X1M U21 ( .A(n10), .B(n11), .C(n12), .Y(n9) );
  CLKXOR2X2M U22 ( .A(Sampler_edge_cnt[2]), .B(N20), .Y(n12) );
  CLKXOR2X2M U23 ( .A(Sampler_edge_cnt[4]), .B(N22), .Y(n11) );
  CLKXOR2X2M U24 ( .A(Sampler_edge_cnt[3]), .B(N21), .Y(n10) );
  XNOR2X1M U25 ( .A(Sampler_edge_cnt[0]), .B(N18), .Y(n8) );
  XNOR2X1M U26 ( .A(Sampler_edge_cnt[1]), .B(N19), .Y(n7) );
  AOI33X1M U27 ( .A0(n13), .A1(n14), .A2(n15), .B0(n16), .B1(n17), .B2(n18), 
        .Y(n6) );
  NOR3X1M U28 ( .A(n19), .B(Sampler_edge_cnt[4]), .C(n20), .Y(n18) );
  CLKXOR2X2M U29 ( .A(Sampler_prescale[2]), .B(Sampler_edge_cnt[1]), .Y(n20)
         );
  CLKXOR2X2M U30 ( .A(N18), .B(Sampler_edge_cnt[0]), .Y(n19) );
  XNOR2X1M U31 ( .A(Sampler_edge_cnt[2]), .B(Sampler_prescale[3]), .Y(n17) );
  XNOR2X1M U32 ( .A(Sampler_edge_cnt[3]), .B(Sampler_prescale[4]), .Y(n16) );
  NOR3X1M U33 ( .A(n21), .B(n22), .C(n23), .Y(n15) );
  CLKXOR2X2M U34 ( .A(Sampler_edge_cnt[2]), .B(N15), .Y(n23) );
  CLKXOR2X2M U35 ( .A(Sampler_edge_cnt[1]), .B(N14), .Y(n22) );
  CLKXOR2X2M U36 ( .A(Sampler_edge_cnt[0]), .B(N13), .Y(n21) );
  XNOR2X1M U37 ( .A(Sampler_edge_cnt[3]), .B(N16), .Y(n14) );
  XNOR2X1M U38 ( .A(Sampler_edge_cnt[4]), .B(N17), .Y(n13) );
endmodule


module Deseralizer ( Deseralizer_SampledData, Deseralizer_Sample_Valid, 
        Deseralizer_EN, Deseralizer_CLK, Deseralizer_RST, Deseralizer_PDATA );
  output [7:0] Deseralizer_PDATA;
  input Deseralizer_SampledData, Deseralizer_Sample_Valid, Deseralizer_EN,
         Deseralizer_CLK, Deseralizer_RST;
  wire   n1, n10, n11, n12, n13, n14, n15, n16, n17, n2, n3, n4, n5, n6, n7,
         n8, n9, n18;

  DFFRQX2M \Deseralizer_PDATA_reg[0]  ( .D(n10), .CK(Deseralizer_CLK), .RN(
        Deseralizer_RST), .Q(Deseralizer_PDATA[0]) );
  DFFRQX2M \Deseralizer_PDATA_reg[1]  ( .D(n11), .CK(Deseralizer_CLK), .RN(
        Deseralizer_RST), .Q(Deseralizer_PDATA[1]) );
  DFFRQX2M \Deseralizer_PDATA_reg[4]  ( .D(n14), .CK(Deseralizer_CLK), .RN(
        Deseralizer_RST), .Q(Deseralizer_PDATA[4]) );
  DFFRQX2M \Deseralizer_PDATA_reg[7]  ( .D(n17), .CK(Deseralizer_CLK), .RN(
        Deseralizer_RST), .Q(Deseralizer_PDATA[7]) );
  DFFRQX2M \Deseralizer_PDATA_reg[3]  ( .D(n13), .CK(Deseralizer_CLK), .RN(
        Deseralizer_RST), .Q(Deseralizer_PDATA[3]) );
  DFFRQX2M \Deseralizer_PDATA_reg[2]  ( .D(n12), .CK(Deseralizer_CLK), .RN(
        Deseralizer_RST), .Q(Deseralizer_PDATA[2]) );
  DFFRQX2M \Deseralizer_PDATA_reg[5]  ( .D(n15), .CK(Deseralizer_CLK), .RN(
        Deseralizer_RST), .Q(Deseralizer_PDATA[5]) );
  DFFRQX2M \Deseralizer_PDATA_reg[6]  ( .D(n16), .CK(Deseralizer_CLK), .RN(
        Deseralizer_RST), .Q(Deseralizer_PDATA[6]) );
  INVX2M U2 ( .A(n2), .Y(n3) );
  BUFX2M U3 ( .A(n1), .Y(n2) );
  NAND2X2M U4 ( .A(Deseralizer_Sample_Valid), .B(Deseralizer_EN), .Y(n1) );
  OAI2BB2X1M U5 ( .B0(n3), .B1(n4), .A0N(Deseralizer_SampledData), .A1N(n3), 
        .Y(n17) );
  OAI22X1M U6 ( .A0(n3), .A1(n18), .B0(n2), .B1(n9), .Y(n11) );
  OAI22X1M U7 ( .A0(n3), .A1(n9), .B0(n2), .B1(n8), .Y(n12) );
  OAI22X1M U8 ( .A0(n3), .A1(n8), .B0(n2), .B1(n7), .Y(n13) );
  OAI22X1M U9 ( .A0(n3), .A1(n7), .B0(n2), .B1(n6), .Y(n14) );
  OAI22X1M U10 ( .A0(n3), .A1(n6), .B0(n2), .B1(n5), .Y(n15) );
  OAI22X1M U11 ( .A0(n3), .A1(n5), .B0(n2), .B1(n4), .Y(n16) );
  OAI2BB2X1M U12 ( .B0(n2), .B1(n18), .A0N(Deseralizer_PDATA[0]), .A1N(n2), 
        .Y(n10) );
  INVX2M U13 ( .A(Deseralizer_PDATA[2]), .Y(n9) );
  INVX2M U14 ( .A(Deseralizer_PDATA[6]), .Y(n5) );
  INVX2M U15 ( .A(Deseralizer_PDATA[7]), .Y(n4) );
  INVX2M U16 ( .A(Deseralizer_PDATA[3]), .Y(n8) );
  INVX2M U17 ( .A(Deseralizer_PDATA[1]), .Y(n18) );
  INVX2M U18 ( .A(Deseralizer_PDATA[4]), .Y(n7) );
  INVX2M U19 ( .A(Deseralizer_PDATA[5]), .Y(n6) );
endmodule


module Strt_Check ( StrtChk_EN, StrtChk_Sample_Valid, StrtChk_sample, 
        StrtChk_glitch );
  input StrtChk_EN, StrtChk_Sample_Valid, StrtChk_sample;
  output StrtChk_glitch;


  AND3X2M U2 ( .A(StrtChk_Sample_Valid), .B(StrtChk_EN), .C(StrtChk_sample), 
        .Y(StrtChk_glitch) );
endmodule


module Parity_Check ( ParityCheck_PDATA, ParityCheck_EN, ParityCheck_PAR_TYP, 
        ParityCheck_sample, ParityCheck_Sample_Valid, ParityCheck_Par_err );
  input [7:0] ParityCheck_PDATA;
  input ParityCheck_EN, ParityCheck_PAR_TYP, ParityCheck_sample,
         ParityCheck_Sample_Valid;
  output ParityCheck_Par_err;
  wire   n1, n2, n3, n4, n5, n6;

  CLKXOR2X2M U2 ( .A(ParityCheck_sample), .B(ParityCheck_PAR_TYP), .Y(n2) );
  AND3X2M U3 ( .A(ParityCheck_EN), .B(n1), .C(ParityCheck_Sample_Valid), .Y(
        ParityCheck_Par_err) );
  XOR3XLM U4 ( .A(n2), .B(n3), .C(n4), .Y(n1) );
  XOR3XLM U5 ( .A(ParityCheck_PDATA[1]), .B(ParityCheck_PDATA[0]), .C(n5), .Y(
        n4) );
  XOR3XLM U6 ( .A(ParityCheck_PDATA[5]), .B(ParityCheck_PDATA[4]), .C(n6), .Y(
        n3) );
  XNOR2X2M U7 ( .A(ParityCheck_PDATA[7]), .B(ParityCheck_PDATA[6]), .Y(n6) );
  XNOR2X2M U8 ( .A(ParityCheck_PDATA[3]), .B(ParityCheck_PDATA[2]), .Y(n5) );
endmodule


module Stop_Check ( StpChk_stp_chk_en, StpChk_sample, StpChk_Sample_Valid, 
        StpChk_stp_err, StpChk_finish );
  input StpChk_stp_chk_en, StpChk_sample, StpChk_Sample_Valid;
  output StpChk_stp_err, StpChk_finish;
  wire   n2;

  NOR2X2M U2 ( .A(StpChk_sample), .B(n2), .Y(StpChk_stp_err) );
  INVX2M U3 ( .A(n2), .Y(StpChk_finish) );
  NAND2X2M U4 ( .A(StpChk_stp_chk_en), .B(StpChk_Sample_Valid), .Y(n2) );
endmodule


module UART_RX ( UartRx_prescale, UartRx_RX_IN, UartRx_PAR_EN, UartRx_Par_Type, 
        UartRx_CLK, UartRx_RST, UartRx_PDATA, UartRx_Data_Valid );
  input [4:0] UartRx_prescale;
  output [7:0] UartRx_PDATA;
  input UartRx_RX_IN, UartRx_PAR_EN, UartRx_Par_Type, UartRx_CLK, UartRx_RST;
  output UartRx_Data_Valid;
  wire   par_err, strt_glitch, stp_err, FINISH, EdgeFinish, data_samp_en,
         deser_en, edge_cnt_enable, bit_cnt_enable, par_chk_en, strt_chk_en,
         stp_chk_en, sample, Sample_Valid, n1, n2;
  wire   [2:0] bit_cnt;
  wire   [4:0] edge_cnt;

  RXFSM U0_RXFSM ( .RXFSM_bit_cnt(bit_cnt), .RXFSM_RX_IN(UartRx_RX_IN), 
        .RXFSM_par_err(par_err), .RXFSM_strt_glitch(strt_glitch), 
        .RXFSM_stp_err(stp_err), .RXFSM_PAR_EN(UartRx_PAR_EN), .RXFSM_FINISH(
        FINISH), .RXFSM_EdgeFinish(EdgeFinish), .RXFSM_CLK(UartRx_CLK), 
        .RXFSM_RST(n1), .RXFSM_data_samp_en(data_samp_en), .RXFSM_deser_en(
        deser_en), .RXFSM_edge_cnt_enable(edge_cnt_enable), 
        .RXFSM_bit_cnt_enable(bit_cnt_enable), .RXFSM_data_valid(
        UartRx_Data_Valid), .RXFSM_par_chk_en(par_chk_en), .RXFSM_strt_chk_en(
        strt_chk_en), .RXFSM_stp_chk(stp_chk_en) );
  edge_bit_counter U0_edge_bit_counter ( .Cnt_prescale(UartRx_prescale), 
        .Cnt_edge_cnt_enable(edge_cnt_enable), .Cnt_bit_cnt_enable(
        bit_cnt_enable), .Cnt_CLK(UartRx_CLK), .Cnt_RST(n1), .Cnt_edge_cnt(
        edge_cnt), .Cnt_bit_cnt(bit_cnt), .Cnt_EdgeFinish(EdgeFinish) );
  Data_Sampler U0_Data_Sampler ( .Sampler_edge_cnt(edge_cnt), 
        .Sampler_prescale(UartRx_prescale), .Sampler_data_samp_en(data_samp_en), .Sampler_RX_IN(UartRx_RX_IN), .Sampler_CLK(UartRx_CLK), .Sampler_RST(n1), 
        .Sampler_sample(sample), .Sampler_Sample_Valid(Sample_Valid) );
  Deseralizer U0_Deseralizer ( .Deseralizer_SampledData(sample), 
        .Deseralizer_Sample_Valid(Sample_Valid), .Deseralizer_EN(deser_en), 
        .Deseralizer_CLK(UartRx_CLK), .Deseralizer_RST(n1), 
        .Deseralizer_PDATA(UartRx_PDATA) );
  Strt_Check U0_Strt_Check ( .StrtChk_EN(strt_chk_en), .StrtChk_Sample_Valid(
        Sample_Valid), .StrtChk_sample(sample), .StrtChk_glitch(strt_glitch)
         );
  Parity_Check U0_Parity_Check ( .ParityCheck_PDATA(UartRx_PDATA), 
        .ParityCheck_EN(par_chk_en), .ParityCheck_PAR_TYP(UartRx_Par_Type), 
        .ParityCheck_sample(sample), .ParityCheck_Sample_Valid(Sample_Valid), 
        .ParityCheck_Par_err(par_err) );
  Stop_Check U0_Stop_Check ( .StpChk_stp_chk_en(stp_chk_en), .StpChk_sample(
        sample), .StpChk_Sample_Valid(Sample_Valid), .StpChk_stp_err(stp_err), 
        .StpChk_finish(FINISH) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(UartRx_RST), .Y(n2) );
endmodule


module InputBuffer ( Buffer_Pdata_in, Buffer_ParityEn_in, Buffer_ParBit_in, 
        Buffer_EN, Buffer_CLK, Buffer_RST_ASYN, Buffer_Pdata_out, 
        Buffer_ParityEn_out, Buffer_ParBit_out );
  input [7:0] Buffer_Pdata_in;
  output [7:0] Buffer_Pdata_out;
  input Buffer_ParityEn_in, Buffer_ParBit_in, Buffer_EN, Buffer_CLK,
         Buffer_RST_ASYN;
  output Buffer_ParityEn_out, Buffer_ParBit_out;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n1, n12;

  DFFRQX2M Buffer_ParityEn_out_reg ( .D(n3), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_ParityEn_out) );
  DFFRQX2M \Buffer_Pdata_out_reg[6]  ( .D(n10), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_Pdata_out[6]) );
  DFFRQX2M \Buffer_Pdata_out_reg[2]  ( .D(n6), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_Pdata_out[2]) );
  DFFRQX2M \Buffer_Pdata_out_reg[7]  ( .D(n11), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_Pdata_out[7]) );
  DFFRQX2M \Buffer_Pdata_out_reg[3]  ( .D(n7), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_Pdata_out[3]) );
  DFFRQX2M \Buffer_Pdata_out_reg[5]  ( .D(n9), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_Pdata_out[5]) );
  DFFRQX2M \Buffer_Pdata_out_reg[1]  ( .D(n5), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_Pdata_out[1]) );
  DFFRQX2M \Buffer_Pdata_out_reg[4]  ( .D(n8), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_Pdata_out[4]) );
  DFFRQX2M \Buffer_Pdata_out_reg[0]  ( .D(n4), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_Pdata_out[0]) );
  DFFRQX2M Buffer_ParBit_out_reg ( .D(n2), .CK(Buffer_CLK), .RN(
        Buffer_RST_ASYN), .Q(Buffer_ParBit_out) );
  INVX2M U2 ( .A(n1), .Y(n12) );
  BUFX2M U3 ( .A(Buffer_EN), .Y(n1) );
  AO22X1M U4 ( .A0(Buffer_ParBit_in), .A1(n1), .B0(Buffer_ParBit_out), .B1(n12), .Y(n2) );
  AO22X1M U5 ( .A0(Buffer_ParityEn_in), .A1(n1), .B0(Buffer_ParityEn_out), 
        .B1(n12), .Y(n3) );
  AO22X1M U6 ( .A0(Buffer_Pdata_in[0]), .A1(n1), .B0(Buffer_Pdata_out[0]), 
        .B1(n12), .Y(n4) );
  AO22X1M U7 ( .A0(Buffer_Pdata_in[1]), .A1(n1), .B0(Buffer_Pdata_out[1]), 
        .B1(n12), .Y(n5) );
  AO22X1M U8 ( .A0(Buffer_Pdata_in[2]), .A1(n1), .B0(Buffer_Pdata_out[2]), 
        .B1(n12), .Y(n6) );
  AO22X1M U9 ( .A0(Buffer_Pdata_in[3]), .A1(n1), .B0(Buffer_Pdata_out[3]), 
        .B1(n12), .Y(n7) );
  AO22X1M U10 ( .A0(Buffer_Pdata_in[4]), .A1(n1), .B0(Buffer_Pdata_out[4]), 
        .B1(n12), .Y(n8) );
  AO22X1M U11 ( .A0(Buffer_Pdata_in[5]), .A1(n1), .B0(Buffer_Pdata_out[5]), 
        .B1(n12), .Y(n9) );
  AO22X1M U12 ( .A0(Buffer_Pdata_in[6]), .A1(n1), .B0(Buffer_Pdata_out[6]), 
        .B1(n12), .Y(n10) );
  AO22X1M U13 ( .A0(Buffer_Pdata_in[7]), .A1(n1), .B0(Buffer_Pdata_out[7]), 
        .B1(n12), .Y(n11) );
endmodule


module Parity_Calc ( ParityCalc_PDATA, ParityCalc_DataValid, 
        ParityCalc_ParType, ParityCalc_ParBit );
  input [7:0] ParityCalc_PDATA;
  input ParityCalc_DataValid, ParityCalc_ParType;
  output ParityCalc_ParBit;
  wire   n1, n2, n3, n4;

  XNOR2X2M U1 ( .A(ParityCalc_PDATA[7]), .B(ParityCalc_PDATA[6]), .Y(n4) );
  XOR3XLM U2 ( .A(ParityCalc_ParType), .B(n1), .C(n2), .Y(ParityCalc_ParBit)
         );
  XOR3XLM U3 ( .A(ParityCalc_PDATA[1]), .B(ParityCalc_PDATA[0]), .C(n3), .Y(n2) );
  XOR3XLM U4 ( .A(ParityCalc_PDATA[5]), .B(ParityCalc_PDATA[4]), .C(n4), .Y(n1) );
  XNOR2X2M U5 ( .A(ParityCalc_PDATA[3]), .B(ParityCalc_PDATA[2]), .Y(n3) );
endmodule


module FSM ( FSM_RST_ASYN, FSM_CLK, FSM_DataValid, FSM_SerDone, FSM_ParEn, 
        FSM_SerEn, FSM_MuxSel, FSM_Busy, FSM_BuffEn );
  output [1:0] FSM_MuxSel;
  input FSM_RST_ASYN, FSM_CLK, FSM_DataValid, FSM_SerDone, FSM_ParEn;
  output FSM_SerEn, FSM_Busy, FSM_BuffEn;
  wire   n2, n5, n6, n7, n8, n9, n10, n1, n3, n4;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;

  DFFRQX2M \Current_State_reg[0]  ( .D(Next_State[0]), .CK(FSM_CLK), .RN(
        FSM_RST_ASYN), .Q(Current_State[0]) );
  DFFRX1M \Current_State_reg[1]  ( .D(Next_State[1]), .CK(FSM_CLK), .RN(
        FSM_RST_ASYN), .QN(n2) );
  DFFRX1M \Current_State_reg[2]  ( .D(Next_State[2]), .CK(FSM_CLK), .RN(
        FSM_RST_ASYN), .Q(Current_State[2]), .QN(n4) );
  INVX2M U3 ( .A(n7), .Y(FSM_SerEn) );
  NAND2X2M U4 ( .A(n6), .B(FSM_MuxSel[1]), .Y(n7) );
  OAI21X2M U5 ( .A0(n4), .A1(n1), .B0(FSM_Busy), .Y(FSM_BuffEn) );
  OR2X2M U6 ( .A(n10), .B(FSM_MuxSel[0]), .Y(FSM_Busy) );
  NOR2X2M U7 ( .A(n2), .B(Current_State[2]), .Y(FSM_MuxSel[1]) );
  NOR2X2M U8 ( .A(n3), .B(Current_State[2]), .Y(FSM_MuxSel[0]) );
  INVX2M U9 ( .A(Current_State[0]), .Y(n3) );
  AOI21X2M U10 ( .A0(n2), .A1(Current_State[0]), .B0(n10), .Y(n6) );
  NOR2X2M U11 ( .A(n2), .B(Current_State[0]), .Y(n10) );
  OAI2B2X1M U12 ( .A1N(FSM_MuxSel[0]), .A0(n8), .B0(n9), .B1(n1), .Y(
        Next_State[0]) );
  NOR2BX2M U13 ( .AN(FSM_SerDone), .B(n2), .Y(n8) );
  AOI22X1M U14 ( .A0(Current_State[2]), .A1(n10), .B0(n2), .B1(n4), .Y(n9) );
  OAI21X2M U15 ( .A0(Current_State[2]), .A1(n6), .B0(n7), .Y(Next_State[1]) );
  NOR2BX2M U16 ( .AN(FSM_MuxSel[1]), .B(n5), .Y(Next_State[2]) );
  AOI2B1X1M U17 ( .A1N(FSM_ParEn), .A0(FSM_SerDone), .B0(n3), .Y(n5) );
  INVX2M U18 ( .A(FSM_DataValid), .Y(n1) );
endmodule


module counter ( counter_RST_ASYN, counter_CLK, counter_En, counter_finish, 
        count );
  output [2:0] count;
  input counter_RST_ASYN, counter_CLK, counter_En;
  output counter_finish;
  wire   n1, n3, n4, n5, n6, n7, n2;

  DFFRQX2M \count_reg[0]  ( .D(n7), .CK(counter_CLK), .RN(counter_RST_ASYN), 
        .Q(count[0]) );
  DFFRX1M \count_reg[2]  ( .D(n6), .CK(counter_CLK), .RN(counter_RST_ASYN), 
        .Q(count[2]), .QN(n1) );
  DFFRQX2M \count_reg[1]  ( .D(n5), .CK(counter_CLK), .RN(counter_RST_ASYN), 
        .Q(count[1]) );
  INVX2M U3 ( .A(counter_En), .Y(n2) );
  OAI32X1M U4 ( .A0(n2), .A1(n4), .A2(n1), .B0(count[0]), .B1(n2), .Y(n7) );
  NOR2X2M U5 ( .A(n1), .B(n4), .Y(counter_finish) );
  NAND2X2M U6 ( .A(count[1]), .B(count[0]), .Y(n4) );
  AOI2B1X1M U7 ( .A1N(counter_finish), .A0(n3), .B0(n2), .Y(n5) );
  XNOR2X2M U8 ( .A(count[0]), .B(count[1]), .Y(n3) );
  AOI21X2M U9 ( .A0(n4), .A1(n1), .B0(n2), .Y(n6) );
endmodule


module Parallel_To_Serial ( PISO_ParallelData, PISO_Count, PISO_SerialData );
  input [7:0] PISO_ParallelData;
  input [2:0] PISO_Count;
  output PISO_SerialData;
  wire   n1, n2;

  MX2X2M U1 ( .A(n2), .B(n1), .S0(PISO_Count[2]), .Y(PISO_SerialData) );
  MX4X1M U2 ( .A(PISO_ParallelData[4]), .B(PISO_ParallelData[6]), .C(
        PISO_ParallelData[5]), .D(PISO_ParallelData[7]), .S0(PISO_Count[1]), 
        .S1(PISO_Count[0]), .Y(n1) );
  MX4X1M U3 ( .A(PISO_ParallelData[0]), .B(PISO_ParallelData[2]), .C(
        PISO_ParallelData[1]), .D(PISO_ParallelData[3]), .S0(PISO_Count[1]), 
        .S1(PISO_Count[0]), .Y(n2) );
endmodule


module Seralizer ( Seralizer_ParallelData, Seralizer_CLK, Seralizer_RST_ASYN, 
        Seralizer_En, Seralizer_done, Seralizer_SerialData );
  input [7:0] Seralizer_ParallelData;
  input Seralizer_CLK, Seralizer_RST_ASYN, Seralizer_En;
  output Seralizer_done, Seralizer_SerialData;

  wire   [2:0] CountToPISO;

  counter C0 ( .counter_RST_ASYN(Seralizer_RST_ASYN), .counter_CLK(
        Seralizer_CLK), .counter_En(Seralizer_En), .counter_finish(
        Seralizer_done), .count(CountToPISO) );
  Parallel_To_Serial P0 ( .PISO_ParallelData(Seralizer_ParallelData), 
        .PISO_Count(CountToPISO), .PISO_SerialData(Seralizer_SerialData) );
endmodule


module MUX ( Selection_Bits, in_00, in_01, in_10, in_11, MUX_Out );
  input [1:0] Selection_Bits;
  input in_00, in_01, in_10, in_11;
  output MUX_Out;
  wire   n5, n2, n3, n4;

  CLKBUFX8M U1 ( .A(n5), .Y(MUX_Out) );
  OAI2B2X1M U2 ( .A1N(Selection_Bits[1]), .A0(n2), .B0(Selection_Bits[1]), 
        .B1(n3), .Y(n5) );
  AOI22X1M U3 ( .A0(in_00), .A1(n4), .B0(in_01), .B1(Selection_Bits[0]), .Y(n3) );
  AOI22X1M U4 ( .A0(in_10), .A1(n4), .B0(in_11), .B1(Selection_Bits[0]), .Y(n2) );
  INVX2M U5 ( .A(Selection_Bits[0]), .Y(n4) );
endmodule


module Uart_TX_Top ( P_DATA, CLK, RST_ASYN, Data_Valid, PAR_EN, PAR_TYP, 
        TX_OUT, busy );
  input [7:0] P_DATA;
  input CLK, RST_ASYN, Data_Valid, PAR_EN, PAR_TYP;
  output TX_OUT, busy;
  wire   Parity_bit_To_Buffer, BuffEn, Parity_En, Parity_bit, Ser_Done, Ser_En,
         Serial_Data;
  wire   [7:0] Parallel_Data;
  wire   [1:0] FSM_MUXSelection;

  InputBuffer U0_InputBuffer ( .Buffer_Pdata_in(P_DATA), .Buffer_ParityEn_in(
        PAR_EN), .Buffer_ParBit_in(Parity_bit_To_Buffer), .Buffer_EN(BuffEn), 
        .Buffer_CLK(CLK), .Buffer_RST_ASYN(RST_ASYN), .Buffer_Pdata_out(
        Parallel_Data), .Buffer_ParityEn_out(Parity_En), .Buffer_ParBit_out(
        Parity_bit) );
  Parity_Calc U0_Parity_Calc ( .ParityCalc_PDATA(P_DATA), 
        .ParityCalc_DataValid(Data_Valid), .ParityCalc_ParType(PAR_TYP), 
        .ParityCalc_ParBit(Parity_bit_To_Buffer) );
  FSM U0_FSM ( .FSM_RST_ASYN(RST_ASYN), .FSM_CLK(CLK), .FSM_DataValid(
        Data_Valid), .FSM_SerDone(Ser_Done), .FSM_ParEn(Parity_En), 
        .FSM_SerEn(Ser_En), .FSM_MuxSel(FSM_MUXSelection), .FSM_Busy(busy), 
        .FSM_BuffEn(BuffEn) );
  Seralizer U0_Seralizer ( .Seralizer_ParallelData(Parallel_Data), 
        .Seralizer_CLK(CLK), .Seralizer_RST_ASYN(RST_ASYN), .Seralizer_En(
        Ser_En), .Seralizer_done(Ser_Done), .Seralizer_SerialData(Serial_Data)
         );
  MUX U0_MUX ( .Selection_Bits(FSM_MUXSelection), .in_00(1'b1), .in_01(1'b0), 
        .in_10(Parity_bit), .in_11(Serial_Data), .MUX_Out(TX_OUT) );
endmodule


module SYSTEM_TOP ( RX_IN, REF_CLK, UART_CLK, RST, TX_OUT );
  input RX_IN, REF_CLK, UART_CLK, RST;
  output TX_OUT;
  wire   REF_RST, UART_RST, RX_Data_Valid, RX_TO_SYS_Data_Valid,
         SYS_TO_TX_Data_Valid, UART_TX_CLK, TX_Data_Valid, TX_busy, SYS_busy,
         CLK_en, ALU_CLK, Wr_en, Rd_en, Rd_Data_Valid, ALUen, ALUValid, n2, n3,
         n4, n5, n6, n7;
  wire   [7:0] RXData;
  wire   [7:0] RX_TO_SYS_Data;
  wire   [7:0] SYS_TO_TX_Data;
  wire   [7:0] TXData;
  wire   [7:0] Division_Ratio;
  wire   [7:0] WrData;
  wire   [7:0] Addr;
  wire   [7:0] RdData;
  wire   [7:0] OperA;
  wire   [7:0] OperB;
  wire   [7:0] UART_Config;
  wire   [3:0] Function;
  wire   [15:0] ALUOut;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4;

  RST_SYNC_0 U0_RST_SYNC ( .RSTSYNC_CLK(REF_CLK), .RSTSYNC_RST(RST), 
        .RSTSYNC_OUT(REF_RST) );
  RST_SYNC_1 U1_RST_SYNC ( .RSTSYNC_CLK(UART_CLK), .RSTSYNC_RST(RST), 
        .RSTSYNC_OUT(UART_RST) );
  DATA_SYNC_0 U0_DATA_SYNC ( .DataSync_unsync_bus(RXData), 
        .DataSync_bus_enable(RX_Data_Valid), .DataSync_CLK(REF_CLK), 
        .DataSync_RST(n6), .DataSync_sync_bus(RX_TO_SYS_Data), 
        .DataSync_enable_pulse(RX_TO_SYS_Data_Valid) );
  DATA_SYNC_1 U1_DATA_SYNC ( .DataSync_unsync_bus(SYS_TO_TX_Data), 
        .DataSync_bus_enable(SYS_TO_TX_Data_Valid), .DataSync_CLK(UART_TX_CLK), 
        .DataSync_RST(n4), .DataSync_sync_bus(TXData), .DataSync_enable_pulse(
        TX_Data_Valid) );
  BIT_SYNC U0_BIT_SYNC ( .BitSync_ASYNC(TX_busy), .BitSync_CLK(REF_CLK), 
        .BitSync_RST(n6), .BitSync_SYNC(SYS_busy) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLK_en), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  ClkDiv U0_ClkDiv ( .i_div_ratio(Division_Ratio[3:0]), .i_ref_clk(UART_CLK), 
        .i_rst_en(n4), .i_clk_en(1'b1), .o_div_clk(UART_TX_CLK) );
  Register_File U0_Register_File ( .RF_WrData(WrData), .RF_Addr({Addr[7:2], n3, 
        n2}), .RF_Wr_en(Wr_en), .RF_Rd_en(Rd_en), .RF_CLK(REF_CLK), .RF_RST(n6), .RF_RdData(RdData), .REG0(OperA), .REG1(OperB), .REG2({
        SYNOPSYS_UNCONNECTED__0, UART_Config[6:0]}), .REG3({
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, Division_Ratio[3:0]}), .RF_Rd_Data_Valid(Rd_Data_Valid) );
  ALU U0_ALU ( .A(OperA), .B(OperB), .ALU_en(ALUen), .ALU_CLK(ALU_CLK), 
        .ALU_RST(n6), .ALU_FUN(Function), .ALU_OUT(ALUOut), .ALU_Valid(
        ALUValid) );
  SYS_Controller U0_SYS_Controller ( .SYSCont_ALU_Out(ALUOut), 
        .SYSCont_RXPdata(RX_TO_SYS_Data), .SYSCont_RdData(RdData), 
        .SYSCont_ALU_Valid(ALUValid), .SYSCont_RX_Data_Valid(
        RX_TO_SYS_Data_Valid), .SYSCont_Rf_Data_Valid(Rd_Data_Valid), 
        .SYSCont_Busy(SYS_busy), .SYSCont_CLK(REF_CLK), .SYSCont_RST(n6), 
        .SYSCont_TXPdata(SYS_TO_TX_Data), .SYSCont_WrData(WrData), 
        .SYSCont_Addr(Addr), .SYSCont_ALU_Fun(Function), .SYSCont_ALU_en(ALUen), .SYSCont_CLK_en(CLK_en), .SYSCont_Rd_en(Rd_en), .SYSCont_Wr_en(Wr_en), 
        .SYSCont_TX_Data_Valid(SYS_TO_TX_Data_Valid) );
  UART_RX U0_UART_RX ( .UartRx_prescale(UART_Config[6:2]), .UartRx_RX_IN(RX_IN), .UartRx_PAR_EN(UART_Config[0]), .UartRx_Par_Type(UART_Config[1]), 
        .UartRx_CLK(UART_CLK), .UartRx_RST(n4), .UartRx_PDATA(RXData), 
        .UartRx_Data_Valid(RX_Data_Valid) );
  Uart_TX_Top U0_Uart_TX_Top ( .P_DATA(TXData), .CLK(UART_TX_CLK), .RST_ASYN(
        n4), .Data_Valid(TX_Data_Valid), .PAR_EN(UART_Config[0]), .PAR_TYP(
        UART_Config[1]), .TX_OUT(TX_OUT), .busy(TX_busy) );
  BUFX2M U1 ( .A(Addr[0]), .Y(n2) );
  BUFX2M U2 ( .A(Addr[1]), .Y(n3) );
  INVX4M U3 ( .A(n7), .Y(n6) );
  INVX2M U4 ( .A(REF_RST), .Y(n7) );
  INVX4M U5 ( .A(n5), .Y(n4) );
  INVX2M U6 ( .A(UART_RST), .Y(n5) );
endmodule
