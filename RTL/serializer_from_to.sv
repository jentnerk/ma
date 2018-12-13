// Generator : SpinalHDL v1.2.2    git head : 3159d9865a8de00378e0b0405c338a97c2f5a601
// Date      : 11/12/2018, 13:32:13
// Component : Serializer


module Serializer_FROM_TO #( parameter int unsigned FROM = 16, parameter int unsigned TO = 1)
      input   io_clk,
      input   io_rst,
      input logic [FROM-1:0] io_dataIn,
      output  io_dataOut);
  reg  reg1;
  reg  reg2;

  // MUX to serialize two inputs into one output
  //clkA is the slow clock and clkB is the fast clock

  assign io_dataOut = (io_clk) ? reg1 : reg2;

//registers
  always @ (posedge io_clk or posedge io_rst) begin
    if (io_rstA) begin
      reg1 <= 1'b0;
      reg2 <= 1'b0;
    end else begin
      reg1 <= io_dataIn1;
      reg2 <= io_dataIn2;
    end
  end



  generate
  //try for loop 
  if (FROM == 2)

  begin
    assign 
  end

  else
    Serializer_FROM_TO Serializer_FROM_TO #(FROM/2,1)(.io_clk(io_clk), .io_rst(io_rst), .io_dataIn)
    Serializer_FROM_TO Serializer_FROM_TO #(FROM/2,1)(.io_clk(io_clk), .io_rst(io_rst), )

  endgenerate


endmodule
