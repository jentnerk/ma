// ########################################################
// ###
// ### Clockdivider
// ###
// ### Written by: Kaja Jentner
// ### January 2019
// ### IEF ETH Zurich
// ########################################################

module Clock_divider (
      output  clk_div_o,
      input   clk_fast_i,
      input   reset);
  reg  clk_div;
  assign clk_div_o = clk_div;
  always @ (posedge clk_fast_i or posedge reset) begin
    if (reset) begin
      clk_div <= 1'b0;
    end else begin
      clk_div <= (! clk_div);
    end
  end

endmodule
