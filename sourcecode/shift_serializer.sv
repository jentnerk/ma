//Shift Register Serializer

//Serializer from

module shift_serializer #(parameter int unsigned FROM = 3)
	(	input logic [FROM-1:0] 	data_i,
		output logic 			data_o,
		input logic 			clk,
		input logic 			reset);

	//Signal declarations	
	logic 									LoadEn_S, shift_S, valid_i, ready_o, valid_o;
	logic									Counter_SP, Counter_SN, CounterZero_S;
	logic [FROM-1:0]						Reg_SP, Reg_SN;
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
    			shift_S = 1'b1;
                valid_o = 1'b1;
                if (CounterZero_S) begin
                    State_SN   	= READ;
                    ready_o		= 1'b1;
                end
    		end

    		default: ;
    		endcase
    	end

    // -----------------
    //  Registers
    // -----------------

    	assign Reg_SN = LoadEn_S ? data_i : (shift_S ? {Reg_SP[FROM-1:1],0} : Reg_SP);
    	assign data_o = Reg_SN[FROM-1];

        //------------------
        // Counter
        // -----------------
        //(m+1) iterations are needed, therefore the counter is set to m (number of leading zeros in the divisor)
        assign Counter_SN = LoadEn_S ? FROM : (~CounterZero_S ? (Counter_SP - 1): Counter_SP);
        //determines whether all bits of Counter_SP are zero
        assign CounterZero_S = ~(|Counter_SP);
	
	  always @ (posedge clk or posedge reset) begin
	    if (reset) begin
	      Reg_SP <= '0;
	    end else begin
	      Reg_SP <= Reg_SN;
	    end
	  end


	endmodule // shift_serializer
