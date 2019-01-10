//TOPLEVEL

//Serializer from to 
//`include "params.sv"

module toplevel #(parameter int unsigned SHIFT_FROM = 20,parameter int unsigned SHIFT_TO = 4, parameter int unsigned SHIFT_LOGFROM = 10, parameter int unsigned TREE_FROM = 4, parameter int unsigned TREE_LOGFROM = 2)
	(	input logic [SHIFT_FROM-1:0] 	data_i,
		output logic 					data_o,
		input logic						valid_i,
        output logic            		valid_o,
        output logic            		ready_o,
		input logic 					clk,
		input logic 					reset);

	//Signal declarations
	
	logic [TREE_LOGFROM:0] 			clks;
	logic 							dataOut_SN, dataOut_SP;
	logic [SHIFT_TO-1:0]			shift_o;
	logic 							valid_out_temp;
	logic							valid1_out_SP, valid1_out_SN, valid2_out_SP, valid2_out_SN;
	enum logic [1:0] {IDLE, COUNT}	State_SP, State_SN;

 	//logic

	assign clks[0]  = clk;
	assign data_o = dataOut_SP;
	assign valid_o = valid2_out_SP;
	assign valid1_out_SN = valid_out_temp;
	assign valid2_out_SN = valid1_out_SP;

	generate
		for (genvar j=0; j < TREE_LOGFROM; j++)
		Clock_divider Clock_divider (.io_clkB(clks[j+1]), .clk(clks[j]), .reset(reset));		
	endgenerate
 	

	shift_serializer #(SHIFT_FROM, SHIFT_LOGFROM, SHIFT_TO) shift_serializer (.data_i(data_i), .data_o(shift_o), .clk(clks[TREE_LOGFROM]), .reset(reset), .valid_i(valid_i), .valid_o(valid_out_temp), .ready_o(ready_o));

 	tree_serializer #(TREE_FROM,TREE_LOGFROM) tree_serializer (.data_i(shift_o), .data_o(dataOut_SN), .clks(clks), .reset(reset));


		//registers fast
	  always @ (posedge clk or posedge reset) begin
	    if (reset) begin
	      dataOut_SP <= '0;
	    end else begin
	      dataOut_SP <= dataOut_SN;
	    end
	  end

	  //registers slow
	  always @ (posedge clks[TREE_LOGFROM] or posedge reset) begin
	    if (reset) begin
	      valid1_out_SP <= '0;
	      valid2_out_SP <= '0;
	    end else begin
	      valid1_out_SP <= valid1_out_SN;
	      valid2_out_SP <= valid2_out_SN;
	    end
	  end


	endmodule // toplevel_from_to

