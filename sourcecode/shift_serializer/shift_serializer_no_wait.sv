// ########################################################
// ###
// ### Shift-Register Serializer without FSM
// ### Behavior: Load Data - Shift Data - Load Data - ...
// ###
// ### Written by: Kaja Jentner
// ### January 2019
// ### IEF ETH Zurich
// ########################################################

`include "parameters.vh"

module shift_serializer #(parameter int unsigned FROM=`SHIFT_FROM, parameter int unsigned LOG2FROM=`SHIFT_LOGFROM, parameter int unsigned TO=`SHIFT_TO)
	(	input logic [FROM-1:0] 	data_i,
		output logic [TO-1:0]	data_o,
		input logic 			clk,
		input logic 			reset,
        output logic            ready_o,
        output logic            valid_o
        );

    //=====================
    // Signal declarations	
    //=====================
    logic [FROM-1:0]                        data_in_temp;
    logic [LOG2FROM:0]						Counter_SP, Counter_SN;
    logic [FROM-1:0]					    Reg_SP, Reg_SN;
    logic                                   valid_SN, valid_SP;

    //===================
    // Logic
    //===================

    // reorder the input data bits, such that it is the same order at the output
    generate
        for (genvar j = 0; j < TO; j++)
            for (genvar k = 0; k < FROM/TO; k++)
                assign data_in_temp[j*(FROM/TO)+k] = data_i[k*TO+j];
    endgenerate

    //assign the correct registers to the output
    generate
        for (genvar k = 1; k < TO+1; k++)
            assign data_o[k-1] = Reg_SP[k*FROM/TO-1];
    endgenerate

    //------------------
    // Counter
    // -----------------
    assign Counter_SN = ~(|Counter_SP) ? FROM/TO : (Counter_SP - 1);

    // Shifting
    assign Reg_SN = ~(|Counter_SP) ? data_in_temp : {Reg_SP[FROM-2:0],1'b0};

    // Handle Output
    assign ready_o = ~(|Counter_SP) ? 1'b1 : 1'b0;
    // assign ready_o = ~valid_SP;
    assign valid_SN = ~(|Counter_SP) ? 1'b0 : 1'b1;
    assign valid_o = ~(|Counter_SP) ? 1'b0 : 1'b1;
    // assign valid_o = valid_SP;
    //==================
    //  Registers
    //==================
    always @ (posedge clk or posedge reset) begin
        if (reset) begin
          Reg_SP           <= '0;
          Counter_SP       <= '0;
          valid_SP         <= '0;
        end else begin
          Reg_SP           <= Reg_SN;
          Counter_SP       <= Counter_SN;
          valid_SP         <= valid_SN;
        end
    end


endmodule // shift_serializer
