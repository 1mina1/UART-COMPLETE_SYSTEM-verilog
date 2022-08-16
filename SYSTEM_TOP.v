// FILE NAME: SYSTEM_TOP.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 15/8/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: uart system, communnication system  
//------------------------------------------------
// PURPOSE: top module for the uart system\
//////////////////defining inputs and output port////////////////////
module SYSTEM_TOP (
  input    wire    RX_IN,
  input    wire    REF_CLK,
  input    wire    UART_CLK,
  input    wire    RST,
  output   wire    TX_OUT
  );
  
  wire              UART_TX_CLK;
  wire              REF_RST;
  wire              UART_RST;
  wire     [7:0]    RXData;
  wire     [7:0]    TXData;
  wire     [7:0]    WrData;
  wire     [7:0]    RdData;
  wire     [7:0]    Addr;
  wire     [7:0]    OperA;
  wire     [7:0]    OperB;
  wire     [7:0]    UART_Config;
  wire     [7:0]    Division_Ratio;
  wire     [7:0]    RX_TO_SYS_Data;
  wire     [7:0]    SYS_TO_TX_Data;
  wire     [15:0]   ALUOut; 
  wire              RX_TO_SYS_Data_Valid;
  wire              SYS_TO_TX_Data_Valid;
  wire              RX_Data_Valid;
  wire              TX_Data_Valid;
  wire              Rd_Data_Valid;
  wire              TX_busy;
  wire              SYS_busy;
  wire              Wr_en;
  wire              Rd_en;
  wire              ALUen;
  wire      [3:0]   Function;
  wire              ALUValid;
  wire              ALU_CLK;
  wire              CLK_en;
  wire              CLK_Div_en;
  ///////////////////////designs instantiations//////////////////
  ///////////////////////RESET synchronizers ///////////////////
  RST_SYNC U0_RST_SYNC (
  .RSTSYNC_CLK(REF_CLK),
  .RSTSYNC_RST(RST),
  .RSTSYNC_OUT(REF_RST)
  );
  
  RST_SYNC U1_RST_SYNC (
  .RSTSYNC_CLK(UART_CLK),
  .RSTSYNC_RST(RST),
  .RSTSYNC_OUT(UART_RST)
  );
  ///////////////////////Data and bit synchronizers/////////////
  DATA_SYNC U0_DATA_SYNC (//from RX to system control
  .DataSync_unsync_bus(RXData),
  .DataSync_bus_enable(RX_Data_Valid),
  .DataSync_CLK(REF_CLK),
  .DataSync_RST(REF_RST),
  .DataSync_sync_bus(RX_TO_SYS_Data),
  .DataSync_enable_pulse(RX_TO_SYS_Data_Valid)
  );
  
  DATA_SYNC U1_DATA_SYNC (//from system control to uart tx
  .DataSync_unsync_bus(SYS_TO_TX_Data),
  .DataSync_bus_enable(SYS_TO_TX_Data_Valid),
  .DataSync_CLK(UART_TX_CLK),
  .DataSync_RST(UART_RST),
  .DataSync_sync_bus(TXData),
  .DataSync_enable_pulse(TX_Data_Valid)
  );
  
  BIT_SYNC U0_BIT_SYNC (//from tx to system control
  .BitSync_ASYNC(TX_busy),
  .BitSync_CLK(REF_CLK),
  .BitSync_RST(REF_RST),
  .BitSync_SYNC(SYS_busy)
  );
  ///////////////////////clock gating and clock dividor//////////
  CLK_GATE U0_CLK_GATE (
  .CLK_EN(CLK_en),
  .CLK(REF_CLK),
  .GATED_CLK(ALU_CLK)
  );
  
  ClkDiv #(.WIDTH(4)) U0_ClkDiv(
  .i_div_ratio(Division_Ratio[3:0]),
  .i_ref_clk(UART_CLK),
  .i_rst_en(UART_RST),
  .i_clk_en(CLK_Div_en),
  .o_div_clk(UART_TX_CLK)
  );
  ///////////////////////Register File and ALU///////////////////
  
  Register_File U0_Register_File (
  .RF_WrData(WrData),
  .RF_Addr(Addr),
  .RF_Wr_en(Wr_en),
  .RF_Rd_en(Rd_en),
  .RF_CLK(REF_CLK),
  .RF_RST(REF_RST),
  .RF_RdData(RdData),
  .REG0(OperA),
  .REG1(OperB),
  .REG2(UART_Config),
  .REG3(Division_Ratio),
  .RF_Rd_Data_Valid(Rd_Data_Valid)
  );
  
  ALU U0_ALU (
  .A(OperA),
  .B(OperB),
  .ALU_en(ALUen),
  .ALU_CLK(ALU_CLK),
  .ALU_RST(REF_RST),
  .ALU_FUN(Function),
  .ALU_OUT(ALUOut),
  .ALU_Valid(ALUValid)
  );
  
  /////////////////////////SYSTEM Controller//////////////////////////
  
  SYS_Controller U0_SYS_Controller (
  .SYSCont_ALU_Out(ALUOut),
  .SYSCont_RXPdata(RX_TO_SYS_Data),
  .SYSCont_RdData(RdData),
  .SYSCont_ALU_Valid(ALUValid),
  .SYSCont_RX_Data_Valid(RX_TO_SYS_Data_Valid),
  .SYSCont_Rf_Data_Valid(Rd_Data_Valid),
  .SYSCont_Busy(SYS_busy),
  .SYSCont_CLK(REF_CLK),
  .SYSCont_RST(REF_RST),
  .SYSCont_TXPdata(SYS_TO_TX_Data),
  .SYSCont_WrData(WrData),
  .SYSCont_Addr(Addr),
  .SYSCont_ALU_Fun(Function),
  .SYSCont_ALU_en(ALUen),
  .SYSCont_CLK_en(CLK_en),
  .SYSCont_Rd_en(Rd_en),
  .SYSCont_Wr_en(Wr_en),
  .SYSCont_TX_Data_Valid(SYS_TO_TX_Data_Valid), 
  .SYSCont_CLK_div_en(CLK_Div_en)
  );
  
  //////////////////////////UART TX and RX///////////////////////////
  UART_RX U0_UART_RX(
  .UartRx_prescale(UART_Config[6:2]),
  .UartRx_RX_IN(RX_IN),
  .UartRx_PAR_EN(UART_Config[0]),
  .UartRx_Par_Type(UART_Config[1]),
  .UartRx_CLK(UART_CLK),
  .UartRx_RST(UART_RST),
  .UartRx_PDATA(RXData),
  .UartRx_Data_Valid(RX_Data_Valid)
  );
  
  Uart_TX_Top U0_Uart_TX_Top(//data width is calculated by 2*n
  .P_DATA(TXData),
  .CLK(UART_TX_CLK),
  .RST_ASYN(UART_RST),
  .Data_Valid(TX_Data_Valid),
  .PAR_EN(UART_Config[0]),
  .PAR_TYP(UART_Config[1]),
  .TX_OUT(TX_OUT),
  .busy(TX_busy));
  
endmodule