// FILE NAME: BIT_SYNC.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 19/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS:  multi clock system, clock domain crossing,crc , synchronizer
//------------------------------------------------
// PURPOSE:\this is a Parameterized synchronizer\
module BIT_SYNC #(parameter STAGES = 2,parameter WIDTH = 1) (
  input    wire    [WIDTH-1:0]    BitSync_ASYNC,
  input    wire                   BitSync_CLK,
  input    wire                   BitSync_RST,
  output   reg     [WIDTH-1:0]    BitSync_SYNC);
  
  reg    [STAGES-1:0]    FFSTAGES    [WIDTH-1:0];
  integer                i;
  
  //////////////////synchronizer logic/////////////////
  always@(posedge BitSync_CLK or negedge BitSync_RST)
  begin
    if(!BitSync_RST)
      begin
        for(i=0;i<WIDTH;i=i+1)
        begin
         FFSTAGES[i] <= 'b0;
        end
      end
    else
      for(i=0;i<WIDTH;i=i+1)
      begin
         FFSTAGES[i] <= {FFSTAGES[i][STAGES-2:0],BitSync_ASYNC};
      end
  end
  
  always@(*)
  begin
    for(i=0;i<WIDTH;i=i+1)
    begin
      BitSync_SYNC[i] = FFSTAGES[i][STAGES-1];
    end
  end 
endmodule