//TOPLEVEL

//Serializer from to 
`include "parameters.vh"

module toplevel_tree_serializer #(parameter int unsigned FROM = `TREE_FROM ,parameter int unsigned LOGFROM = `TREE_LOGFROM)
	(	input logic [FROM-1:0] 	data_i,
		output logic 			data_o,
		input logic 			clk_i,
		input logic 			reset_ni);

	//Signal declarations
	
	logic [LOGFROM:0] 			clks;
	logic 						dataOut_SN, dataOut_SP;

	assign clks[0]  = clk_i;
	assign data_o = dataOut_SP;

	// build the clock dividers
	// the clockdivider modules name will be << clks[j].clock_divider >>
	generate 
			for (genvar j=1; j<LOGFROM+1; j++) begin:clk_
				Clock_divider clock_divider (.clk_div_o(clks[j]), .clk_fast_i(clks[j-1]), .reset(reset_ni));
			end // for (genvar j=0; j<LOGFROM; j++)
	endgenerate
 	

 	Serializer #(FROM,LOGFROM,0) Serializer (.io_clk(clks[LOGFROM:1]), .io_rst(reset_ni), .io_dataIn(data_i), .io_dataOut(dataOut_SN));

		//registers
	  always @ (posedge clk_i or posedge reset_ni) begin
	    if (reset_ni) begin
	      dataOut_SP <= '0;
	    end else begin
	      dataOut_SP <= dataOut_SN;
	    end
	  end

endmodule // toplevel_from_to