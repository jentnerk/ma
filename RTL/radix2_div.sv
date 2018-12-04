// Copyright (C) 2017 ETH Zurich, University of Bologna
// All rights reserved.
//
// This code is under development and not yet released to the public.
// Until it is released, the code is under the copyright of ETH Zurich and
// the University of Bologna, and may contain confidential and/or unpublished
// work. Any reuse/redistribution is strictly forbidden without written
// permission from ETH Zurich.

// Author: Kaja Jentner
// Date: 16.4.18
// Description: this RTL describes a radix 2 divider

import div_pkg::*;

module div_two #(    parameter int unsigned C_WIDTH     = 64, parameter int unsigned C_LOG_WIDTH = 6)
	(
    input  logic clk_i,                             // Clock
    input  logic rst_ni,                            // Asynchronous reset active low
    input  logic [TRANS_ID_BITS-1:0] trans_id_i,    // transaction id in
    input  logic                     div_valid_i,   // division request is valid = DataInReq
    input  fu_op                     operator_i,    // operator in can be of value DIV, DIVU, DIVW, DIVUW, REM, REMU, REMW, REMUW
    input  logic [63:0]              operand_a_i,   // operand a in (rs1)
    input  logic [63:0]              operand_b_i,   // operand b in (rs2)
    output logic [63:0]              result_o,      // result out
    output logic                     div_valid_o,   // division is valid = DataOutReq
    output logic                     div_ready_o,   // divider is ready = DataInAck
    output logic [TRANS_ID_BITS-1:0] div_trans_id_o // transaction ID out
);



    // ----------------------------------
    // Signal Declarations
    // ----------------------------------

        //Data Signals
        logic [C_WIDTH-1:0]         dividend_S, divisor_S;
        logic [C_WIDTH + 3:0]       ResCarry_DP, ResCarry_DN, Two_ResCarry_S, Two_ResSum_S, CarryIn_S;
        logic [C_WIDTH + 3:0]       ResSum_DP, ResSum_DN;
        logic [C_WIDTH + 3:0]       Divisor_DP, Divisor_DN, Divisor_Neg_S;
        logic [63:0]                operand_b_rev;
        logic [C_WIDTH + 3:0]       MuxOut_S, AddOutSum_S, AddOutCarry_S;
        logic [3:0]                 ResSum_trunc_S, ResCarry_trunc_S;
        logic [1:0]                 NextQ_S;
        logic [3:0]                 p_S, g_S;
        logic [63:0]                Q_DP, Q_DN, QM_DP, QM_DN;
        logic [63:0]                result_S, finalQuotient_S;
        logic [C_WIDTH + 3:0]       remainder_shifted, remainder_S, finalRemainder_S, finalSum_S;

        //Control Signals
        logic                       LoadEn_S;
        logic                       RegEn_S;
        logic                       overflow_S, overflow_DP, overflow_DN;
        logic                       DivisorZero_S, DivisorZero_DP, DivisorZero_DN;
        logic                       negative_S, negative_DP, negative_DN;
        fu_op                       operator_DP, operator_DN;
        logic [TRANS_ID_BITS - 1:0] TransId_DP, TransId_DN;
        logic [C_LOG_WIDTH - 1:0]   LeadingZeros_S, LeadingZeros_DP, LeadingZeros_DN;
        logic [C_LOG_WIDTH:0]       Counter_DP, Counter_DN;
        logic                       CounterZero_S;

        //define the possible states from the FSM, per default idle,newdata,run,dataout = 0,1,2,3
    	enum logic [1:0] {IDLE, DIVIDE, FINISH} State_DP, State_DN;



    // -----------------
    // Datapath
    // -----------------

        make_pos make_pos (.operator_i(operator_i), .operand_a_i(operand_a_i), .operand_b_i(operand_b_i), .operand_a_o(dividend_S), .operand_b_o(divisor_S), .res_neg_o(negative_S), .overflow_o (overflow_S));


        // ---------------------
        // Find First one
        // ---------------------

            // First: reverse input operands
                generate
                    for (genvar k = 0; k < 64; k++)
                        assign operand_b_rev[k] = divisor_S[63-k];
                endgenerate
            //then give reversed input operand b into given alu, that determines first one
                alu_ff #(
                    .LEN         (64)
                ) i_ff1 (
                    .in_i        (operand_b_rev), // signed = operand_b_rev_neg, unsigned operand_b_rev
                    .first_one_o (LeadingZeros_S),
                    .no_ones_o   (DivisorZero_S)
                );


        //--------------------------------------
        //Multiplication of divisor with quotient
        //--------------------------------------
            //divisor inverted
            assign Divisor_Neg_S = ~Divisor_DP;

            //if NextQ_S =(1,1) then q = -1, if NextQ_S = (1,0) then q =0 and if NextQ_S = (0,1) then q = 1
            //if q is negative, the divisor has to be added to the residual, if q is positive the divisor has to be substracted
            assign MuxOut_S = (& NextQ_S) ? Divisor_DP : (NextQ_S[0] ? Divisor_Neg_S : 1'b0);

          	//if quotient is positive (and therefore the divisor has to be substracted), add one to ResCarry for twos complement
            assign CarryIn_S = &NextQ_S ? Two_ResCarry_S: {Two_ResCarry_S[C_WIDTH + 3:1], ~ResCarry_DP[0]};

        //----------
        //handle signals
        //-----------
            //multiply residual with 2: shift left by one and cut away the most significant bit
            assign Two_ResSum_S = ResSum_DP << 1;
            assign Two_ResCarry_S = ResCarry_DP << 1;

            //take the 4 top bits of sum and carry for the quotient selection function
            assign ResSum_trunc_S = Two_ResSum_S[C_WIDTH + 3:C_WIDTH];
            assign ResCarry_trunc_S = Two_ResCarry_S[C_WIDTH + 3:C_WIDTH];

        //----------
        //Full adder
        //---------
            assign AddOutSum_S = (MuxOut_S ^ CarryIn_S ^ Two_ResSum_S);
            assign AddOutCarry_S = (CarryIn_S & Two_ResSum_S | MuxOut_S & (CarryIn_S^Two_ResSum_S))<<1;

        //------------
        //Q-SEL
        //-----------
            //formulas as given in chapter 5
            assign p_S = ResCarry_trunc_S ^ ResSum_trunc_S;
            assign g_S = ResCarry_trunc_S & ResSum_trunc_S;
            assign NextQ_S = {p_S[3] ^ ( g_S[2] | (p_S[2] & g_S[1]) | (p_S[2] & p_S[1] & g_S[0]) ), ~(p_S[2] & p_S[1] & p_S[0])};

        //----------------------------
        //Quotient on the fly conversion
        //----------------------------
            assign Q_DN = RegEn_S ? (LoadEn_S ? 1'b0:((& NextQ_S) ? {QM_DP,1'b1} : (NextQ_S[1] ? {Q_DP, 1'b0} : {Q_DP,1'b1}))):Q_DP;
            assign QM_DN = RegEn_S ? (LoadEn_S ? 1'b0: ((& NextQ_S) ? {QM_DP,1'b0} : (NextQ_S[1] ? {QM_DP, 1'b1} : {Q_DP, 1'b0}))): QM_DP;

        //-------------------
        //Termination Step, is the remainder negative, then substract 1 from the quotient
        //-------------------

            // if one of the inputs was negative, the sign of the result has to be changed
            assign finalSum_S = ResSum_DP + ResCarry_DP;
            assign result_S = (finalSum_S[C_WIDTH + 3]) ? QM_DP : Q_DP;
            assign finalQuotient_S = (negative_DP) ? -result_S:result_S;
            //remainder has to be shifted correctly
            assign remainder_S = (finalSum_S[C_WIDTH + 3]) ? (ResCarry_DP + ResSum_DP + Divisor_DP): (ResCarry_DP + ResSum_DP);
            assign remainder_shifted = remainder_S >> (1+ LeadingZeros_DP);
            assign finalRemainder_S = (negative_DP) ? -remainder_shifted : remainder_shifted;


            //depending on the operator the output of the divider is either the remainder or the quotient
            always_comb begin
            //default assignements
            result_o = '0;

                case (operator_DP)

                    DIV:begin
                        result_o = finalQuotient_S;
                        if(overflow_DP) begin
                            result_o = -64'd9223372036854775808;
                        end
                        if(DivisorZero_DP) begin
                            result_o = -1;
                        end
                    end

                    DIVU:begin
                        result_o = finalQuotient_S;
                        if(DivisorZero_DP) begin
                            result_o = 64'd18446744073709551615;
                        end
                    end

                    DIVW:begin
                        result_o = finalQuotient_S;
                        if(overflow_DP) begin
                            result_o = -64'd2147483648;
                        end
                        if(DivisorZero_DP) begin
                            result_o = -1;
                        end


                    end

                    DIVUW:begin
                        result_o = finalQuotient_S;
                        if(DivisorZero_DP) begin
                            result_o = -1;
                        end
                    end

                    REM:begin
                        result_o = finalRemainder_S;
                        if(overflow_DP) begin
                            result_o = 0;
                        end
                        if(DivisorZero_DP) begin
                            result_o = ResSum_DP;
                            if(negative_DP) begin
                                result_o= -ResSum_DP;
                            end
                        end
                    end

                    REMU:begin
                        result_o = finalRemainder_S;
                        if(DivisorZero_DP) begin
                            result_o=ResSum_DP;
                            if(negative_DP) begin
                                result_o= -ResSum_DP;
                            end
                        end


                    end

                    REMW:begin
                        result_o = sext32(finalRemainder_S[31:0]);
                        if(overflow_DP) begin
                            result_o = 0;
                        end

                        if(DivisorZero_DP) begin
                            result_o= sext32(ResSum_DP[31:0]);
                            if(negative_DP) begin
                                result_o = sext32(-ResSum_DP[31:0]);
                            end
                        end
                    end

                    REMUW:begin
                        result_o = sext32(finalRemainder_S[31:0]);
                        if(DivisorZero_DP) begin
                            result_o=sext32(ResSum_DP[31:0]);
                            if(negative_DP) begin
                                result_o= sext32(-ResSum_DP[31:0]);
                            end
                        end
                    end
                endcase
            end









    // -----------------
    // FSM
    // -----------------

    	//computation of next state and present outputs
    	always_comb begin
    		//default assignements
    		State_DN = State_DP;
    		div_valid_o 	= 1'b0;
            div_ready_o     = 1'b0;
            LoadEn_S 		= 1'b0;
            RegEn_S           = 1'b0;

    		//nondefault transitions and outputs
    		case (State_DP)

    		IDLE: begin
    			div_ready_o = 1'b1;
    			if(div_valid_i) begin
    	            div_ready_o		= 1'b0;
    	            div_valid_o		= 1'b0;
    	            LoadEn_S 		= 1'b1;
                    RegEn_S         = 1'b1;
    				State_DN		= DIVIDE;
                    if(DivisorZero_DN) begin
                        State_DN = FINISH;
                    end
                    if (overflow_S) begin
                        State_DN = FINISH;
                    end

    			end
    		end

    		DIVIDE: begin
                RegEn_S = 1'b1;
                if (CounterZero_S) begin
                    State_DN   = FINISH;
                end
    		end

            FINISH: begin
                RegEn_S = 1'b1;
                div_valid_o=1'b1;
                State_DN = IDLE;
            end

    		default: ;
    		endcase
    	end


    // -----------------
    //  Registers
    // -----------------
        assign overflow_DN = LoadEn_S ? overflow_S : overflow_DP;
        assign DivisorZero_DN = LoadEn_S ? DivisorZero_S : DivisorZero_DP;
        assign LeadingZeros_DN =  LoadEn_S ? LeadingZeros_S: LeadingZeros_DP;
        assign operator_DN = LoadEn_S ? operator_i : operator_DP;
        assign negative_DN = LoadEn_S ? negative_S : negative_DP;

        assign TransId_DN = (LoadEn_S) ? trans_id_i : TransId_DP;
        assign div_trans_id_o = TransId_DN;

        //shift divisor
        assign Divisor_DN = LoadEn_S ? divisor_S << LeadingZeros_S + 1 : Divisor_DP;

        //muxes before sum and carry registers
        assign ResCarry_DN = RegEn_S ? (LoadEn_S ? 1'b0 : AddOutCarry_S): ResCarry_DP;
        assign ResSum_DN = RegEn_S ? (LoadEn_S ? dividend_S : AddOutSum_S): ResSum_DP;

        //------------------
        // Counter
        // -----------------
        //(m+1) iterations are needed, therefore the counter is set to m (number of leading zeros in the divisor)
        assign Counter_DN = LoadEn_S ? LeadingZeros_S : (~CounterZero_S ? (Counter_DP - 1): Counter_DP);
        //determines whether all bits of Counter_DP are zero
        assign CounterZero_S = ~(|Counter_DP);


        // at the active clock edge, all registers update their state:
        always_ff @(posedge clk_i or negedge rst_ni) begin : p_regs
            if (~rst_ni) begin
                State_DP		<= IDLE;
                ResSum_DP		<= '0;
                ResCarry_DP 	<= '0;
               	Divisor_DP		<= '0;
                Counter_DP		<= '0;
                TransId_DP		<= '0;
                Q_DP  			<= '0;
                QM_DP   		<= '0;
                negative_DP     <= '0;
                operator_DP     <= ADD;
                LeadingZeros_DP <= '0;
                DivisorZero_DP  <= '0;
                overflow_DP     <= '0;

            end else begin
                State_DP		<= State_DN;
                ResSum_DP 		<= ResSum_DN;
                ResCarry_DP     <= ResCarry_DN;
                Divisor_DP      <= Divisor_DN;
                Counter_DP 		<= Counter_DN;
                TransId_DP      <= TransId_DN;
                Q_DP 			<= Q_DN;
                QM_DP 			<= QM_DN;
                negative_DP     <= negative_DN;
                operator_DP     <= operator_DN;
                LeadingZeros_DP <= LeadingZeros_DN;
                DivisorZero_DP  <= DivisorZero_DN;
                overflow_DP     <= overflow_DN;

            end
        end


endmodule


