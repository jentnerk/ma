// Generator : SpinalHDL v1.2.2    git head : 3159d9865a8de00378e0b0405c338a97c2f5a601
// Date      : 11/12/2018, 13:32:13
// Component : Serializer

//TOPLEVEL

//Serializer from to

module tree_serializer #(parameter int unsigned FROM,parameter int unsigned LOGFROM)
  ( input logic [FROM-1:0]        data_i,
    output logic                  data_o,
    input logic [LOGFROM:0]       clks,
    input logic                   reset);

  //Signal declarations
  
  logic             dataOut_SN, dataOut_SP;

  assign data_o = dataOut_SP;

  Serializer #(FROM,LOGFROM,0) Serializer (.io_clk(clks[LOGFROM:1]), .io_rst(reset), .io_dataIn(data_i), .io_dataOut(dataOut_SN));

    //registers
    always @ (posedge clks[0] or posedge reset) begin
      if (reset) begin
        dataOut_SP <= '0;
      end else begin
        dataOut_SP <= dataOut_SN;
      end
    end

  endmodule // toplevel_from_to


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
  //clkA is the slow clock and clkB is the fast clock
  assign dataOut = (io_clk[LOGFROM-COUNTER]) ? reg_SP[FROM-1:FROM/2] : reg_SP[FROM/2-1:0];

//registers
  always @ (posedge io_clk[LOGFROM-COUNTER] or posedge io_rst) begin
    if (io_rst) begin
      reg_SP <= '0;
    end else begin
      reg_SP <= reg_SN;
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

