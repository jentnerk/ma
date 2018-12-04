// Copyright (C) 2017 ETH Zurich, University of Bologna
// All rights reserved.
//
// This code is under development and not yet released to the public.
// Until it is released, the code is under the copyright of ETH Zurich and
// the University of Bologna, and may contain confidential and/or unpublished
// work. Any reuse/redistribution is strictly forbidden without written
// permission from ETH Zurich.

// Author: Kaja Jentner
// Date: 4.12.18
// Description: this RTL describes a serializer


module serializer #(parameter int unsigned C_WIDTH = 2)
	(
    input  logic                    clk_i,                             // Clock
    input  logic                    rst_ni,                            // Asynchronous reset active low
    input logic [C_WIDTH-1:0]       input_stream                       // input stream that has to be serialized
    output logic                    output_stream                      // output stream that is searlized
    );



    // ----------------------------------
    // Signal Declarations
    // ----------------------------------

        //Data Signals
        logic [C_WIDTH-1:0] input_SP, input_SN;
        logic output_SP, output_SN;
        logic output_mux;

        //Control Signals
        logic clk_divided_SP, clk_divided_SN;



    // -----------------
    // Logic
    // -----------------
        assign input_SN = input_stream;
        assign output_SN = output_mux;
        assign output_mux = (clk_divided_SP) ? input_SP[1] : input_SP[0];

    // -----------------
    //  Clock Dividier
    // -----------------
        assign clk_divided_SN = !clk_divided_SP;

        always_ff @(posedge clk_i or negedge rst_ni) begin : p_regs
            if (~rst_ni) begin
                clk_divided_SP     <= '0;
            end else begin
                clk_divided_SP     <= clk_divided_SN;

            end
        end

    // -----------------
    //  Slow Clock
    // -----------------

        // at the active clock edge, all registers update their state:
        always_ff @(posedge clk_divided_SP or negedge rst_ni) begin : p_regs_slow
            if (~rst_ni) begin
                input_SP     <= '0;
            end else begin
                input_SP     <= input_SN;
            end
        end

    // -----------------
    //  Fast Clock
    // -----------------

        // at the active clock edge, all registers update their state:
        always_ff @(posedge clk_i or negedge rst_ni) begin : p_regs_fast
            if (~rst_ni) begin
                output_SP     <= '0;
            end else begin
                output_SP     <= output_SN;

            end
        end


endmodule


