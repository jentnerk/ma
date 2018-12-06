module TopLevel(
  input clk,
  input reset,
  input data1_i,
  input data2_i,
  output data_o);

Clock_divider Clock_divider ( 
      .io_clkB        (clkB),
      .clk            (clk),
      .reset          (reset));

Serializer Serializer (
      .io_clkA        (clkB),
      .io_rstA        (reset),
      .io_clkB        (clk),
      .io_rstB        (reset),
      .io_dataIn1     (data1_i),
      .io_dataIn2     (data2_i),
      .io_dataOut     (data_o));
endmodule


