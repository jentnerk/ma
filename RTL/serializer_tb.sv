// testbench serializer
// Written by Kaja Jentner
// Dec-2018

module serializer_tb;

    //
    timeunit 1ns;
    localparam int unsigned CLOCK_PERIOD = 10ns;  // Clock period

    // activate and deactive different tests
    localparam logic TESTRAND  = 1'b0; // Enable testing of random inputs
    localparam logic TESTKNOWN = 1'b1; // Enable testing if next request is in next cycle after taking one
    //localparam longint unsigned RANDOM_ROUNDS = 1000;   // # of randomized test rounds


/*
module TopLevel(
  input clk,
  input reset,
  input data1_i,
  input data2_i,
  output data_o);

Clock_divider Clock_divider ( 
      .io_clkB        (clkB),
      .clk            (clk),
      .reset          (reset));

Serializer Serializer (
      .io_clkA        (clkB),
      .io_rstA        (reset),
      .io_clkB        (clk),
      .io_rstB        (reset),
      .io_dataIn1     (data1_i),
      .io_dataIn2     (data2_i),
      .io_dataOut     (data_o));
endmodule


*/

    // ---------------------------------
    // inputs to the DUT
    // ---------------------------------
    logic clk = 0;
    logic reset;
    logic data1_i;
    logic data2_i;

    // -------------------------------------
    // outputs from the DUT
    // -------------------------------------
    logic data_o;

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
                            input of clocking block #1step
    */

    class static Stimulus #();

        rand logic         stimulus_a;
        rand logic         stimulus_b;

        local longint checks; // Bookkeeping for how many tests were done
        local longint passed;
        local longint allchecks;
        local longint allpassed;

        // -----------------
        // Constructor
        // -----------------
        function new(logic a = 0, logic b = 0);
            stimulus_a = a;
            stimulus_b = b;
            checks     = 0;
            passed     = 0;
            allchecks  = 0;
            allpassed  = 0;
        endfunction : new

        function void set_stimulus_a(logic a);
            stimulus_a = a;
        endfunction : set_stimulus_a

        function void set_stimulus_b(logic b);
            stimulus_b = b;
        endfunction : set_stimulus_b

        // -----------------------------------------------
        // Functions for checking the outputs of the DUT
        // -----------------------------------------------

        function void check_serializer(logic result);
            logic signed expected;
                expected = {stimulus_a,stimulus_b};

            checks++;

            Check_serializer: assert (expected == result) passed++;
                                else $error("%m: Failed!!!!!!!\nOperand_a: %d\nOperand_b: %d\nResult:   %d\nExpected: %d",
                                            stimulus_a, stimulus_b, result, expected);
        endfunction : check_serializer

        // ----------------------
        // Print Functions
        // ----------------------

        function void print_stimuli();
            $display("stimulus_a: %d\nstimulus_b: %d",
                         stimulus_a, stimulus_b);
        endfunction : print_stimuli

        //Statistics how many checks were performed until this function was called
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
    // Testbench
    // -----------------------------------------------
    program test_div;

        // SystemVerilog "clocking block"
        // Clocking outputs are DUT inputs and vice versa
        clocking cb @(posedge clk);
            // specify skew (how many time units away from clock event a signal is sampled or driven)
            // input (sample) skew is implicitly negative
            default input #1step output #2; // #1step indicates value read is signal immediately before clock edge
            output negedge reset;
            output data1_i, data2_i;
            input data_o;
        endclocking

        // ---------------------
        // Apply test stimuli
        // ---------------------
        // Can use the ## operator to delay execution by a specified number of clocking events / clock cycles
        initial begin
            // Declare the Stimulus Objects
            Stimulus #(1) stim;

            automatic longint counter = 0;  // For printing during long simulations

            stim = new;

            //Set all inputs to the DUT at the beginning
            reset      = '0;
            data1_i  = '0;
            data2_i = '0;

            // --------------------------
            // Test Reset
            // --------------------------
            // Will be applied on negedge of clock!
            cb.reset <= 0;
            repeat(5) @(cb);

            cb.reset <= 1;

            repeat(5) @(cb);

            // ------------------------------
            // Test 
            // ------------------------------

            if(TESTKNOWN) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Serializer\n",
                         "--------------------------------------------------");


                TestSerializer(stim, 1'b1,  1'b0);

                stim.print_rounds();
            end
/*
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

            
*/

        // --------------------------------------------------
        // Tests for specified inputs
        // --------------------------------------------------
        task automatic TestSerializer(Stimulus #(1) st, logic a = 1'b1, logic b = 1'b0);
            $display("--------------------------------------------------\n",
                     "Test Serializer with:\ndata1: %d\ndata2: %d\nExpected:  ", a, b, {a,b});

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli(st);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            //handshake formalities
            //@(posedge cb.div_valid_o);
            st.check_serializer(cb.result);
            $display("Result:    %d\n", cb.result,
                     "--------------------------------------------------");
        endtask : TestSerializer



        // --------------------------------------------------
        // Randomized Tests for division 64 bit
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





        // -----------------------------------------------
        // Helper Methods to apply stimulies to the DUT
        // -----------------------------------------------
        // Applies all 64 bit stimulies to the DUT except rst_ni
        task ApplyStimuli(Stimulus #(1) st);
            cb.operand_a   <= st.stimulus_a;
            cb.operand_b   <= st.stimulus_b;
        endtask : ApplyStimuli

        // Sets all stimulies to the DUT to default
        task ClearStimuli();
            cb.data1_i <= '0;
            cb.data2_i   <= '0;
        endtask : ClearStimuli

    endprogram



    // -----------------------------------
    // Instatce DUT - Device Under Test
    // -----------------------------------

    TopLevel dut
    (
        .clk                (clk),   // Clock
        .reset              (reset),   // Asynchronous reset active low
        .data1_i            (data1_i),   // operand a in (rs1)
        .data2_i            (data2_i),   // operand b in (rs2)
        .data_o             (data_o)   // result out
    );


    // Instance the test program - not required, because the progam will be instanced implicitly.
    test_div T1 ();

    */


endmodule
