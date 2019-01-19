// ########################################################
// ###
// ### Shift-Register Serializer with FSM
// ###
// ### Written by: Kaja Jentner
// ### January 2019
// ### IEF ETH Zurich
// ########################################################

module shift_serializer #(parameter int unsigned FROM, parameter int unsigned LOG2FROM, parameter int unsigned TO)
	(	input logic [FROM-1:0] 	data_i,
		output logic [TO-1:0]	data_o,
		input logic 			clk,
		input logic 			reset,
        output logic            ready_o);

    //=====================
    // Signal declarations  
    //=====================
        logic [FROM-1:0]                        data_in_temp;
        logic [LOG2FROM:0]						Counter_SP, Counter_SN;
    	logic [FROM-1:0]					    Reg_SP, Reg_SN;

    //===================
    // Logic
    //===================
        //reorder the input data bits, such that it is the same order at the output
            generate
                for (genvar j = 0; j < TO; j++)
                    for (genvar k = 0; k < FROM/TO; k++)
                        assign data_in_temp[j*(FROM/TO)+k] = data_i[k*TO+j];
            endgenerate

        // Assign the Correct Registers to the Output
            generate
                for (genvar k = 1; k < TO+1; k++)
                    assign data_o[k-1] = Reg_SP[k*FROM/TO-1];
            endgenerate

        //------------------
        // Counter
        // -----------------
            assign Counter_SN = ~(|Counter_SP) ? FROM/TO - 1 : (Counter_SP - 1);
          
        // Shifting
            assign Reg_SN = ~(|Counter_SP) ? data_in_temp : {Reg_SP[FROM-2:0],1'b0};
    	   
        // Handle Output
            assign ready_o = ~(|Counter_SP) ? 1'b1 : 1'b0;            

    //=============
    //  Registers
    //=============
	  always @ (posedge clk or posedge reset) begin
	    if (reset) begin
	      Reg_SP           <= '0;
          Counter_SP       <= '0;
	    end else begin
	      Reg_SP           <= Reg_SN;
          Counter_SP       <= Counter_SN;
	    end
	  end

	endmodule // shift_serializer
