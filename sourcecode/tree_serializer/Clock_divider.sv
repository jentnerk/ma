
// Generator : SpinalHDL v1.2.2    git head : 3159d9865a8de00378e0b0405c338a97c2f5a601
// Date      : 05/12/2018, 16:29:22
// Component : Clock_divider


module Clock_divider (
      output  io_clkB,
      input   clk,
      input   reset);
  reg  clkB;
  assign io_clkB = clkB;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      clkB <= 1'b0;
    end else begin
      clkB <= (! clkB);
    end
  end

endmodule