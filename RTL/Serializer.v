// Generator : SpinalHDL v1.2.2    git head : 3159d9865a8de00378e0b0405c338a97c2f5a601
// Date      : 11/12/2018, 13:32:13
// Component : Serializer


module Serializer (
      input   io_clkA,
      input   io_rstA,
      input   io_clkB,
      input   io_rstB,
      input   io_dataIn1,
      input   io_dataIn2,
      output  io_dataOut);
  reg  area_clkA_reg1;
  reg  area_clkA_reg2;
  reg  area_clkA_output_clkA;
  reg  area_clkB_reg_out;
  always @ (*) begin
    area_clkA_output_clkA = area_clkA_reg1;
    if(io_clkA)begin
      area_clkA_output_clkA = area_clkA_reg2;
    end
  end

  assign io_dataOut = area_clkB_reg_out;
  always @ (posedge io_clkA or posedge io_rstA) begin
    if (io_rstA) begin
      area_clkA_reg1 <= 1'b0;
      area_clkA_reg2 <= 1'b0;
    end else begin
      area_clkA_reg1 <= io_dataIn1;
      area_clkA_reg2 <= io_dataIn2;
    end
  end

  always @ (posedge io_clkB or posedge io_rstB) begin
    if (io_rstB) begin
      area_clkB_reg_out <= 1'b0;
    end else begin
      area_clkB_reg_out <= area_clkA_output_clkA;
    end
  end

endmodule

