// FILE NAME: RST_SYNC.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 19/7/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: reset deassertion, clock domain crossing, synchronizer
//------------------------------------------------
// PURPOSE:\this is a Parameterized reset synchronizer for reset deassertion\
module RST_SYNC #(parameter STAGES = 2) (
  input    wire                   RSTSYNC_CLK,
  input    wire                   RSTSYNC_RST,
  output   reg                    RSTSYNC_OUT);
  
  reg    [STAGES-1:0]    FFSTAGES;
  
  //////////////////synchronizer logic/////////////////
  always@(posedge RSTSYNC_CLK or negedge RSTSYNC_RST)
  begin
    if(!RSTSYNC_RST)
      begin
        FFSTAGES <= 'b0;
      end
    else
     FFSTAGES <= {FFSTAGES[STAGES-2:0],1'b1};
  end
  
  always@(*)
  begin
   RSTSYNC_OUT = FFSTAGES[STAGES-1];
  end 
endmodule
