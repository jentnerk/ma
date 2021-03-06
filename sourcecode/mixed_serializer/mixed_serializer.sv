// ########################################################
// ###
// ### Top-Level Serializer (contains Shift-Registers 
// ### as well as Tree-Elements)
// ###
// ### Written by: Kaja Jentner
// ### January 2019
// ### IEF ETH Zurich
// ########################################################

`include "parameters.vh"

module toplevel_mixed_serializer #(parameter int unsigned SHIFT_FROM = `SHIFT_FROM,parameter int unsigned SHIFT_TO = `SHIFT_TO, parameter int unsigned SHIFT_LOGFROM = `SHIFT_LOGFROM, parameter int unsigned TREE_FROM = `TREE_FROM, parameter int unsigned TREE_LOGFROM = `TREE_LOGFROM)
	(	input logic [SHIFT_FROM-1:0] 	data_i,
		output logic 					data_o,
        output logic            		ready_o,
		input logic 					clk_i,
		input logic 					reset_ni);

	//=====================
	// Signal Declarations
	//=====================	
		logic [TREE_LOGFROM:0] 			clks;
		logic 							dataOut_SN, dataOut_SP;
		logic [SHIFT_TO-1:0]			shift_o;

	//=======
 	// Logic
 	//=======
		assign clks[0]  = clk_i;
		assign data_o = dataOut_SP;

	//===============
	// Clock Divider
	//===============
		generate
			for (genvar j=1; j < TREE_LOGFROM+1; j++) begin:clk_
				Clock_divider clock_divider (.clk_div_o(clks[j]), .clk_fast_i(clks[j-1]), .reset(reset_ni));
			end
		endgenerate
 	
 	//============================================
 	// Instantiation of Tree- and Shift-Serializer
 	//============================================
		shift_serializer #(SHIFT_FROM, SHIFT_LOGFROM, SHIFT_TO) shift_serializer (.data_i(data_i), .data_o(shift_o), .clk(clks[TREE_LOGFROM]), .reset(reset_ni), .ready_o(ready_o));

	 	tree_serializer #(TREE_FROM,TREE_LOGFROM) tree_serializer (.data_i(shift_o), .data_o(dataOut_SN), .clks(clks), .reset(reset_ni));

	//================
	// Registers Fast
	//================
	  always @ (posedge clk_i or posedge reset_ni) begin
	    if (reset_ni) begin
	      dataOut_SP <= '0;
	    end else begin
	      dataOut_SP <= dataOut_SN;
	    end
	  end

endmodule // toplevel_mixed_serializer

