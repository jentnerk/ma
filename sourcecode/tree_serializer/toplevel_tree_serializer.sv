//TOPLEVEL

//Serializer from to 
`include "parameters.vh"

module toplevel_tree_serializer #(parameter int unsigned FROM = `TREE_FROM ,parameter int unsigned LOGFROM = `TREE_LOGFROM)
	(	input logic [FROM-1:0] 	data_i,
		output logic 			data_o,
		input logic 			clk,
		input logic 			reset);

	//Signal declarations
	
	logic [LOGFROM:0] 			clks;
	logic 						dataOut_SN, dataOut_SP;

	assign clks[0]  = clk;
	assign data_o = dataOut_SP;

	// build the clock dividers
	// the clockdivider modules name will be << clock[j].divider >>
	generate 
			for (genvar j=0; j<LOGFROM; j++) begin:clock
				Clock_divider divider (.io_clkB(clks[j+1]), .clk(clks[j]), .reset(reset));
			end // for (genvar j=0; j<LOGFROM; j++)
	endgenerate
 	

 	Serializer #(FROM,LOGFROM,0) Serializer (.io_clk(clks[LOGFROM:1]), .io_rst(reset), .io_dataIn(data_i), .io_dataOut(dataOut_SN));

		//registers
	  always @ (posedge clk or posedge reset) begin
	    if (reset) begin
	      dataOut_SP <= '0;
	    end else begin
	      dataOut_SP <= dataOut_SN;
	    end
	  end

endmodule // toplevel_from_to