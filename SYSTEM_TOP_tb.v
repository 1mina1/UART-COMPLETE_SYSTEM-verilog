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
// PURPOSE: top module testbench for the uart system\
`timescale 1ns/1ps
//////////////////defining inputs and output port////////////////////
module SYSTEM_TOP_tb ();
  /////////////////test bench signals///////////////////////
  reg             RX_IN_tb;
  reg             REF_CLK_tb;
  reg             UART_CLK_tb;
  reg             RST_tb;
  reg             en_transmission;
  reg    [6:0]    count;
  wire            TX_OUT_tb;
  /////////////////// parameters ///////////////////////////
  parameter REF_CLK_PER = 20;
  parameter UART_CLK_PER = 100;
  parameter ALU_W_OP_NUM_OF_FRAMES = 4 ;
  parameter RF_Wr_CMD_NUK_OF_FRAMES =3;
  reg   [RF_Wr_CMD_NUK_OF_FRAMES*10-1:0]  RF_Wr_CMD    = 'b1_0_00111_11_0_1_00000010_0_1_10101010_0;
  reg   [ALU_W_OP_NUM_OF_FRAMES*11-1:0]   ALU_W_OP_CMD = 'b10_00000001_0_11_00000011_0_11_00000101_0_11_11001100_0 ;
  ////////////////// initial block /////////////////////////
  initial
  begin
    RX_IN_tb = 1'b1;
    REF_CLK_tb = 1'b0;
    UART_CLK_tb = 1'b0;
    RST_tb = 1'b1;
    count = 6'd0;
    #5
    RST_tb = 1'b0;
    #5
    RST_tb = 1'b1;
    en_transmission = 1'b1;
    #500000
    $finish;
  end
  //////////////////RX in///////////////////////////////////
  always@(posedge DUT.U0_ClkDiv.o_div_clk)
  begin
  if(en_transmission && count < 7'd30 )
   begin
    RX_IN_tb <= RF_Wr_CMD[count] ;
	  count <= count + 7'b1 ;
   end	
  else if(en_transmission && count < 7'd74)
    begin
      RX_IN_tb <= ALU_W_OP_CMD[count-30] ;
	    count <= count + 6'b1 ;
    end
  else
    RX_IN_tb <= 1'b1 ; 
  end
  //////////////////clocks definition///////////////////////
  always #(REF_CLK_PER/2)  REF_CLK_tb = ~ REF_CLK_tb;
  always #(UART_CLK_PER/2)  UART_CLK_tb = ~ UART_CLK_tb;
  //////////////////Design instantiation////////////////////
  SYSTEM_TOP DUT(
  .RX_IN(RX_IN_tb),
  .REF_CLK(REF_CLK_tb),
  .UART_CLK(UART_CLK_tb),
  .RST(RST_tb),
  .TX_OUT(TX_OUT_tb)
  );
endmodule