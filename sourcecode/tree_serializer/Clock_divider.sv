
// Generator : SpinalHDL v1.2.2    git head : 3159d9865a8de00378e0b0405c338a97c2f5a601
// Date      : 05/12/2018, 16:29:22
// Component : Clock_divider


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