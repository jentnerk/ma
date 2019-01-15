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

  assign reg_SN = io_dataIn;
  // MUX to serialize two inputs into one output
  mux #(FROM) mux (.mux_i(reg_SP), .mux_control_S(io_clk[LOGFROM-COUNTER]), .mux_o(dataOut));
  // before: assign dataOut = (io_clk[LOGFROM-COUNTER]) ? reg_SP[FROM-1:FROM/2] : reg_SP[FROM/2-1:0];

  //registers
    always @ (posedge io_clk[LOGFROM-COUNTER] or posedge io_rst) begin
      if (io_rst) begin
        reg_SP <= '0;
      end else begin
        reg_SP <= reg_SN;
      end
    end

    // call the serializer module recursively to construct the tree structure
    // the generated modules name will be <<recursive.serializer>>
    generate
        if (FROM == 2) begin:recursive_last
            assign io_dataOut = dataOut;
          end
        else begin:recursive
            Serializer  #(FROM/2,LOGFROM,COUNTER+1) serializer (.io_clk(io_clk[LOGFROM-(COUNTER+1):1]), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(io_dataOut));
          end
    endgenerate

endmodule



module mux #(parameter int unsigned FROM) (
  input logic[FROM-1:0] mux_i,
  input logic mux_control_S,
  output logic[FROM/2-1:0] mux_o
  );  
  assign mux_o = mux_control_S ? mux_i[FROM-1:FROM/2] : mux_i[FROM/2-1:0];
endmodule // module mux

