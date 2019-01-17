// ########################################################
// ###
// ###  Tree-Structured Serializer
// ###
// ### Written by: Kaja Jentner
// ### January 2019
// ### IEF ETH Zurich
// ########################################################

//================================
// Toplevel of the Tree-Serializer
//================================
module tree_serializer #(parameter int unsigned FROM,parameter int unsigned LOGFROM)
  ( input logic [FROM-1:0]        data_i,
    output logic                  data_o,
    input logic [LOGFROM:0]       clks,
    input logic                   reset);

  //=====================
  // Signal Declarations
  //=====================
    logic dataOut_SN, dataOut_SP;

  //=======
  // Logic
  //=======
    assign data_o = dataOut_SP;

  //==========================
  // Instantiante Serializer
  //==========================
      Serializer #(FROM,LOGFROM,0) Serializer (.io_clk(clks[LOGFROM:1]), .io_rst(reset), .io_dataIn(data_i), .io_dataOut(dataOut_SN));

  //===========
  // Registers 
  //===========
      always @ (posedge clks[0] or posedge reset) begin
        if (reset) begin
          dataOut_SP <= '0;
        end else begin
          dataOut_SP <= dataOut_SN;
        end
      end

  endmodule // tree_serializer

//=====================
// Serializer Module
// (to use recursively)
//=====================
module Serializer #(parameter int unsigned FROM, parameter int unsigned LOGFROM, parameter int unsigned COUNTER)(
      input logic [LOGFROM-COUNTER:1]           io_clk,
      input logic                               io_rst,
      input logic [FROM-1:0]                    io_dataIn,
      output logic                              io_dataOut);
    
  //=====================
  // Signal Declarations
  //=====================
    logic [FROM/2-1:0]          dataOut;
    logic [FROM-1:0]            reg_SP, reg_SN;

  //=======
  // Logic
  //=======
    assign reg_SN = io_dataIn;
    // MUX to serialize two inputs into one output
    //clkA is the slow clock and clkB is the fast clock
    assign dataOut = (io_clk[LOGFROM-COUNTER]) ? reg_SP[FROM-1:FROM/2] : reg_SP[FROM/2-1:0];

  //===========
  // Registers 
  //===========
    always @ (posedge io_clk[LOGFROM-COUNTER] or posedge io_rst) begin
      if (io_rst) begin
        reg_SP <= '0;
      end else begin
        reg_SP <= reg_SN;
      end
    end

  //========================
  // Recursive Step
  // (Call Serializer Again)
  //========================
    generate
        if (FROM == 2)
          begin
            assign io_dataOut = dataOut;
          end
        else 
          begin
            Serializer  #(FROM/2,LOGFROM,COUNTER+1) Serializer (.io_clk(io_clk[LOGFROM-(COUNTER+1):1]), .io_rst(io_rst), .io_dataIn(dataOut), .io_dataOut(io_dataOut));
          end
    endgenerate

endmodule // Serializer

