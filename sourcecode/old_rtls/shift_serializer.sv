//Shift Register Serializer

//Serializer from

module shift_serializer #(parameter int unsigned FROM = 32, parameter int unsigned LOG2FROM = 5)
	(	input logic [FROM-1:0] 	data_i,
		output logic 			data_o,
		input logic 			clk,
		input logic 			reset,
        input logic             valid_i,
        output logic            valid_o,
        output logic            ready_o);

	//Signal declarations	
	logic 									LoadEn_S, shift_S;
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

    // -----------------
    //  Registers
    // -----------------
        assign Reg_SN = LoadEn_S ? data_i : (shift_S ? {Reg_SP[FROM-2:0],1'b0} : Reg_SP);
        assign data_o = Reg_SP[FROM-1];
        //reverse shifting
        //assign Reg_SN = LoadEn_S ? data_i : (shift_S ? {1'b0,Reg_SP[FROM-1:1]} : Reg_SP);
        //assign data_o = Reg_SP[0];

        //------------------
        // Counter
        // -----------------
        //(m+1) iterations are needed, therefore the counter is set to m (number of leading zeros in the divisor)
        assign Counter_SN = LoadEn_S ? FROM : (~(|Counter_SP) ? Counter_SP : (Counter_SP - 1));
	
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
