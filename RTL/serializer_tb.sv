// testbench serializer
// Written by Kaja Jentner
// Dec-2018

module serializer_tb;
    // constants
    timeunit 1ns;
    localparam int unsigned CLOCK_PERIOD = 10ns;  // Clock period
    localparam int unsigned FROM = 256;

    // activate and deactive different tests
    localparam logic TESTRAND  = 1'b1; // Enable testing of random inputs
    localparam longint unsigned RANDOM_ROUNDS = 100;   // # of randomized test
    localparam logic TESTKNOWN = 1'b0; // Enable testing of two specific stimuli

    // ---------------------------------
    // inputs to the DUT
    // ---------------------------------
    logic clk = 0;
    logic reset;
    logic[FROM-1:0] data_i;

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

    class static Stimulus;

        rand logic [FROM-1:0] stimulus;

        local longint checks; // Bookkeeping for how many tests were done
        local longint passed;

        // -----------------
        // Constructor
        // -----------------
        function new(logic [FROM-1:0] a = 0);
            stimulus = a;
            checks   = 0;
            passed   = 0;
        endfunction : new

        function void set_stimulus(logic [FROM-1:0] a);
            stimulus = a;
        endfunction : set_stimulus


        // -----------------------------------------------
        // Functions for checking the outputs of the DUT
        // -----------------------------------------------

        function void check_serializer(logic result);
            logic expected;
            expected = {stimulus};

            checks++;

            Check_serializer: assert (expected == result) passed++;
                                else $error("%m: Failed!!!!!!!\nOperand_a: %d\nResult:   %d\nExpected: %d",
                                            stimulus, result, expected);
        endfunction : check_serializer


        // ----------------------
        // Print Functions
        // ----------------------

        function void print_stimuli();
            $display("stimulus: %d",
                         stimulus);
        endfunction : print_stimuli

        function void pass_statistic();
            $display("//////////////////////////////////////////////////\n",
                     "--------------------------------------------------\n",
                     "After %d Checks\n", checks,
                     "      %d were successfull!\n", passed,
                     "--------------------------------------------------");
        endfunction : pass_statistic

    endclass : Stimulus

    // -----------------------------------------------
    // Testbench
    // -----------------------------------------------
    program test_div;

        // SystemVerilog "clocking block"
        // Clocking outputs are DUT inputs and vice versa
        clocking cb @(posedge clk);
            // specify skew (how many time units away FROM clock event a signal is sampled or driven)
            // input (sample) skew is implicitly negative
            // the following line means: after positive clockedge, only after 2ns will the rest of the models signal change
            // the data_o will be read 1ns before the active clock edge of the next cycle
            default input #1step output #2; // #1step indicates value read is signal immediately before clock edge
            output  negedge reset;
            output data_i;
            input data_o;
        endclocking

        // ---------------------
        // Apply test stimuli
        // ---------------------
        // Can use the ## operator to delay execution by a specified number of clocking events / clock cycles
        initial begin

            // Declare the Stimulus Objects
            Stimulus stim;
            stim = new;

            //Set all inputs to the DUT at the beginning
            reset    = '0;
            data_i  = '0;

            // --------------------------
            // Test Reset
            // --------------------------
            // Will be applied on negedge of clock!
            cb.reset <= 1;
            repeat(FROM) @(cb);

            cb.reset <= 0;
            repeat(FROM) @(cb);

            // ------------------------------
            // Test 
            // ------------------------------

            if(TESTKNOWN) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Serializer\n",
                         "--------------------------------------------------");

                //here you can insert your specified stimuli
                TestSerializer(stim, 8'b10101010);

            //print how many tests have passed
            stim.pass_statistic();
            end

            // Randomized Testing
            if(TESTRAND) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Randomized with %d Stimuli\n", (RANDOM_ROUNDS),
                         "--------------------------------------------------");

                for (longint j = 0; j < RANDOM_ROUNDS; j++) begin
                        RandTest(stim);
                end
            end
            
            //print how many tests have passed
            stim.pass_statistic();

        end

        // --------------------------------------------------
        // Tests for specified inputs
        // --------------------------------------------------
        task automatic TestSerializer(Stimulus st, logic [FROM-1:0] a);
            $display("--------------------------------------------------\n",
                     "Test Serializer with:\ndata1: %d", a);

            st.set_stimulus(a);

            ApplyStimuli(st);
            //@(cb iff cb.div_ready_o == 0); // Clear them in next cycle if they have been eaten
            repeat(FROM) @(cb); //wait FROM cycles to imitate the slow clock
        endtask : TestSerializer

        // --------------------------------------------------
        // Randomized Tests
        // --------------------------------------------------
        task automatic RandTest(Stimulus st);
            st.stimulus=$urandom_range(0,FROM);
            ApplyStimuli(st);
            repeat(FROM) @(cb);//wait FROM cycles to imitate the slow clock
            //st.check_serializer(cb.data_o);
        endtask : RandTest

        // -----------------------------------------------
        // Apply and Clear Stimuli Methods
        // -----------------------------------------------
        // Applies stimuli to the DUT except reset
        task ApplyStimuli(Stimulus st);
            cb.data_i   <= st.stimulus;
        endtask : ApplyStimuli

        // Sets all stimulies to the DUT to default
        task ClearStimuli();
            cb.data_i <= '0;
        endtask : ClearStimuli

    endprogram



    // -----------------------------------
    // Instance DUT - Device Under Test
    // -----------------------------------

    toplevel dut
    (
        .clk                (clk),   // Clock
        .reset              (reset),   // Asynchronous reset active low
        .data_i             (data_i),   // operand a in (rs1)
        .data_o             (data_o)   // result out
    );


endmodule
