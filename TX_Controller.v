// FILE NAME: TX_Controller.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 15/8/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: UART TX controller, finite state machine, mealy FSM
//------------------------------------------------
// PURPOSE:   finite state machine act as main controller for controlling uart TX\
//////////////////defining inputs and output port////////////////////
module TX_Controller (
  input    wire    [15:0]    TXCont_ALU_Out,
  input    wire    [7:0]     TXCont_Pdata,
  input    wire    [7:0]     TXCont_RdData,
  input    wire    [7:0]     TXCont_Addr,
  input    wire    [2:0]     TXCont_command,
  input    wire              TXCont_ALU_valid,
  input    wire              TXCont_RF_Valid,
  input    wire              TXCont_Busy,
  input    wire              TXCont_CLK,
  input    wire              TXCont_RST,
  output   reg     [7:0]     TXCont_Addr_Out,
  output   reg     [7:0]     TXCont_TXPdata_Out,
  output   reg     [7:0]     TXCont_RFWr_Data,
  output   reg     [3:0]     TXCont_ALU_Fun,  
  output   reg               TXCont_ALU_en,
  output   reg               TXCont_CLK_en,
  output   reg               TXCont_Rd_en,
  output   reg               TXCont_Wr_en, 
  output   reg               TXCont_Data_Valid,
  output   reg               TXCont_CLK_Div_en
  );
  /////////buffering input data and address for one cycle////////////
  reg    [7:0]     TXCont_Pdata_c;
  reg    [7:0]     TXCont_Addr_c;
  always@(posedge TXCont_CLK or negedge TXCont_RST)
  begin
    if(!TXCont_RST)
      begin
        TXCont_Pdata_c <= 8'b0;
        TXCont_Addr_c <= 8'b0;
      end
    else
      begin
        TXCont_Pdata_c <= TXCont_Pdata;
        TXCont_Addr_c <= TXCont_Addr;
      end
  end
  
  /////////defining the states////////
  
  reg      [2:0]     Current_State;
  reg      [2:0]     Next_State;
  
  localparam IDLE       = 3'b000,
  Write_Data            = 3'b001,
  Read_Data             = 3'b010,
  Read_Operands         = 3'b011,
  Using_ALU             = 3'b100,
  Busy_State            = 3'b101,
  Send_MS_Byte          = 3'b111;
  //////////saving the function ////////////////////////////////////
  reg     [3:0]    Function;
  always@(posedge TXCont_CLK or negedge TXCont_RST)
  begin
    if(!TXCont_RST)
      begin
        Function <= 4'b0;
      end
    else if(TXCont_command == Using_ALU)
      begin
        Function <= TXCont_Pdata[3:0];
      end
  end
  /////////////////////state transition///////////////////
  always@(posedge TXCont_CLK or negedge TXCont_RST)
  begin
    if(!TXCont_RST)
      Current_State <= IDLE ;
    else
      Current_State <= Next_State ;
  end
  //////////////////next state logic///////////////////
  always@(*)
  begin
    case(Current_State)
      IDLE                   : begin
                                if(!TXCont_Busy)
                                 Next_State = TXCont_command;
                               else
                                 Next_State = IDLE;
                               end
      Write_Data            :  begin
                                Next_State = IDLE;
                               end
      Read_Data             :  begin
                                if(TXCont_RF_Valid)
                                  begin
                                    Next_State = IDLE;
                                  end
                                else
                                  begin
                                    Next_State = Read_Data;
                                  end
                               end
      Read_Operands         :  begin
                                Next_State = TXCont_command;
                               end
      Using_ALU             :  begin
                                if(TXCont_Busy)
                                  begin
                                    Next_State = Busy_State;
                                  end
                                else
                                  begin
                                    Next_State = Using_ALU ;
                                  end
                               end
      Busy_State            : begin
                               if(!TXCont_Busy)
                                 begin
                                   Next_State = Send_MS_Byte;
                                 end
                               else
                                 begin
                                   Next_State = Busy_State;
                                 end
                              end
      Send_MS_Byte         :  begin
                               if(TXCont_Busy)
                                 begin
                                   Next_State = IDLE;
                                 end
                               else
                                 begin
                                   Next_State = Send_MS_Byte;
                                 end
                               end
    endcase
  end
 //////////////////output logic///////////////////
  always@(*)
  begin
    case(Current_State)
      IDLE                   : begin
                                TXCont_Addr_Out = 8'b0;
                                TXCont_TXPdata_Out = 8'b0;
                                TXCont_RFWr_Data = 8'b0;
                                TXCont_ALU_Fun = 4'b0;
                                TXCont_ALU_en = 1'b0;
                                TXCont_CLK_en = 1'b0;
                                TXCont_Rd_en = 1'b0;
                                TXCont_Wr_en = 1'b0;
                                TXCont_Data_Valid = 1'b0;
                                TXCont_CLK_Div_en =1'b1;
                                if(TXCont_command == Using_ALU)
                                  begin
                                    TXCont_ALU_en = 1'b1;
                                    TXCont_CLK_en = 1'b1;
                                  end
                               end
      Write_Data            :  begin
                                TXCont_Addr_Out = TXCont_Addr_c;
                                TXCont_TXPdata_Out = 8'b0;
                                TXCont_RFWr_Data = TXCont_Pdata_c;
                                TXCont_ALU_Fun = 4'b0;
                                TXCont_ALU_en = 1'b0;
                                TXCont_CLK_en = 1'b0;
                                TXCont_Rd_en = 1'b0;
                                TXCont_Wr_en = 1'b1;
                                TXCont_Data_Valid = 1'b0;
                                TXCont_CLK_Div_en =1'b1;
                               end
      Read_Data             :  begin
                                TXCont_Addr_Out = TXCont_Addr_c;
                                TXCont_TXPdata_Out = 8'b0;
                                TXCont_RFWr_Data = 8'b0;
                                TXCont_ALU_Fun = 4'b0;
                                TXCont_ALU_en = 1'b0;
                                TXCont_CLK_en = 1'b0;
                                TXCont_Rd_en = 1'b1;
                                TXCont_Wr_en = 1'b0;
                                TXCont_Data_Valid = 1'b0;
                                TXCont_CLK_Div_en =1'b1;
                                if(TXCont_RF_Valid)
                                  begin
                                    TXCont_TXPdata_Out = TXCont_RdData;
                                    TXCont_Data_Valid = 1'b1;
                                  end
                               end
      Read_Operands         :  begin
                                TXCont_Addr_Out = TXCont_Addr_c;
                                TXCont_TXPdata_Out = 8'b0;
                                TXCont_RFWr_Data = TXCont_Pdata_c;
                                TXCont_ALU_Fun = 4'b0;
                                TXCont_ALU_en = 1'b0;
                                TXCont_CLK_en = 1'b0;
                                TXCont_Rd_en = 1'b0;
                                TXCont_Wr_en = 1'b1;
                                TXCont_Data_Valid = 1'b0;
                                TXCont_CLK_Div_en =1'b1;
                               end
      Using_ALU             :  begin
                                TXCont_Addr_Out = 8'b0;
                                TXCont_TXPdata_Out = 8'b0;
                                TXCont_RFWr_Data = 8'b0;
                                TXCont_ALU_Fun = Function;
                                TXCont_ALU_en = 1'b1;
                                TXCont_CLK_en = 1'b1;
                                TXCont_Rd_en = 1'b0;
                                TXCont_Wr_en = 1'b0;
                                TXCont_Data_Valid = 1'b0;
                                TXCont_CLK_Div_en =1'b1;
                                if(TXCont_ALU_valid)
                                  begin
                                    TXCont_TXPdata_Out = TXCont_ALU_Out[7:0];
                                    TXCont_Data_Valid = 1'b1;
                                  end
                               end
      Busy_State            : begin
                                TXCont_Addr_Out = 8'b0;
                                TXCont_TXPdata_Out = TXCont_ALU_Out[7:0];
                                TXCont_RFWr_Data = 8'b0;
                                TXCont_ALU_Fun = 4'b0;
                                TXCont_ALU_en = 1'b0;
                                TXCont_CLK_en = 1'b1;
                                TXCont_Rd_en = 1'b0;
                                TXCont_Wr_en = 1'b0;
                                TXCont_Data_Valid = 1'b0;
                                TXCont_CLK_Div_en =1'b1;
                                if(!TXCont_Busy)
                                  begin
                                    TXCont_TXPdata_Out = TXCont_ALU_Out[15:8];
                                    TXCont_Data_Valid = 1'b1; 
                                  end
                              end
      Send_MS_Byte         :  begin
                                TXCont_Addr_Out = 8'b0;
                                TXCont_TXPdata_Out = TXCont_ALU_Out[15:8];
                                TXCont_RFWr_Data = 8'b0;
                                TXCont_ALU_Fun = 4'b0;
                                TXCont_ALU_en = 1'b0;
                                TXCont_CLK_en = 1'b1;
                                TXCont_Rd_en = 1'b0;
                                TXCont_Wr_en = 1'b0;
                                TXCont_Data_Valid = 1'b1;
                                TXCont_CLK_Div_en =1'b1;
                              end
    endcase
  end
endmodule
  
  
  
  