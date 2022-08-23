/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Tue Aug 23 04:05:34 2022
/////////////////////////////////////////////////////////////


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  CLKMX2X4M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module RST_SYNC_test_0 ( RSTSYNC_CLK, RSTSYNC_RST, RSTSYNC_OUT, test_si, 
        test_se );
  input RSTSYNC_CLK, RSTSYNC_RST, test_si, test_se;
  output RSTSYNC_OUT;
  wire   \FFSTAGES[0] ;

  SDFFRQX2M \FFSTAGES_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(
        RSTSYNC_CLK), .RN(RSTSYNC_RST), .Q(\FFSTAGES[0] ) );
  SDFFRQX1M \FFSTAGES_reg[1]  ( .D(\FFSTAGES[0] ), .SI(\FFSTAGES[0] ), .SE(
        test_se), .CK(RSTSYNC_CLK), .RN(RSTSYNC_RST), .Q(RSTSYNC_OUT) );
endmodule


module RST_SYNC_test_1 ( RSTSYNC_CLK, RSTSYNC_RST, RSTSYNC_OUT, test_si, 
        test_se );
  input RSTSYNC_CLK, RSTSYNC_RST, test_si, test_se;
  output RSTSYNC_OUT;
  wire   \FFSTAGES[0] ;

  SDFFRQX2M \FFSTAGES_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(
        RSTSYNC_CLK), .RN(RSTSYNC_RST), .Q(\FFSTAGES[0] ) );
  SDFFRQX1M \FFSTAGES_reg[1]  ( .D(\FFSTAGES[0] ), .SI(\FFSTAGES[0] ), .SE(
        test_se), .CK(RSTSYNC_CLK), .RN(RSTSYNC_RST), .Q(RSTSYNC_OUT) );
endmodule


module DATA_SYNC_test_0 ( DataSync_unsync_bus, DataSync_bus_enable, 
        DataSync_CLK, DataSync_RST, DataSync_sync_bus, DataSync_enable_pulse, 
        test_si, test_so, test_se );
  input [7:0] DataSync_unsync_bus;
  output [7:0] DataSync_sync_bus;
  input DataSync_bus_enable, DataSync_CLK, DataSync_RST, test_si, test_se;
  output DataSync_enable_pulse, test_so;
  wire   PulseGenFF, n1, n3, n5, n7, n9, n11, n13, n15, n17, n22;
  wire   [1:0] FFSTAGES;
  assign test_so = PulseGenFF;

  SDFFRQX2M PulseGenFF_reg ( .D(FFSTAGES[1]), .SI(FFSTAGES[1]), .SE(test_se), 
        .CK(DataSync_CLK), .RN(DataSync_RST), .Q(PulseGenFF) );
  SDFFRQX2M \FFSTAGES_reg[1]  ( .D(FFSTAGES[0]), .SI(FFSTAGES[0]), .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(FFSTAGES[1]) );
  SDFFRQX2M \DataSync_sync_bus_reg[6]  ( .D(n15), .SI(DataSync_sync_bus[5]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[6]) );
  SDFFRQX2M \DataSync_sync_bus_reg[2]  ( .D(n7), .SI(DataSync_sync_bus[1]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[2]) );
  SDFFRQX2M \DataSync_sync_bus_reg[3]  ( .D(n9), .SI(DataSync_sync_bus[2]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[3]) );
  SDFFRQX2M \DataSync_sync_bus_reg[7]  ( .D(n17), .SI(DataSync_sync_bus[6]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[7]) );
  SDFFRQX2M \DataSync_sync_bus_reg[4]  ( .D(n11), .SI(DataSync_sync_bus[3]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[4]) );
  SDFFRQX2M \DataSync_sync_bus_reg[0]  ( .D(n3), .SI(DataSync_enable_pulse), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[0]) );
  SDFFRQX2M DataSync_enable_pulse_reg ( .D(n22), .SI(test_si), .SE(test_se), 
        .CK(DataSync_CLK), .RN(DataSync_RST), .Q(DataSync_enable_pulse) );
  SDFFRQX2M \DataSync_sync_bus_reg[5]  ( .D(n13), .SI(DataSync_sync_bus[4]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[5]) );
  SDFFRQX2M \DataSync_sync_bus_reg[1]  ( .D(n5), .SI(DataSync_sync_bus[0]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[1]) );
  SDFFRQX2M \FFSTAGES_reg[0]  ( .D(DataSync_bus_enable), .SI(
        DataSync_sync_bus[7]), .SE(test_se), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(FFSTAGES[0]) );
  INVX2M U3 ( .A(n1), .Y(n22) );
  NAND2BX2M U4 ( .AN(PulseGenFF), .B(FFSTAGES[1]), .Y(n1) );
  AO22X1M U5 ( .A0(DataSync_unsync_bus[0]), .A1(n22), .B0(DataSync_sync_bus[0]), .B1(n1), .Y(n3) );
  AO22X1M U6 ( .A0(DataSync_unsync_bus[1]), .A1(n22), .B0(DataSync_sync_bus[1]), .B1(n1), .Y(n5) );
  AO22X1M U7 ( .A0(DataSync_unsync_bus[2]), .A1(n22), .B0(DataSync_sync_bus[2]), .B1(n1), .Y(n7) );
  AO22X1M U8 ( .A0(DataSync_unsync_bus[3]), .A1(n22), .B0(DataSync_sync_bus[3]), .B1(n1), .Y(n9) );
  AO22X1M U9 ( .A0(DataSync_unsync_bus[4]), .A1(n22), .B0(DataSync_sync_bus[4]), .B1(n1), .Y(n11) );
  AO22X1M U10 ( .A0(DataSync_unsync_bus[5]), .A1(n22), .B0(
        DataSync_sync_bus[5]), .B1(n1), .Y(n13) );
  AO22X1M U11 ( .A0(DataSync_unsync_bus[6]), .A1(n22), .B0(
        DataSync_sync_bus[6]), .B1(n1), .Y(n15) );
  AO22X1M U12 ( .A0(DataSync_unsync_bus[7]), .A1(n22), .B0(
        DataSync_sync_bus[7]), .B1(n1), .Y(n17) );
endmodule


module DATA_SYNC_test_1 ( DataSync_unsync_bus, DataSync_bus_enable, 
        DataSync_CLK, DataSync_RST, DataSync_sync_bus, DataSync_enable_pulse, 
        test_si, test_so, test_se );
  input [7:0] DataSync_unsync_bus;
  output [7:0] DataSync_sync_bus;
  input DataSync_bus_enable, DataSync_CLK, DataSync_RST, test_si, test_se;
  output DataSync_enable_pulse, test_so;
  wire   PulseGenFF, n22, n27, n29, n31, n33, n35, n37, n39, n41, n43;
  wire   [1:0] FFSTAGES;
  assign test_so = PulseGenFF;

  SDFFRQX2M PulseGenFF_reg ( .D(FFSTAGES[1]), .SI(FFSTAGES[1]), .SE(test_se), 
        .CK(DataSync_CLK), .RN(DataSync_RST), .Q(PulseGenFF) );
  SDFFRQX2M \DataSync_sync_bus_reg[5]  ( .D(n31), .SI(DataSync_sync_bus[4]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[5]) );
  SDFFRQX2M \DataSync_sync_bus_reg[1]  ( .D(n39), .SI(DataSync_sync_bus[0]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[1]) );
  SDFFRQX2M \DataSync_sync_bus_reg[4]  ( .D(n33), .SI(DataSync_sync_bus[3]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[4]) );
  SDFFRQX2M \DataSync_sync_bus_reg[0]  ( .D(n41), .SI(DataSync_enable_pulse), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[0]) );
  SDFFRQX2M DataSync_enable_pulse_reg ( .D(n22), .SI(test_si), .SE(test_se), 
        .CK(DataSync_CLK), .RN(DataSync_RST), .Q(DataSync_enable_pulse) );
  SDFFRQX2M \DataSync_sync_bus_reg[7]  ( .D(n27), .SI(DataSync_sync_bus[6]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[7]) );
  SDFFRQX2M \DataSync_sync_bus_reg[3]  ( .D(n35), .SI(DataSync_sync_bus[2]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[3]) );
  SDFFRQX2M \FFSTAGES_reg[1]  ( .D(FFSTAGES[0]), .SI(FFSTAGES[0]), .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(FFSTAGES[1]) );
  SDFFRQX2M \DataSync_sync_bus_reg[6]  ( .D(n29), .SI(DataSync_sync_bus[5]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[6]) );
  SDFFRQX2M \DataSync_sync_bus_reg[2]  ( .D(n37), .SI(DataSync_sync_bus[1]), 
        .SE(test_se), .CK(DataSync_CLK), .RN(DataSync_RST), .Q(
        DataSync_sync_bus[2]) );
  SDFFRQX2M \FFSTAGES_reg[0]  ( .D(DataSync_bus_enable), .SI(
        DataSync_sync_bus[7]), .SE(test_se), .CK(DataSync_CLK), .RN(
        DataSync_RST), .Q(FFSTAGES[0]) );
  INVX2M U3 ( .A(n43), .Y(n22) );
  NAND2BX2M U4 ( .AN(PulseGenFF), .B(FFSTAGES[1]), .Y(n43) );
  AO22X1M U5 ( .A0(DataSync_unsync_bus[0]), .A1(n22), .B0(DataSync_sync_bus[0]), .B1(n43), .Y(n41) );
  AO22X1M U6 ( .A0(DataSync_unsync_bus[1]), .A1(n22), .B0(DataSync_sync_bus[1]), .B1(n43), .Y(n39) );
  AO22X1M U7 ( .A0(DataSync_unsync_bus[2]), .A1(n22), .B0(DataSync_sync_bus[2]), .B1(n43), .Y(n37) );
  AO22X1M U8 ( .A0(DataSync_unsync_bus[3]), .A1(n22), .B0(DataSync_sync_bus[3]), .B1(n43), .Y(n35) );
  AO22X1M U9 ( .A0(DataSync_unsync_bus[4]), .A1(n22), .B0(DataSync_sync_bus[4]), .B1(n43), .Y(n33) );
  AO22X1M U10 ( .A0(DataSync_unsync_bus[5]), .A1(n22), .B0(
        DataSync_sync_bus[5]), .B1(n43), .Y(n31) );
  AO22X1M U11 ( .A0(DataSync_unsync_bus[6]), .A1(n22), .B0(
        DataSync_sync_bus[6]), .B1(n43), .Y(n29) );
  AO22X1M U12 ( .A0(DataSync_unsync_bus[7]), .A1(n22), .B0(
        DataSync_sync_bus[7]), .B1(n43), .Y(n27) );
endmodule


module BIT_SYNC_test_1 ( BitSync_ASYNC, BitSync_CLK, BitSync_RST, BitSync_SYNC, 
        test_si, test_se );
  input [0:0] BitSync_ASYNC;
  output [0:0] BitSync_SYNC;
  input BitSync_CLK, BitSync_RST, test_si, test_se;
  wire   \FFSTAGES[0][0] ;

  SDFFRQX2M \FFSTAGES_reg[0][1]  ( .D(\FFSTAGES[0][0] ), .SI(\FFSTAGES[0][0] ), 
        .SE(test_se), .CK(BitSync_CLK), .RN(BitSync_RST), .Q(BitSync_SYNC[0])
         );
  SDFFRQX2M \FFSTAGES_reg[0][0]  ( .D(BitSync_ASYNC[0]), .SI(test_si), .SE(
        test_se), .CK(BitSync_CLK), .RN(BitSync_RST), .Q(\FFSTAGES[0][0] ) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module ClkDiv_test_1 ( i_div_ratio, i_ref_clk, i_rst_en, i_clk_en, o_div_clk, 
        test_si, test_so, test_se );
  input [3:0] i_div_ratio;
  input i_ref_clk, i_rst_en, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N5, i_clk_en_c, div_clk, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n1, n2, n3, n4, n5, n6, n13;
  wire   [3:0] count;
  wire   [3:0] count_comb;
  assign N5 = i_clk_en;
  assign test_so = i_clk_en_c;

  SDFFRQX2M i_clk_en_c_reg ( .D(N5), .SI(n13), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_en), .Q(i_clk_en_c) );
  SDFFRQX2M div_clk_reg ( .D(n44), .SI(n6), .SE(test_se), .CK(i_ref_clk), .RN(
        i_rst_en), .Q(div_clk) );
  SDFFRQX2M \count_reg[3]  ( .D(count_comb[3]), .SI(n5), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_en), .Q(count[3]) );
  SDFFRQX2M \count_reg[0]  ( .D(count_comb[0]), .SI(test_si), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_en), .Q(count[0]) );
  SDFFRQX2M \count_reg[1]  ( .D(count_comb[1]), .SI(n4), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_en), .Q(count[1]) );
  SDFFRQX2M \count_reg[2]  ( .D(count_comb[2]), .SI(count[1]), .SE(test_se), 
        .CK(i_ref_clk), .RN(i_rst_en), .Q(count[2]) );
  OAI32X1M U9 ( .A0(n30), .A1(n4), .A2(n31), .B0(n32), .B1(n6), .Y(
        count_comb[3]) );
  NAND3X2M U10 ( .A(count[2]), .B(n6), .C(count[1]), .Y(n30) );
  OA21X2M U11 ( .A0(n31), .A1(count[2]), .B0(n33), .Y(n32) );
  OAI32X1M U12 ( .A0(n34), .A1(n4), .A2(n31), .B0(n33), .B1(n5), .Y(
        count_comb[2]) );
  NAND2X2M U13 ( .A(count[1]), .B(n5), .Y(n34) );
  OAI32X1M U14 ( .A0(n1), .A1(div_clk), .A2(n2), .B0(n20), .B1(n13), .Y(n44)
         );
  INVX2M U15 ( .A(N5), .Y(n1) );
  INVX2M U16 ( .A(div_clk), .Y(n13) );
  INVX2M U17 ( .A(n20), .Y(n2) );
  NOR3X2M U18 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), 
        .Y(n28) );
  NAND3X2M U19 ( .A(N5), .B(n22), .C(i_clk_en_c), .Y(n31) );
  AOI21X2M U20 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[0]), .B0(n42), .Y(n43)
         );
  NOR2X2M U21 ( .A(i_div_ratio[1]), .B(i_div_ratio[0]), .Y(n42) );
  NAND4X2M U22 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n22) );
  CLKXOR2X2M U23 ( .A(i_div_ratio[0]), .B(count[0]), .Y(n37) );
  CLKXOR2X2M U24 ( .A(count[1]), .B(n43), .Y(n38) );
  XOR3XLM U25 ( .A(i_div_ratio[2]), .B(n5), .C(n42), .Y(n36) );
  AOI2BB1X2M U26 ( .A0N(count[1]), .A1N(n31), .B0(count_comb[0]), .Y(n33) );
  NOR2X2M U27 ( .A(n31), .B(count[0]), .Y(count_comb[0]) );
  NAND3X2M U28 ( .A(n21), .B(n22), .C(N5), .Y(n20) );
  NAND4X2M U29 ( .A(n23), .B(n24), .C(n25), .D(n26), .Y(n21) );
  CLKXOR2X2M U30 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n24) );
  CLKXOR2X2M U31 ( .A(n28), .B(n6), .Y(n23) );
  INVX2M U32 ( .A(count[2]), .Y(n5) );
  CLKXOR2X2M U33 ( .A(count[3]), .B(n40), .Y(n39) );
  AOI2B1X1M U34 ( .A1N(i_div_ratio[0]), .A0(n28), .B0(n41), .Y(n40) );
  AOI2B1X1M U35 ( .A1N(i_div_ratio[2]), .A0(n42), .B0(n3), .Y(n41) );
  INVX2M U36 ( .A(i_div_ratio[3]), .Y(n3) );
  CLKXOR2X2M U37 ( .A(n5), .B(n27), .Y(n26) );
  NAND2BX2M U38 ( .AN(n28), .B(n29), .Y(n27) );
  OAI21X2M U39 ( .A0(i_div_ratio[1]), .A1(i_div_ratio[2]), .B0(i_div_ratio[3]), 
        .Y(n29) );
  XOR3XLM U40 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .C(count[1]), .Y(n25)
         );
  NOR2X2M U41 ( .A(n35), .B(n31), .Y(count_comb[1]) );
  CLKXOR2X2M U42 ( .A(n4), .B(count[1]), .Y(n35) );
  INVX2M U43 ( .A(count[0]), .Y(n4) );
  INVX2M U44 ( .A(count[3]), .Y(n6) );
  MX2X2M U45 ( .A(i_ref_clk), .B(div_clk), .S0(N5), .Y(o_div_clk) );
endmodule


module Register_File_test_1 ( RF_WrData, RF_Addr, RF_Wr_en, RF_Rd_en, RF_CLK, 
        RF_RST, RF_RdData, REG0, REG1, REG2, REG3, RF_Rd_Data_Valid, test_si2, 
        test_si1, test_so2, test_so1, test_se );
  input [7:0] RF_WrData;
  input [7:0] RF_Addr;
  output [7:0] RF_RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input RF_Wr_en, RF_Rd_en, RF_CLK, RF_RST, test_si2, test_si1, test_se;
  output RF_Rd_Data_Valid, test_so2, test_so1;
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
         \registers[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, N61, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366;
  assign N11 = RF_Addr[0];
  assign N12 = RF_Addr[1];
  assign N13 = RF_Addr[2];
  assign N14 = RF_Addr[3];
  assign test_so2 = \registers[15][7] ;
  assign test_so1 = \registers[5][0] ;

  SDFFRQX2M \RF_RdData_reg[7]  ( .D(n185), .SI(RF_RdData[6]), .SE(test_se), 
        .CK(RF_CLK), .RN(n344), .Q(RF_RdData[7]) );
  SDFFRQX2M \RF_RdData_reg[6]  ( .D(n184), .SI(RF_RdData[5]), .SE(test_se), 
        .CK(RF_CLK), .RN(n343), .Q(RF_RdData[6]) );
  SDFFRQX2M \RF_RdData_reg[5]  ( .D(n183), .SI(RF_RdData[4]), .SE(test_se), 
        .CK(RF_CLK), .RN(n343), .Q(RF_RdData[5]) );
  SDFFRQX2M \RF_RdData_reg[4]  ( .D(n182), .SI(RF_RdData[3]), .SE(test_se), 
        .CK(RF_CLK), .RN(n343), .Q(RF_RdData[4]) );
  SDFFRQX2M \RF_RdData_reg[3]  ( .D(n181), .SI(RF_RdData[2]), .SE(test_se), 
        .CK(RF_CLK), .RN(n343), .Q(RF_RdData[3]) );
  SDFFRQX2M \RF_RdData_reg[2]  ( .D(n180), .SI(RF_RdData[1]), .SE(test_se), 
        .CK(RF_CLK), .RN(n344), .Q(RF_RdData[2]) );
  SDFFRQX2M \RF_RdData_reg[1]  ( .D(n179), .SI(RF_RdData[0]), .SE(test_se), 
        .CK(RF_CLK), .RN(n343), .Q(RF_RdData[1]) );
  SDFFRQX2M \RF_RdData_reg[0]  ( .D(n178), .SI(test_si1), .SE(test_se), .CK(
        RF_CLK), .RN(n347), .Q(RF_RdData[0]) );
  SDFFRQX2M \registers_reg[13][7]  ( .D(n297), .SI(\registers[13][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[13][7] ) );
  SDFFRQX2M \registers_reg[13][6]  ( .D(n296), .SI(\registers[13][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[13][6] ) );
  SDFFRQX2M \registers_reg[13][5]  ( .D(n295), .SI(\registers[13][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[13][5] ) );
  SDFFRQX2M \registers_reg[13][4]  ( .D(n294), .SI(\registers[13][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[13][4] ) );
  SDFFRQX2M \registers_reg[13][3]  ( .D(n293), .SI(\registers[13][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[13][3] ) );
  SDFFRQX2M \registers_reg[13][2]  ( .D(n292), .SI(\registers[13][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[13][2] ) );
  SDFFRQX2M \registers_reg[13][1]  ( .D(n291), .SI(\registers[13][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[13][1] ) );
  SDFFRQX2M \registers_reg[13][0]  ( .D(n290), .SI(\registers[12][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[13][0] ) );
  SDFFRQX2M \registers_reg[9][7]  ( .D(n265), .SI(\registers[9][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[9][7] ) );
  SDFFRQX2M \registers_reg[9][6]  ( .D(n264), .SI(\registers[9][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[9][6] ) );
  SDFFRQX2M \registers_reg[9][5]  ( .D(n263), .SI(\registers[9][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[9][5] ) );
  SDFFRQX2M \registers_reg[9][4]  ( .D(n262), .SI(\registers[9][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[9][4] ) );
  SDFFRQX2M \registers_reg[9][3]  ( .D(n261), .SI(\registers[9][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[9][3] ) );
  SDFFRQX2M \registers_reg[9][2]  ( .D(n260), .SI(\registers[9][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[9][2] ) );
  SDFFRQX2M \registers_reg[9][1]  ( .D(n259), .SI(\registers[9][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[9][1] ) );
  SDFFRQX2M \registers_reg[9][0]  ( .D(n258), .SI(\registers[8][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[9][0] ) );
  SDFFRQX2M \registers_reg[5][7]  ( .D(n233), .SI(\registers[5][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[5][7] ) );
  SDFFRQX2M \registers_reg[5][6]  ( .D(n232), .SI(\registers[5][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[5][6] ) );
  SDFFRQX2M \registers_reg[5][5]  ( .D(n231), .SI(\registers[5][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[5][5] ) );
  SDFFRQX2M \registers_reg[5][4]  ( .D(n230), .SI(\registers[5][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[5][4] ) );
  SDFFRQX2M \registers_reg[5][3]  ( .D(n229), .SI(\registers[5][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[5][3] ) );
  SDFFRQX2M \registers_reg[5][2]  ( .D(n228), .SI(\registers[5][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[5][2] ) );
  SDFFRQX2M \registers_reg[5][1]  ( .D(n227), .SI(test_si2), .SE(test_se), 
        .CK(RF_CLK), .RN(n346), .Q(\registers[5][1] ) );
  SDFFRQX2M \registers_reg[5][0]  ( .D(n226), .SI(\registers[4][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[5][0] ) );
  SDFFRQX2M \registers_reg[15][7]  ( .D(n313), .SI(\registers[15][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n343), .Q(\registers[15][7] ) );
  SDFFRQX2M \registers_reg[15][6]  ( .D(n312), .SI(\registers[15][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[15][6] ) );
  SDFFRQX2M \registers_reg[15][5]  ( .D(n311), .SI(\registers[15][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[15][5] ) );
  SDFFRQX2M \registers_reg[15][4]  ( .D(n310), .SI(\registers[15][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[15][4] ) );
  SDFFRQX2M \registers_reg[15][3]  ( .D(n309), .SI(\registers[15][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[15][3] ) );
  SDFFRQX2M \registers_reg[15][2]  ( .D(n308), .SI(\registers[15][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[15][2] ) );
  SDFFRQX2M \registers_reg[15][1]  ( .D(n307), .SI(\registers[15][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[15][1] ) );
  SDFFRQX2M \registers_reg[15][0]  ( .D(n306), .SI(\registers[14][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[15][0] ) );
  SDFFRQX2M \registers_reg[11][7]  ( .D(n281), .SI(\registers[11][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[11][7] ) );
  SDFFRQX2M \registers_reg[11][6]  ( .D(n280), .SI(\registers[11][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[11][6] ) );
  SDFFRQX2M \registers_reg[11][5]  ( .D(n279), .SI(\registers[11][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[11][5] ) );
  SDFFRQX2M \registers_reg[11][4]  ( .D(n278), .SI(\registers[11][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[11][4] ) );
  SDFFRQX2M \registers_reg[11][3]  ( .D(n277), .SI(\registers[11][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[11][3] ) );
  SDFFRQX2M \registers_reg[11][2]  ( .D(n276), .SI(\registers[11][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[11][2] ) );
  SDFFRQX2M \registers_reg[11][1]  ( .D(n275), .SI(\registers[11][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[11][1] ) );
  SDFFRQX2M \registers_reg[11][0]  ( .D(n274), .SI(\registers[10][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[11][0] ) );
  SDFFRQX2M \registers_reg[7][7]  ( .D(n249), .SI(\registers[7][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[7][7] ) );
  SDFFRQX2M \registers_reg[7][6]  ( .D(n248), .SI(\registers[7][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[7][6] ) );
  SDFFRQX2M \registers_reg[7][5]  ( .D(n247), .SI(\registers[7][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[7][5] ) );
  SDFFRQX2M \registers_reg[7][4]  ( .D(n246), .SI(\registers[7][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[7][4] ) );
  SDFFRQX2M \registers_reg[7][3]  ( .D(n245), .SI(\registers[7][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[7][3] ) );
  SDFFRQX2M \registers_reg[7][2]  ( .D(n244), .SI(\registers[7][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[7][2] ) );
  SDFFRQX2M \registers_reg[7][1]  ( .D(n243), .SI(\registers[7][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[7][1] ) );
  SDFFRQX2M \registers_reg[7][0]  ( .D(n242), .SI(\registers[6][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[7][0] ) );
  SDFFRQX2M \registers_reg[3][7]  ( .D(n217), .SI(REG3[6]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG3[7]) );
  SDFFRQX2M \registers_reg[3][6]  ( .D(n216), .SI(REG3[5]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG3[6]) );
  SDFFRQX2M \registers_reg[3][5]  ( .D(n215), .SI(REG3[4]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG3[5]) );
  SDFFRQX2M \registers_reg[3][4]  ( .D(n214), .SI(REG3[3]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG3[4]) );
  SDFFRQX2M \registers_reg[14][7]  ( .D(n305), .SI(\registers[14][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[14][7] ) );
  SDFFRQX2M \registers_reg[14][6]  ( .D(n304), .SI(\registers[14][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[14][6] ) );
  SDFFRQX2M \registers_reg[14][5]  ( .D(n303), .SI(\registers[14][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[14][5] ) );
  SDFFRQX2M \registers_reg[14][4]  ( .D(n302), .SI(\registers[14][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[14][4] ) );
  SDFFRQX2M \registers_reg[14][3]  ( .D(n301), .SI(\registers[14][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n352), .Q(\registers[14][3] ) );
  SDFFRQX2M \registers_reg[14][2]  ( .D(n300), .SI(\registers[14][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[14][2] ) );
  SDFFRQX2M \registers_reg[14][1]  ( .D(n299), .SI(\registers[14][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[14][1] ) );
  SDFFRQX2M \registers_reg[14][0]  ( .D(n298), .SI(\registers[13][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[14][0] ) );
  SDFFRQX2M \registers_reg[10][7]  ( .D(n273), .SI(\registers[10][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[10][7] ) );
  SDFFRQX2M \registers_reg[10][6]  ( .D(n272), .SI(\registers[10][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[10][6] ) );
  SDFFRQX2M \registers_reg[10][5]  ( .D(n271), .SI(\registers[10][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[10][5] ) );
  SDFFRQX2M \registers_reg[10][4]  ( .D(n270), .SI(\registers[10][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[10][4] ) );
  SDFFRQX2M \registers_reg[10][3]  ( .D(n269), .SI(\registers[10][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[10][3] ) );
  SDFFRQX2M \registers_reg[10][2]  ( .D(n268), .SI(\registers[10][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[10][2] ) );
  SDFFRQX2M \registers_reg[10][1]  ( .D(n267), .SI(\registers[10][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[10][1] ) );
  SDFFRQX2M \registers_reg[10][0]  ( .D(n266), .SI(\registers[9][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n349), .Q(\registers[10][0] ) );
  SDFFRQX2M \registers_reg[6][7]  ( .D(n241), .SI(\registers[6][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[6][7] ) );
  SDFFRQX2M \registers_reg[6][6]  ( .D(n240), .SI(\registers[6][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[6][6] ) );
  SDFFRQX2M \registers_reg[6][5]  ( .D(n239), .SI(\registers[6][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[6][5] ) );
  SDFFRQX2M \registers_reg[6][4]  ( .D(n238), .SI(\registers[6][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[6][4] ) );
  SDFFRQX2M \registers_reg[6][3]  ( .D(n237), .SI(\registers[6][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[6][3] ) );
  SDFFRQX2M \registers_reg[6][2]  ( .D(n236), .SI(\registers[6][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[6][2] ) );
  SDFFRQX2M \registers_reg[6][1]  ( .D(n235), .SI(\registers[6][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[6][1] ) );
  SDFFRQX2M \registers_reg[6][0]  ( .D(n234), .SI(\registers[5][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n347), .Q(\registers[6][0] ) );
  SDFFRQX2M \registers_reg[2][7]  ( .D(n209), .SI(REG2[6]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG2[7]) );
  SDFFRQX2M \registers_reg[12][7]  ( .D(n289), .SI(\registers[12][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[12][7] ) );
  SDFFRQX2M \registers_reg[12][6]  ( .D(n288), .SI(\registers[12][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[12][6] ) );
  SDFFRQX2M \registers_reg[12][5]  ( .D(n287), .SI(\registers[12][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n351), .Q(\registers[12][5] ) );
  SDFFRQX2M \registers_reg[12][4]  ( .D(n286), .SI(\registers[12][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[12][4] ) );
  SDFFRQX2M \registers_reg[12][3]  ( .D(n285), .SI(\registers[12][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[12][3] ) );
  SDFFRQX2M \registers_reg[12][2]  ( .D(n284), .SI(\registers[12][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[12][2] ) );
  SDFFRQX2M \registers_reg[12][1]  ( .D(n283), .SI(\registers[12][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[12][1] ) );
  SDFFRQX2M \registers_reg[12][0]  ( .D(n282), .SI(\registers[11][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n350), .Q(\registers[12][0] ) );
  SDFFRQX2M \registers_reg[8][7]  ( .D(n257), .SI(\registers[8][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[8][7] ) );
  SDFFRQX2M \registers_reg[8][6]  ( .D(n256), .SI(\registers[8][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[8][6] ) );
  SDFFRQX2M \registers_reg[8][5]  ( .D(n255), .SI(\registers[8][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[8][5] ) );
  SDFFRQX2M \registers_reg[8][4]  ( .D(n254), .SI(\registers[8][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[8][4] ) );
  SDFFRQX2M \registers_reg[8][3]  ( .D(n253), .SI(\registers[8][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[8][3] ) );
  SDFFRQX2M \registers_reg[8][2]  ( .D(n252), .SI(\registers[8][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[8][2] ) );
  SDFFRQX2M \registers_reg[8][1]  ( .D(n251), .SI(\registers[8][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[8][1] ) );
  SDFFRQX2M \registers_reg[8][0]  ( .D(n250), .SI(\registers[7][7] ), .SE(
        test_se), .CK(RF_CLK), .RN(n348), .Q(\registers[8][0] ) );
  SDFFRQX2M \registers_reg[4][7]  ( .D(n225), .SI(\registers[4][6] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[4][7] ) );
  SDFFRQX2M \registers_reg[4][6]  ( .D(n224), .SI(\registers[4][5] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[4][6] ) );
  SDFFRQX2M \registers_reg[4][5]  ( .D(n223), .SI(\registers[4][4] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[4][5] ) );
  SDFFRQX2M \registers_reg[4][4]  ( .D(n222), .SI(\registers[4][3] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[4][4] ) );
  SDFFRQX2M \registers_reg[4][3]  ( .D(n221), .SI(\registers[4][2] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[4][3] ) );
  SDFFRQX2M \registers_reg[4][2]  ( .D(n220), .SI(\registers[4][1] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[4][2] ) );
  SDFFRQX2M \registers_reg[4][1]  ( .D(n219), .SI(\registers[4][0] ), .SE(
        test_se), .CK(RF_CLK), .RN(n346), .Q(\registers[4][1] ) );
  SDFFRQX2M \registers_reg[4][0]  ( .D(n218), .SI(REG3[7]), .SE(test_se), .CK(
        RF_CLK), .RN(n346), .Q(\registers[4][0] ) );
  SDFFRQX2M \registers_reg[2][0]  ( .D(n202), .SI(REG1[7]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG2[0]) );
  SDFFRQX2M RF_Rd_Data_Valid_reg ( .D(N61), .SI(RF_RdData[7]), .SE(test_se), 
        .CK(RF_CLK), .RN(n343), .Q(RF_Rd_Data_Valid) );
  SDFFRQX2M \registers_reg[1][6]  ( .D(n200), .SI(REG1[5]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG1[6]) );
  SDFFRQX2M \registers_reg[0][7]  ( .D(n193), .SI(REG0[6]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG0[7]) );
  SDFFRQX2M \registers_reg[0][6]  ( .D(n192), .SI(REG0[5]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG0[6]) );
  SDFFRQX2M \registers_reg[0][5]  ( .D(n191), .SI(REG0[4]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG0[5]) );
  SDFFRQX2M \registers_reg[0][4]  ( .D(n190), .SI(REG0[3]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG0[4]) );
  SDFFRQX2M \registers_reg[0][3]  ( .D(n189), .SI(REG0[2]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG0[3]) );
  SDFFRQX2M \registers_reg[0][2]  ( .D(n188), .SI(REG0[1]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG0[2]) );
  SDFFRQX2M \registers_reg[0][1]  ( .D(n187), .SI(REG0[0]), .SE(test_se), .CK(
        RF_CLK), .RN(n343), .Q(REG0[1]) );
  SDFFRQX2M \registers_reg[0][0]  ( .D(n186), .SI(RF_Rd_Data_Valid), .SE(
        test_se), .CK(RF_CLK), .RN(n343), .Q(REG0[0]) );
  SDFFRQX2M \registers_reg[2][1]  ( .D(n203), .SI(REG2[0]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG2[1]) );
  SDFFRQX2M \registers_reg[1][7]  ( .D(n201), .SI(REG1[6]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG1[7]) );
  SDFFRQX2M \registers_reg[1][5]  ( .D(n199), .SI(REG1[4]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG1[5]) );
  SDFFRQX2M \registers_reg[1][4]  ( .D(n198), .SI(REG1[3]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG1[4]) );
  SDFFRQX2M \registers_reg[1][1]  ( .D(n195), .SI(REG1[0]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG1[1]) );
  SDFFRQX2M \registers_reg[1][3]  ( .D(n197), .SI(REG1[2]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG1[3]) );
  SDFFRQX2M \registers_reg[1][2]  ( .D(n196), .SI(REG1[1]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG1[2]) );
  SDFFRQX2M \registers_reg[1][0]  ( .D(n194), .SI(REG0[7]), .SE(test_se), .CK(
        RF_CLK), .RN(n344), .Q(REG1[0]) );
  SDFFSQX2M \registers_reg[3][3]  ( .D(n213), .SI(REG3[2]), .SE(test_se), .CK(
        RF_CLK), .SN(n343), .Q(REG3[3]) );
  SDFFRQX2M \registers_reg[3][2]  ( .D(n212), .SI(REG3[1]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG3[2]) );
  SDFFRQX2M \registers_reg[3][0]  ( .D(n210), .SI(REG2[7]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG3[0]) );
  SDFFRQX2M \registers_reg[3][1]  ( .D(n211), .SI(REG3[0]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG3[1]) );
  SDFFSQX2M \registers_reg[2][2]  ( .D(n204), .SI(REG2[1]), .SE(test_se), .CK(
        RF_CLK), .SN(n343), .Q(REG2[2]) );
  SDFFSQX2M \registers_reg[2][3]  ( .D(n205), .SI(REG2[2]), .SE(test_se), .CK(
        RF_CLK), .SN(n343), .Q(REG2[3]) );
  SDFFRQX2M \registers_reg[2][6]  ( .D(n208), .SI(REG2[5]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG2[6]) );
  SDFFRQX2M \registers_reg[2][5]  ( .D(n207), .SI(REG2[4]), .SE(test_se), .CK(
        RF_CLK), .RN(n345), .Q(REG2[5]) );
  SDFFSQX1M \registers_reg[2][4]  ( .D(n206), .SI(REG2[3]), .SE(test_se), .CK(
        RF_CLK), .SN(RF_RST), .Q(REG2[4]) );
  NOR2X2M U141 ( .A(n342), .B(N13), .Y(n156) );
  NOR2X2M U142 ( .A(N12), .B(N13), .Y(n151) );
  INVX2M U143 ( .A(n338), .Y(n339) );
  INVX2M U144 ( .A(n336), .Y(n337) );
  INVX2M U145 ( .A(n338), .Y(n340) );
  BUFX2M U146 ( .A(n341), .Y(n338) );
  BUFX2M U147 ( .A(n342), .Y(n336) );
  NAND2X2M U148 ( .A(n156), .B(n152), .Y(n155) );
  NAND2X2M U149 ( .A(n156), .B(n154), .Y(n157) );
  NAND2X2M U150 ( .A(n159), .B(n152), .Y(n158) );
  NAND2X2M U151 ( .A(n159), .B(n154), .Y(n160) );
  NAND2X2M U152 ( .A(n162), .B(n152), .Y(n161) );
  NAND2X2M U153 ( .A(n162), .B(n154), .Y(n164) );
  NAND2X2M U154 ( .A(n167), .B(n159), .Y(n172) );
  NAND2X2M U155 ( .A(n169), .B(n159), .Y(n173) );
  NAND2X2M U156 ( .A(n167), .B(n162), .Y(n174) );
  NAND2X2M U157 ( .A(n169), .B(n162), .Y(n176) );
  NAND2X2M U158 ( .A(n154), .B(n151), .Y(n153) );
  NAND2X2M U159 ( .A(n167), .B(n151), .Y(n166) );
  NAND2X2M U160 ( .A(n169), .B(n151), .Y(n168) );
  NAND2X2M U161 ( .A(n167), .B(n156), .Y(n170) );
  NAND2X2M U162 ( .A(n169), .B(n156), .Y(n171) );
  NAND2X2M U163 ( .A(n151), .B(n152), .Y(n150) );
  AND2X2M U164 ( .A(n163), .B(N11), .Y(n154) );
  AND2X2M U165 ( .A(n175), .B(N11), .Y(n169) );
  NOR2BX2M U166 ( .AN(n165), .B(N14), .Y(n163) );
  AND2X2M U167 ( .A(N13), .B(n342), .Y(n159) );
  AND2X2M U168 ( .A(N13), .B(N12), .Y(n162) );
  AND2X2M U169 ( .A(n163), .B(n341), .Y(n152) );
  AND2X2M U170 ( .A(n175), .B(n341), .Y(n167) );
  AND2X2M U171 ( .A(N14), .B(n165), .Y(n175) );
  BUFX2M U172 ( .A(n357), .Y(n344) );
  BUFX2M U173 ( .A(n356), .Y(n345) );
  BUFX2M U174 ( .A(n356), .Y(n346) );
  BUFX2M U175 ( .A(n355), .Y(n347) );
  BUFX2M U176 ( .A(n355), .Y(n348) );
  BUFX2M U177 ( .A(n354), .Y(n349) );
  BUFX2M U178 ( .A(n354), .Y(n350) );
  BUFX2M U179 ( .A(n353), .Y(n351) );
  BUFX2M U180 ( .A(n357), .Y(n343) );
  BUFX2M U181 ( .A(n353), .Y(n352) );
  INVX2M U182 ( .A(N12), .Y(n342) );
  INVX2M U183 ( .A(N11), .Y(n341) );
  NOR4X1M U184 ( .A(RF_Addr[5]), .B(RF_Addr[4]), .C(n366), .D(n177), .Y(n165)
         );
  OR3X2M U185 ( .A(RF_Rd_en), .B(RF_Addr[7]), .C(RF_Addr[6]), .Y(n177) );
  INVX2M U186 ( .A(RF_Wr_en), .Y(n366) );
  INVX2M U187 ( .A(RF_WrData[0]), .Y(n365) );
  INVX2M U188 ( .A(RF_WrData[1]), .Y(n364) );
  INVX2M U189 ( .A(RF_WrData[2]), .Y(n363) );
  INVX2M U190 ( .A(RF_WrData[3]), .Y(n362) );
  INVX2M U191 ( .A(RF_WrData[4]), .Y(n361) );
  INVX2M U192 ( .A(RF_WrData[5]), .Y(n360) );
  INVX2M U193 ( .A(RF_WrData[6]), .Y(n359) );
  INVX2M U194 ( .A(RF_WrData[7]), .Y(n358) );
  NOR2X2M U195 ( .A(n366), .B(RF_Rd_en), .Y(n149) );
  AND2X2M U196 ( .A(RF_Rd_en), .B(n366), .Y(N61) );
  BUFX2M U197 ( .A(RF_RST), .Y(n356) );
  BUFX2M U198 ( .A(RF_RST), .Y(n355) );
  BUFX2M U199 ( .A(RF_RST), .Y(n354) );
  BUFX2M U200 ( .A(RF_RST), .Y(n353) );
  BUFX2M U201 ( .A(RF_RST), .Y(n357) );
  MX4X1M U202 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n339), 
        .S1(N12), .Y(n146) );
  MX4X1M U203 ( .A(\registers[4][0] ), .B(\registers[5][0] ), .C(
        \registers[6][0] ), .D(\registers[7][0] ), .S0(N11), .S1(N12), .Y(n141) );
  MX4X1M U204 ( .A(\registers[4][1] ), .B(\registers[5][1] ), .C(
        \registers[6][1] ), .D(\registers[7][1] ), .S0(n339), .S1(N12), .Y(
        n145) );
  MX4X1M U205 ( .A(\registers[4][2] ), .B(\registers[5][2] ), .C(
        \registers[6][2] ), .D(\registers[7][2] ), .S0(n339), .S1(n337), .Y(
        n314) );
  MX4X1M U206 ( .A(\registers[4][3] ), .B(\registers[5][3] ), .C(
        \registers[6][3] ), .D(\registers[7][3] ), .S0(n339), .S1(n337), .Y(
        n318) );
  MX4X1M U207 ( .A(\registers[4][4] ), .B(\registers[5][4] ), .C(
        \registers[6][4] ), .D(\registers[7][4] ), .S0(n339), .S1(n337), .Y(
        n322) );
  MX4X1M U208 ( .A(\registers[4][5] ), .B(\registers[5][5] ), .C(
        \registers[6][5] ), .D(\registers[7][5] ), .S0(n340), .S1(N12), .Y(
        n326) );
  MX4X1M U209 ( .A(\registers[4][6] ), .B(\registers[5][6] ), .C(
        \registers[6][6] ), .D(\registers[7][6] ), .S0(n340), .S1(N12), .Y(
        n330) );
  MX4X1M U210 ( .A(\registers[4][7] ), .B(\registers[5][7] ), .C(
        \registers[6][7] ), .D(\registers[7][7] ), .S0(n340), .S1(N12), .Y(
        n334) );
  MX4X1M U211 ( .A(\registers[12][0] ), .B(\registers[13][0] ), .C(
        \registers[14][0] ), .D(\registers[15][0] ), .S0(n340), .S1(n337), .Y(
        n139) );
  MX4X1M U212 ( .A(\registers[12][2] ), .B(\registers[13][2] ), .C(
        \registers[14][2] ), .D(\registers[15][2] ), .S0(n339), .S1(n337), .Y(
        n147) );
  MX4X1M U213 ( .A(\registers[12][3] ), .B(\registers[13][3] ), .C(
        \registers[14][3] ), .D(\registers[15][3] ), .S0(n339), .S1(n337), .Y(
        n316) );
  MX4X1M U214 ( .A(\registers[12][4] ), .B(\registers[13][4] ), .C(
        \registers[14][4] ), .D(\registers[15][4] ), .S0(n339), .S1(n337), .Y(
        n320) );
  MX4X1M U215 ( .A(\registers[12][5] ), .B(\registers[13][5] ), .C(
        \registers[14][5] ), .D(\registers[15][5] ), .S0(n340), .S1(N12), .Y(
        n324) );
  MX4X1M U216 ( .A(\registers[12][6] ), .B(\registers[13][6] ), .C(
        \registers[14][6] ), .D(\registers[15][6] ), .S0(n340), .S1(N12), .Y(
        n328) );
  MX4X1M U217 ( .A(\registers[12][7] ), .B(\registers[13][7] ), .C(
        \registers[14][7] ), .D(\registers[15][7] ), .S0(n340), .S1(N12), .Y(
        n332) );
  AO22X1M U218 ( .A0(RF_RdData[0]), .A1(n149), .B0(N43), .B1(N61), .Y(n178) );
  MX4X1M U219 ( .A(n142), .B(n140), .C(n141), .D(n139), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U220 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(N12), .Y(n142) );
  MX4X1M U221 ( .A(\registers[8][0] ), .B(\registers[9][0] ), .C(
        \registers[10][0] ), .D(\registers[11][0] ), .S0(N11), .S1(N12), .Y(
        n140) );
  AO22X1M U222 ( .A0(RF_RdData[1]), .A1(n149), .B0(N42), .B1(N61), .Y(n179) );
  MX4X1M U223 ( .A(n146), .B(n144), .C(n145), .D(n143), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U224 ( .A(\registers[8][1] ), .B(\registers[9][1] ), .C(
        \registers[10][1] ), .D(\registers[11][1] ), .S0(N11), .S1(N12), .Y(
        n144) );
  MX4X1M U225 ( .A(\registers[12][1] ), .B(\registers[13][1] ), .C(
        \registers[14][1] ), .D(\registers[15][1] ), .S0(n339), .S1(n337), .Y(
        n143) );
  AO22X1M U226 ( .A0(RF_RdData[2]), .A1(n149), .B0(N41), .B1(N61), .Y(n180) );
  MX4X1M U227 ( .A(n315), .B(n148), .C(n314), .D(n147), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U228 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n339), 
        .S1(n337), .Y(n315) );
  MX4X1M U229 ( .A(\registers[8][2] ), .B(\registers[9][2] ), .C(
        \registers[10][2] ), .D(\registers[11][2] ), .S0(n339), .S1(n337), .Y(
        n148) );
  AO22X1M U230 ( .A0(RF_RdData[3]), .A1(n149), .B0(N40), .B1(N61), .Y(n181) );
  MX4X1M U231 ( .A(n319), .B(n317), .C(n318), .D(n316), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U232 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n339), 
        .S1(n337), .Y(n319) );
  MX4X1M U233 ( .A(\registers[8][3] ), .B(\registers[9][3] ), .C(
        \registers[10][3] ), .D(\registers[11][3] ), .S0(n339), .S1(n337), .Y(
        n317) );
  AO22X1M U234 ( .A0(RF_RdData[4]), .A1(n149), .B0(N39), .B1(N61), .Y(n182) );
  MX4X1M U235 ( .A(n323), .B(n321), .C(n322), .D(n320), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U236 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n340), 
        .S1(n337), .Y(n323) );
  MX4X1M U237 ( .A(\registers[8][4] ), .B(\registers[9][4] ), .C(
        \registers[10][4] ), .D(\registers[11][4] ), .S0(n339), .S1(n337), .Y(
        n321) );
  AO22X1M U238 ( .A0(RF_RdData[5]), .A1(n149), .B0(N38), .B1(N61), .Y(n183) );
  MX4X1M U239 ( .A(n327), .B(n325), .C(n326), .D(n324), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U240 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n340), 
        .S1(N12), .Y(n327) );
  MX4X1M U241 ( .A(\registers[8][5] ), .B(\registers[9][5] ), .C(
        \registers[10][5] ), .D(\registers[11][5] ), .S0(n340), .S1(N12), .Y(
        n325) );
  AO22X1M U242 ( .A0(RF_RdData[6]), .A1(n149), .B0(N37), .B1(N61), .Y(n184) );
  MX4X1M U243 ( .A(n331), .B(n329), .C(n330), .D(n328), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U244 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n340), 
        .S1(N12), .Y(n331) );
  MX4X1M U245 ( .A(\registers[8][6] ), .B(\registers[9][6] ), .C(
        \registers[10][6] ), .D(\registers[11][6] ), .S0(n340), .S1(N12), .Y(
        n329) );
  AO22X1M U246 ( .A0(RF_RdData[7]), .A1(n149), .B0(N36), .B1(N61), .Y(n185) );
  MX4X1M U247 ( .A(n335), .B(n333), .C(n334), .D(n332), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U248 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n340), 
        .S1(N12), .Y(n335) );
  MX4X1M U249 ( .A(\registers[8][7] ), .B(\registers[9][7] ), .C(
        \registers[10][7] ), .D(\registers[11][7] ), .S0(n340), .S1(N12), .Y(
        n333) );
  OAI2BB2X1M U250 ( .B0(n150), .B1(n365), .A0N(REG0[0]), .A1N(n150), .Y(n186)
         );
  OAI2BB2X1M U251 ( .B0(n150), .B1(n364), .A0N(REG0[1]), .A1N(n150), .Y(n187)
         );
  OAI2BB2X1M U252 ( .B0(n150), .B1(n363), .A0N(REG0[2]), .A1N(n150), .Y(n188)
         );
  OAI2BB2X1M U253 ( .B0(n150), .B1(n362), .A0N(REG0[3]), .A1N(n150), .Y(n189)
         );
  OAI2BB2X1M U254 ( .B0(n150), .B1(n361), .A0N(REG0[4]), .A1N(n150), .Y(n190)
         );
  OAI2BB2X1M U255 ( .B0(n150), .B1(n360), .A0N(REG0[5]), .A1N(n150), .Y(n191)
         );
  OAI2BB2X1M U256 ( .B0(n150), .B1(n359), .A0N(REG0[6]), .A1N(n150), .Y(n192)
         );
  OAI2BB2X1M U257 ( .B0(n150), .B1(n358), .A0N(REG0[7]), .A1N(n150), .Y(n193)
         );
  OAI2BB2X1M U258 ( .B0(n365), .B1(n155), .A0N(REG2[0]), .A1N(n155), .Y(n202)
         );
  OAI2BB2X1M U259 ( .B0(n364), .B1(n155), .A0N(REG2[1]), .A1N(n155), .Y(n203)
         );
  OAI2BB2X1M U260 ( .B0(n360), .B1(n155), .A0N(REG2[5]), .A1N(n155), .Y(n207)
         );
  OAI2BB2X1M U261 ( .B0(n359), .B1(n155), .A0N(REG2[6]), .A1N(n155), .Y(n208)
         );
  OAI2BB2X1M U262 ( .B0(n358), .B1(n155), .A0N(REG2[7]), .A1N(n155), .Y(n209)
         );
  OAI2BB2X1M U263 ( .B0(n365), .B1(n157), .A0N(REG3[0]), .A1N(n157), .Y(n210)
         );
  OAI2BB2X1M U264 ( .B0(n364), .B1(n157), .A0N(REG3[1]), .A1N(n157), .Y(n211)
         );
  OAI2BB2X1M U265 ( .B0(n363), .B1(n157), .A0N(REG3[2]), .A1N(n157), .Y(n212)
         );
  OAI2BB2X1M U266 ( .B0(n361), .B1(n157), .A0N(REG3[4]), .A1N(n157), .Y(n214)
         );
  OAI2BB2X1M U267 ( .B0(n360), .B1(n157), .A0N(REG3[5]), .A1N(n157), .Y(n215)
         );
  OAI2BB2X1M U268 ( .B0(n359), .B1(n157), .A0N(REG3[6]), .A1N(n157), .Y(n216)
         );
  OAI2BB2X1M U269 ( .B0(n358), .B1(n157), .A0N(REG3[7]), .A1N(n157), .Y(n217)
         );
  OAI2BB2X1M U270 ( .B0(n365), .B1(n153), .A0N(REG1[0]), .A1N(n153), .Y(n194)
         );
  OAI2BB2X1M U271 ( .B0(n364), .B1(n153), .A0N(REG1[1]), .A1N(n153), .Y(n195)
         );
  OAI2BB2X1M U272 ( .B0(n363), .B1(n153), .A0N(REG1[2]), .A1N(n153), .Y(n196)
         );
  OAI2BB2X1M U273 ( .B0(n362), .B1(n153), .A0N(REG1[3]), .A1N(n153), .Y(n197)
         );
  OAI2BB2X1M U274 ( .B0(n361), .B1(n153), .A0N(REG1[4]), .A1N(n153), .Y(n198)
         );
  OAI2BB2X1M U275 ( .B0(n360), .B1(n153), .A0N(REG1[5]), .A1N(n153), .Y(n199)
         );
  OAI2BB2X1M U276 ( .B0(n359), .B1(n153), .A0N(REG1[6]), .A1N(n153), .Y(n200)
         );
  OAI2BB2X1M U277 ( .B0(n358), .B1(n153), .A0N(REG1[7]), .A1N(n153), .Y(n201)
         );
  OAI2BB2X1M U278 ( .B0(n365), .B1(n166), .A0N(\registers[8][0] ), .A1N(n166), 
        .Y(n250) );
  OAI2BB2X1M U279 ( .B0(n364), .B1(n166), .A0N(\registers[8][1] ), .A1N(n166), 
        .Y(n251) );
  OAI2BB2X1M U280 ( .B0(n363), .B1(n166), .A0N(\registers[8][2] ), .A1N(n166), 
        .Y(n252) );
  OAI2BB2X1M U281 ( .B0(n362), .B1(n166), .A0N(\registers[8][3] ), .A1N(n166), 
        .Y(n253) );
  OAI2BB2X1M U282 ( .B0(n361), .B1(n166), .A0N(\registers[8][4] ), .A1N(n166), 
        .Y(n254) );
  OAI2BB2X1M U283 ( .B0(n360), .B1(n166), .A0N(\registers[8][5] ), .A1N(n166), 
        .Y(n255) );
  OAI2BB2X1M U284 ( .B0(n359), .B1(n166), .A0N(\registers[8][6] ), .A1N(n166), 
        .Y(n256) );
  OAI2BB2X1M U285 ( .B0(n358), .B1(n166), .A0N(\registers[8][7] ), .A1N(n166), 
        .Y(n257) );
  OAI2BB2X1M U286 ( .B0(n365), .B1(n168), .A0N(\registers[9][0] ), .A1N(n168), 
        .Y(n258) );
  OAI2BB2X1M U287 ( .B0(n364), .B1(n168), .A0N(\registers[9][1] ), .A1N(n168), 
        .Y(n259) );
  OAI2BB2X1M U288 ( .B0(n363), .B1(n168), .A0N(\registers[9][2] ), .A1N(n168), 
        .Y(n260) );
  OAI2BB2X1M U289 ( .B0(n362), .B1(n168), .A0N(\registers[9][3] ), .A1N(n168), 
        .Y(n261) );
  OAI2BB2X1M U290 ( .B0(n361), .B1(n168), .A0N(\registers[9][4] ), .A1N(n168), 
        .Y(n262) );
  OAI2BB2X1M U291 ( .B0(n360), .B1(n168), .A0N(\registers[9][5] ), .A1N(n168), 
        .Y(n263) );
  OAI2BB2X1M U292 ( .B0(n359), .B1(n168), .A0N(\registers[9][6] ), .A1N(n168), 
        .Y(n264) );
  OAI2BB2X1M U293 ( .B0(n358), .B1(n168), .A0N(\registers[9][7] ), .A1N(n168), 
        .Y(n265) );
  OAI2BB2X1M U294 ( .B0(n365), .B1(n170), .A0N(\registers[10][0] ), .A1N(n170), 
        .Y(n266) );
  OAI2BB2X1M U295 ( .B0(n364), .B1(n170), .A0N(\registers[10][1] ), .A1N(n170), 
        .Y(n267) );
  OAI2BB2X1M U296 ( .B0(n363), .B1(n170), .A0N(\registers[10][2] ), .A1N(n170), 
        .Y(n268) );
  OAI2BB2X1M U297 ( .B0(n362), .B1(n170), .A0N(\registers[10][3] ), .A1N(n170), 
        .Y(n269) );
  OAI2BB2X1M U298 ( .B0(n361), .B1(n170), .A0N(\registers[10][4] ), .A1N(n170), 
        .Y(n270) );
  OAI2BB2X1M U299 ( .B0(n360), .B1(n170), .A0N(\registers[10][5] ), .A1N(n170), 
        .Y(n271) );
  OAI2BB2X1M U300 ( .B0(n359), .B1(n170), .A0N(\registers[10][6] ), .A1N(n170), 
        .Y(n272) );
  OAI2BB2X1M U301 ( .B0(n358), .B1(n170), .A0N(\registers[10][7] ), .A1N(n170), 
        .Y(n273) );
  OAI2BB2X1M U302 ( .B0(n365), .B1(n171), .A0N(\registers[11][0] ), .A1N(n171), 
        .Y(n274) );
  OAI2BB2X1M U303 ( .B0(n364), .B1(n171), .A0N(\registers[11][1] ), .A1N(n171), 
        .Y(n275) );
  OAI2BB2X1M U304 ( .B0(n363), .B1(n171), .A0N(\registers[11][2] ), .A1N(n171), 
        .Y(n276) );
  OAI2BB2X1M U305 ( .B0(n362), .B1(n171), .A0N(\registers[11][3] ), .A1N(n171), 
        .Y(n277) );
  OAI2BB2X1M U306 ( .B0(n361), .B1(n171), .A0N(\registers[11][4] ), .A1N(n171), 
        .Y(n278) );
  OAI2BB2X1M U307 ( .B0(n360), .B1(n171), .A0N(\registers[11][5] ), .A1N(n171), 
        .Y(n279) );
  OAI2BB2X1M U308 ( .B0(n359), .B1(n171), .A0N(\registers[11][6] ), .A1N(n171), 
        .Y(n280) );
  OAI2BB2X1M U309 ( .B0(n358), .B1(n171), .A0N(\registers[11][7] ), .A1N(n171), 
        .Y(n281) );
  OAI2BB2X1M U310 ( .B0(n363), .B1(n155), .A0N(REG2[2]), .A1N(n155), .Y(n204)
         );
  OAI2BB2X1M U311 ( .B0(n362), .B1(n155), .A0N(REG2[3]), .A1N(n155), .Y(n205)
         );
  OAI2BB2X1M U312 ( .B0(n361), .B1(n155), .A0N(REG2[4]), .A1N(n155), .Y(n206)
         );
  OAI2BB2X1M U313 ( .B0(n362), .B1(n157), .A0N(REG3[3]), .A1N(n157), .Y(n213)
         );
  OAI2BB2X1M U314 ( .B0(n365), .B1(n158), .A0N(\registers[4][0] ), .A1N(n158), 
        .Y(n218) );
  OAI2BB2X1M U315 ( .B0(n364), .B1(n158), .A0N(\registers[4][1] ), .A1N(n158), 
        .Y(n219) );
  OAI2BB2X1M U316 ( .B0(n363), .B1(n158), .A0N(\registers[4][2] ), .A1N(n158), 
        .Y(n220) );
  OAI2BB2X1M U317 ( .B0(n362), .B1(n158), .A0N(\registers[4][3] ), .A1N(n158), 
        .Y(n221) );
  OAI2BB2X1M U318 ( .B0(n361), .B1(n158), .A0N(\registers[4][4] ), .A1N(n158), 
        .Y(n222) );
  OAI2BB2X1M U319 ( .B0(n360), .B1(n158), .A0N(\registers[4][5] ), .A1N(n158), 
        .Y(n223) );
  OAI2BB2X1M U320 ( .B0(n359), .B1(n158), .A0N(\registers[4][6] ), .A1N(n158), 
        .Y(n224) );
  OAI2BB2X1M U321 ( .B0(n358), .B1(n158), .A0N(\registers[4][7] ), .A1N(n158), 
        .Y(n225) );
  OAI2BB2X1M U322 ( .B0(n365), .B1(n160), .A0N(\registers[5][0] ), .A1N(n160), 
        .Y(n226) );
  OAI2BB2X1M U323 ( .B0(n364), .B1(n160), .A0N(\registers[5][1] ), .A1N(n160), 
        .Y(n227) );
  OAI2BB2X1M U324 ( .B0(n363), .B1(n160), .A0N(\registers[5][2] ), .A1N(n160), 
        .Y(n228) );
  OAI2BB2X1M U325 ( .B0(n362), .B1(n160), .A0N(\registers[5][3] ), .A1N(n160), 
        .Y(n229) );
  OAI2BB2X1M U326 ( .B0(n361), .B1(n160), .A0N(\registers[5][4] ), .A1N(n160), 
        .Y(n230) );
  OAI2BB2X1M U327 ( .B0(n360), .B1(n160), .A0N(\registers[5][5] ), .A1N(n160), 
        .Y(n231) );
  OAI2BB2X1M U328 ( .B0(n359), .B1(n160), .A0N(\registers[5][6] ), .A1N(n160), 
        .Y(n232) );
  OAI2BB2X1M U329 ( .B0(n358), .B1(n160), .A0N(\registers[5][7] ), .A1N(n160), 
        .Y(n233) );
  OAI2BB2X1M U330 ( .B0(n365), .B1(n161), .A0N(\registers[6][0] ), .A1N(n161), 
        .Y(n234) );
  OAI2BB2X1M U331 ( .B0(n364), .B1(n161), .A0N(\registers[6][1] ), .A1N(n161), 
        .Y(n235) );
  OAI2BB2X1M U332 ( .B0(n363), .B1(n161), .A0N(\registers[6][2] ), .A1N(n161), 
        .Y(n236) );
  OAI2BB2X1M U333 ( .B0(n362), .B1(n161), .A0N(\registers[6][3] ), .A1N(n161), 
        .Y(n237) );
  OAI2BB2X1M U334 ( .B0(n361), .B1(n161), .A0N(\registers[6][4] ), .A1N(n161), 
        .Y(n238) );
  OAI2BB2X1M U335 ( .B0(n360), .B1(n161), .A0N(\registers[6][5] ), .A1N(n161), 
        .Y(n239) );
  OAI2BB2X1M U336 ( .B0(n359), .B1(n161), .A0N(\registers[6][6] ), .A1N(n161), 
        .Y(n240) );
  OAI2BB2X1M U337 ( .B0(n358), .B1(n161), .A0N(\registers[6][7] ), .A1N(n161), 
        .Y(n241) );
  OAI2BB2X1M U338 ( .B0(n365), .B1(n164), .A0N(\registers[7][0] ), .A1N(n164), 
        .Y(n242) );
  OAI2BB2X1M U339 ( .B0(n364), .B1(n164), .A0N(\registers[7][1] ), .A1N(n164), 
        .Y(n243) );
  OAI2BB2X1M U340 ( .B0(n363), .B1(n164), .A0N(\registers[7][2] ), .A1N(n164), 
        .Y(n244) );
  OAI2BB2X1M U341 ( .B0(n362), .B1(n164), .A0N(\registers[7][3] ), .A1N(n164), 
        .Y(n245) );
  OAI2BB2X1M U342 ( .B0(n361), .B1(n164), .A0N(\registers[7][4] ), .A1N(n164), 
        .Y(n246) );
  OAI2BB2X1M U343 ( .B0(n360), .B1(n164), .A0N(\registers[7][5] ), .A1N(n164), 
        .Y(n247) );
  OAI2BB2X1M U344 ( .B0(n359), .B1(n164), .A0N(\registers[7][6] ), .A1N(n164), 
        .Y(n248) );
  OAI2BB2X1M U345 ( .B0(n358), .B1(n164), .A0N(\registers[7][7] ), .A1N(n164), 
        .Y(n249) );
  OAI2BB2X1M U346 ( .B0(n365), .B1(n172), .A0N(\registers[12][0] ), .A1N(n172), 
        .Y(n282) );
  OAI2BB2X1M U347 ( .B0(n364), .B1(n172), .A0N(\registers[12][1] ), .A1N(n172), 
        .Y(n283) );
  OAI2BB2X1M U348 ( .B0(n363), .B1(n172), .A0N(\registers[12][2] ), .A1N(n172), 
        .Y(n284) );
  OAI2BB2X1M U349 ( .B0(n362), .B1(n172), .A0N(\registers[12][3] ), .A1N(n172), 
        .Y(n285) );
  OAI2BB2X1M U350 ( .B0(n361), .B1(n172), .A0N(\registers[12][4] ), .A1N(n172), 
        .Y(n286) );
  OAI2BB2X1M U351 ( .B0(n360), .B1(n172), .A0N(\registers[12][5] ), .A1N(n172), 
        .Y(n287) );
  OAI2BB2X1M U352 ( .B0(n359), .B1(n172), .A0N(\registers[12][6] ), .A1N(n172), 
        .Y(n288) );
  OAI2BB2X1M U353 ( .B0(n358), .B1(n172), .A0N(\registers[12][7] ), .A1N(n172), 
        .Y(n289) );
  OAI2BB2X1M U354 ( .B0(n365), .B1(n173), .A0N(\registers[13][0] ), .A1N(n173), 
        .Y(n290) );
  OAI2BB2X1M U355 ( .B0(n364), .B1(n173), .A0N(\registers[13][1] ), .A1N(n173), 
        .Y(n291) );
  OAI2BB2X1M U356 ( .B0(n363), .B1(n173), .A0N(\registers[13][2] ), .A1N(n173), 
        .Y(n292) );
  OAI2BB2X1M U357 ( .B0(n362), .B1(n173), .A0N(\registers[13][3] ), .A1N(n173), 
        .Y(n293) );
  OAI2BB2X1M U358 ( .B0(n361), .B1(n173), .A0N(\registers[13][4] ), .A1N(n173), 
        .Y(n294) );
  OAI2BB2X1M U359 ( .B0(n360), .B1(n173), .A0N(\registers[13][5] ), .A1N(n173), 
        .Y(n295) );
  OAI2BB2X1M U360 ( .B0(n359), .B1(n173), .A0N(\registers[13][6] ), .A1N(n173), 
        .Y(n296) );
  OAI2BB2X1M U361 ( .B0(n358), .B1(n173), .A0N(\registers[13][7] ), .A1N(n173), 
        .Y(n297) );
  OAI2BB2X1M U362 ( .B0(n365), .B1(n174), .A0N(\registers[14][0] ), .A1N(n174), 
        .Y(n298) );
  OAI2BB2X1M U363 ( .B0(n364), .B1(n174), .A0N(\registers[14][1] ), .A1N(n174), 
        .Y(n299) );
  OAI2BB2X1M U364 ( .B0(n363), .B1(n174), .A0N(\registers[14][2] ), .A1N(n174), 
        .Y(n300) );
  OAI2BB2X1M U365 ( .B0(n362), .B1(n174), .A0N(\registers[14][3] ), .A1N(n174), 
        .Y(n301) );
  OAI2BB2X1M U366 ( .B0(n361), .B1(n174), .A0N(\registers[14][4] ), .A1N(n174), 
        .Y(n302) );
  OAI2BB2X1M U367 ( .B0(n360), .B1(n174), .A0N(\registers[14][5] ), .A1N(n174), 
        .Y(n303) );
  OAI2BB2X1M U368 ( .B0(n359), .B1(n174), .A0N(\registers[14][6] ), .A1N(n174), 
        .Y(n304) );
  OAI2BB2X1M U369 ( .B0(n358), .B1(n174), .A0N(\registers[14][7] ), .A1N(n174), 
        .Y(n305) );
  OAI2BB2X1M U370 ( .B0(n365), .B1(n176), .A0N(\registers[15][0] ), .A1N(n176), 
        .Y(n306) );
  OAI2BB2X1M U371 ( .B0(n364), .B1(n176), .A0N(\registers[15][1] ), .A1N(n176), 
        .Y(n307) );
  OAI2BB2X1M U372 ( .B0(n363), .B1(n176), .A0N(\registers[15][2] ), .A1N(n176), 
        .Y(n308) );
  OAI2BB2X1M U373 ( .B0(n362), .B1(n176), .A0N(\registers[15][3] ), .A1N(n176), 
        .Y(n309) );
  OAI2BB2X1M U374 ( .B0(n361), .B1(n176), .A0N(\registers[15][4] ), .A1N(n176), 
        .Y(n310) );
  OAI2BB2X1M U375 ( .B0(n360), .B1(n176), .A0N(\registers[15][5] ), .A1N(n176), 
        .Y(n311) );
  OAI2BB2X1M U376 ( .B0(n359), .B1(n176), .A0N(\registers[15][6] ), .A1N(n176), 
        .Y(n312) );
  OAI2BB2X1M U377 ( .B0(n358), .B1(n176), .A0N(\registers[15][7] ), .A1N(n176), 
        .Y(n313) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
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
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
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
  XNOR2X2M U9 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  NAND2X2M U10 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n3) );
  INVX2M U12 ( .A(n19), .Y(n2) );
  NAND2X2M U13 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n5) );
  INVX2M U15 ( .A(n19), .Y(n4) );
  NAND2X2M U16 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n7) );
  INVX2M U18 ( .A(n19), .Y(n6) );
  NAND2X2M U19 ( .A(n8), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n9) );
  INVX2M U21 ( .A(n19), .Y(n8) );
  NAND2X2M U22 ( .A(n6), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U23 ( .A(a[1]), .Y(n10) );
  NAND2X2M U24 ( .A(n4), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U25 ( .A(a[0]), .Y(n11) );
  NAND2X2M U26 ( .A(n2), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U27 ( .A(a[6]), .Y(n1) );
  INVX2M U28 ( .A(b[6]), .Y(n13) );
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
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  NAND2X2M U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U9 ( .A(B[1]), .Y(n8) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
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

  NAND2X2M U2 ( .A(A[7]), .B(B[7]), .Y(n15) );
  AOI21BX2M U3 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  INVX2M U4 ( .A(A[6]), .Y(n9) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  XNOR2X2M U7 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
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
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40;

  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n8), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n6), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n23) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U17 ( .A(\ab[0][7] ), .Y(n24) );
  INVX2M U18 ( .A(\ab[0][4] ), .Y(n21) );
  INVX2M U19 ( .A(\ab[0][5] ), .Y(n22) );
  INVX2M U20 ( .A(\ab[0][3] ), .Y(n20) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n19) );
  XNOR2X2M U22 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U23 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U24 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U25 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U26 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U27 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  AND2X2M U28 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U29 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U30 ( .A(\ab[1][6] ), .B(n24), .Y(\SUMB[1][6] ) );
  XNOR2X2M U31 ( .A(\ab[1][2] ), .B(n20), .Y(\SUMB[1][2] ) );
  XNOR2X2M U32 ( .A(\ab[1][3] ), .B(n21), .Y(\SUMB[1][3] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n22), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][5] ), .B(n23), .Y(\SUMB[1][5] ) );
  XNOR2X2M U35 ( .A(\ab[1][1] ), .B(n19), .Y(\SUMB[1][1] ) );
  INVX2M U36 ( .A(A[6]), .Y(n34) );
  INVX2M U37 ( .A(A[1]), .Y(n39) );
  INVX2M U38 ( .A(A[7]), .Y(n33) );
  INVX2M U39 ( .A(A[0]), .Y(n40) );
  INVX2M U40 ( .A(A[2]), .Y(n38) );
  INVX2M U41 ( .A(A[3]), .Y(n37) );
  INVX2M U42 ( .A(A[4]), .Y(n36) );
  INVX2M U43 ( .A(A[5]), .Y(n35) );
  INVX2M U44 ( .A(B[6]), .Y(n26) );
  XNOR2X2M U45 ( .A(\ab[1][0] ), .B(n18), .Y(PRODUCT[1]) );
  INVX2M U46 ( .A(\ab[0][1] ), .Y(n18) );
  INVX2M U47 ( .A(B[0]), .Y(n32) );
  INVX2M U48 ( .A(B[2]), .Y(n30) );
  INVX2M U49 ( .A(B[3]), .Y(n29) );
  INVX2M U50 ( .A(B[1]), .Y(n31) );
  INVX2M U51 ( .A(B[5]), .Y(n27) );
  INVX2M U52 ( .A(B[4]), .Y(n28) );
  INVX2M U53 ( .A(B[7]), .Y(n25) );
  NOR2X1M U55 ( .A(n33), .B(n25), .Y(\ab[7][7] ) );
  NOR2X1M U56 ( .A(n33), .B(n26), .Y(\ab[7][6] ) );
  NOR2X1M U57 ( .A(n33), .B(n27), .Y(\ab[7][5] ) );
  NOR2X1M U58 ( .A(n33), .B(n28), .Y(\ab[7][4] ) );
  NOR2X1M U59 ( .A(n33), .B(n29), .Y(\ab[7][3] ) );
  NOR2X1M U60 ( .A(n33), .B(n30), .Y(\ab[7][2] ) );
  NOR2X1M U61 ( .A(n33), .B(n31), .Y(\ab[7][1] ) );
  NOR2X1M U62 ( .A(n33), .B(n32), .Y(\ab[7][0] ) );
  NOR2X1M U63 ( .A(n25), .B(n34), .Y(\ab[6][7] ) );
  NOR2X1M U64 ( .A(n26), .B(n34), .Y(\ab[6][6] ) );
  NOR2X1M U65 ( .A(n27), .B(n34), .Y(\ab[6][5] ) );
  NOR2X1M U66 ( .A(n28), .B(n34), .Y(\ab[6][4] ) );
  NOR2X1M U67 ( .A(n29), .B(n34), .Y(\ab[6][3] ) );
  NOR2X1M U68 ( .A(n30), .B(n34), .Y(\ab[6][2] ) );
  NOR2X1M U69 ( .A(n31), .B(n34), .Y(\ab[6][1] ) );
  NOR2X1M U70 ( .A(n32), .B(n34), .Y(\ab[6][0] ) );
  NOR2X1M U71 ( .A(n25), .B(n35), .Y(\ab[5][7] ) );
  NOR2X1M U72 ( .A(n26), .B(n35), .Y(\ab[5][6] ) );
  NOR2X1M U73 ( .A(n27), .B(n35), .Y(\ab[5][5] ) );
  NOR2X1M U74 ( .A(n28), .B(n35), .Y(\ab[5][4] ) );
  NOR2X1M U75 ( .A(n29), .B(n35), .Y(\ab[5][3] ) );
  NOR2X1M U76 ( .A(n30), .B(n35), .Y(\ab[5][2] ) );
  NOR2X1M U77 ( .A(n31), .B(n35), .Y(\ab[5][1] ) );
  NOR2X1M U78 ( .A(n32), .B(n35), .Y(\ab[5][0] ) );
  NOR2X1M U79 ( .A(n25), .B(n36), .Y(\ab[4][7] ) );
  NOR2X1M U80 ( .A(n26), .B(n36), .Y(\ab[4][6] ) );
  NOR2X1M U81 ( .A(n27), .B(n36), .Y(\ab[4][5] ) );
  NOR2X1M U82 ( .A(n28), .B(n36), .Y(\ab[4][4] ) );
  NOR2X1M U83 ( .A(n29), .B(n36), .Y(\ab[4][3] ) );
  NOR2X1M U84 ( .A(n30), .B(n36), .Y(\ab[4][2] ) );
  NOR2X1M U85 ( .A(n31), .B(n36), .Y(\ab[4][1] ) );
  NOR2X1M U86 ( .A(n32), .B(n36), .Y(\ab[4][0] ) );
  NOR2X1M U87 ( .A(n25), .B(n37), .Y(\ab[3][7] ) );
  NOR2X1M U88 ( .A(n26), .B(n37), .Y(\ab[3][6] ) );
  NOR2X1M U89 ( .A(n27), .B(n37), .Y(\ab[3][5] ) );
  NOR2X1M U90 ( .A(n28), .B(n37), .Y(\ab[3][4] ) );
  NOR2X1M U91 ( .A(n29), .B(n37), .Y(\ab[3][3] ) );
  NOR2X1M U92 ( .A(n30), .B(n37), .Y(\ab[3][2] ) );
  NOR2X1M U93 ( .A(n31), .B(n37), .Y(\ab[3][1] ) );
  NOR2X1M U94 ( .A(n32), .B(n37), .Y(\ab[3][0] ) );
  NOR2X1M U95 ( .A(n25), .B(n38), .Y(\ab[2][7] ) );
  NOR2X1M U96 ( .A(n26), .B(n38), .Y(\ab[2][6] ) );
  NOR2X1M U97 ( .A(n27), .B(n38), .Y(\ab[2][5] ) );
  NOR2X1M U98 ( .A(n28), .B(n38), .Y(\ab[2][4] ) );
  NOR2X1M U99 ( .A(n29), .B(n38), .Y(\ab[2][3] ) );
  NOR2X1M U100 ( .A(n30), .B(n38), .Y(\ab[2][2] ) );
  NOR2X1M U101 ( .A(n31), .B(n38), .Y(\ab[2][1] ) );
  NOR2X1M U102 ( .A(n32), .B(n38), .Y(\ab[2][0] ) );
  NOR2X1M U103 ( .A(n25), .B(n39), .Y(\ab[1][7] ) );
  NOR2X1M U104 ( .A(n26), .B(n39), .Y(\ab[1][6] ) );
  NOR2X1M U105 ( .A(n27), .B(n39), .Y(\ab[1][5] ) );
  NOR2X1M U106 ( .A(n28), .B(n39), .Y(\ab[1][4] ) );
  NOR2X1M U107 ( .A(n29), .B(n39), .Y(\ab[1][3] ) );
  NOR2X1M U108 ( .A(n30), .B(n39), .Y(\ab[1][2] ) );
  NOR2X1M U109 ( .A(n31), .B(n39), .Y(\ab[1][1] ) );
  NOR2X1M U110 ( .A(n32), .B(n39), .Y(\ab[1][0] ) );
  NOR2X1M U111 ( .A(n25), .B(n40), .Y(\ab[0][7] ) );
  NOR2X1M U112 ( .A(n26), .B(n40), .Y(\ab[0][6] ) );
  NOR2X1M U113 ( .A(n27), .B(n40), .Y(\ab[0][5] ) );
  NOR2X1M U114 ( .A(n28), .B(n40), .Y(\ab[0][4] ) );
  NOR2X1M U115 ( .A(n29), .B(n40), .Y(\ab[0][3] ) );
  NOR2X1M U116 ( .A(n30), .B(n40), .Y(\ab[0][2] ) );
  NOR2X1M U117 ( .A(n31), .B(n40), .Y(\ab[0][1] ) );
  NOR2X1M U118 ( .A(n32), .B(n40), .Y(PRODUCT[0]) );
  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n14, n16, n13, n15, n12, n11, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module ALU_test_1 ( A, B, ALU_en, ALU_CLK, ALU_RST, ALU_FUN, ALU_OUT, 
        ALU_Valid, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input ALU_en, ALU_CLK, ALU_RST, test_si, test_se;
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
         n120, n122, n124, n126, n128, n130, n132, n134, n136, n152, n4, n5,
         n6, n7, n8, n9, n15, n18, n23, n25, n26, n27, n29, n33, n48, n49, n55,
         n57, n63, n65, n71, n73, n79, n81, n87, n89, n91, n96, n98, n102,
         n103, n111, n138, n140, n142, n144, n146, n148, n150, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185;

  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(n136), .SI(ALU_OUT[7]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[8]) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(n134), .SI(ALU_OUT[6]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(n132), .SI(ALU_OUT[5]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(n130), .SI(ALU_OUT[4]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(n128), .SI(ALU_OUT[3]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(n126), .SI(ALU_OUT[2]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(n124), .SI(ALU_OUT[1]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(n156), .SI(ALU_OUT[14]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(n157), .SI(ALU_OUT[13]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(n158), .SI(ALU_OUT[12]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(n159), .SI(ALU_OUT[11]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(n160), .SI(ALU_OUT[10]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(n161), .SI(ALU_OUT[9]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(n162), .SI(ALU_OUT[8]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(n122), .SI(ALU_OUT[0]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(n120), .SI(test_si), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_OUT[0]) );
  SDFFRQX1M ALU_Valid_reg ( .D(n152), .SI(ALU_OUT[15]), .SE(test_se), .CK(
        ALU_CLK), .RN(ALU_RST), .Q(ALU_Valid) );
  NOR4X1M U4 ( .A(n99), .B(n173), .C(n5), .D(ALU_FUN[3]), .Y(n32) );
  NOR4X1M U7 ( .A(n172), .B(n43), .C(n173), .D(ALU_FUN[3]), .Y(n35) );
  BUFX2M U8 ( .A(ALU_FUN[0]), .Y(n5) );
  BUFX2M U9 ( .A(A[6]), .Y(n25) );
  NOR3BX2M U10 ( .AN(n97), .B(n171), .C(n172), .Y(n31) );
  NOR3X2M U11 ( .A(n43), .B(n45), .C(n172), .Y(n30) );
  NOR2BX2M U12 ( .AN(n17), .B(n99), .Y(n40) );
  INVX2M U13 ( .A(n32), .Y(n167) );
  INVX2M U14 ( .A(n35), .Y(n165) );
  INVX2M U15 ( .A(n90), .Y(n169) );
  INVX2M U16 ( .A(n19), .Y(n164) );
  INVX2M U17 ( .A(n24), .Y(n168) );
  NOR3X2M U18 ( .A(n173), .B(n5), .C(n105), .Y(n90) );
  NAND3BX2M U19 ( .AN(n43), .B(n17), .C(N155), .Y(n19) );
  NOR2BX2M U20 ( .AN(n109), .B(n5), .Y(n14) );
  NAND2X2M U21 ( .A(ALU_FUN[1]), .B(ALU_FUN[2]), .Y(n99) );
  NOR3X2M U22 ( .A(ALU_FUN[2]), .B(ALU_FUN[3]), .C(n173), .Y(n97) );
  NAND2X2M U23 ( .A(ALU_en), .B(ALU_FUN[3]), .Y(n45) );
  NAND2X2M U24 ( .A(ALU_FUN[2]), .B(n171), .Y(n43) );
  NAND3X2M U25 ( .A(ALU_en), .B(n118), .C(n5), .Y(n24) );
  OAI21X2M U26 ( .A0(ALU_FUN[3]), .A1(n99), .B0(n105), .Y(n118) );
  NAND2X2M U27 ( .A(ALU_en), .B(n104), .Y(n28) );
  OAI22X1M U28 ( .A0(n172), .A1(n105), .B0(ALU_FUN[3]), .B1(n43), .Y(n104) );
  NAND3X2M U29 ( .A(n171), .B(n170), .C(ALU_FUN[3]), .Y(n105) );
  INVX2M U30 ( .A(n106), .Y(n163) );
  INVX2M U31 ( .A(ALU_en), .Y(n173) );
  NOR2X2M U32 ( .A(n45), .B(n5), .Y(n17) );
  INVX2M U33 ( .A(ALU_FUN[1]), .Y(n171) );
  NOR2BX2M U34 ( .AN(n97), .B(ALU_FUN[1]), .Y(n109) );
  INVX2M U35 ( .A(ALU_FUN[2]), .Y(n170) );
  INVX2M U36 ( .A(n5), .Y(n172) );
  AND2X2M U37 ( .A(n109), .B(n5), .Y(n21) );
  BUFX2M U38 ( .A(n34), .Y(n4) );
  NOR3BX2M U39 ( .AN(n97), .B(n171), .C(n5), .Y(n34) );
  NAND2X2M U40 ( .A(n42), .B(n19), .Y(n41) );
  NAND4X2M U41 ( .A(N154), .B(n5), .C(n44), .D(ALU_FUN[1]), .Y(n42) );
  NOR2X2M U42 ( .A(ALU_FUN[2]), .B(n45), .Y(n44) );
  AND4X2M U43 ( .A(N153), .B(ALU_FUN[1]), .C(n17), .D(n170), .Y(n16) );
  NAND4X2M U44 ( .A(n82), .B(n83), .C(n84), .D(n85), .Y(n132) );
  AOI222X1M U45 ( .A0(N127), .A1(n31), .B0(n86), .B1(n174), .C0(n6), .C1(n88), 
        .Y(n84) );
  AOI222X1M U46 ( .A0(N102), .A1(n21), .B0(n23), .B1(n40), .C0(N93), .C1(n14), 
        .Y(n85) );
  AOI222X1M U47 ( .A0(N111), .A1(n4), .B0(n32), .B1(n179), .C0(n26), .C1(n30), 
        .Y(n83) );
  AOI211X2M U48 ( .A0(N104), .A1(n21), .B0(n168), .C0(n32), .Y(n106) );
  AOI221XLM U49 ( .A0(n26), .A1(n90), .B0(n168), .B1(n178), .C0(n32), .Y(n101)
         );
  AOI221XLM U50 ( .A0(n90), .A1(n178), .B0(n26), .B1(n166), .C0(n35), .Y(n100)
         );
  INVX2M U51 ( .A(n28), .Y(n166) );
  OAI221X1M U52 ( .A0(n7), .A1(n24), .B0(n169), .B1(n185), .C0(n167), .Y(n22)
         );
  OAI221X1M U53 ( .A0(n8), .A1(n24), .B0(n169), .B1(n184), .C0(n167), .Y(n47)
         );
  OAI221X1M U54 ( .A0(n9), .A1(n24), .B0(n169), .B1(n183), .C0(n167), .Y(n54)
         );
  OAI221X1M U55 ( .A0(n15), .A1(n24), .B0(n169), .B1(n182), .C0(n167), .Y(n62)
         );
  OAI221X1M U56 ( .A0(n18), .A1(n24), .B0(n169), .B1(n181), .C0(n167), .Y(n70)
         );
  OAI221X1M U57 ( .A0(n23), .A1(n24), .B0(n169), .B1(n180), .C0(n167), .Y(n78)
         );
  OAI221X1M U58 ( .A0(n25), .A1(n24), .B0(n169), .B1(n179), .C0(n167), .Y(n86)
         );
  OAI221X1M U59 ( .A0(n185), .A1(n28), .B0(n7), .B1(n169), .C0(n165), .Y(n20)
         );
  OAI221X1M U60 ( .A0(n28), .A1(n184), .B0(n8), .B1(n169), .C0(n165), .Y(n46)
         );
  OAI221X1M U61 ( .A0(n28), .A1(n183), .B0(n9), .B1(n169), .C0(n165), .Y(n56)
         );
  OAI221X1M U62 ( .A0(n28), .A1(n182), .B0(n15), .B1(n169), .C0(n165), .Y(n64)
         );
  OAI221X1M U63 ( .A0(n28), .A1(n181), .B0(n18), .B1(n169), .C0(n165), .Y(n72)
         );
  OAI221X1M U64 ( .A0(n28), .A1(n180), .B0(n23), .B1(n169), .C0(n165), .Y(n80)
         );
  OAI221X1M U65 ( .A0(n28), .A1(n179), .B0(n25), .B1(n169), .C0(n165), .Y(n88)
         );
  INVX2M U66 ( .A(n26), .Y(n178) );
  INVX2M U67 ( .A(n25), .Y(n179) );
  INVX2M U68 ( .A(n8), .Y(n184) );
  INVX2M U69 ( .A(n7), .Y(n185) );
  INVX2M U70 ( .A(n9), .Y(n183) );
  INVX2M U71 ( .A(n15), .Y(n182) );
  INVX2M U72 ( .A(n18), .Y(n181) );
  INVX2M U73 ( .A(n23), .Y(n180) );
  INVX2M U74 ( .A(n6), .Y(n174) );
  AOI222X1M U75 ( .A0(ALU_OUT[0]), .A1(n173), .B0(N105), .B1(n4), .C0(n35), 
        .C1(n7), .Y(n10) );
  AOI222X1M U76 ( .A0(ALU_OUT[1]), .A1(n173), .B0(N106), .B1(n4), .C0(n35), 
        .C1(n8), .Y(n36) );
  INVX2M U77 ( .A(n110), .Y(n162) );
  AOI221XLM U78 ( .A0(N114), .A1(n4), .B0(ALU_OUT[9]), .B1(n173), .C0(n163), 
        .Y(n110) );
  INVX2M U79 ( .A(n112), .Y(n161) );
  AOI221XLM U80 ( .A0(N115), .A1(n4), .B0(ALU_OUT[10]), .B1(n173), .C0(n163), 
        .Y(n112) );
  INVX2M U81 ( .A(n113), .Y(n160) );
  AOI221XLM U82 ( .A0(N116), .A1(n4), .B0(ALU_OUT[11]), .B1(n173), .C0(n163), 
        .Y(n113) );
  INVX2M U83 ( .A(n114), .Y(n159) );
  AOI221XLM U84 ( .A0(N117), .A1(n4), .B0(ALU_OUT[12]), .B1(n173), .C0(n163), 
        .Y(n114) );
  INVX2M U85 ( .A(n115), .Y(n158) );
  AOI221XLM U86 ( .A0(N118), .A1(n4), .B0(ALU_OUT[13]), .B1(n173), .C0(n163), 
        .Y(n115) );
  INVX2M U87 ( .A(n116), .Y(n157) );
  AOI221XLM U88 ( .A0(N119), .A1(n4), .B0(ALU_OUT[14]), .B1(n173), .C0(n163), 
        .Y(n116) );
  INVX2M U89 ( .A(n117), .Y(n156) );
  AOI221XLM U90 ( .A0(N120), .A1(n4), .B0(ALU_OUT[15]), .B1(n173), .C0(n163), 
        .Y(n117) );
  NAND4X2M U91 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(n120) );
  AOI211X2M U92 ( .A0(N87), .A1(n14), .B0(n164), .C0(n16), .Y(n13) );
  AOI222X1M U93 ( .A0(B[0]), .A1(n20), .B0(N96), .B1(n21), .C0(n22), .C1(n148), 
        .Y(n12) );
  AOI222X1M U94 ( .A0(n8), .A1(n30), .B0(N121), .B1(n31), .C0(n32), .C1(n185), 
        .Y(n11) );
  NAND4X2M U95 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n122) );
  AOI221XLM U96 ( .A0(n40), .A1(n7), .B0(N88), .B1(n14), .C0(n41), .Y(n39) );
  AOI222X1M U97 ( .A0(B[1]), .A1(n46), .B0(N97), .B1(n21), .C0(n47), .C1(n177), 
        .Y(n38) );
  AOI222X1M U98 ( .A0(n9), .A1(n30), .B0(N122), .B1(n31), .C0(n32), .C1(n184), 
        .Y(n37) );
  AOI22X1M U99 ( .A0(n9), .A1(n35), .B0(ALU_OUT[2]), .B1(n173), .Y(n50) );
  AOI22X1M U100 ( .A0(n15), .A1(n35), .B0(ALU_OUT[3]), .B1(n173), .Y(n58) );
  AOI22X1M U101 ( .A0(n18), .A1(n35), .B0(ALU_OUT[4]), .B1(n173), .Y(n66) );
  AOI22X1M U102 ( .A0(n23), .A1(n35), .B0(ALU_OUT[5]), .B1(n173), .Y(n74) );
  AOI22X1M U103 ( .A0(n25), .A1(n35), .B0(ALU_OUT[6]), .B1(n173), .Y(n82) );
  AOI22X1M U104 ( .A0(n26), .A1(n35), .B0(ALU_OUT[7]), .B1(n173), .Y(n94) );
  OAI2B11X2M U105 ( .A1N(ALU_OUT[8]), .A0(ALU_en), .B0(n106), .C0(n107), .Y(
        n136) );
  AOI221XLM U106 ( .A0(N113), .A1(n4), .B0(N95), .B1(n14), .C0(n108), .Y(n107)
         );
  NOR4X1M U107 ( .A(n5), .B(n173), .C(n99), .D(n178), .Y(n108) );
  NAND4X2M U108 ( .A(n50), .B(n51), .C(n52), .D(n53), .Y(n124) );
  AOI222X1M U109 ( .A0(N123), .A1(n31), .B0(n54), .B1(n153), .C0(B[2]), .C1(
        n56), .Y(n52) );
  AOI222X1M U110 ( .A0(N98), .A1(n21), .B0(n40), .B1(n8), .C0(N89), .C1(n14), 
        .Y(n53) );
  AOI222X1M U111 ( .A0(N107), .A1(n4), .B0(n32), .B1(n183), .C0(n15), .C1(n30), 
        .Y(n51) );
  NAND4X2M U112 ( .A(n58), .B(n59), .C(n60), .D(n61), .Y(n126) );
  AOI222X1M U113 ( .A0(N124), .A1(n31), .B0(n62), .B1(n155), .C0(B[3]), .C1(
        n64), .Y(n60) );
  AOI222X1M U114 ( .A0(N99), .A1(n21), .B0(n9), .B1(n40), .C0(N90), .C1(n14), 
        .Y(n61) );
  AOI222X1M U115 ( .A0(N108), .A1(n4), .B0(n32), .B1(n182), .C0(n18), .C1(n30), 
        .Y(n59) );
  NAND4X2M U116 ( .A(n66), .B(n67), .C(n68), .D(n69), .Y(n128) );
  AOI222X1M U117 ( .A0(N125), .A1(n31), .B0(n70), .B1(n176), .C0(B[4]), .C1(
        n72), .Y(n68) );
  AOI222X1M U118 ( .A0(N100), .A1(n21), .B0(n15), .B1(n40), .C0(N91), .C1(n14), 
        .Y(n69) );
  AOI222X1M U119 ( .A0(N109), .A1(n4), .B0(n32), .B1(n181), .C0(n23), .C1(n30), 
        .Y(n67) );
  NAND4X2M U120 ( .A(n74), .B(n75), .C(n76), .D(n77), .Y(n130) );
  AOI222X1M U121 ( .A0(N126), .A1(n31), .B0(n78), .B1(n175), .C0(B[5]), .C1(
        n80), .Y(n76) );
  AOI222X1M U122 ( .A0(N101), .A1(n21), .B0(n18), .B1(n40), .C0(N92), .C1(n14), 
        .Y(n77) );
  AOI222X1M U123 ( .A0(N110), .A1(n4), .B0(n32), .B1(n180), .C0(n25), .C1(n30), 
        .Y(n75) );
  NAND4BX1M U124 ( .AN(n92), .B(n93), .C(n94), .D(n95), .Y(n134) );
  OAI2B2X1M U125 ( .A1N(B[7]), .A0(n100), .B0(B[7]), .B1(n101), .Y(n92) );
  AOI222X1M U126 ( .A0(N112), .A1(n4), .B0(N128), .B1(n31), .C0(n32), .C1(n178), .Y(n95) );
  AOI222X1M U127 ( .A0(N103), .A1(n21), .B0(n25), .B1(n40), .C0(N94), .C1(n14), 
        .Y(n93) );
  OR2X2M U128 ( .A(ALU_Valid), .B(ALU_en), .Y(n152) );
  INVX2M U129 ( .A(n27), .Y(n150) );
  INVX2M U130 ( .A(n79), .Y(n154) );
  BUFX2M U131 ( .A(A[1]), .Y(n8) );
  BUFX2M U149 ( .A(A[7]), .Y(n26) );
  BUFX2M U150 ( .A(A[0]), .Y(n7) );
  BUFX2M U151 ( .A(A[2]), .Y(n9) );
  BUFX2M U152 ( .A(A[3]), .Y(n15) );
  BUFX2M U153 ( .A(A[4]), .Y(n18) );
  BUFX2M U154 ( .A(A[5]), .Y(n23) );
  BUFX2M U155 ( .A(B[6]), .Y(n6) );
  INVX2M U156 ( .A(B[0]), .Y(n148) );
  INVX2M U157 ( .A(B[2]), .Y(n153) );
  INVX2M U158 ( .A(B[3]), .Y(n155) );
  INVX2M U159 ( .A(B[1]), .Y(n177) );
  INVX2M U160 ( .A(B[4]), .Y(n176) );
  INVX2M U161 ( .A(B[5]), .Y(n175) );
  NOR2X1M U162 ( .A(n178), .B(B[7]), .Y(n140) );
  NAND2BX1M U163 ( .AN(B[4]), .B(n18), .Y(n91) );
  NAND2BX1M U164 ( .AN(n18), .B(B[4]), .Y(n49) );
  CLKNAND2X2M U165 ( .A(n91), .B(n49), .Y(n98) );
  NOR2X1M U166 ( .A(n155), .B(n15), .Y(n81) );
  NOR2X1M U167 ( .A(n153), .B(n9), .Y(n48) );
  NOR2X1M U168 ( .A(n148), .B(n7), .Y(n27) );
  CLKNAND2X2M U169 ( .A(n9), .B(n153), .Y(n89) );
  NAND2BX1M U170 ( .AN(n48), .B(n89), .Y(n71) );
  AOI21X1M U171 ( .A0(n27), .A1(n184), .B0(B[1]), .Y(n29) );
  AOI211X1M U172 ( .A0(n8), .A1(n150), .B0(n71), .C0(n29), .Y(n33) );
  CLKNAND2X2M U173 ( .A(n15), .B(n155), .Y(n87) );
  OAI31X1M U174 ( .A0(n81), .A1(n48), .A2(n33), .B0(n87), .Y(n55) );
  NAND2BX1M U175 ( .AN(n23), .B(B[5]), .Y(n111) );
  OAI211X1M U176 ( .A0(n98), .A1(n55), .B0(n49), .C0(n111), .Y(n57) );
  NAND2BX1M U177 ( .AN(B[5]), .B(n23), .Y(n96) );
  XNOR2X1M U178 ( .A(n25), .B(n6), .Y(n103) );
  AOI32X1M U179 ( .A0(n57), .A1(n96), .A2(n103), .B0(n6), .B1(n179), .Y(n63)
         );
  CLKNAND2X2M U180 ( .A(B[7]), .B(n178), .Y(n142) );
  OAI21X1M U181 ( .A0(n140), .A1(n63), .B0(n142), .Y(N155) );
  CLKNAND2X2M U182 ( .A(n7), .B(n148), .Y(n73) );
  OA21X1M U183 ( .A0(n73), .A1(n184), .B0(B[1]), .Y(n65) );
  AOI211X1M U184 ( .A0(n73), .A1(n184), .B0(n71), .C0(n65), .Y(n79) );
  AOI31X1M U185 ( .A0(n154), .A1(n89), .A2(n87), .B0(n81), .Y(n102) );
  OAI2B11X1M U186 ( .A1N(n102), .A0(n98), .B0(n96), .C0(n91), .Y(n138) );
  AOI32X1M U187 ( .A0(n138), .A1(n111), .A2(n103), .B0(n25), .B1(n174), .Y(
        n144) );
  AOI2B1X1M U188 ( .A1N(n144), .A0(n142), .B0(n140), .Y(n146) );
  CLKINVX1M U189 ( .A(n146), .Y(N154) );
  NOR2X1M U190 ( .A(N155), .B(N154), .Y(N153) );
  ALU_DW_div_uns_0 div_48 ( .a({n26, n25, n23, n18, n15, n9, n8, n7}), .b({
        B[7], n6, B[5:0]}), .quotient({N128, N127, N126, N125, N124, N123, 
        N122, N121}) );
  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n26, n25, n23, n18, n15, n9, n8, n7}), .B(
        {1'b0, B[7], n6, B[5:0]}), .CI(1'b0), .DIFF({N104, N103, N102, N101, 
        N100, N99, N98, N97, N96}) );
  ALU_DW01_add_0 add_45 ( .A({1'b0, n26, n25, n23, n18, n15, n9, n8, n7}), .B(
        {1'b0, B[7], n6, B[5:0]}), .CI(1'b0), .SUM({N95, N94, N93, N92, N91, 
        N90, N89, N88, N87}) );
  ALU_DW02_mult_0 mult_47 ( .A({n26, n25, n23, n18, n15, n9, n8, n7}), .B({
        B[7], n6, B[5:0]}), .TC(1'b0), .PRODUCT({N120, N119, N118, N117, N116, 
        N115, N114, N113, N112, N111, N110, N109, N108, N107, N106, N105}) );
endmodule


module RX_Controller_test_1 ( RXCont_Pdata, RXCont_Data_Valid, RXCont_CLK, 
        RXCont_RST, RXCont_Out_Data, RXCont_Out_Addr, RXCont_Out_command, 
        test_si2, test_si1, test_so2, test_so1, test_se );
  input [7:0] RXCont_Pdata;
  output [7:0] RXCont_Out_Data;
  output [7:0] RXCont_Out_Addr;
  output [2:0] RXCont_Out_command;
  input RXCont_Data_Valid, RXCont_CLK, RXCont_RST, test_si2, test_si1, test_se;
  output test_so2, test_so1;
  wire   count, n30, n33, n34, n35, n36, n37, n38, n39, n40, n41, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n21, n22, n23, n24, n25, n26, n27, n28, n29, n31, n32, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;
  wire   [7:0] command;
  assign test_so1 = Current_State[1];
  assign test_so2 = count;

  SDFFRX1M \addr_reg[0]  ( .D(n87), .SI(n24), .SE(test_se), .CK(RXCont_CLK), 
        .RN(n22), .Q(n109), .QN(n41) );
  SDFFRQX2M count_reg ( .D(n96), .SI(command[7]), .SE(test_se), .CK(RXCont_CLK), .RN(n22), .Q(count) );
  SDFFRX1M \addr_reg[7]  ( .D(n80), .SI(n103), .SE(test_se), .CK(RXCont_CLK), 
        .RN(n22), .Q(n102), .QN(n34) );
  SDFFRX1M \addr_reg[6]  ( .D(n81), .SI(n104), .SE(test_se), .CK(RXCont_CLK), 
        .RN(n22), .Q(n103), .QN(n35) );
  SDFFRX1M \addr_reg[5]  ( .D(n82), .SI(n105), .SE(test_se), .CK(RXCont_CLK), 
        .RN(n22), .Q(n104), .QN(n36) );
  SDFFRX1M \addr_reg[4]  ( .D(n83), .SI(n106), .SE(test_se), .CK(RXCont_CLK), 
        .RN(n22), .Q(n105), .QN(n37) );
  SDFFRX1M \addr_reg[3]  ( .D(n84), .SI(n107), .SE(test_se), .CK(RXCont_CLK), 
        .RN(n22), .Q(n106), .QN(n38) );
  SDFFRX1M \addr_reg[2]  ( .D(n85), .SI(n108), .SE(test_se), .CK(RXCont_CLK), 
        .RN(n22), .Q(n107), .QN(n39) );
  SDFFRX1M \addr_reg[1]  ( .D(n86), .SI(n109), .SE(test_se), .CK(RXCont_CLK), 
        .RN(n22), .Q(n108), .QN(n40) );
  SDFFRQX2M \command_reg[7]  ( .D(n88), .SI(n31), .SE(test_se), .CK(RXCont_CLK), .RN(n22), .Q(command[7]) );
  SDFFRQX2M \command_reg[3]  ( .D(n92), .SI(n42), .SE(test_se), .CK(RXCont_CLK), .RN(n22), .Q(command[3]) );
  SDFFRX1M \command_reg[4]  ( .D(n91), .SI(command[3]), .SE(test_se), .CK(
        RXCont_CLK), .RN(n22), .Q(n100), .QN(n30) );
  SDFFRX1M \command_reg[0]  ( .D(n95), .SI(n102), .SE(test_se), .CK(RXCont_CLK), .RN(n22), .Q(n101), .QN(n33) );
  SDFFRQX2M \Current_State_reg[0]  ( .D(Next_State[0]), .SI(test_si1), .SE(
        test_se), .CK(RXCont_CLK), .RN(n22), .Q(Current_State[0]) );
  SDFFRQX2M \command_reg[6]  ( .D(n89), .SI(command[5]), .SE(test_se), .CK(
        RXCont_CLK), .RN(n22), .Q(command[6]) );
  SDFFRQX2M \command_reg[5]  ( .D(n90), .SI(n100), .SE(test_se), .CK(
        RXCont_CLK), .RN(n22), .Q(command[5]) );
  SDFFRQX2M \command_reg[2]  ( .D(n93), .SI(command[1]), .SE(test_se), .CK(
        RXCont_CLK), .RN(n22), .Q(command[2]) );
  SDFFRQX2M \command_reg[1]  ( .D(n94), .SI(n101), .SE(test_se), .CK(
        RXCont_CLK), .RN(n22), .Q(command[1]) );
  SDFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .SI(n44), .SE(test_se), 
        .CK(RXCont_CLK), .RN(n22), .Q(Current_State[1]) );
  SDFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .SI(test_si2), .SE(
        test_se), .CK(RXCont_CLK), .RN(n22), .Q(Current_State[2]) );
  NOR3X2M U23 ( .A(Current_State[1]), .B(Current_State[2]), .C(n44), .Y(n52)
         );
  INVX2M U24 ( .A(n23), .Y(n22) );
  NOR2X2M U25 ( .A(RXCont_Out_command[0]), .B(RXCont_Out_command[2]), .Y(n57)
         );
  NAND2X2M U26 ( .A(n21), .B(n61), .Y(n56) );
  NAND2X2M U27 ( .A(n59), .B(n55), .Y(RXCont_Out_command[0]) );
  NAND2X2M U28 ( .A(n55), .B(n56), .Y(RXCont_Out_command[1]) );
  INVX2M U29 ( .A(n61), .Y(n29) );
  INVX2M U30 ( .A(n21), .Y(n25) );
  INVX2M U31 ( .A(RXCont_RST), .Y(n23) );
  NAND2X2M U32 ( .A(n29), .B(n54), .Y(n59) );
  NAND3X2M U33 ( .A(n63), .B(n64), .C(n54), .Y(n55) );
  NOR2X2M U34 ( .A(n57), .B(n49), .Y(RXCont_Out_Data[4]) );
  NOR2X2M U35 ( .A(n57), .B(n48), .Y(RXCont_Out_Data[5]) );
  NOR2X2M U36 ( .A(n57), .B(n47), .Y(RXCont_Out_Data[6]) );
  NOR2X2M U37 ( .A(n57), .B(n46), .Y(RXCont_Out_Data[7]) );
  NOR2X2M U38 ( .A(n57), .B(n99), .Y(RXCont_Out_Data[0]) );
  NOR2X2M U39 ( .A(n57), .B(n98), .Y(RXCont_Out_Data[1]) );
  NOR2X2M U40 ( .A(n57), .B(n97), .Y(RXCont_Out_Data[2]) );
  NOR2X2M U41 ( .A(n57), .B(n50), .Y(RXCont_Out_Data[3]) );
  NAND2X2M U42 ( .A(n64), .B(n70), .Y(n61) );
  BUFX2M U43 ( .A(n51), .Y(n21) );
  NOR2X2M U44 ( .A(n45), .B(n26), .Y(n51) );
  INVX2M U45 ( .A(n69), .Y(n26) );
  OAI31X1M U46 ( .A0(n74), .A1(n49), .A2(n99), .B0(n75), .Y(n72) );
  NOR2X2M U47 ( .A(n58), .B(n45), .Y(RXCont_Out_command[2]) );
  OAI22X1M U48 ( .A0(n52), .A1(n43), .B0(n98), .B1(n27), .Y(n94) );
  OAI22X1M U49 ( .A0(n52), .A1(n42), .B0(n97), .B1(n27), .Y(n93) );
  OAI22X1M U50 ( .A0(n52), .A1(n32), .B0(n48), .B1(n27), .Y(n90) );
  OAI22X1M U51 ( .A0(n52), .A1(n31), .B0(n47), .B1(n27), .Y(n89) );
  INVX2M U52 ( .A(n52), .Y(n27) );
  NOR2X2M U53 ( .A(n50), .B(n27), .Y(n73) );
  NAND3X2M U54 ( .A(n99), .B(n49), .C(n79), .Y(n75) );
  NOR4X1M U55 ( .A(n43), .B(n32), .C(command[2]), .D(command[6]), .Y(n70) );
  NOR3X2M U56 ( .A(n44), .B(Current_State[2]), .C(n28), .Y(n69) );
  NOR3X2M U57 ( .A(Current_State[0]), .B(Current_State[2]), .C(n28), .Y(n53)
         );
  AND4X2M U58 ( .A(command[3]), .B(command[7]), .C(n33), .D(n30), .Y(n64) );
  OAI221X1M U59 ( .A0(n99), .A1(n56), .B0(n41), .B1(n59), .C0(n60), .Y(
        RXCont_Out_Addr[0]) );
  OAI22X1M U60 ( .A0(n40), .A1(n59), .B0(n98), .B1(n56), .Y(RXCont_Out_Addr[1]) );
  OAI22X1M U61 ( .A0(n39), .A1(n59), .B0(n97), .B1(n56), .Y(RXCont_Out_Addr[2]) );
  OAI22X1M U62 ( .A0(n38), .A1(n59), .B0(n50), .B1(n56), .Y(RXCont_Out_Addr[3]) );
  OAI22X1M U63 ( .A0(n37), .A1(n59), .B0(n49), .B1(n56), .Y(RXCont_Out_Addr[4]) );
  OAI22X1M U64 ( .A0(n36), .A1(n59), .B0(n48), .B1(n56), .Y(RXCont_Out_Addr[5]) );
  OAI22X1M U65 ( .A0(n35), .A1(n59), .B0(n47), .B1(n56), .Y(RXCont_Out_Addr[6]) );
  OAI22X1M U66 ( .A0(n34), .A1(n59), .B0(n46), .B1(n56), .Y(RXCont_Out_Addr[7]) );
  INVX2M U67 ( .A(Current_State[0]), .Y(n44) );
  INVX2M U68 ( .A(Current_State[1]), .Y(n28) );
  AND2X2M U69 ( .A(n53), .B(RXCont_Data_Valid), .Y(n54) );
  INVX2M U70 ( .A(command[1]), .Y(n43) );
  INVX2M U71 ( .A(command[5]), .Y(n32) );
  OAI31X1M U72 ( .A0(n74), .A1(RXCont_Pdata[4]), .A2(RXCont_Pdata[0]), .B0(n65), .Y(n71) );
  NOR4X1M U73 ( .A(n42), .B(n31), .C(command[1]), .D(command[5]), .Y(n63) );
  NOR4X1M U74 ( .A(n97), .B(n47), .C(RXCont_Pdata[1]), .D(RXCont_Pdata[5]), 
        .Y(n79) );
  OAI221X1M U75 ( .A0(RXCont_Data_Valid), .A1(n26), .B0(n76), .B1(n27), .C0(
        n77), .Y(Next_State[0]) );
  NAND4X2M U76 ( .A(RXCont_Data_Valid), .B(n78), .C(n44), .D(n24), .Y(n77) );
  AOI211X2M U77 ( .A0(n75), .A1(n65), .B0(n50), .C0(n46), .Y(n76) );
  OAI211X2M U78 ( .A0(n63), .A1(n70), .B0(Current_State[1]), .C0(n64), .Y(n78)
         );
  OAI211X2M U79 ( .A0(RXCont_Data_Valid), .A1(n58), .B0(n62), .C0(n60), .Y(
        Next_State[2]) );
  NAND4BX1M U80 ( .AN(n65), .B(n52), .C(RXCont_Pdata[3]), .D(RXCont_Pdata[7]), 
        .Y(n62) );
  OAI22X1M U81 ( .A0(n52), .A1(n33), .B0(n99), .B1(n27), .Y(n95) );
  OAI22X1M U82 ( .A0(n52), .A1(n30), .B0(n49), .B1(n27), .Y(n91) );
  OAI22X1M U83 ( .A0(n25), .A1(n99), .B0(n21), .B1(n41), .Y(n87) );
  OAI22X1M U84 ( .A0(n25), .A1(n98), .B0(n21), .B1(n40), .Y(n86) );
  OAI22X1M U85 ( .A0(n25), .A1(n97), .B0(n21), .B1(n39), .Y(n85) );
  OAI22X1M U86 ( .A0(n25), .A1(n50), .B0(n21), .B1(n38), .Y(n84) );
  OAI22X1M U87 ( .A0(n25), .A1(n49), .B0(n21), .B1(n37), .Y(n83) );
  OAI22X1M U88 ( .A0(n25), .A1(n48), .B0(n21), .B1(n36), .Y(n82) );
  OAI22X1M U89 ( .A0(n25), .A1(n47), .B0(n21), .B1(n35), .Y(n81) );
  OAI22X1M U90 ( .A0(n25), .A1(n46), .B0(n21), .B1(n34), .Y(n80) );
  OAI211X2M U91 ( .A0(n28), .A1(n66), .B0(n67), .C0(n68), .Y(Next_State[1]) );
  OAI21X2M U92 ( .A0(n44), .A1(n24), .B0(n45), .Y(n66) );
  AOI32X1M U93 ( .A0(n64), .A1(n53), .A2(n63), .B0(n29), .B1(n69), .Y(n68) );
  OAI211X2M U94 ( .A0(n71), .A1(n72), .B0(RXCont_Pdata[7]), .C0(n73), .Y(n67)
         );
  INVX2M U95 ( .A(RXCont_Pdata[2]), .Y(n97) );
  INVX2M U96 ( .A(RXCont_Pdata[6]), .Y(n47) );
  OAI2BB2X1M U97 ( .B0(n50), .B1(n27), .A0N(n27), .A1N(command[3]), .Y(n92) );
  OAI2BB2X1M U98 ( .B0(n46), .B1(n27), .A0N(n27), .A1N(command[7]), .Y(n88) );
  NAND3X2M U99 ( .A(Current_State[1]), .B(n44), .C(Current_State[2]), .Y(n58)
         );
  NAND4X2M U100 ( .A(RXCont_Pdata[1]), .B(RXCont_Pdata[5]), .C(n97), .D(n47), 
        .Y(n74) );
  INVX2M U101 ( .A(RXCont_Pdata[4]), .Y(n49) );
  INVX2M U102 ( .A(RXCont_Pdata[3]), .Y(n50) );
  INVX2M U103 ( .A(RXCont_Pdata[0]), .Y(n99) );
  INVX2M U104 ( .A(RXCont_Pdata[1]), .Y(n98) );
  INVX2M U105 ( .A(RXCont_Pdata[5]), .Y(n48) );
  INVX2M U106 ( .A(RXCont_Data_Valid), .Y(n45) );
  INVX2M U107 ( .A(RXCont_Pdata[7]), .Y(n46) );
  INVX2M U108 ( .A(Current_State[2]), .Y(n24) );
  NAND3X2M U109 ( .A(RXCont_Pdata[0]), .B(RXCont_Pdata[4]), .C(n79), .Y(n65)
         );
  INVX2M U110 ( .A(command[2]), .Y(n42) );
  INVX2M U111 ( .A(command[6]), .Y(n31) );
  NAND2BX2M U112 ( .AN(n55), .B(count), .Y(n60) );
  AO21XLM U113 ( .A0(n53), .A1(count), .B0(n54), .Y(n96) );
endmodule


module TX_Controller_test_1 ( TXCont_ALU_Out, TXCont_Pdata, TXCont_RdData, 
        TXCont_Addr, TXCont_command, TXCont_ALU_valid, TXCont_RF_Valid, 
        TXCont_Busy, TXCont_CLK, TXCont_RST, TXCont_Addr_Out, 
        TXCont_TXPdata_Out, TXCont_RFWr_Data, TXCont_ALU_Fun, TXCont_ALU_en, 
        TXCont_CLK_en, TXCont_Rd_en, TXCont_Wr_en, TXCont_Data_Valid, 
        TXCont_CLK_Div_en, test_si, test_so, test_se );
  input [15:0] TXCont_ALU_Out;
  input [7:0] TXCont_Pdata;
  input [7:0] TXCont_RdData;
  input [7:0] TXCont_Addr;
  input [2:0] TXCont_command;
  output [7:0] TXCont_Addr_Out;
  output [7:0] TXCont_TXPdata_Out;
  output [7:0] TXCont_RFWr_Data;
  output [3:0] TXCont_ALU_Fun;
  input TXCont_ALU_valid, TXCont_RF_Valid, TXCont_Busy, TXCont_CLK, TXCont_RST,
         test_si, test_se;
  output TXCont_ALU_en, TXCont_CLK_en, TXCont_Rd_en, TXCont_Wr_en,
         TXCont_Data_Valid, TXCont_CLK_Div_en, test_so;
  wire   n21, n23, n24, n26, n27, n29, n30, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n43, n46, n47, n48, n49, n50, n56, n58, n60, n62, n64,
         n66, n68, n70, n72, n74, n76, n78, n80, n82, n84, n86, n87, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n22, n25, n28, n31, n42, n44, n45, n51, n88, n89;
  wire   [7:0] TXCont_Pdata_c;
  wire   [7:0] TXCont_Addr_c;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;
  assign test_so = TXCont_Pdata_c[7];

  SDFFRQX2M \TXCont_Pdata_c_reg[7]  ( .D(n86), .SI(TXCont_Pdata_c[6]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Pdata_c[7]) );
  SDFFRQX2M \TXCont_Pdata_c_reg[6]  ( .D(n84), .SI(TXCont_Pdata_c[5]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Pdata_c[6]) );
  SDFFRQX2M \TXCont_Pdata_c_reg[5]  ( .D(n82), .SI(TXCont_Pdata_c[4]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Pdata_c[5]) );
  SDFFRQX2M \TXCont_Pdata_c_reg[4]  ( .D(n80), .SI(n8), .SE(test_se), .CK(
        TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Pdata_c[4]) );
  SDFFRQX2M \TXCont_Pdata_c_reg[3]  ( .D(n78), .SI(n9), .SE(test_se), .CK(
        TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Pdata_c[3]) );
  SDFFRQX2M \TXCont_Pdata_c_reg[2]  ( .D(n76), .SI(n10), .SE(test_se), .CK(
        TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Pdata_c[2]) );
  SDFFRQX2M \TXCont_Pdata_c_reg[1]  ( .D(n74), .SI(n11), .SE(test_se), .CK(
        TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Pdata_c[1]) );
  SDFFRQX2M \TXCont_Pdata_c_reg[0]  ( .D(n72), .SI(TXCont_Addr_c[7]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Pdata_c[0]) );
  SDFFRQX2M \TXCont_Addr_c_reg[5]  ( .D(n66), .SI(TXCont_Addr_c[4]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Addr_c[5]) );
  SDFFRQX2M \TXCont_Addr_c_reg[4]  ( .D(n64), .SI(n16), .SE(test_se), .CK(
        TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Addr_c[4]) );
  SDFFRQX2M \TXCont_Addr_c_reg[3]  ( .D(n62), .SI(TXCont_Addr_c[2]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Addr_c[3]) );
  SDFFRQX2M \TXCont_Addr_c_reg[2]  ( .D(n60), .SI(TXCont_Addr_c[1]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Addr_c[2]) );
  SDFFRQX2M \TXCont_Addr_c_reg[7]  ( .D(n70), .SI(TXCont_Addr_c[6]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Addr_c[7]) );
  SDFFRQX2M \TXCont_Addr_c_reg[6]  ( .D(n68), .SI(TXCont_Addr_c[5]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Addr_c[6]) );
  SDFFRQX2M \TXCont_Addr_c_reg[1]  ( .D(n58), .SI(TXCont_Addr_c[0]), .SE(
        test_se), .CK(TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Addr_c[1]) );
  SDFFRQX2M \TXCont_Addr_c_reg[0]  ( .D(n56), .SI(n42), .SE(test_se), .CK(
        TXCont_CLK), .RN(TXCont_RST), .Q(TXCont_Addr_c[0]) );
  SDFFRQX2M \Current_State_reg[0]  ( .D(n87), .SI(test_si), .SE(test_se), .CK(
        TXCont_CLK), .RN(TXCont_RST), .Q(Current_State[0]) );
  SDFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .SI(n25), .SE(test_se), 
        .CK(TXCont_CLK), .RN(TXCont_RST), .Q(Current_State[1]) );
  SDFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .SI(n31), .SE(test_se), 
        .CK(TXCont_CLK), .RN(TXCont_RST), .Q(Current_State[2]) );
  NAND3X2M U5 ( .A(n44), .B(n51), .C(n45), .Y(n3) );
  NOR2X2M U6 ( .A(n46), .B(n17), .Y(TXCont_Addr_Out[2]) );
  INVX2M U7 ( .A(TXCont_Wr_en), .Y(n22) );
  NOR2X2M U8 ( .A(n8), .B(n41), .Y(TXCont_ALU_Fun[3]) );
  NOR2X2M U9 ( .A(n9), .B(n41), .Y(TXCont_ALU_Fun[2]) );
  NOR2X2M U10 ( .A(n10), .B(n41), .Y(TXCont_ALU_Fun[1]) );
  NOR3X2M U11 ( .A(Current_State[0]), .B(Current_State[2]), .C(n31), .Y(
        TXCont_Rd_en) );
  INVX2M U12 ( .A(TXCont_command[0]), .Y(n45) );
  INVX2M U13 ( .A(TXCont_command[1]), .Y(n44) );
  INVX2M U14 ( .A(TXCont_command[2]), .Y(n51) );
  INVX2M U15 ( .A(n39), .Y(n20) );
  NOR2X2M U16 ( .A(TXCont_Rd_en), .B(TXCont_Wr_en), .Y(n46) );
  NOR2X2M U17 ( .A(n46), .B(n18), .Y(TXCont_Addr_Out[1]) );
  NOR2X2M U18 ( .A(n46), .B(n19), .Y(TXCont_Addr_Out[0]) );
  NOR2X4M U19 ( .A(n46), .B(n16), .Y(TXCont_Addr_Out[3]) );
  NOR2X2M U20 ( .A(n46), .B(n14), .Y(TXCont_Addr_Out[5]) );
  NOR2X2M U21 ( .A(n46), .B(n15), .Y(TXCont_Addr_Out[4]) );
  OAI2BB2X1M U22 ( .B0(n3), .B1(n7), .A0N(TXCont_Pdata[4]), .A1N(n3), .Y(n80)
         );
  OAI2BB2X1M U23 ( .B0(n3), .B1(n6), .A0N(TXCont_Pdata[5]), .A1N(n3), .Y(n82)
         );
  OAI2BB2X1M U24 ( .B0(n3), .B1(n5), .A0N(TXCont_Pdata[6]), .A1N(n3), .Y(n84)
         );
  OAI2BB2X1M U25 ( .B0(n3), .B1(n4), .A0N(TXCont_Pdata[7]), .A1N(n3), .Y(n86)
         );
  OAI2BB2X1M U26 ( .B0(n3), .B1(n11), .A0N(TXCont_Pdata[0]), .A1N(n3), .Y(n72)
         );
  OAI2BB2X1M U27 ( .B0(n3), .B1(n10), .A0N(TXCont_Pdata[1]), .A1N(n3), .Y(n74)
         );
  OAI2BB2X1M U28 ( .B0(n3), .B1(n9), .A0N(TXCont_Pdata[2]), .A1N(n3), .Y(n76)
         );
  OAI2BB2X1M U29 ( .B0(n3), .B1(n8), .A0N(TXCont_Pdata[3]), .A1N(n3), .Y(n78)
         );
  NOR2X2M U30 ( .A(n46), .B(n13), .Y(TXCont_Addr_Out[6]) );
  NOR2X2M U31 ( .A(n46), .B(n12), .Y(TXCont_Addr_Out[7]) );
  OAI2B2X1M U32 ( .A1N(n40), .A0(n23), .B0(n41), .B1(n88), .Y(n30) );
  NOR2X2M U33 ( .A(n11), .B(n22), .Y(TXCont_RFWr_Data[0]) );
  NOR2X2M U34 ( .A(n10), .B(n22), .Y(TXCont_RFWr_Data[1]) );
  NOR2X2M U35 ( .A(n9), .B(n22), .Y(TXCont_RFWr_Data[2]) );
  NOR2X2M U36 ( .A(n8), .B(n22), .Y(TXCont_RFWr_Data[3]) );
  NOR2X2M U37 ( .A(n7), .B(n22), .Y(TXCont_RFWr_Data[4]) );
  NOR2X2M U38 ( .A(n6), .B(n22), .Y(TXCont_RFWr_Data[5]) );
  NOR2X2M U39 ( .A(n5), .B(n22), .Y(TXCont_RFWr_Data[6]) );
  NOR2X2M U40 ( .A(n4), .B(n22), .Y(TXCont_RFWr_Data[7]) );
  OAI221X1M U41 ( .A0(n21), .A1(n45), .B0(n42), .B1(n23), .C0(n24), .Y(n87) );
  AOI31X2M U42 ( .A0(n42), .A1(n89), .A2(n26), .B0(n27), .Y(n21) );
  NOR2X2M U43 ( .A(n42), .B(n25), .Y(n40) );
  OAI211X2M U44 ( .A0(n41), .A1(n88), .B0(n39), .C0(n43), .Y(TXCont_Data_Valid) );
  NOR2X2M U45 ( .A(n31), .B(n22), .Y(n27) );
  NAND2X2M U46 ( .A(n40), .B(n23), .Y(n39) );
  NAND2X2M U47 ( .A(n40), .B(n89), .Y(n24) );
  INVX2M U48 ( .A(n43), .Y(n28) );
  NAND2X2M U49 ( .A(n41), .B(n47), .Y(TXCont_ALU_en) );
  NAND4X2M U50 ( .A(TXCont_command[2]), .B(n26), .C(n45), .D(n44), .Y(n47) );
  NOR2X2M U51 ( .A(n11), .B(n41), .Y(TXCont_ALU_Fun[0]) );
  INVX2M U52 ( .A(Current_State[1]), .Y(n31) );
  NOR2X2M U53 ( .A(n25), .B(Current_State[2]), .Y(TXCont_Wr_en) );
  OAI211X2M U54 ( .A0(n49), .A1(n44), .B0(n50), .C0(n24), .Y(Next_State[1]) );
  OAI2BB1X2M U55 ( .A0N(TXCont_Busy), .A1N(TXCont_RF_Valid), .B0(TXCont_Rd_en), 
        .Y(n50) );
  AOI31X2M U56 ( .A0(n42), .A1(n89), .A2(n25), .B0(n27), .Y(n49) );
  OAI2BB2X1M U57 ( .B0(n3), .B1(n19), .A0N(TXCont_Addr[0]), .A1N(n3), .Y(n56)
         );
  OAI2BB2X1M U58 ( .B0(n3), .B1(n18), .A0N(TXCont_Addr[1]), .A1N(n3), .Y(n58)
         );
  OAI2BB2X1M U59 ( .B0(n3), .B1(n17), .A0N(TXCont_Addr[2]), .A1N(n3), .Y(n60)
         );
  OAI2BB2X1M U60 ( .B0(n3), .B1(n16), .A0N(TXCont_Addr[3]), .A1N(n3), .Y(n62)
         );
  OAI2BB2X1M U61 ( .B0(n3), .B1(n15), .A0N(TXCont_Addr[4]), .A1N(n3), .Y(n64)
         );
  OAI2BB2X1M U62 ( .B0(n3), .B1(n14), .A0N(TXCont_Addr[5]), .A1N(n3), .Y(n66)
         );
  OAI2BB2X1M U63 ( .B0(n3), .B1(n13), .A0N(TXCont_Addr[6]), .A1N(n3), .Y(n68)
         );
  OAI2BB2X1M U64 ( .B0(n3), .B1(n12), .A0N(TXCont_Addr[7]), .A1N(n3), .Y(n70)
         );
  INVX2M U65 ( .A(Current_State[0]), .Y(n25) );
  INVX2M U66 ( .A(TXCont_Addr_c[6]), .Y(n13) );
  INVX2M U67 ( .A(TXCont_Addr_c[7]), .Y(n12) );
  INVX2M U68 ( .A(TXCont_Addr_c[1]), .Y(n18) );
  INVX2M U69 ( .A(TXCont_Addr_c[0]), .Y(n19) );
  OAI221X1M U70 ( .A0(n48), .A1(n51), .B0(Current_State[1]), .B1(n42), .C0(n24), .Y(Next_State[2]) );
  AOI21X2M U71 ( .A0(n26), .A1(n89), .B0(n27), .Y(n48) );
  NAND2X2M U72 ( .A(n26), .B(Current_State[2]), .Y(n41) );
  NOR2X2M U73 ( .A(Current_State[0]), .B(Current_State[1]), .Y(n26) );
  NAND2X2M U74 ( .A(TXCont_RF_Valid), .B(TXCont_Rd_en), .Y(n43) );
  NAND2X2M U75 ( .A(TXCont_Busy), .B(n31), .Y(n23) );
  INVX2M U76 ( .A(Current_State[2]), .Y(n42) );
  INVX2M U77 ( .A(TXCont_Busy), .Y(n89) );
  INVX2M U78 ( .A(TXCont_Pdata_c[0]), .Y(n11) );
  INVX2M U79 ( .A(TXCont_Pdata_c[1]), .Y(n10) );
  INVX2M U80 ( .A(TXCont_Pdata_c[2]), .Y(n9) );
  INVX2M U81 ( .A(TXCont_Pdata_c[3]), .Y(n8) );
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
  INVX2M U125 ( .A(TXCont_ALU_valid), .Y(n88) );
  OR2X2M U126 ( .A(TXCont_ALU_en), .B(n40), .Y(TXCont_CLK_en) );
  INVX2M U3 ( .A(1'b0), .Y(TXCont_CLK_Div_en) );
endmodule


module SYS_Controller_test_1 ( SYSCont_ALU_Out, SYSCont_RXPdata, 
        SYSCont_RdData, SYSCont_ALU_Valid, SYSCont_RX_Data_Valid, 
        SYSCont_Rf_Data_Valid, SYSCont_Busy, SYSCont_CLK, SYSCont_RST, 
        SYSCont_TXPdata, SYSCont_WrData, SYSCont_Addr, SYSCont_ALU_Fun, 
        SYSCont_ALU_en, SYSCont_CLK_en, SYSCont_Rd_en, SYSCont_Wr_en, 
        SYSCont_TX_Data_Valid, SYSCont_CLK_div_en, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [15:0] SYSCont_ALU_Out;
  input [7:0] SYSCont_RXPdata;
  input [7:0] SYSCont_RdData;
  output [7:0] SYSCont_TXPdata;
  output [7:0] SYSCont_WrData;
  output [7:0] SYSCont_Addr;
  output [3:0] SYSCont_ALU_Fun;
  input SYSCont_ALU_Valid, SYSCont_RX_Data_Valid, SYSCont_Rf_Data_Valid,
         SYSCont_Busy, SYSCont_CLK, SYSCont_RST, test_si2, test_si1, test_se;
  output SYSCont_ALU_en, SYSCont_CLK_en, SYSCont_Rd_en, SYSCont_Wr_en,
         SYSCont_TX_Data_Valid, SYSCont_CLK_div_en, test_so2, test_so1;
  wire   n3, n4, n7;
  wire   [7:0] Recieved_Addr;
  wire   [7:0] Recieved_Data;
  wire   [2:0] Recieved_Command;

  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(SYSCont_RST), .Y(n4) );
  RX_Controller_test_1 U0_RX_Controller ( .RXCont_Pdata(SYSCont_RXPdata), 
        .RXCont_Data_Valid(SYSCont_RX_Data_Valid), .RXCont_CLK(SYSCont_CLK), 
        .RXCont_RST(n3), .RXCont_Out_Data(Recieved_Data), .RXCont_Out_Addr(
        Recieved_Addr), .RXCont_Out_command(Recieved_Command), .test_si2(
        test_si2), .test_si1(test_si1), .test_so2(n7), .test_so1(test_so1), 
        .test_se(test_se) );
  TX_Controller_test_1 U0_TX_Controller ( .TXCont_ALU_Out(SYSCont_ALU_Out), 
        .TXCont_Pdata(Recieved_Data), .TXCont_RdData(SYSCont_RdData), 
        .TXCont_Addr(Recieved_Addr), .TXCont_command(Recieved_Command), 
        .TXCont_ALU_valid(SYSCont_ALU_Valid), .TXCont_RF_Valid(
        SYSCont_Rf_Data_Valid), .TXCont_Busy(SYSCont_Busy), .TXCont_CLK(
        SYSCont_CLK), .TXCont_RST(n3), .TXCont_Addr_Out(SYSCont_Addr), 
        .TXCont_TXPdata_Out(SYSCont_TXPdata), .TXCont_RFWr_Data(SYSCont_WrData), .TXCont_ALU_Fun(SYSCont_ALU_Fun), .TXCont_ALU_en(SYSCont_ALU_en), 
        .TXCont_CLK_en(SYSCont_CLK_en), .TXCont_Rd_en(SYSCont_Rd_en), 
        .TXCont_Wr_en(SYSCont_Wr_en), .TXCont_Data_Valid(SYSCont_TX_Data_Valid), .test_si(n7), .test_so(test_so2), .test_se(test_se) );
  INVX2M U1 ( .A(1'b0), .Y(SYSCont_CLK_div_en) );
endmodule


module RXFSM_test_1 ( RXFSM_bit_cnt, RXFSM_RX_IN, RXFSM_par_err, 
        RXFSM_strt_glitch, RXFSM_stp_err, RXFSM_PAR_EN, RXFSM_FINISH, 
        RXFSM_EdgeFinish, RXFSM_CLK, RXFSM_RST, RXFSM_data_samp_en, 
        RXFSM_deser_en, RXFSM_edge_cnt_enable, RXFSM_bit_cnt_enable, 
        RXFSM_data_valid, RXFSM_par_chk_en, RXFSM_strt_chk_en, RXFSM_stp_chk, 
        test_si, test_so, test_se );
  input [2:0] RXFSM_bit_cnt;
  input RXFSM_RX_IN, RXFSM_par_err, RXFSM_strt_glitch, RXFSM_stp_err,
         RXFSM_PAR_EN, RXFSM_FINISH, RXFSM_EdgeFinish, RXFSM_CLK, RXFSM_RST,
         test_si, test_se;
  output RXFSM_data_samp_en, RXFSM_deser_en, RXFSM_edge_cnt_enable,
         RXFSM_bit_cnt_enable, RXFSM_data_valid, RXFSM_par_chk_en,
         RXFSM_strt_chk_en, RXFSM_stp_chk, test_so;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n5, n6, n7, n8,
         n9, n10;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;
  assign test_so = Current_State[2];

  SDFFRQX2M \Current_State_reg[0]  ( .D(Next_State[0]), .SI(test_si), .SE(
        test_se), .CK(RXFSM_CLK), .RN(RXFSM_RST), .Q(Current_State[0]) );
  SDFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .SI(n9), .SE(test_se), 
        .CK(RXFSM_CLK), .RN(RXFSM_RST), .Q(Current_State[1]) );
  SDFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .SI(Current_State[1]), 
        .SE(test_se), .CK(RXFSM_CLK), .RN(RXFSM_RST), .Q(Current_State[2]) );
  INVX2M U6 ( .A(RXFSM_EdgeFinish), .Y(n6) );
  OAI211X2M U7 ( .A0(RXFSM_FINISH), .A1(n11), .B0(n16), .C0(n17), .Y(
        Next_State[1]) );
  AOI211X2M U8 ( .A0(n18), .A1(RXFSM_strt_chk_en), .B0(RXFSM_par_chk_en), .C0(
        RXFSM_bit_cnt_enable), .Y(n17) );
  NOR2X2M U9 ( .A(RXFSM_strt_glitch), .B(n6), .Y(n18) );
  INVX2M U10 ( .A(n11), .Y(RXFSM_stp_chk) );
  NOR3BX2M U11 ( .AN(RXFSM_FINISH), .B(RXFSM_stp_err), .C(n11), .Y(
        RXFSM_data_valid) );
  NAND4XLM U12 ( .A(RXFSM_bit_cnt[2]), .B(RXFSM_bit_cnt[1]), .C(
        RXFSM_bit_cnt[0]), .D(RXFSM_EdgeFinish), .Y(n15) );
  AOI32X1M U13 ( .A0(n21), .A1(Current_State[1]), .A2(Current_State[2]), .B0(
        RXFSM_stp_chk), .B1(RXFSM_stp_err), .Y(n16) );
  NOR2XLM U14 ( .A(n9), .B(RXFSM_EdgeFinish), .Y(n21) );
  OAI211X2M U15 ( .A0(RXFSM_RX_IN), .A1(Current_State[2]), .B0(n7), .C0(n10), 
        .Y(RXFSM_edge_cnt_enable) );
  INVX2M U16 ( .A(RXFSM_data_samp_en), .Y(n7) );
  OAI2B11X2M U17 ( .A1N(RXFSM_par_chk_en), .A0(n6), .B0(n13), .C0(n5), .Y(
        Next_State[2]) );
  INVX2M U18 ( .A(n14), .Y(n5) );
  OAI32X1M U19 ( .A0(n15), .A1(RXFSM_PAR_EN), .A2(n8), .B0(n11), .B1(
        RXFSM_FINISH), .Y(n14) );
  INVX2M U20 ( .A(RXFSM_bit_cnt_enable), .Y(n8) );
  OAI2B11X2M U21 ( .A1N(RXFSM_strt_chk_en), .A0(RXFSM_strt_glitch), .B0(n13), 
        .C0(n19), .Y(Next_State[0]) );
  AOI32X1M U22 ( .A0(n9), .A1(n10), .A2(n20), .B0(RXFSM_bit_cnt_enable), .B1(
        n15), .Y(n19) );
  NOR2X2M U23 ( .A(RXFSM_RX_IN), .B(Current_State[2]), .Y(n20) );
  AOI21BX2M U24 ( .A0(RXFSM_par_err), .A1(RXFSM_par_chk_en), .B0N(n16), .Y(n13) );
  OAI211X2M U25 ( .A0(Current_State[2]), .A1(n9), .B0(n11), .C0(n12), .Y(
        RXFSM_data_samp_en) );
  NAND3X2M U26 ( .A(Current_State[1]), .B(n9), .C(Current_State[2]), .Y(n11)
         );
  INVX2M U27 ( .A(Current_State[0]), .Y(n9) );
  OR2X2M U28 ( .A(Current_State[2]), .B(n10), .Y(n12) );
  INVX2M U29 ( .A(Current_State[1]), .Y(n10) );
  NOR3X2M U30 ( .A(Current_State[1]), .B(Current_State[2]), .C(n9), .Y(
        RXFSM_strt_chk_en) );
  NOR2X2M U31 ( .A(n12), .B(Current_State[0]), .Y(RXFSM_par_chk_en) );
  BUFX2M U32 ( .A(RXFSM_bit_cnt_enable), .Y(RXFSM_deser_en) );
  NOR2X2M U33 ( .A(n12), .B(n9), .Y(RXFSM_bit_cnt_enable) );
endmodule


module edge_bit_counter_test_1 ( Cnt_prescale, Cnt_edge_cnt_enable, 
        Cnt_bit_cnt_enable, Cnt_CLK, Cnt_RST, Cnt_edge_cnt, Cnt_bit_cnt, 
        Cnt_EdgeFinish, test_si, test_se );
  input [4:0] Cnt_prescale;
  output [4:0] Cnt_edge_cnt;
  output [2:0] Cnt_bit_cnt;
  input Cnt_edge_cnt_enable, Cnt_bit_cnt_enable, Cnt_CLK, Cnt_RST, test_si,
         test_se;
  output Cnt_EdgeFinish;
  wire   N11, N12, N13, n15, n16, n17, n18, n19, n20, n21, n22,
         \add_50/carry[4] , \add_50/carry[3] , \add_50/carry[2] , n1, n2, n11,
         n12, n13, n14, n23, n24, n25, n26, n27, n28, n29;
  wire   [4:0] EdgeCounter_comb;

  SDFFRQX2M \Cnt_bit_cnt_reg[2]  ( .D(n20), .SI(n28), .SE(test_se), .CK(
        Cnt_CLK), .RN(Cnt_RST), .Q(Cnt_bit_cnt[2]) );
  SDFFRQX2M \Cnt_bit_cnt_reg[1]  ( .D(n21), .SI(n27), .SE(test_se), .CK(
        Cnt_CLK), .RN(Cnt_RST), .Q(Cnt_bit_cnt[1]) );
  SDFFRQX2M \Cnt_bit_cnt_reg[0]  ( .D(n22), .SI(test_si), .SE(test_se), .CK(
        Cnt_CLK), .RN(Cnt_RST), .Q(Cnt_bit_cnt[0]) );
  SDFFRQX2M \Cnt_edge_cnt_reg[4]  ( .D(EdgeCounter_comb[4]), .SI(
        Cnt_edge_cnt[3]), .SE(test_se), .CK(Cnt_CLK), .RN(Cnt_RST), .Q(
        Cnt_edge_cnt[4]) );
  SDFFRQX2M \Cnt_edge_cnt_reg[0]  ( .D(EdgeCounter_comb[0]), .SI(
        Cnt_bit_cnt[2]), .SE(test_se), .CK(Cnt_CLK), .RN(Cnt_RST), .Q(
        Cnt_edge_cnt[0]) );
  SDFFRQX2M \Cnt_edge_cnt_reg[3]  ( .D(EdgeCounter_comb[3]), .SI(
        Cnt_edge_cnt[2]), .SE(test_se), .CK(Cnt_CLK), .RN(Cnt_RST), .Q(
        Cnt_edge_cnt[3]) );
  SDFFRQX2M \Cnt_edge_cnt_reg[1]  ( .D(EdgeCounter_comb[1]), .SI(
        Cnt_edge_cnt[0]), .SE(test_se), .CK(Cnt_CLK), .RN(Cnt_RST), .Q(
        Cnt_edge_cnt[1]) );
  SDFFRQX2M \Cnt_edge_cnt_reg[2]  ( .D(EdgeCounter_comb[2]), .SI(
        Cnt_edge_cnt[1]), .SE(test_se), .CK(Cnt_CLK), .RN(Cnt_RST), .Q(
        Cnt_edge_cnt[2]) );
  INVX2M U6 ( .A(n18), .Y(n26) );
  INVX2M U12 ( .A(Cnt_bit_cnt_enable), .Y(n29) );
  NOR2X2M U13 ( .A(n29), .B(Cnt_EdgeFinish), .Y(n18) );
  NOR2BX2M U14 ( .AN(N11), .B(n19), .Y(EdgeCounter_comb[1]) );
  NOR2BX2M U15 ( .AN(N12), .B(n19), .Y(EdgeCounter_comb[2]) );
  NOR2BX2M U16 ( .AN(N13), .B(n19), .Y(EdgeCounter_comb[3]) );
  OAI32X1M U17 ( .A0(n29), .A1(Cnt_bit_cnt[0]), .A2(n18), .B0(n27), .B1(n26), 
        .Y(n22) );
  NAND2BX1M U18 ( .AN(Cnt_EdgeFinish), .B(Cnt_edge_cnt_enable), .Y(n19) );
  OAI22X1M U19 ( .A0(n28), .A1(n26), .B0(n17), .B1(n29), .Y(n21) );
  AOI32X1M U20 ( .A0(n26), .A1(n28), .A2(Cnt_bit_cnt[0]), .B0(Cnt_bit_cnt[1]), 
        .B1(n27), .Y(n17) );
  INVX2M U21 ( .A(Cnt_bit_cnt[1]), .Y(n28) );
  NOR2X2M U22 ( .A(n15), .B(n29), .Y(n20) );
  CLKXOR2X2M U23 ( .A(n16), .B(Cnt_bit_cnt[2]), .Y(n15) );
  NAND3XLM U24 ( .A(Cnt_bit_cnt[1]), .B(Cnt_bit_cnt[0]), .C(Cnt_EdgeFinish), 
        .Y(n16) );
  NOR2X2M U25 ( .A(n1), .B(n19), .Y(EdgeCounter_comb[4]) );
  XNOR2X2M U26 ( .A(\add_50/carry[4] ), .B(Cnt_edge_cnt[4]), .Y(n1) );
  NOR2X2M U27 ( .A(Cnt_edge_cnt[0]), .B(n19), .Y(EdgeCounter_comb[0]) );
  INVX2M U28 ( .A(Cnt_bit_cnt[0]), .Y(n27) );
  ADDHX1M U29 ( .A(Cnt_edge_cnt[2]), .B(\add_50/carry[2] ), .CO(
        \add_50/carry[3] ), .S(N12) );
  ADDHX1M U30 ( .A(Cnt_edge_cnt[1]), .B(Cnt_edge_cnt[0]), .CO(
        \add_50/carry[2] ), .S(N11) );
  ADDHX1M U31 ( .A(Cnt_edge_cnt[3]), .B(\add_50/carry[3] ), .CO(
        \add_50/carry[4] ), .S(N13) );
  CLKXOR2X2M U32 ( .A(Cnt_prescale[2]), .B(Cnt_edge_cnt[2]), .Y(n25) );
  NOR2BX1M U33 ( .AN(Cnt_prescale[0]), .B(Cnt_edge_cnt[0]), .Y(n2) );
  OAI2B2X1M U34 ( .A1N(Cnt_edge_cnt[1]), .A0(n2), .B0(Cnt_prescale[1]), .B1(n2), .Y(n13) );
  NOR2BX1M U35 ( .AN(Cnt_edge_cnt[0]), .B(Cnt_prescale[0]), .Y(n11) );
  OAI2B2X1M U36 ( .A1N(Cnt_prescale[1]), .A0(n11), .B0(Cnt_edge_cnt[1]), .B1(
        n11), .Y(n12) );
  CLKNAND2X2M U37 ( .A(n13), .B(n12), .Y(n24) );
  CLKXOR2X2M U38 ( .A(Cnt_prescale[3]), .B(Cnt_edge_cnt[3]), .Y(n23) );
  CLKXOR2X2M U39 ( .A(Cnt_prescale[4]), .B(Cnt_edge_cnt[4]), .Y(n14) );
  NOR4X1M U40 ( .A(n25), .B(n24), .C(n23), .D(n14), .Y(Cnt_EdgeFinish) );
endmodule


module Data_Sampler_test_1 ( Sampler_edge_cnt, Sampler_prescale, 
        Sampler_data_samp_en, Sampler_RX_IN, Sampler_CLK, Sampler_RST, 
        Sampler_sample, Sampler_Sample_Valid, test_si, test_so, test_se );
  input [4:0] Sampler_edge_cnt;
  input [4:0] Sampler_prescale;
  input Sampler_data_samp_en, Sampler_RX_IN, Sampler_CLK, Sampler_RST, test_si,
         test_se;
  output Sampler_sample, Sampler_Sample_Valid, test_so;
  wire   N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, \add_75/carry[3] ,
         \add_75/carry[2] , \add_76/carry[3] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25;
  wire   [1:0] Ones_Num;
  wire   [1:0] Ones_Num_comb;
  assign test_so = Ones_Num[1];
  assign N18 = Sampler_prescale[1];

  SDFFRQX2M \Ones_Num_reg[1]  ( .D(Ones_Num_comb[1]), .SI(Ones_Num[0]), .SE(
        test_se), .CK(Sampler_CLK), .RN(Sampler_RST), .Q(Ones_Num[1]) );
  SDFFRQX2M \Ones_Num_reg[0]  ( .D(Ones_Num_comb[0]), .SI(test_si), .SE(
        test_se), .CK(Sampler_CLK), .RN(Sampler_RST), .Q(Ones_Num[0]) );
  INVX2M U5 ( .A(Sampler_prescale[2]), .Y(N19) );
  ADDHX1M U6 ( .A(Sampler_prescale[3]), .B(\add_75/carry[2] ), .CO(
        \add_75/carry[3] ), .S(N15) );
  ADDHX1M U7 ( .A(Sampler_prescale[2]), .B(N18), .CO(\add_75/carry[2] ), .S(
        N14) );
  ADDHX1M U8 ( .A(Sampler_prescale[4]), .B(\add_75/carry[3] ), .CO(N17), .S(
        N16) );
  AND2X1M U9 ( .A(\add_76/carry[3] ), .B(Sampler_prescale[4]), .Y(N22) );
  CLKXOR2X2M U10 ( .A(Sampler_prescale[4]), .B(\add_76/carry[3] ), .Y(N21) );
  AND2X1M U11 ( .A(Sampler_prescale[2]), .B(Sampler_prescale[3]), .Y(
        \add_76/carry[3] ) );
  CLKXOR2X2M U12 ( .A(Sampler_prescale[3]), .B(Sampler_prescale[2]), .Y(N20)
         );
  CLKINVX1M U13 ( .A(N18), .Y(N13) );
  NOR2X1M U14 ( .A(n1), .B(n2), .Y(Sampler_sample) );
  NOR2X1M U15 ( .A(n3), .B(n1), .Y(Ones_Num_comb[1]) );
  CLKXOR2X2M U16 ( .A(n4), .B(Ones_Num[1]), .Y(n1) );
  CLKNAND2X2M U17 ( .A(Sampler_RX_IN), .B(Ones_Num[0]), .Y(n4) );
  NOR2X1M U18 ( .A(n3), .B(n5), .Y(Ones_Num_comb[0]) );
  XNOR2X1M U19 ( .A(Ones_Num[0]), .B(Sampler_RX_IN), .Y(n5) );
  AOI2B1X1M U20 ( .A1N(n6), .A0(Sampler_data_samp_en), .B0(
        Sampler_Sample_Valid), .Y(n3) );
  CLKINVX1M U21 ( .A(n2), .Y(Sampler_Sample_Valid) );
  NAND4X1M U22 ( .A(n7), .B(Sampler_data_samp_en), .C(n8), .D(n9), .Y(n2) );
  NOR3X1M U23 ( .A(n10), .B(n11), .C(n12), .Y(n9) );
  CLKXOR2X2M U24 ( .A(Sampler_edge_cnt[2]), .B(N20), .Y(n12) );
  CLKXOR2X2M U25 ( .A(Sampler_edge_cnt[4]), .B(N22), .Y(n11) );
  CLKXOR2X2M U26 ( .A(Sampler_edge_cnt[3]), .B(N21), .Y(n10) );
  XNOR2X1M U27 ( .A(Sampler_edge_cnt[0]), .B(N18), .Y(n8) );
  XNOR2X1M U28 ( .A(Sampler_edge_cnt[1]), .B(N19), .Y(n7) );
  AOI33X1M U29 ( .A0(n13), .A1(n16), .A2(n17), .B0(n18), .B1(n19), .B2(n20), 
        .Y(n6) );
  NOR3X1M U30 ( .A(n21), .B(Sampler_edge_cnt[4]), .C(n22), .Y(n20) );
  CLKXOR2X2M U31 ( .A(Sampler_prescale[2]), .B(Sampler_edge_cnt[1]), .Y(n22)
         );
  CLKXOR2X2M U32 ( .A(N18), .B(Sampler_edge_cnt[0]), .Y(n21) );
  XNOR2X1M U33 ( .A(Sampler_edge_cnt[2]), .B(Sampler_prescale[3]), .Y(n19) );
  XNOR2X1M U34 ( .A(Sampler_edge_cnt[3]), .B(Sampler_prescale[4]), .Y(n18) );
  NOR3X1M U35 ( .A(n23), .B(n24), .C(n25), .Y(n17) );
  CLKXOR2X2M U36 ( .A(Sampler_edge_cnt[2]), .B(N15), .Y(n25) );
  CLKXOR2X2M U37 ( .A(Sampler_edge_cnt[1]), .B(N14), .Y(n24) );
  CLKXOR2X2M U38 ( .A(Sampler_edge_cnt[0]), .B(N13), .Y(n23) );
  XNOR2X1M U39 ( .A(Sampler_edge_cnt[3]), .B(N16), .Y(n16) );
  XNOR2X1M U40 ( .A(Sampler_edge_cnt[4]), .B(N17), .Y(n13) );
endmodule


module Deseralizer_test_1 ( Deseralizer_SampledData, Deseralizer_Sample_Valid, 
        Deseralizer_EN, Deseralizer_CLK, Deseralizer_RST, Deseralizer_PDATA, 
        test_si, test_so, test_se );
  output [7:0] Deseralizer_PDATA;
  input Deseralizer_SampledData, Deseralizer_Sample_Valid, Deseralizer_EN,
         Deseralizer_CLK, Deseralizer_RST, test_si, test_se;
  output test_so;
  wire   n1, n11, n13, n15, n17, n19, n21, n23, n25, n2, n3, n4, n5, n6, n7,
         n8, n9, n26;
  assign test_so = n4;

  SDFFRQX2M \Deseralizer_PDATA_reg[0]  ( .D(n11), .SI(test_si), .SE(test_se), 
        .CK(Deseralizer_CLK), .RN(Deseralizer_RST), .Q(Deseralizer_PDATA[0])
         );
  SDFFRQX2M \Deseralizer_PDATA_reg[1]  ( .D(n13), .SI(Deseralizer_PDATA[0]), 
        .SE(test_se), .CK(Deseralizer_CLK), .RN(Deseralizer_RST), .Q(
        Deseralizer_PDATA[1]) );
  SDFFRQX2M \Deseralizer_PDATA_reg[3]  ( .D(n17), .SI(n9), .SE(test_se), .CK(
        Deseralizer_CLK), .RN(Deseralizer_RST), .Q(Deseralizer_PDATA[3]) );
  SDFFRQX2M \Deseralizer_PDATA_reg[2]  ( .D(n15), .SI(n26), .SE(test_se), .CK(
        Deseralizer_CLK), .RN(Deseralizer_RST), .Q(Deseralizer_PDATA[2]) );
  SDFFRQX2M \Deseralizer_PDATA_reg[5]  ( .D(n21), .SI(n7), .SE(test_se), .CK(
        Deseralizer_CLK), .RN(Deseralizer_RST), .Q(Deseralizer_PDATA[5]) );
  SDFFRQX2M \Deseralizer_PDATA_reg[4]  ( .D(n19), .SI(n8), .SE(test_se), .CK(
        Deseralizer_CLK), .RN(Deseralizer_RST), .Q(Deseralizer_PDATA[4]) );
  SDFFRQX2M \Deseralizer_PDATA_reg[7]  ( .D(n25), .SI(n5), .SE(test_se), .CK(
        Deseralizer_CLK), .RN(Deseralizer_RST), .Q(Deseralizer_PDATA[7]) );
  SDFFRQX2M \Deseralizer_PDATA_reg[6]  ( .D(n23), .SI(n6), .SE(test_se), .CK(
        Deseralizer_CLK), .RN(Deseralizer_RST), .Q(Deseralizer_PDATA[6]) );
  INVX2M U2 ( .A(n2), .Y(n3) );
  BUFX2M U3 ( .A(n1), .Y(n2) );
  NAND2X2M U4 ( .A(Deseralizer_Sample_Valid), .B(Deseralizer_EN), .Y(n1) );
  OAI2BB2X1M U5 ( .B0(n3), .B1(n4), .A0N(Deseralizer_SampledData), .A1N(n3), 
        .Y(n25) );
  OAI22X1M U6 ( .A0(n3), .A1(n26), .B0(n2), .B1(n9), .Y(n13) );
  OAI22X1M U7 ( .A0(n3), .A1(n9), .B0(n2), .B1(n8), .Y(n15) );
  OAI22X1M U8 ( .A0(n3), .A1(n8), .B0(n2), .B1(n7), .Y(n17) );
  OAI22X1M U9 ( .A0(n3), .A1(n7), .B0(n2), .B1(n6), .Y(n19) );
  OAI22X1M U10 ( .A0(n3), .A1(n6), .B0(n2), .B1(n5), .Y(n21) );
  OAI22X1M U11 ( .A0(n3), .A1(n5), .B0(n2), .B1(n4), .Y(n23) );
  OAI2BB2X1M U12 ( .B0(n2), .B1(n26), .A0N(Deseralizer_PDATA[0]), .A1N(n2), 
        .Y(n11) );
  INVX2M U13 ( .A(Deseralizer_PDATA[2]), .Y(n9) );
  INVX2M U14 ( .A(Deseralizer_PDATA[6]), .Y(n5) );
  INVX2M U15 ( .A(Deseralizer_PDATA[7]), .Y(n4) );
  INVX2M U16 ( .A(Deseralizer_PDATA[3]), .Y(n8) );
  INVX2M U17 ( .A(Deseralizer_PDATA[4]), .Y(n7) );
  INVX2M U18 ( .A(Deseralizer_PDATA[5]), .Y(n6) );
  INVX2M U27 ( .A(Deseralizer_PDATA[1]), .Y(n26) );
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


module UART_RX_test_1 ( UartRx_prescale, UartRx_RX_IN, UartRx_PAR_EN, 
        UartRx_Par_Type, UartRx_CLK, UartRx_RST, UartRx_PDATA, 
        UartRx_Data_Valid, test_si, test_so, test_se );
  input [4:0] UartRx_prescale;
  output [7:0] UartRx_PDATA;
  input UartRx_RX_IN, UartRx_PAR_EN, UartRx_Par_Type, UartRx_CLK, UartRx_RST,
         test_si, test_se;
  output UartRx_Data_Valid, test_so;
  wire   par_err, strt_glitch, stp_err, FINISH, EdgeFinish, data_samp_en,
         deser_en, edge_cnt_enable, bit_cnt_enable, par_chk_en, strt_chk_en,
         stp_chk_en, sample, Sample_Valid, n1, n2, n3, n4, n5;
  wire   [2:0] bit_cnt;
  wire   [4:0] edge_cnt;
  assign test_so = edge_cnt[4];

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(UartRx_RST), .Y(n2) );
  RXFSM_test_1 U0_RXFSM ( .RXFSM_bit_cnt(bit_cnt), .RXFSM_RX_IN(UartRx_RX_IN), 
        .RXFSM_par_err(par_err), .RXFSM_strt_glitch(strt_glitch), 
        .RXFSM_stp_err(stp_err), .RXFSM_PAR_EN(UartRx_PAR_EN), .RXFSM_FINISH(
        FINISH), .RXFSM_EdgeFinish(EdgeFinish), .RXFSM_CLK(UartRx_CLK), 
        .RXFSM_RST(n1), .RXFSM_data_samp_en(data_samp_en), .RXFSM_deser_en(
        deser_en), .RXFSM_edge_cnt_enable(edge_cnt_enable), 
        .RXFSM_bit_cnt_enable(bit_cnt_enable), .RXFSM_data_valid(
        UartRx_Data_Valid), .RXFSM_par_chk_en(par_chk_en), .RXFSM_strt_chk_en(
        strt_chk_en), .RXFSM_stp_chk(stp_chk_en), .test_si(n4), .test_so(n3), 
        .test_se(test_se) );
  edge_bit_counter_test_1 U0_edge_bit_counter ( .Cnt_prescale(UartRx_prescale), 
        .Cnt_edge_cnt_enable(edge_cnt_enable), .Cnt_bit_cnt_enable(
        bit_cnt_enable), .Cnt_CLK(UartRx_CLK), .Cnt_RST(n1), .Cnt_edge_cnt(
        edge_cnt), .Cnt_bit_cnt(bit_cnt), .Cnt_EdgeFinish(EdgeFinish), 
        .test_si(n3), .test_se(test_se) );
  Data_Sampler_test_1 U0_Data_Sampler ( .Sampler_edge_cnt(edge_cnt), 
        .Sampler_prescale(UartRx_prescale), .Sampler_data_samp_en(data_samp_en), .Sampler_RX_IN(UartRx_RX_IN), .Sampler_CLK(UartRx_CLK), .Sampler_RST(n1), 
        .Sampler_sample(sample), .Sampler_Sample_Valid(Sample_Valid), 
        .test_si(test_si), .test_so(n5), .test_se(test_se) );
  Deseralizer_test_1 U0_Deseralizer ( .Deseralizer_SampledData(sample), 
        .Deseralizer_Sample_Valid(Sample_Valid), .Deseralizer_EN(deser_en), 
        .Deseralizer_CLK(UartRx_CLK), .Deseralizer_RST(n1), 
        .Deseralizer_PDATA(UartRx_PDATA), .test_si(n5), .test_so(n4), 
        .test_se(test_se) );
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
endmodule


module InputBuffer_test_1 ( Buffer_Pdata_in, Buffer_ParityEn_in, 
        Buffer_ParBit_in, Buffer_EN, Buffer_CLK, Buffer_RST_ASYN, 
        Buffer_Pdata_out, Buffer_ParityEn_out, Buffer_ParBit_out, test_si, 
        test_se );
  input [7:0] Buffer_Pdata_in;
  output [7:0] Buffer_Pdata_out;
  input Buffer_ParityEn_in, Buffer_ParBit_in, Buffer_EN, Buffer_CLK,
         Buffer_RST_ASYN, test_si, test_se;
  output Buffer_ParityEn_out, Buffer_ParBit_out;
  wire   n3, n5, n7, n9, n11, n13, n15, n17, n19, n21, n1, n22;

  SDFFRQX2M \Buffer_Pdata_out_reg[6]  ( .D(n19), .SI(Buffer_Pdata_out[5]), 
        .SE(test_se), .CK(Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(
        Buffer_Pdata_out[6]) );
  SDFFRQX2M \Buffer_Pdata_out_reg[2]  ( .D(n11), .SI(Buffer_Pdata_out[1]), 
        .SE(test_se), .CK(Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(
        Buffer_Pdata_out[2]) );
  SDFFRQX2M \Buffer_Pdata_out_reg[7]  ( .D(n21), .SI(Buffer_Pdata_out[6]), 
        .SE(test_se), .CK(Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(
        Buffer_Pdata_out[7]) );
  SDFFRQX2M \Buffer_Pdata_out_reg[3]  ( .D(n13), .SI(Buffer_Pdata_out[2]), 
        .SE(test_se), .CK(Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(
        Buffer_Pdata_out[3]) );
  SDFFRQX2M \Buffer_Pdata_out_reg[5]  ( .D(n17), .SI(Buffer_Pdata_out[4]), 
        .SE(test_se), .CK(Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(
        Buffer_Pdata_out[5]) );
  SDFFRQX2M \Buffer_Pdata_out_reg[1]  ( .D(n9), .SI(Buffer_Pdata_out[0]), .SE(
        test_se), .CK(Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(
        Buffer_Pdata_out[1]) );
  SDFFRQX2M \Buffer_Pdata_out_reg[4]  ( .D(n15), .SI(Buffer_Pdata_out[3]), 
        .SE(test_se), .CK(Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(
        Buffer_Pdata_out[4]) );
  SDFFRQX2M \Buffer_Pdata_out_reg[0]  ( .D(n7), .SI(Buffer_ParityEn_out), .SE(
        test_se), .CK(Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(
        Buffer_Pdata_out[0]) );
  SDFFRQX2M Buffer_ParBit_out_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(
        Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(Buffer_ParBit_out) );
  SDFFRQX2M Buffer_ParityEn_out_reg ( .D(n5), .SI(Buffer_ParBit_out), .SE(
        test_se), .CK(Buffer_CLK), .RN(Buffer_RST_ASYN), .Q(
        Buffer_ParityEn_out) );
  INVX2M U2 ( .A(n1), .Y(n22) );
  BUFX2M U3 ( .A(Buffer_EN), .Y(n1) );
  AO22X1M U4 ( .A0(Buffer_ParBit_in), .A1(n1), .B0(Buffer_ParBit_out), .B1(n22), .Y(n3) );
  AO22X1M U5 ( .A0(Buffer_ParityEn_in), .A1(n1), .B0(Buffer_ParityEn_out), 
        .B1(n22), .Y(n5) );
  AO22X1M U6 ( .A0(Buffer_Pdata_in[0]), .A1(n1), .B0(Buffer_Pdata_out[0]), 
        .B1(n22), .Y(n7) );
  AO22X1M U7 ( .A0(Buffer_Pdata_in[1]), .A1(n1), .B0(Buffer_Pdata_out[1]), 
        .B1(n22), .Y(n9) );
  AO22X1M U8 ( .A0(Buffer_Pdata_in[2]), .A1(n1), .B0(Buffer_Pdata_out[2]), 
        .B1(n22), .Y(n11) );
  AO22X1M U9 ( .A0(Buffer_Pdata_in[3]), .A1(n1), .B0(Buffer_Pdata_out[3]), 
        .B1(n22), .Y(n13) );
  AO22X1M U10 ( .A0(Buffer_Pdata_in[4]), .A1(n1), .B0(Buffer_Pdata_out[4]), 
        .B1(n22), .Y(n15) );
  AO22X1M U11 ( .A0(Buffer_Pdata_in[5]), .A1(n1), .B0(Buffer_Pdata_out[5]), 
        .B1(n22), .Y(n17) );
  AO22X1M U12 ( .A0(Buffer_Pdata_in[6]), .A1(n1), .B0(Buffer_Pdata_out[6]), 
        .B1(n22), .Y(n19) );
  AO22X1M U23 ( .A0(Buffer_Pdata_in[7]), .A1(n1), .B0(Buffer_Pdata_out[7]), 
        .B1(n22), .Y(n21) );
endmodule


module Parity_Calc ( ParityCalc_PDATA, ParityCalc_DataValid, 
        ParityCalc_ParType, ParityCalc_ParBit );
  input [7:0] ParityCalc_PDATA;
  input ParityCalc_DataValid, ParityCalc_ParType;
  output ParityCalc_ParBit;
  wire   n1, n2, n3, n4;

  XNOR2X2M U1 ( .A(ParityCalc_PDATA[7]), .B(ParityCalc_PDATA[6]), .Y(n4) );
  XNOR2X2M U2 ( .A(ParityCalc_PDATA[3]), .B(ParityCalc_PDATA[2]), .Y(n3) );
  XOR3XLM U3 ( .A(ParityCalc_ParType), .B(n1), .C(n2), .Y(ParityCalc_ParBit)
         );
  XOR3XLM U4 ( .A(ParityCalc_PDATA[1]), .B(ParityCalc_PDATA[0]), .C(n3), .Y(n2) );
  XOR3XLM U5 ( .A(ParityCalc_PDATA[5]), .B(ParityCalc_PDATA[4]), .C(n4), .Y(n1) );
endmodule


module FSM_test_1 ( FSM_RST_ASYN, FSM_CLK, FSM_DataValid, FSM_SerDone, 
        FSM_ParEn, FSM_SerEn, FSM_MuxSel, FSM_Busy, FSM_BuffEn, test_si, 
        test_so, test_se );
  output [1:0] FSM_MuxSel;
  input FSM_RST_ASYN, FSM_CLK, FSM_DataValid, FSM_SerDone, FSM_ParEn, test_si,
         test_se;
  output FSM_SerEn, FSM_Busy, FSM_BuffEn, test_so;
  wire   n5, n8, n9, n10, n11, n12, n13, n6, n7, n14, n15;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;
  assign test_so = n14;

  SDFFRQX2M \Current_State_reg[0]  ( .D(Next_State[0]), .SI(test_si), .SE(
        test_se), .CK(FSM_CLK), .RN(FSM_RST_ASYN), .Q(Current_State[0]) );
  SDFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .SI(n15), .SE(test_se), 
        .CK(FSM_CLK), .RN(FSM_RST_ASYN), .Q(Current_State[2]) );
  SDFFRX1M \Current_State_reg[1]  ( .D(Next_State[1]), .SI(Current_State[0]), 
        .SE(test_se), .CK(FSM_CLK), .RN(FSM_RST_ASYN), .Q(n15), .QN(n5) );
  INVX2M U7 ( .A(n10), .Y(FSM_SerEn) );
  NAND2X2M U8 ( .A(n9), .B(FSM_MuxSel[1]), .Y(n10) );
  OAI21X2M U9 ( .A0(n14), .A1(n6), .B0(FSM_Busy), .Y(FSM_BuffEn) );
  OR2X2M U10 ( .A(n13), .B(FSM_MuxSel[0]), .Y(FSM_Busy) );
  AOI21X2M U11 ( .A0(n5), .A1(Current_State[0]), .B0(n13), .Y(n9) );
  NOR2X2M U12 ( .A(n5), .B(Current_State[2]), .Y(FSM_MuxSel[1]) );
  OAI2B2X1M U13 ( .A1N(FSM_MuxSel[0]), .A0(n11), .B0(n12), .B1(n6), .Y(
        Next_State[0]) );
  AOI22X1M U14 ( .A0(Current_State[2]), .A1(n13), .B0(n5), .B1(n14), .Y(n12)
         );
  NOR2BX2M U15 ( .AN(FSM_SerDone), .B(n5), .Y(n11) );
  NOR2X2M U16 ( .A(n7), .B(Current_State[2]), .Y(FSM_MuxSel[0]) );
  NOR2X2M U17 ( .A(n5), .B(Current_State[0]), .Y(n13) );
  OAI21X2M U18 ( .A0(Current_State[2]), .A1(n9), .B0(n10), .Y(Next_State[1])
         );
  NOR2BX2M U19 ( .AN(FSM_MuxSel[1]), .B(n8), .Y(Next_State[2]) );
  AOI2B1X1M U20 ( .A1N(FSM_ParEn), .A0(FSM_SerDone), .B0(n7), .Y(n8) );
  INVX2M U21 ( .A(Current_State[0]), .Y(n7) );
  INVX2M U22 ( .A(Current_State[2]), .Y(n14) );
  INVX2M U23 ( .A(FSM_DataValid), .Y(n6) );
endmodule


module counter_test_1 ( counter_RST_ASYN, counter_CLK, counter_En, 
        counter_finish, count, test_si, test_se );
  output [2:0] count;
  input counter_RST_ASYN, counter_CLK, counter_En, test_si, test_se;
  output counter_finish;
  wire   n4, n6, n7, n8, n9, n10, n11;

  SDFFRQX2M \count_reg[0]  ( .D(n10), .SI(test_si), .SE(test_se), .CK(
        counter_CLK), .RN(counter_RST_ASYN), .Q(count[0]) );
  SDFFRQX2M \count_reg[1]  ( .D(n8), .SI(count[0]), .SE(test_se), .CK(
        counter_CLK), .RN(counter_RST_ASYN), .Q(count[1]) );
  SDFFRX1M \count_reg[2]  ( .D(n9), .SI(count[1]), .SE(test_se), .CK(
        counter_CLK), .RN(counter_RST_ASYN), .Q(count[2]), .QN(n4) );
  INVX2M U7 ( .A(counter_En), .Y(n11) );
  OAI32X1M U8 ( .A0(n11), .A1(n7), .A2(n4), .B0(count[0]), .B1(n11), .Y(n10)
         );
  NOR2X2M U9 ( .A(n4), .B(n7), .Y(counter_finish) );
  NAND2X2M U10 ( .A(count[1]), .B(count[0]), .Y(n7) );
  AOI2B1X1M U11 ( .A1N(counter_finish), .A0(n6), .B0(n11), .Y(n8) );
  XNOR2X2M U12 ( .A(count[0]), .B(count[1]), .Y(n6) );
  AOI21X2M U13 ( .A0(n7), .A1(n4), .B0(n11), .Y(n9) );
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


module Seralizer_test_1 ( Seralizer_ParallelData, Seralizer_CLK, 
        Seralizer_RST_ASYN, Seralizer_En, Seralizer_done, Seralizer_SerialData, 
        test_so, test_se );
  input [7:0] Seralizer_ParallelData;
  input Seralizer_CLK, Seralizer_RST_ASYN, Seralizer_En, test_se;
  output Seralizer_done, Seralizer_SerialData, test_so;

  wire   [2:0] CountToPISO;
  assign test_so = CountToPISO[2];

  counter_test_1 C0 ( .counter_RST_ASYN(Seralizer_RST_ASYN), .counter_CLK(
        Seralizer_CLK), .counter_En(Seralizer_En), .counter_finish(
        Seralizer_done), .count(CountToPISO), .test_si(
        Seralizer_ParallelData[7]), .test_se(test_se) );
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


module Uart_TX_Top_test_1 ( P_DATA, CLK, RST_ASYN, Data_Valid, PAR_EN, PAR_TYP, 
        TX_OUT, busy, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input CLK, RST_ASYN, Data_Valid, PAR_EN, PAR_TYP, test_si, test_se;
  output TX_OUT, busy, test_so;
  wire   Parity_bit_To_Buffer, BuffEn, Parity_En, Parity_bit, Ser_Done, Ser_En,
         Serial_Data, n1, n2, n4;
  wire   [7:0] Parallel_Data;
  wire   [1:0] FSM_MUXSelection;

  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST_ASYN), .Y(n2) );
  InputBuffer_test_1 U0_InputBuffer ( .Buffer_Pdata_in(P_DATA), 
        .Buffer_ParityEn_in(PAR_EN), .Buffer_ParBit_in(Parity_bit_To_Buffer), 
        .Buffer_EN(BuffEn), .Buffer_CLK(CLK), .Buffer_RST_ASYN(n1), 
        .Buffer_Pdata_out(Parallel_Data), .Buffer_ParityEn_out(Parity_En), 
        .Buffer_ParBit_out(Parity_bit), .test_si(n4), .test_se(test_se) );
  Parity_Calc U0_Parity_Calc ( .ParityCalc_PDATA(P_DATA), 
        .ParityCalc_DataValid(Data_Valid), .ParityCalc_ParType(PAR_TYP), 
        .ParityCalc_ParBit(Parity_bit_To_Buffer) );
  FSM_test_1 U0_FSM ( .FSM_RST_ASYN(n1), .FSM_CLK(CLK), .FSM_DataValid(
        Data_Valid), .FSM_SerDone(Ser_Done), .FSM_ParEn(Parity_En), 
        .FSM_SerEn(Ser_En), .FSM_MuxSel(FSM_MUXSelection), .FSM_Busy(busy), 
        .FSM_BuffEn(BuffEn), .test_si(test_si), .test_so(n4), .test_se(test_se) );
  Seralizer_test_1 U0_Seralizer ( .Seralizer_ParallelData(Parallel_Data), 
        .Seralizer_CLK(CLK), .Seralizer_RST_ASYN(n1), .Seralizer_En(Ser_En), 
        .Seralizer_done(Ser_Done), .Seralizer_SerialData(Serial_Data), 
        .test_so(test_so), .test_se(test_se) );
  MUX U0_MUX ( .Selection_Bits(FSM_MUXSelection), .in_00(1'b1), .in_01(1'b0), 
        .in_10(Parity_bit), .in_11(Serial_Data), .MUX_Out(TX_OUT) );
endmodule


module SYSTEM_TOP_dft ( RX_IN, REF_CLK, UART_CLK, SI, SE, scan_clk, scan_rst, 
        test_mode, SO, RST, TX_OUT );
  input [2:0] SI;
  output [2:0] SO;
  input RX_IN, REF_CLK, UART_CLK, SE, scan_clk, scan_rst, test_mode, RST;
  output TX_OUT;
  wire   REF_CLK_m, UART_CLK_m, UART_TX_CLK, UART_TX_CLK_m, RST_m, REF_RST,
         REF_RST_m, UART_RST, UART_RST_m, RX_Data_Valid, RX_TO_SYS_Data_Valid,
         SYS_TO_TX_Data_Valid, TX_Data_Valid, TX_busy, SYS_busy, _0_net_,
         ALU_CLK, CLK_en, Wr_en, Rd_en, Rd_Data_Valid, ALUen, ALUValid, n2, n3,
         n4, n5, n6, n7, n9, n10, n11, n12, n15, n18, n19;
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
  assign SO[0] = UART_RST;

  INVX2M U2 ( .A(n5), .Y(n4) );
  BUFX2M U3 ( .A(Addr[1]), .Y(n3) );
  BUFX2M U4 ( .A(Addr[0]), .Y(n2) );
  INVX4M U5 ( .A(n7), .Y(n6) );
  INVX2M U6 ( .A(REF_RST_m), .Y(n7) );
  INVX2M U7 ( .A(UART_RST_m), .Y(n5) );
  OR2X2M U8 ( .A(CLK_en), .B(test_mode), .Y(_0_net_) );
  mux2X1_2 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        REF_CLK_m) );
  mux2X1_4 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(UART_CLK_m) );
  mux2X1_3 U2_mux2X1 ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(UART_TX_CLK_m) );
  mux2X1_0 U3_mux2X1 ( .IN_0(RST), .IN_1(scan_rst), .SEL(test_mode), .OUT(
        RST_m) );
  mux2X1_1 U4_mux2X1 ( .IN_0(REF_RST), .IN_1(scan_rst), .SEL(test_mode), .OUT(
        REF_RST_m) );
  mux2X1_5 U5_mux2X1 ( .IN_0(UART_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(UART_RST_m) );
  RST_SYNC_test_0 U0_RST_SYNC ( .RSTSYNC_CLK(REF_CLK_m), .RSTSYNC_RST(RST_m), 
        .RSTSYNC_OUT(REF_RST), .test_si(n18), .test_se(SE) );
  RST_SYNC_test_1 U1_RST_SYNC ( .RSTSYNC_CLK(UART_CLK_m), .RSTSYNC_RST(RST_m), 
        .RSTSYNC_OUT(UART_RST), .test_si(n9), .test_se(SE) );
  DATA_SYNC_test_0 U0_DATA_SYNC ( .DataSync_unsync_bus(RXData), 
        .DataSync_bus_enable(RX_Data_Valid), .DataSync_CLK(REF_CLK_m), 
        .DataSync_RST(n6), .DataSync_sync_bus(RX_TO_SYS_Data), 
        .DataSync_enable_pulse(RX_TO_SYS_Data_Valid), .test_si(n19), .test_so(
        n18), .test_se(SE) );
  DATA_SYNC_test_1 U1_DATA_SYNC ( .DataSync_unsync_bus(SYS_TO_TX_Data), 
        .DataSync_bus_enable(SYS_TO_TX_Data_Valid), .DataSync_CLK(
        UART_TX_CLK_m), .DataSync_RST(n4), .DataSync_sync_bus(TXData), 
        .DataSync_enable_pulse(TX_Data_Valid), .test_si(n10), .test_so(n9), 
        .test_se(SE) );
  BIT_SYNC_test_1 U0_BIT_SYNC ( .BitSync_ASYNC(TX_busy), .BitSync_CLK(
        REF_CLK_m), .BitSync_RST(n6), .BitSync_SYNC(SYS_busy), .test_si(
        ALUValid), .test_se(SE) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(_0_net_), .CLK(REF_CLK_m), .GATED_CLK(ALU_CLK) );
  ClkDiv_test_1 U0_ClkDiv ( .i_div_ratio(Division_Ratio[3:0]), .i_ref_clk(
        UART_CLK_m), .i_rst_en(n4), .i_clk_en(1'b1), .o_div_clk(UART_TX_CLK), 
        .test_si(SYS_busy), .test_so(n19), .test_se(SE) );
  Register_File_test_1 U0_Register_File ( .RF_WrData(WrData), .RF_Addr({
        Addr[7:2], n3, n2}), .RF_Wr_en(Wr_en), .RF_Rd_en(Rd_en), .RF_CLK(
        REF_CLK_m), .RF_RST(n6), .RF_RdData(RdData), .REG0(OperA), .REG1(OperB), .REG2({SYNOPSYS_UNCONNECTED__0, UART_Config[6:0]}), .REG3({
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, Division_Ratio[3:0]}), .RF_Rd_Data_Valid(Rd_Data_Valid), .test_si2(SI[1]), .test_si1(REF_RST), 
        .test_so2(n15), .test_so1(SO[2]), .test_se(SE) );
  ALU_test_1 U0_ALU ( .A(OperA), .B(OperB), .ALU_en(ALUen), .ALU_CLK(ALU_CLK), 
        .ALU_RST(n6), .ALU_FUN(Function), .ALU_OUT(ALUOut), .ALU_Valid(
        ALUValid), .test_si(SI[2]), .test_se(SE) );
  SYS_Controller_test_1 U0_SYS_Controller ( .SYSCont_ALU_Out(ALUOut), 
        .SYSCont_RXPdata(RX_TO_SYS_Data), .SYSCont_RdData(RdData), 
        .SYSCont_ALU_Valid(ALUValid), .SYSCont_RX_Data_Valid(
        RX_TO_SYS_Data_Valid), .SYSCont_Rf_Data_Valid(Rd_Data_Valid), 
        .SYSCont_Busy(SYS_busy), .SYSCont_CLK(REF_CLK_m), .SYSCont_RST(n6), 
        .SYSCont_TXPdata(SYS_TO_TX_Data), .SYSCont_WrData(WrData), 
        .SYSCont_Addr(Addr), .SYSCont_ALU_Fun(Function), .SYSCont_ALU_en(ALUen), .SYSCont_CLK_en(CLK_en), .SYSCont_Rd_en(Rd_en), .SYSCont_Wr_en(Wr_en), 
        .SYSCont_TX_Data_Valid(SYS_TO_TX_Data_Valid), .test_si2(SI[0]), 
        .test_si1(n15), .test_so2(n12), .test_so1(SO[1]), .test_se(SE) );
  UART_RX_test_1 U0_UART_RX ( .UartRx_prescale(UART_Config[6:2]), 
        .UartRx_RX_IN(RX_IN), .UartRx_PAR_EN(UART_Config[0]), 
        .UartRx_Par_Type(UART_Config[1]), .UartRx_CLK(UART_CLK_m), 
        .UartRx_RST(n4), .UartRx_PDATA(RXData), .UartRx_Data_Valid(
        RX_Data_Valid), .test_si(n12), .test_so(n11), .test_se(SE) );
  Uart_TX_Top_test_1 U0_Uart_TX_Top ( .P_DATA(TXData), .CLK(UART_TX_CLK_m), 
        .RST_ASYN(n4), .Data_Valid(TX_Data_Valid), .PAR_EN(UART_Config[0]), 
        .PAR_TYP(UART_Config[1]), .TX_OUT(TX_OUT), .busy(TX_busy), .test_si(
        n11), .test_so(n10), .test_se(SE) );
endmodule

