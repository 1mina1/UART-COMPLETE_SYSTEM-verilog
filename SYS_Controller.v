// FILE NAME: SYS_Controller.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 15/8/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: UART main controller, finite state machine, mealy FSM
//------------------------------------------------
// PURPOSE:   finite state machine act as main controller for controlling the whole uart system\
//////////////////defining inputs and output port////////////////////
module SYS_Controller (
  input    wire    [15:0]    SYSCont_ALU_Out,
  input    wire    [7:0]     SYSCont_RXPdata,
  input    wire    [7:0]     SYSCont_RdData,
  input    wire              SYSCont_ALU_Valid,
  input    wire              SYSCont_RX_Data_Valid,
  input    wire              SYSCont_Rf_Data_Valid,
  input    wire              SYSCont_Busy,
  input    wire              SYSCont_CLK,
  input    wire              SYSCont_RST,
  output   wire    [7:0]     SYSCont_TXPdata,
  output   wire    [7:0]     SYSCont_WrData,
  output   wire    [7:0]     SYSCont_Addr,
  output   wire    [3:0]     SYSCont_ALU_Fun,
  output   wire              SYSCont_ALU_en,
  output   wire              SYSCont_CLK_en,
  output   wire              SYSCont_Rd_en,
  output   wire              SYSCont_Wr_en,
  output   wire              SYSCont_TX_Data_Valid, 
  output   wire              SYSCont_CLK_div_en
  );
  
  wire    [7:0]    Recieved_Addr;
  wire    [7:0]    Recieved_Data;
  wire    [2:0]    Recieved_Command;
  ///////////////////////////////Design instantiations ///////////////////////
  RX_Controller U0_RX_Controller(
  .RXCont_Pdata(SYSCont_RXPdata),
  .RXCont_Data_Valid(SYSCont_RX_Data_Valid),
  .RXCont_CLK(SYSCont_CLK),
  .RXCont_RST(SYSCont_RST),
  .RXCont_Out_Data(Recieved_Data),
  .RXCont_Out_Addr(Recieved_Addr),
  .RXCont_Out_command(Recieved_Command)
  );
  
  TX_Controller U0_TX_Controller(
  .TXCont_ALU_Out(SYSCont_ALU_Out),
  .TXCont_Pdata(Recieved_Data),
  .TXCont_RdData(SYSCont_RdData),
  .TXCont_Addr(Recieved_Addr),
  .TXCont_command(Recieved_Command),
  .TXCont_ALU_valid(SYSCont_ALU_Valid),
  .TXCont_RF_Valid(SYSCont_Rf_Data_Valid),
  .TXCont_Busy(SYSCont_Busy),
  .TXCont_CLK(SYSCont_CLK),
  .TXCont_RST(SYSCont_RST),
  .TXCont_Addr_Out(SYSCont_Addr),
  .TXCont_TXPdata_Out(SYSCont_TXPdata),
  .TXCont_RFWr_Data(SYSCont_WrData),
  .TXCont_ALU_Fun(SYSCont_ALU_Fun),  
  .TXCont_ALU_en(SYSCont_ALU_en),
  .TXCont_CLK_en(SYSCont_CLK_en),
  .TXCont_Rd_en(SYSCont_Rd_en),
  .TXCont_Wr_en(SYSCont_Wr_en), 
  .TXCont_Data_Valid(SYSCont_TX_Data_Valid),
  .TXCont_CLK_Div_en(SYSCont_CLK_div_en)
  );
endmodule