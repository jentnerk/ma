// ########################################################
// ###
// ### Shift-Register Serializer with FSM
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
        input logic             valid_i,
        output logic            valid_o,
        output logic            ready_o);

	//Signal declarations	
	logic 									LoadEn_S, shift_S;
    logic [FROM-1:0]                        data_in_temp;
    logic [LOG2FROM:0]						Counter_SP, Counter_SN;
	logic [FROM-1:0]					    Reg_SP, Reg_SN;
	enum logic [1:0] {READ, SHIFT}			State_SP, State_SN;

    // -----------------
    // FSM
    // -----------------

    	//computation of next state and present outputs
    	always_comb begin
    		//default assignements
    		State_SN 	= State_SP;
            ready_o     = 1'b0;
            LoadEn_S 	= 1'b0;
            valid_o     = 1'b0;
            shift_S     = 1'b0;

    		//nondefault transitions and outputs
    		case (State_SP)

    		READ: begin
    			ready_o = 1'b1;
                valid_o = 1'b0;
    			if(valid_i) begin
    	            ready_o		= 1'b0;
    	            LoadEn_S 	= 1'b1;
    				State_SN	= SHIFT;
    			end
    		end

    		SHIFT: begin
    			shift_S  = 1'b1;
                valid_o  = 1'b1;
                LoadEn_S = 1'b0;
                if (~(|Counter_SP)) begin
                    State_SN   	= READ;
                    ready_o		= 1'b1;
                end
    		end

    		default: ;
    		endcase
    	end

    // reorder the input data bits, such that it is the same order at the output
        generate
        for (genvar j = 0; j < TO; j++)

                for (genvar k = 0; k < FROM/TO; k++)
                    assign data_in_temp[j*(FROM/TO)+k] = data_i[k*TO+j];

        endgenerate
    // -----------------
    //  Registers
    // -----------------
        //shifting
        assign Reg_SN = LoadEn_S ? data_in_temp : (shift_S ? {Reg_SP[FROM-2:0],1'b0} : Reg_SP);

        //assign the correct registers to the output
        generate
        for (genvar k = 1; k < TO+1; k++)
            assign data_o[k-1] = Reg_SP[k*FROM/TO-1];
        endgenerate

        //------------------
        // Counter
        // -----------------
        //(m+1) iterations are needed, therefore the counter is set to m (number of leading zeros in the divisor)
        assign Counter_SN = LoadEn_S ? FROM/TO: (~(|Counter_SP) ? Counter_SP : (Counter_SP - 1));
	
	  always @ (posedge clk or posedge reset) begin
	    if (reset) begin
	      Reg_SP           <= '0;
          Counter_SP       <= '0;
          State_SP         <= READ;
	    end else begin
	      Reg_SP           <= Reg_SN;
          Counter_SP       <= Counter_SN;
          State_SP         <= State_SN;
	    end
	  end


	endmodule // shift_serializer
