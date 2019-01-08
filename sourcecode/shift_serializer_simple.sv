//Shift Register Serializer

//Serializer from

module shift_serializer #(parameter int unsigned FROM = 100, parameter int unsigned LOG2FROM = 5)
	(	input logic 	        data_i,
		output logic 			data_o,
		input logic 			clk,
		input logic 			reset);

	//Signal declarations	
	logic [FROM-1:0]					    Reg_SP, Reg_SN;
    // -----------------
    //  Registers
    // -----------------
        //assign Reg_SN = LoadEn_S ? data_i : (shift_S ? {Reg_SP[FROM-2:0],1'b0} : Reg_SP);
        //assign data_o = Reg_SP[FROM-1];
        assign Reg_SN = {Reg_SP[FROM-2:0],data_i};
        assign data_o = Reg_SP[FROM-1];

	  always @ (posedge clk or posedge reset) begin
	    if (reset) begin
	      Reg_SP           <= '0;
	    end else begin
	      Reg_SP           <= Reg_SN;
	    end
	  end


	endmodule // shift_serializer
