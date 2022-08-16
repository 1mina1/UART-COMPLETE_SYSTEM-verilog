// FILE NAME: ClkDiv.v
// TYPE: module
// DEPARTMENT: communication and electronics department
// AUTHOR: Mina Hanna
// AUTHOR EMAIL: mina.hannaone@gmail.com
//------------------------------------------------
// Release history
// VERSION DATE AUTHOR DESCRIPTION
// 1.0 2/8/2022 Mina Hanna final version
//------------------------------------------------
// KEYWORDS: clock dividor, multiclock
//------------------------------------------------
// PURPOSE: \clock dividor to divide frequency into a slower one\
module ClkDiv #(parameter WIDTH =8) (
  input    wire    [WIDTH-1:0]    i_div_ratio,
  input    wire                   i_ref_clk,
  input    wire                   i_rst_en,
  input    wire                   i_clk_en,
  output   wire                   o_div_clk);
  reg                   div_clk;
  reg                   i_clk_en_c; 
  reg    [WIDTH-1:0]    count;
  reg    [WIDTH-1:0]    count_comb;
  wire                  count_finish;
  wire                  count_half;
  //////////////counter logic/////////////////////
  always@(posedge i_ref_clk or negedge i_rst_en)
  begin
    if(!i_rst_en)
      begin
        count <= 'b0;
        i_clk_en_c <= 1'b0;
      end
    else
      begin
        count <= count_comb;
        i_clk_en_c <= i_clk_en;
      end
  end
  always@(*)
  begin
    if(i_clk_en_c & i_clk_en)
      begin
       if(count_finish)
        begin
          count_comb = 'b0;
        end
       else 
         begin
           count_comb = count + 1'b1;
         end
      end
    else
      begin
        count_comb = 'b0;
      end
  end
  assign count_finish = (count == (i_div_ratio-1'b1));
  assign count_half   = (count == ((i_div_ratio>>1) -1'b1));
  ////////////////clock dividor logic//////////////////
  always@(posedge i_ref_clk or negedge i_rst_en)
  begin
    if(!i_rst_en)
      begin
        div_clk <= 1'b0;
      end
    else if(i_clk_en)
      begin
        if(count_finish | count_half)
          begin
            div_clk <= ~div_clk;
          end
      end
    else
      begin
        div_clk <= 1'b0;
      end
  end
  
  assign o_div_clk = (i_clk_en && (i_div_ratio != 'd0 | i_div_ratio != 'd1))? div_clk:i_ref_clk;
endmodule