// Generator : SpinalHDL v1.2.2    git head : 3159d9865a8de00378e0b0405c338a97c2f5a601
// Date      : 11/12/2018, 13:32:13
// Component : Serializer


module Serializer #(parameter int unsigned FROM, parameter int unsigned LOGFROM, parameter int unsigned COUNTER)(
      input logic [LOGFROM-COUNTER:1]           io_clk,
      input logic                               io_rst,
      input logic [FROM-1:0]                    io_dataIn,
      output logic                              io_dataOut);
    
    // ----------------------------------
    // Signal Declarations
    // ----------------------------------
    logic [FROM/2-1:0]          dataOut;
    logic [FROM-1:0]            reg_SP, reg_SN;
    logic [FROM/2-1:0]          reg_asyn_SN, reg_asyn_SP;

  assign reg_SN = io_dataIn;
  // MUX to serialize two inputs into one output
  //clkA is the slow clock and clkB is the fast clock
  assign reg_asyn_SN=reg_SP[FROM-1:FROM/2];
  assign dataOut = (io_clk[LOGFROM-COUNTER]) ? reg_asyn_SP : reg_SP[FROM/2-1:0];

//registers
  always @ (posedge io_clk[LOGFROM-COUNTER] or posedge io_rst) begin
    if (io_rst) begin
      reg_SP <= '0;
    end else begin
      reg_SP <= reg_SN;
    end
  end

  //registers
  always @ (negedge io_clk[LOGFROM-COUNTER] or posedge io_rst) begin
    if (io_rst) begin
      reg_asyn_SP <= '0;
    end else begin
      reg_asyn_SP <= reg_asyn_SN;
    end
  end



  generate
      //try for loop 
      if (FROM == 2)
        begin
          assign io_dataOut = dataOut;
        end
      else 
        begin
          Serializer  #(FROM/2,LOGFROM,COUNTER+1) Serializer (.io_clk(io_clk[LOGFROM-(COUNTER+1):1]), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(io_dataOut));
        end

  endgenerate



endmodule
