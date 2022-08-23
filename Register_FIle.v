// FILE NAME: Register_File.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 15/8/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: Register File, memory
//------------------------------------------------
// PURPOSE: Register file for the uart system\
//////////////////defining inputs and output port////////////////////
module Register_File #(parameter WIDTH = 8 , DEPTH = 16) (
  input    wire    [WIDTH-1:0]    RF_WrData,
  input    wire    [WIDTH-1:0]    RF_Addr,
  input    wire                   RF_Wr_en,
  input    wire                   RF_Rd_en,
  input    wire                   RF_CLK,
  input    wire                   RF_RST,
  output   reg     [WIDTH-1:0]    RF_RdData,
  output   wire    [WIDTH-1:0]    REG0,
  output   wire    [WIDTH-1:0]    REG1,
  output   wire    [WIDTH-1:0]    REG2,
  output   wire    [WIDTH-1:0]    REG3,
  output   reg                    RF_Rd_Data_Valid
  );
  reg    [WIDTH-1:0]    registers    [DEPTH-1:0] ;
  integer i;
  
  always@(posedge RF_CLK or negedge RF_RST)
  begin
    if(!RF_RST)
      begin
        RF_RdData <= 'b0;
        RF_Rd_Data_Valid <= 1'b0;
        for(i = 0;i<DEPTH;i=i+1)
        begin
          if(i == 2)
            begin
              registers[i] <= 'b0_00111_0_0;//intiating prescal 8 with no parity
            end
          else if(i == 3)
            begin
              registers[i] <= 'b0000_1000;
            end
          else
            begin
              registers[i] <= 'b0;
            end
        end
      end
    else
      begin
        if(RF_Wr_en && !RF_Rd_en)//write
          begin
            registers[RF_Addr] <=RF_WrData;
            RF_Rd_Data_Valid <= 1'b0;
          end
        else if(RF_Rd_en && !RF_Wr_en)//read
          begin
            RF_RdData <= registers[RF_Addr];
            RF_Rd_Data_Valid <= 1'b1;
          end
        else
          begin
            RF_RdData <= 'b0;
            RF_Rd_Data_Valid <= 1'b0;
          end
      end
  end
  assign REG0 = registers[0];
  assign REG1 = registers[1];
  assign REG2 = registers[2];
  assign REG3 = registers[3];
  
endmodule
