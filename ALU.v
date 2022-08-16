// FILE NAME: ALU.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 15/8/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: ALU, parameterized ALU 
//------------------------------------------------
// PURPOSE: ALU for the uart system\
//////////////////defining inputs and output port////////////////////
module ALU #(parameter WIDTH = 8)(
  input     wire     [WIDTH-1:0]     A,
  input     wire     [WIDTH-1:0]     B,
  input     wire                     ALU_en,
  input     wire                     ALU_CLK,
  input     wire                     ALU_RST,
  input     wire     [3:0]           ALU_FUN,
  output    reg      [2*WIDTH-1 :0]  ALU_OUT,
  output    reg                      ALU_Valid );
  
  reg     [2*WIDTH-1 :0]     ALU_Comb ;
  wire                       ALU_Valid_Comb;
  
  always@(posedge ALU_CLK or negedge ALU_RST)
  begin
    if(!ALU_RST)
      begin
        ALU_OUT <= 'b0;
        ALU_Valid <= 1'b0;
      end
    else if(ALU_en)
      begin
        ALU_OUT <= ALU_Comb;
        ALU_Valid <= ALU_Valid_Comb;
      end 
  end
  
  always@(*)
  begin
  case(ALU_FUN)
  4'b0000: ALU_Comb = A + B ;
  4'b0001: ALU_Comb = A - B ;
  4'b0010: ALU_Comb = A * B ;
  4'b0011: ALU_Comb = A / B ;
  4'b0100: ALU_Comb = A & B ;
  4'b0101: ALU_Comb = A | B ;
  4'b0110: ALU_Comb = ~(A & B) ;
  4'b0111: ALU_Comb = ~(A | B) ;
  4'b1000: ALU_Comb = A ^ B ;
  4'b1001: ALU_Comb = ~(A ^ B) ;
  4'b1010: ALU_Comb = (A==B) ;
  4'b1011:  if (A>B) 
              begin
                ALU_Comb = 16'b10 ;
              end
            else
              begin
                ALU_Comb = 16'b0 ;
              end
  4'b1100:  if (A<B) 
              begin
                ALU_Comb = 16'b11 ;
              end
            else
              begin
                ALU_Comb = 16'b0 ;
              end             
  4'b1101: ALU_Comb = A >> 1 ;
  4'b1110: ALU_Comb = A << 1 ;
  default : ALU_Comb = 16'b0 ;
endcase
end

assign ALU_Valid_Comb = ALU_en?1'b1:1'b0;

endmodule
