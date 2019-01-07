//TOPLEVEL

//Serializer from to 

module toplevel #(parameter int unsigned FROM = 256,parameter int unsigned LOGFROM = 8)
	(	input logic [FROM-1:0] 	data_i,
		output logic 			data_o,
		input logic 			clk,
		input logic 			reset);

	//Signal declarations
	
	logic [LOGFROM:0] 			clks;
	logic 						dataOut_SN, dataOut_SP;

	assign clks[0]  = clk;
	assign data_o = dataOut_SP;
	generate
		for (genvar j=0; j<LOGFROM; j++)
		Clock_divider Clock_divider (.io_clkB(clks[j+1]), .clk(clks[j]), .reset(reset));		
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
