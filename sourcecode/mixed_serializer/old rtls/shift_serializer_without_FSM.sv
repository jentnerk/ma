// ########################################################
// ###
// ### Shift-Register Serializer with FSM
// ###
// ### Written by: Kaja Jentner
// ### January 2019
// ### IEF ETH Zurich
// ########################################################

module shift_serializer_wo_FSM #(parameter int unsigned FROM, parameter int unsigned LOG2FROM, parameter int unsigned TO)
	(	input logic [FROM-1:0] 	data_i,
		output logic [TO-1:0]	data_o,
		input logic 			clk,
		input logic 			reset,
        output logic            valid_o,
        output logic            ready_o);

    //=====================
    // Signal declarations  
    //=====================
    	logic 									valid_SP, valid_SN;
        logic [FROM-1:0]                        data_in_temp;
        logic [LOG2FROM:0]						Counter_SP, Counter_SN;
    	logic [FROM-1:0]					    Reg_SP, Reg_SN;
    	enum logic [1:0] {READ, SHIFT}			State_SP, State_SN;

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
            assign Counter_SN = ~(|Counter_SP) ? FROM/TO : (Counter_SP - 1);
            // assign Counter_SN = LoadEn_S ? FROM/TO-1 : (~(|Counter_SP) ? Counter_SP : (Counter_SP - 1));
          
        // Shifting
            assign Reg_SN = ~(|Counter_SP) ? data_in_temp : {Reg_SP[FROM-2:0],1'b0};
            // assign Reg_SN = LoadEn_S ? data_in_temp : (shift_S ? {Reg_SP[FROM-2:0],1'b0} : Reg_SP);
    	   
        // Handle Output
            assign ready_o = ~(|Counter_SP) ? 1'b1 : 1'b0;
            // assign ready_o = ~valid_SP;
            assign valid_SN = ~(|Counter_SP) ? 1'b0 : 1'b1;
            assign valid_o = ~(|Counter_SP) ? 1'b0 : 1'b1;
    //=============
    //  Registers
    //=============
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
