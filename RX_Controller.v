// FILE NAME: RX_Controller.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 15/8/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: UART RX controller, finite state machine, mealy FSM
//------------------------------------------------
// PURPOSE:   finite state machine act as main controller for  receiving from uart RX\
//////////////////defining inputs and output port////////////////////
module RX_Controller (
  input    wire    [7:0]    RXCont_Pdata,
  input    wire             RXCont_Data_Valid,
  input    wire             RXCont_CLK,
  input    wire             RXCont_RST,
  output   reg     [7:0]    RXCont_Out_Data,
  output   reg     [7:0]    RXCont_Out_Addr,
  output   reg     [2:0]    RXCont_Out_command
  );  
  
  /////////defining the states////////
  
  reg      [2:0]     Current_State;
  reg      [2:0]     Next_State;
  
  localparam IDLE       = 3'b000,
  Receive_Command       = 3'b001,
  Receive_Address       = 3'b011,
  Receive_Data          = 3'b010,
  Receive_Fun           = 3'b110;
  ////////defining the commands ////////////////////////////
  localparam RF_Wr_CMD          = 8'haa,
             RF_Rd_CMD          = 8'hbb,
             ALU_OPER_W_OP_CMD  = 8'hcc,
             ALU_OPER_W_NOP_CMD = 8'hdd;
  
  /////////////////////state transition///////////////////
  always@(posedge RXCont_CLK or negedge RXCont_RST)
  begin
    if(!RXCont_RST)
      Current_State <= IDLE ;
    else
      Current_State <= Next_State ;
  end
  
  ////////////////////saving the command//////////////////
  reg    [7:0]    command;
  reg             save_en;
  always@(posedge RXCont_CLK or negedge RXCont_RST)
  begin
    if(!RXCont_RST)
      command <= 8'b0; 
    else if(save_en)
      command <= RXCont_Pdata ;
  end
  ////////////////////saving the addr//////////////////
  reg    [7:0]    addr;
  reg             addr_en;
  always@(posedge RXCont_CLK or negedge RXCont_RST)
  begin
    if(!RXCont_RST)
      addr <= 8'b0; 
    else if(addr_en)
      addr <= RXCont_Pdata ;
  end
  //////////////////counter logic//////////////////////
  reg             count;
  reg             count_en;
  always@(posedge RXCont_CLK or negedge RXCont_RST)
  begin
    if(!RXCont_RST)
      count <= 1'b0;
    else if(count_en)
    begin   
     if(RXCont_Data_Valid)
       begin
       count <= 1'b1;
       end
    end
    else
      count <= 1'b0;
  end
  //////////////////next state logic///////////////////
  always@(*)
  begin
    case(Current_State)
      IDLE                   : begin
                                if(RXCont_Data_Valid)
                                  begin
                                    Next_State = Receive_Command;
                                  end
                                else
                                  begin
                                    Next_State = IDLE;
                                  end
                               end
      Receive_Command        : begin
                                case(RXCont_Pdata)
                                  RF_Wr_CMD                 : begin
                                                               Next_State = Receive_Address;
                                                              end
                                  RF_Rd_CMD                 : begin
                                                               Next_State = Receive_Address;
                                                              end
                                  ALU_OPER_W_OP_CMD         : begin
                                                               Next_State = Receive_Data;
                                                              end
                                  ALU_OPER_W_NOP_CMD        : begin
                                                               Next_State = Receive_Fun;
                                                              end
                                  default                   : begin
                                                               Next_State = Receive_Command;
                                                              end
                                endcase  
                               end
      Receive_Address        : begin
                                if(RXCont_Data_Valid)
                                  begin
                                    if(command == 8'haa)
                                     Next_State = Receive_Data;
                                    else
                                     Next_State = IDLE; 
                                  end
                                else
                                  begin
                                    Next_State = Receive_Address;
                                  end
                               end
      Receive_Data           : begin
                                if(RXCont_Data_Valid)
                                  begin
                                    case(command)
                                      RF_Wr_CMD                 : begin
                                                                   Next_State = IDLE;
                                                                  end
                                      ALU_OPER_W_OP_CMD         : begin
                                                                   if(count == 1'b1)
                                                                     Next_State = Receive_Fun;
                                                                   else
                                                                     Next_State = Receive_Data;
                                                                  end
                                     default                    : begin
                                                                   Next_State = Receive_Command;
                                                                  end
                                    endcase
                                  end
                                else
                                  begin
                                    Next_State = Receive_Data;
                                  end
                               end
      Receive_Fun            : begin
                                if(RXCont_Data_Valid)
                                  begin
                                    Next_State = IDLE;
                                  end
                                else
                                  begin
                                    Next_State = Receive_Fun;
                                  end
                               end
      default                : begin
                                Next_State = IDLE;
                               end
    endcase
  end
  //////////////////output logic///////////////////
  always@(*)
  begin
    case(Current_State)
      IDLE                   : begin
                                RXCont_Out_Data = 8'b0;
                                RXCont_Out_Addr = 8'b0;
                                RXCont_Out_command = 3'b0;
                                save_en = 1'b0;
                                addr_en = 1'b0;
                                count_en = 1'b0;
                               end
      Receive_Command        : begin
                                RXCont_Out_Data = 8'b0;
                                RXCont_Out_Addr = 8'b0;
                                RXCont_Out_command = 3'b0;
                                save_en = 1'b1;
                                addr_en = 1'b0;
                                count_en = 1'b0;
                               end
      Receive_Address        : begin
                               save_en = 1'b0;
                               count_en = 1'b0;
                                if(RXCont_Data_Valid)
                                  begin
                                    addr_en = 1'b1;
                                    if(command == 8'haa)
                                      begin
                                        RXCont_Out_Data = 8'b0;
                                        RXCont_Out_Addr = 8'b0;
                                        RXCont_Out_command = 3'b0;
                                      end
                                    else
                                      begin
                                        RXCont_Out_Data = 8'b0;
                                        RXCont_Out_Addr = RXCont_Pdata;
                                        RXCont_Out_command = 3'b010;
                                      end
                                  end
                                else
                                  begin
                                    addr_en = 1'b0;
                                    RXCont_Out_Data = 8'b0;
                                    RXCont_Out_Addr = 8'b0;
                                    RXCont_Out_command = 3'b0;
                                  end
                               end
      Receive_Data           : begin
                                save_en = 1'b0;
                                addr_en = 1'b0;
                                count_en = 1'b1;
                                if(RXCont_Data_Valid)
                                  begin
                                  case(command)
                                      RF_Wr_CMD                 : begin
                                                                   RXCont_Out_Data = RXCont_Pdata;
                                                                   RXCont_Out_Addr = addr;
                                                                   RXCont_Out_command = 3'b001;
                                                                  end
                                      ALU_OPER_W_OP_CMD         : begin
                                                                   if(count == 1'b1)
                                                                     begin
                                                                      RXCont_Out_Data = RXCont_Pdata;
                                                                      RXCont_Out_Addr = 8'd1;
                                                                      RXCont_Out_command = 3'b011;
                                                                     end
                                                                   else
                                                                     begin
                                                                      RXCont_Out_Data = RXCont_Pdata;
                                                                      RXCont_Out_Addr = 8'd0;
                                                                      RXCont_Out_command = 3'b011;
                                                                     end
                                                                  end
                                      default                   : begin
                                                                   RXCont_Out_Data = 8'b0;
                                                                   RXCont_Out_Addr = 8'b0;
                                                                   RXCont_Out_command = 3'b0;
                                                                  end
                                    endcase
                                  end
                                else
                                  begin
                                    RXCont_Out_Data = 8'b0;
                                    RXCont_Out_Addr = 8'b0;
                                    RXCont_Out_command = 3'b0;
                                  end
                               end
      Receive_Fun            : begin
                                save_en = 1'b0;
                                addr_en = 1'b0;
                                count_en = 1'b0;
                                if(RXCont_Data_Valid)
                                  begin
                                    RXCont_Out_Data = RXCont_Pdata;
                                    RXCont_Out_Addr = 8'b0;
                                    RXCont_Out_command = 3'b100;
                                  end
                                else
                                  begin
                                    RXCont_Out_Data = 8'b0;
                                    RXCont_Out_Addr = 8'b0;
                                    RXCont_Out_command = 3'b0;
                                  end
                               end
      default                : begin
                                RXCont_Out_Data = 8'b0;
                                RXCont_Out_Addr = 8'b0;
                                RXCont_Out_command = 3'b0;
                                save_en = 1'b0;
                                addr_en = 1'b0;
                               end
    endcase
  end
endmodule
