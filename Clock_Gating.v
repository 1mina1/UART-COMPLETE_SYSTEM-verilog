// FILE NAME: Clock_Gating.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 15/8/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: clock gating, low power applications, latch based clock gating
//------------------------------------------------
// PURPOSE: clock gating for the alu\
//////////////////defining inputs and output port////////////////////
module CLK_GATE (
input      CLK_EN,
input      CLK,
output     GATED_CLK
);

//internal connections
reg     Latch_Out ;

//latch (Level Sensitive Device)
always @(CLK or CLK_EN)
 begin
  if(!CLK)      // active low
   begin
    Latch_Out <= CLK_EN ;
   end
 end
 
 
// ANDING
assign  GATED_CLK = CLK && Latch_Out ;


endmodule