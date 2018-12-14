




// Author: Wolfgang Roenninger, ETH Zurich
// Date: 9.3.2018
// Description: (fast) Divider testbench
//

//testbench which instantiates the radix 2 divider
module div_two_tb;

    //
    timeunit 1ns;
    localparam int unsigned CLOCK_PERIOD = 10ns;  // Clock period

    localparam logic TESTZERO  = 1'b1; // Enable testing division by zero
    localparam logic TESTOVER  = 1'b1; // Enable testing overflow
    localparam logic TESTKNOWN = 1'b0; // Enable testing two known numbers (125 / 6)
    localparam logic TESTRAND  = 1'b1; // Enable testing of random inputs
    localparam logic TESTBIG   = 1'b0; // Enable testing of 'big' (125/6)
    localparam logic TESTNARRO = 1'b0; // Enable testing if next request is in next cycle after taking one
    localparam longint unsigned RANDOM_ROUNDS = 1000;   // # of randomized test rounds

    // ---------------------------------
    // inputs to the DUT
    // ---------------------------------
    logic clk = 0;
    logic rst_ni;
    logic [TRANS_ID_BITS-1:0] trans_id_i;
    logic div_valid_i;
    fu_op operator_i;
    logic [63:0] operand_a;
    logic [63:0] operand_b;

    // -------------------------------------
    // outputs from the DUT
    // -------------------------------------
    logic [63:0] result;
    logic div_valid_o;
    logic div_ready_o;
    logic [TRANS_ID_BITS-1:0] div_trans_id_o;

    // -------------------------------------
    // Dummy signals for testing positiv conversion
    // -------------------------------------
    logic [63:0] op_a_neg;
    logic [63:0] op_b_neg;
    logic res_neg;


    // ------------------
    // Clock generator
    // ------------------
    // Every 5 timeunits change the signal of the clock! corresponds to period of 10ns
    always
    begin
        #(CLOCK_PERIOD/2) clk = 1;
        #(CLOCK_PERIOD/2) clk = 0;
    end


    // ---------------------------
    // Test Program - Testbench
    // ---------------------------
    /*       CLOCK_PERIOD
        <--------------------->
        ------------          -------------
        | A        |        T |           |
       --          ------------           -------------
        <->
        output of clocking block
                            <->
                            input of clocking blok #1step
    */

    class static Stimulus #(parameter WIDTH = 32);

        rand logic [WIDTH-1:0]         stimulus_a;
        rand logic [WIDTH-1:0]         stimulus_b;
        rand logic [TRANS_ID_BITS-1:0] trans_id;

        local longint checks; // Bookkeeping for how many tests were done
        local longint passed;
        local longint allchecks;
        local longint allpassed;

        // -----------------
        // Constructor
        // -----------------
        function new(logic[WIDTH-1:0] a = 0, logic[WIDTH-1:0] b = 0);
            stimulus_a = a;
            stimulus_b = b;
            trans_id   = 0;
            checks     = 0;
            passed     = 0;
            allchecks  = 0;
            allpassed  = 0;
        endfunction : new

        function void set_stimulus_a(logic [WIDTH-1:0] a);
            stimulus_a = a;
        endfunction : set_stimulus_a

        function void set_stimulus_b(logic [WIDTH-1:0] b);
            stimulus_b = b;
        endfunction : set_stimulus_b

        function void set_trans_id(logic [TRANS_ID_BITS-1:0] id);
            trans_id = id;
        endfunction : set_trans_id

       /* // make rand mubers smaller
        function void set_first_bits_zero_a(int n = 0);
            stimulus_a = {stimulus_a[WIDTH-1], {n{1'b0}}, stimulus_a[WIDTH-1-n:0]};
        endfunction : set_first_bits_zero_a
*/
        // -----------------------------------------------
        // Functions for checking the outputs of the DUT
        // -----------------------------------------------

        function void check_div(logic [WIDTH-1:0] result);
            logic signed [WIDTH-1:0] expected;
            // Check for edge cases
            if(stimulus_b == 0) begin  // Division by zero
                expected = -1;
            end else if($signed(stimulus_a) == -2**(WIDTH-1) && $signed(stimulus_b) == -1) begin // Overflow
                expected = -2**(WIDTH-1);
            end else begin //"Normal"
                expected = $signed(stimulus_a) / $signed(stimulus_b);
            end

            checks++;
            Check_division: assert (expected == $signed(result)) passed++;
                                else $error("%m: Failed!!!!!!!\nOperand_a: %d\nOperand_b: %d\nResult:   %d\nExpected: %d",
                                            $signed(stimulus_a), $signed(stimulus_b), $signed(result), expected);
        endfunction : check_div


        function void check_divu(logic [WIDTH-1:0] result);
            logic [WIDTH-1:0] expected;
            // Check for edge cases
            if (stimulus_b == 0) begin  // Division by zero
                expected = '1;
            end else begin //"Normal"
                expected = stimulus_a / stimulus_b;
            end

            checks++;
            Check_division_u: assert (expected == result) passed++;
                                else $error("%m: Failed!!!!!!!\nOperand_a: %d\nOperand_b: %d\nResult:   %d\nExpected: %d",
                                            stimulus_a, stimulus_b, result, expected);
        endfunction : check_divu


        function void check_rem(logic [WIDTH-1:0] result);
            logic signed [WIDTH-1:0] expected;
            // Check for edge cases
            if (stimulus_b == 0) begin  // Division by zero
                expected = stimulus_a;
            end else if($signed(stimulus_a) == -2**(WIDTH-1) && $signed(stimulus_b) == -1) begin // Overflow
                expected = 0;
            end else begin //"Normal"
                expected = $signed(stimulus_a) % $signed(stimulus_b);
            end


            checks++;
            Check_remainder: assert (expected == $signed(result)) passed++;
                                else $error("%m: Failed!!!!!!!\nOperand_a: %d\nOperand_b: %d\nResult:   %d\nExpected: %d",
                                            $signed(stimulus_a), $signed(stimulus_b), $signed(result), expected);
        endfunction : check_rem

        function void check_remu(logic [WIDTH-1:0] result);
            logic [WIDTH-1:0] expected;
            // Check for edge cases
            if (stimulus_b == 0) begin // Division by zero
                expected = stimulus_a;
            end else begin //'Normal'
                expected = stimulus_a % stimulus_b;
            end
            checks++;
            Check_remainder_u: assert (expected == result) passed++;
                                else $error("%m: Failed!!!!!!!\nOperand_a: %d\nOperand_b: %d\nResult:   %d\nExpected: %d",
                                            stimulus_a, stimulus_b, result, expected);

        endfunction : check_remu

        function void check_trans_id(logic [TRANS_ID_BITS-1:0] result_trans_id);
            checks++;
            Check_trans_id: assert (trans_id == result_trans_id) passed++;
                                else $error("%m: Expected %d, actual trans_id was: %d", trans_id, result_trans_id);
        endfunction : check_trans_id

        // ----------------------
        // Print Functions
        // ----------------------

        function void print_stimuli();
            $display("stimulus_a: %d\nstimulus_b: %d \ntrans_id: %d",
                         stimulus_a, stimulus_b, trans_id);
        endfunction : print_stimuli

        function void print_stimuli_sign();
            $display("stimulus_a: %d\nstimulus_b: %d \ntrans_id: %d",
                         $signed(stimulus_a), $signed(stimulus_b), trans_id);
        endfunction : print_stimuli_sign

        //Statistics how many checks were performed till this function was called
        function void print_rounds();
            $display("--------------------------------------------------\n",
                     "(Operator width: %d Bit)\n", WIDTH,
                     "%d of %d Checks were successful\n", passed, checks,
                     "--------------------------------------------------");
            allchecks = allchecks + checks;
            allpassed = allpassed + passed;
            checks = 0;
            passed = 0;
        endfunction : print_rounds

        function void print_all_rounds();
            $display("//////////////////////////////////////////////////\n",
                     "--------------------------------------------------\n",
                     "(Operator width: %d)\n", WIDTH,
                     "After %d Checks\n", allchecks,
                     "      %d were successfull!\n", allpassed,
                     "--------------------------------------------------");
        endfunction : print_all_rounds

    endclass : Stimulus

    // -----------------------------------------------
    // Class to randomize an operator
    // -----------------------------------------------

    class FuOperator;
        rand fu_op randFuOp;
        rand int rCycles;
        constraint c1 {randFuOp inside {DIV, DIVU, DIVW, DIVUW, REM, REMU, REMW, REMUW};};
        constraint c2 {rCycles inside {[0:10]};};
    endclass : FuOperator

    // -----------------------------------------------
    // Testbench
    // -----------------------------------------------
    program test_div;

        // SystemVerilog "clocking block"
        // Clocking outputs are DUT inputs and vice versa
        clocking cb @(posedge clk);
            // specify skew (how many time units away from clock event a signal is sampled or driven)
            // input (sample) skew is implicitly negative
            default input #1step output #2; // #1step indicates value read is signal immediately before clock edge
            output negedge rst_ni;
            output trans_id_i, div_valid_i, operator_i, operand_a, operand_b;
            input result, div_valid_o, div_ready_o, div_trans_id_o;
        endclocking

        // ---------------------
        // Apply test stimuli
        // ---------------------
        // Can use the ## operator to delay execution by a specified number of clocking events / clock cycles
        initial begin
            // Declare the Stimulus Objects
            Stimulus #(64) stim_64;
            Stimulus #(32) stim_32;
            Stimulus #(64) stim_64_2; // These for having multiple requests


            automatic longint temp;     // To hold operator a value for testn division by zero
            automatic longint counter = 0;  // For printing during long simulations

            FuOperator rFuOp;



            stim_64 = new;
            stim_32 = new;
            stim_64_2 = new;

            rFuOp = new;

            //Set all inputs to the DUT at the beginning
            rst_ni      = '0;
            trans_id_i  = '0;
            div_valid_i = '0;
            operator_i  = ADD;
            operand_a   = '0;
            operand_b   = '0;


            // --------------------------
            // Test Reset
            // --------------------------
            // Will be applied on negedge of clock!
            cb.rst_ni <= 0;
            repeat(5) @(cb);

            cb.rst_ni <= 1;

            repeat(5) @(cb);

            // ------------------------------
            // Test Division by zero
            // ------------------------------



            if(TESTZERO) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Division by zero\n",
                         "--------------------------------------------------");
                temp = 123456789;
                // 64 Bit operations
                TestDIV(stim_64, temp, 0);

                TestREM(stim_64, temp, 0);

                TestDIVU(stim_64, temp, 0);

                TestREMU(stim_64, temp, 0);

                stim_64.print_rounds();

                // 32 Bit operations
                TestDIVW (stim_32, temp, 0);

                TestREMW (stim_32, temp, 0);

                TestDIVUW(stim_32, temp, 0);

                TestREMUW(stim_32, temp, 0);

                stim_32.print_rounds();
            end

            if(TESTOVER) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing for Overflow:\n",
                         "(It's right that expected has the wrong sign)\n",
                         "--------------------------------------------------\n");

                TestDIV(stim_64, -2**63, -1);
                TestREM(stim_64, -2**63, -1);

                TestDIVW(stim_32, -2**31, -1);
                TestREMW(stim_32, -2**31, -1);

                TestDIV(stim_64, -2**63, -1);
                TestREM(stim_64, -2**63, -1);

                TestDIVW(stim_32, -2**31, -1);
                TestREMW(stim_32, -2**31, -1);

                stim_64.print_rounds();
                stim_32.print_rounds();
            end

            if(TESTKNOWN) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Division 125 / 6 = 20, Remander: 5\n",
                         "(All possible combination of signs if signed)\n",
                         "--------------------------------------------------");
                //TestDIV(stim_64,  1 428 101 697,  897 721 346);
                //TestDIV(stim_64,  1844674407370955161,  844674407370955100);

                TestDIVU(stim_64, 34,  2048);

            /*
                TestDIV(stim_64,  156578,  13);
                TestREM(stim_64,  7897,  6);
                                TestDIV(stim_64,  543654,  1123);
                TestREM(stim_64,  3124,  64);
                                TestDIV(stim_64,  132145654,  112313);
                TestREM(stim_64,  4578,  78);
                TestDIV(stim_64,  26465 * 2**48, 1099 * 2**48);
                TestREM(stim_64,  26465 * 2**48, 1099 * 2**48);
                TestDIV(stim_64,  17,  2);
                */

/*                TestDIV(stim_64, -125,  6);
                TestDIV(stim_64,  125, -6);
                TestDIV(stim_64, -125, -6);

                TestREM(stim_64,  125,  6);
                TestREM(stim_64, -125,  6);
                TestREM(stim_64,  125, -6);
                TestREM(stim_64, -125, -6);

                TestDIVU(stim_64, 125,  6);
                TestREMU(stim_64, 125,  6);


                TestDIVW(stim_32, -125,  6);
                TestDIVW(stim_32,  125, -6);
                TestDIVW(stim_32, -125, -6);

                TestREMW(stim_32,  125,  6);
                TestREMW(stim_32, -125,  6);
                TestREMW(stim_32,  125, -6);
                TestREMW(stim_32, -125, -6);

                TestDIVUW(stim_32, 125,  6);
                TestREMUW(stim_32, 125,  6);
*/
                stim_64.print_rounds();
                stim_32.print_rounds();
            end

            // Randomized Testing
            if(TESTRAND) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Randomized with %d Stimuli\n", (RANDOM_ROUNDS*32),
                         "--------------------------------------------------");
                for (longint j = 0; j < RANDOM_ROUNDS; j++) begin

                    for (int i = 1; i <= 32; i++) begin
                        assert(rFuOp.randomize());
                        if(         rFuOp.randFuOp == DIV)   begin
                            RandTestDIV(stim_64, 2*i, 2*i);
                            //stim_64.print_stimuli_sign();

                        end else if(rFuOp.randFuOp == REM)   begin
                            RandTestREM(stim_64, 2*i, 2*i);
                            //stim_64.print_stimuli_sign();

                        end else if(rFuOp.randFuOp == DIVU)  begin
                            RandTestDIVU(stim_64, 2*i, 2*i);
                            //stim_64.print_stimuli();

                        end else if(rFuOp.randFuOp == REMU)  begin
                            RandTestREMU(stim_64, 2*i, 2*i);
                            //stim_64.print_stimuli();

                        end else if(rFuOp.randFuOp == DIVW)  begin
                            RandTestDIVW(stim_32, i, i);
                            //stim_32.print_stimuli_sign();

                        end else if(rFuOp.randFuOp == REMW)  begin
                            RandTestREMW(stim_32, i, i);
                            //stim_32.print_stimuli_sign();

                        end else if(rFuOp.randFuOp == DIVUW) begin
                            RandTestDIVUW(stim_32, i, i);
                            //stim_32.print_stimuli();

                        end else if(rFuOp.randFuOp == REMUW) begin
                            RandTestREMUW(stim_32, i, i);
                            //stim_32.print_stimuli();

                        end else $error("random Fu_Op was not in range.");

                        repeat(rFuOp.rCycles) @(cb); // Wait 0 to 10 rounds before applying next test
                        @(cb iff cb.div_ready_o == 1);
                    end
                    if(counter >= 10000) begin
                        counter = 0;
                        $display("100'000 times 32 cases tested.\n",);
                    end
                    counter++;
                end

                stim_64.print_rounds();
                stim_32.print_rounds();
            end

            if(TESTBIG) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Division 125 / 6 = 20, Remander: 5\n",
                         "But shifted by 56 to the left\n",
                         "--------------------------------------------------");
                 TestDIV(stim_64,  (125 * 2**56),  (6 * 2**56));
                 TestREM(stim_64,  (125 * 2**56),  (6 * 2**56));
                 //Look out for the size of literals if they are bigger than 32 bit!!
                 //TestDIV(stim_64,  64'd844674407370955161,  64'd1365465465465);
                 stim_64.print_stimuli();
                 stim_64.print_rounds();
            end



            if(TESTNARRO) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing what happens if many request come in \n",
                         "quick succession.\n",
                         "--------------------------------------------------");
                stim_64.randomize();
                stim_64.set_stimulus_a(125);
                stim_64.set_stimulus_b(6);
                stim_64_2.randomize();
                stim_64_2.set_stimulus_a(125);
                stim_64_2.set_stimulus_b(6);

                ApplyStimuli_64(stim_64, DIV);
                @(cb iff cb.div_ready_o == 0);
                ApplyStimuli_64(stim_64_2, REM);

                @(posedge cb.div_valid_o);
                stim_64.check_div(cb.result);
                stim_64.check_trans_id(cb.div_trans_id_o);

                stim_64.randomize();
                @(cb iff cb.div_ready_o == 0);
                ApplyStimuli_64(stim_64, DIV);

                @(posedge cb.div_valid_o);
                stim_64_2.check_rem(cb.result);
                stim_64_2.check_trans_id(cb.div_trans_id_o);

                stim_64_2.randomize();
                @(cb iff cb.div_ready_o == 0);
                ApplyStimuli_64(stim_64_2, DIV);


                @(posedge cb.div_valid_o);
                stim_64.check_div(cb.result);
                stim_64.check_trans_id(cb.div_trans_id_o);

                @(cb iff cb.div_ready_o == 0);
                ClearStimuli();

                @(posedge cb.div_valid_o);
                stim_64_2.check_div(cb.result);
                stim_64_2.check_trans_id(cb.div_trans_id_o);



                stim_64.print_rounds();
                stim_64_2.print_rounds();


            end



            stim_64.print_all_rounds();
            stim_32.print_all_rounds();
        end


        // --------------------------------------------------
        // Tests for specified devision 64 bit
        // --------------------------------------------------
        task automatic TestDIV(Stimulus #(64) st, logic [63:0] a = 125, logic [63:0] b = 6);
            $display("--------------------------------------------------\n",
                     "Test DIV with:\nOperand_a: %d\nOperand_b: %d\nExpected:  ", $signed(a), $signed(b), $signed(a) / $signed(b));

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli_64(st, DIV);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_div(cb.result);
            st.check_trans_id(cb.div_trans_id_o);
            $display("Result:    %d\n", $signed(cb.result),
                     "--------------------------------------------------");
        endtask : TestDIV

        task automatic TestREM(Stimulus #(64) st, logic [63:0] a = 125, logic [63:0] b = 6);
            $display("--------------------------------------------------\n",
                     "Test REM with:\nOperand_a: %d\nOperand_b: %d\nExpected:  ", $signed(a), $signed(b), $signed(a)%$signed(b));

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli_64(st, REM);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_rem(cb.result);
            st.check_trans_id(cb.div_trans_id_o);
            $display("Result:    %d\n", $signed(cb.result),
                     "--------------------------------------------------");
        endtask : TestREM

        task automatic TestDIVU(Stimulus #(64) st, logic [63:0] a = 125, logic [63:0] b = 6);
            $display("--------------------------------------------------\n",
                     "Test DIVU with:\nOperand_a: %d\nOperand_b: %d\nExpected:  ", a, b, (a/b));

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli_64(st, DIVU);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_divu(cb.result);
            st.check_trans_id(cb.div_trans_id_o);
            $display("Result:    %d\n", cb.result,
                     "--------------------------------------------------");
        endtask : TestDIVU

        task automatic TestREMU(Stimulus #(64) st, logic [63:0] a = 125, logic [63:0] b = 6);
            $display("--------------------------------------------------\n",
                     "Test REMU with:\nOperand_a: %d\nOperand_b: %d\nExpected:  ", a, b, a%b);

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli_64(st, REMU);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_remu(cb.result);
            st.check_trans_id(cb.div_trans_id_o);
            $display("Result:    %d\n", cb.result,
                     "--------------------------------------------------");
        endtask : TestREMU

        // --------------------------------------------------
        // Tests for specified devision 32 bit
        // --------------------------------------------------
        task automatic TestDIVW(Stimulus #(32) st, logic [31:0] a = 125, logic [31:0] b = 6);
            $display("--------------------------------------------------\n",
                     "Test DIVW with:\nOperand_a: %d\nOperand_b: %d\nExpected:  ", $signed(a), $signed(b), $signed(a) / $signed(b));

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli_32(st, DIVW);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_div(cb.result[31:0]);
            st.check_trans_id(cb.div_trans_id_o);
            $display("Result:    %d\n", $signed(cb.result[31:0]),
                     "Higher Bits: %f\n", $signed(cb.result[63:32]),
                     "--------------------------------------------------");
        endtask : TestDIVW

        task automatic TestREMW(Stimulus #(32) st, logic [31:0] a = 125, logic [31:0] b = 6);
            $display("--------------------------------------------------\n",
                     "Test REMW with:\nOperand_a: %d\nOperand_b: %d\nExpected:  ", $signed(a), $signed(b), $signed(a)%$signed(b));

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli_32(st, REMW);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_rem(cb.result[31:0]);
            st.check_trans_id(cb.div_trans_id_o);
            $display("Result:    %d\n", $signed(cb.result[31:0]),
                     "Higher Bits: %f\n", $signed(cb.result[63:32]),
                     "--------------------------------------------------");
        endtask : TestREMW

        task automatic TestDIVUW(Stimulus #(32) st, logic [31:0] a = 125, logic [31:0] b = 6);
            $display("--------------------------------------------------\n",
                     "Test DIVUW with:\nOperand_a: %d\nOperand_b: %d\nExpected:  ", a, b, (a/b));

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli_32(st, DIVUW);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_divu(cb.result[31:0]);
            st.check_trans_id(cb.div_trans_id_o);
            $display("Result:    %d\n", cb.result[31:0],
                     "Higher Bits: %f\n", cb.result[63:32],
                     "--------------------------------------------------");
        endtask : TestDIVUW

        task automatic TestREMUW(Stimulus #(32) st, logic [31:0] a = 125, logic [31:0] b = 6);
            $display("--------------------------------------------------\n",
                     "Test REMUW with:\nOperand_a: %d\nOperand_b: %d\nExpected:  ", a, b, a%b);

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli_32(st, REMUW);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_remu(cb.result[31:0]);
            st.check_trans_id(cb.div_trans_id_o);
            $display("Result:    %d\n", cb.result[31:0],
                     "Higher Bits: %f\n", cb.result[63:32],
                     "--------------------------------------------------");
        endtask : TestREMUW




        // --------------------------------------------------
        // Randomized Tests for devision 64 bit
        // --------------------------------------------------
        task automatic RandTestDIV(Stimulus #(64) st, int count_a = 64, int count_b = 64);
            int bound_a;
            int bound_b;

            bound_a = $urandom_range(0,count_a);
            bound_b = $urandom_range(0,count_b);

            assert(st.randomize() with {$countones(stimulus_a) == bound_a; $countones(stimulus_b) == bound_b;});

            ApplyStimuli_64(st, DIV);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_div(cb.result);
            st.check_trans_id(cb.div_trans_id_o);
        endtask : RandTestDIV

        task automatic RandTestREM(Stimulus #(64) st, int count_a = 64, int count_b = 64);
            int bound_a;
            int bound_b;

            bound_a = $urandom_range(0,count_a);
            bound_b = $urandom_range(0,count_b);

            assert(st.randomize() with {$countones(stimulus_a) == bound_a; $countones(stimulus_b) == bound_b;});

            ApplyStimuli_64(st, REM);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_rem(cb.result);
            st.check_trans_id(cb.div_trans_id_o);
        endtask : RandTestREM

        task automatic RandTestDIVU(Stimulus #(64) st, int count_a = 64, int count_b = 64);
            int bound_a;
            int bound_b;

            bound_a = $urandom_range(0,count_a);
            bound_b = $urandom_range(0,count_b);

            assert(st.randomize() with {$countones(stimulus_a) == bound_a; $countones(stimulus_b) == bound_b;});

            ApplyStimuli_64(st, DIVU);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_divu(cb.result);
            st.check_trans_id(cb.div_trans_id_o);
        endtask : RandTestDIVU

        task automatic RandTestREMU(Stimulus #(64) st, int count_a = 64, int count_b = 64);
            int bound_a;
            int bound_b;

            bound_a = $urandom_range(0,count_a);
            bound_b = $urandom_range(0,count_b);

            assert(st.randomize() with {$countones(stimulus_a) == bound_a; $countones(stimulus_b) == bound_b;});

            ApplyStimuli_64(st, REMU);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_remu(cb.result);
            st.check_trans_id(cb.div_trans_id_o);
        endtask : RandTestREMU

        // --------------------------------------------------
        // Randomized Tests for devision 32 bit
        // --------------------------------------------------
        task automatic RandTestDIVW(Stimulus #(32) st, int count_a = 32, int count_b = 32);
            int bound_a;
            int bound_b;

            bound_a = $urandom_range(0,count_a);
            bound_b = $urandom_range(0,count_b);

            assert(st.randomize() with {$countones(stimulus_a) == bound_a; $countones(stimulus_b) == bound_b;});

            ApplyStimuli_32(st, DIVW);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_div(cb.result[31:0]);
            st.check_trans_id(cb.div_trans_id_o);
        endtask : RandTestDIVW

        task automatic RandTestREMW(Stimulus #(32) st, int count_a = 32, int count_b = 32);
            int bound_a;
            int bound_b;

            bound_a = $urandom_range(0,count_a);
            bound_b = $urandom_range(0,count_b);

            assert(st.randomize() with {$countones(stimulus_a) == bound_a; $countones(stimulus_b) == bound_b;});

            ApplyStimuli_32(st, REMW);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_rem(cb.result[31:0]);
            st.check_trans_id(cb.div_trans_id_o);
        endtask : RandTestREMW

        task automatic RandTestDIVUW(Stimulus #(32) st, int count_a = 32, int count_b = 32);
            int bound_a;
            int bound_b;

            bound_a = $urandom_range(0,count_a);
            bound_b = $urandom_range(0,count_b);

            assert(st.randomize() with {$countones(stimulus_a) == bound_a; $countones(stimulus_b) == bound_b;});

            ApplyStimuli_32(st, DIVUW);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_divu(cb.result[31:0]);
            st.check_trans_id(cb.div_trans_id_o);
        endtask : RandTestDIVUW

        task automatic RandTestREMUW(Stimulus #(32) st, int count_a = 32, int count_b = 32);
           int bound_a;
            int bound_b;

            bound_a = $urandom_range(0,count_a);
            bound_b = $urandom_range(0,count_b);

            assert(st.randomize() with {$countones(stimulus_a) == bound_a; $countones(stimulus_b) == bound_b;});

            ApplyStimuli_32(st, REMUW);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            @(posedge cb.div_valid_o);
            st.check_remu(cb.result[31:0]);
            st.check_trans_id(cb.div_trans_id_o);
        endtask : RandTestREMUW




        // -----------------------------------------------
        // Helper Methods to apply stimulies to the DUT
        // -----------------------------------------------
        // Applies all 64 bit stimulies to the DUT except rst_ni
        task ApplyStimuli_64(Stimulus #(64) st, fu_op operator = ADD);
            cb.trans_id_i  <= st.trans_id;
            cb.div_valid_i <= 1;
            cb.operator_i  <= operator;
            cb.operand_a   <= st.stimulus_a;
            cb.operand_b   <= st.stimulus_b;
        endtask : ApplyStimuli_64

        // Applies all 64 bit stimulies to the DUT except rst_ni
        task ApplyStimuli_32(Stimulus #(32) st, fu_op operator = ADD);
            cb.trans_id_i  <= st.trans_id;
            cb.div_valid_i <= 1;
            cb.operator_i  <= operator;
            if(operator inside {DIVW, REMW}) begin
                cb.operand_a <= sext32(st.stimulus_a);
                cb.operand_b <= sext32(st.stimulus_b);
            end
            if(operator inside {DIVUW, REMUW}) begin
                cb.operand_a <= {32'b0, st.stimulus_a};
                cb.operand_b <= {32'b0, st.stimulus_b};
            end


        endtask : ApplyStimuli_32

        // Sets all stimulies to the DUT to default
        task ClearStimuli();
            cb.trans_id_i  <= '0;
            cb.div_valid_i <= '0;
            cb.operator_i  <= ADD;
            cb.operand_a   <= '0;
            cb.operand_b   <= '0;
        endtask : ClearStimuli

    endprogram



    // -----------------------------------
    // Instatce DUT - Device Under Test
    // -----------------------------------

    div_simple_6_one_cycle dut
    (
        .clk_i          ( clk            ),   // Clock
        .rst_ni         ( rst_ni         ),   // Asynchronous reset active low
        .trans_id_i     ( trans_id_i     ),   // transaction id in
        .div_valid_i    ( div_valid_i    ),   // division request is valid
        .operator_i     ( operator_i     ),   // operator in can be of value DIV, DIVU, DIVW, DIVUW, REM, REMU, REMW, REMUW
        .operand_a_i    ( operand_a      ),   // operand a in (rs1)
        .operand_b_i    ( operand_b      ),   // operand b in (rs2)
        .result_o       ( result         ),   // result out
        .div_valid_o    ( div_valid_o    ),   // division is valid
        .div_ready_o    ( div_ready_o    ),   // divider is ready
        .div_trans_id_o ( div_trans_id_o )    // transaction ID out
    );


  /*  mult dut
    (
        .clk_i           ( clk            ),   // Clock
        .rst_ni          ( rst_ni         ),   // Asynchronous reset active low
        .trans_id_i      ( trans_id_i     ),   // transaction id in
        .mult_valid_i    ( div_valid_i    ),   // division request is valid
        .operator_i      ( operator_i     ),   // operator in can be of value DIV, DIVU, DIVW, DIVUW, REM, REMU, REMW, REMUW
        .operand_a_i     ( operand_a      ),   // operand a in (rs1)
        .operand_b_i     ( operand_b      ),   // operand b in (rs2)
        .result_o        ( result         ),   // result out
        .mult_valid_o    ( div_valid_o    ),   // division is valid
        .mult_ready_o    ( div_ready_o    ),   // divider is ready
        .mult_trans_id_o ( div_trans_id_o )    // transaction ID out
    );
   *//*

    make_pos p1
    (
        .operator_i ( operator_i   ),
        .operand_a_i( operand_a   ),
        .operand_b_i( operand_b   ),
        .operand_a_o( op_a_neg    ),
        .operand_b_o( op_b_neg    ),
        .res_neg_o  ( res_neg     )
    );


    // Instance the test program - not required, because the progam will be instanced implicitly.
    test_div T1 ();

    */


endmodule
