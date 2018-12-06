module TopLevel(
  input clk,
  input reset,
  input data1,
  input data2,
  output data);

Clock_divider Clock_divider ( 
      .io_clkB        (clkB),
      .clk            (clk),
      .reset          (reset));

Serializer Serializer (
      .io_clkA        (clk),
      .io_rstA        (reset),
      .io_clkB        (clkB),
      .io_rstB        (reset),
      .io_dataIn1     (data1),
      .io_dataIn2     (data2),
      .io_dataOut     (data));
endmodule


