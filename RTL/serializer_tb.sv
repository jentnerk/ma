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
    localparam longint unsigned RANDOM_ROUNDS = 10;   // # of randomized test rounds



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
            logic expected;
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
            output  posedge reset;
            output data1_i, data2_i;
            input data_o;
        endclocking

        // ---------------------
        // Apply test stimuli
        // ---------------------
        // Can use the ## operator to delay execution by a specified number of clocking events / clock cycles
        initial begin
            // Declare the Stimulus Objects
            Stimulus stim;

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
            cb.reset <= 1;
            repeat(5) @(cb);

            cb.reset <= 0;
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

                        // Randomized Testing
            if(TESTRAND) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Randomized with %d Stimuli\n", (RANDOM_ROUNDS),
                         "--------------------------------------------------");
                for (longint j = 0; j < RANDOM_ROUNDS; j++) begin
                        RandTest(stim);
                        //repeat(rFuOp.rCycles) @(cb); // Wait 0 to 10 rounds before applying next test
                        //@(cb iff cb.div_ready_o == 1);
                end
            end

            stim.print_all_rounds();
        end
        // --------------------------------------------------
        // Tests for specified inputs
        // --------------------------------------------------
        task automatic TestSerializer(Stimulus st, logic a = 1'b1, logic b = 1'b0);
            $display("--------------------------------------------------\n",
                     "Test Serializer with:\ndata1: %d\ndata2: %d\nExpected:  ", a, b, {a,b});

            st.randomize();
            st.set_stimulus_a(a);
            st.set_stimulus_b(b);

            ApplyStimuli(st);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            //@(cb); //wait one cycle
            ClearStimuli();
            //handshake formalities
            //@(posedge cb.div_valid_o);
            st.check_serializer(cb.data_o);
            $display("Result:    %d\n", cb.data_o,
                     "--------------------------------------------------");
        endtask : TestSerializer

        // --------------------------------------------------
        // Randomized Tests
        // --------------------------------------------------
        task automatic RandTest(Stimulus st);
            int bound_a;
            int bound_b;

            bound_a = $urandom_range(0,1);
            bound_b = $urandom_range(0,1);

            ApplyStimuli(st);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            @(cb); //wait one cycle
            ClearStimuli();
            st.check_serializer(cb.data_o);
        endtask : RandTest

        // -----------------------------------------------
        // Helper Methods to apply stimulies to the DUT
        // -----------------------------------------------
        // Applies all 64 bit stimulies to the DUT except rst_ni
        task ApplyStimuli(Stimulus st);
            cb.data1_i   <= st.stimulus_a;
            cb.data2_i   <= st.stimulus_b;
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


endmodule
