// testbench serializer
// Written by Kaja Jentner
// Dec-2018

module shift_serializer_tb;
    // constants
    //timeunit 1ns; //(activate for RTL simulation)
    //`timescale 1 ns / 1 ns; //(activate for gate level simulation)
    localparam int unsigned CLOCK_PERIOD = 10ns;  // Clock period
    localparam int unsigned FROM = 8;
    localparam int unsigned TO = 1;

    // activate and deactive different tests
    localparam logic TESTRAND  = 1'b1; // Enable testing of random inputs
    localparam longint unsigned RANDOM_ROUNDS = 2;   // # of randomized test
    localparam logic TESTKNOWN = 1'b0; // Enable testing of two specific stimuli

    // ---------------------------------
    // inputs to the DUT
    // ---------------------------------
    logic clk = 0;
    logic reset;
    logic[FROM-1:0] data_i;
    logic valid_i;

    // -------------------------------------
    // outputs from the DUT
    // -------------------------------------
    logic[TO-1:0] data_o;
    logic ready_o;
    logic valid_o;

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

    class static Stimulus #(parameter WIDTH = 4);

        rand logic [WIDTH-1:0] stimulus;

        local longint checks; // Bookkeeping for how many tests were done
        local longint passed;

        // -----------------
        // Constructor
        // -----------------
        function new(logic [WIDTH-1:0] a = 0);
            stimulus = a;
            checks   = 0;
            passed   = 0;
        endfunction : new

        function void set_stimulus(logic [WIDTH-1:0] a);
            stimulus = a;
        endfunction : set_stimulus


        // -----------------------------------------------
        // Functions for checking the outputs of the DUT
        // -----------------------------------------------

        function void check_serializer(logic result, int i);
            logic expected;
            expected = {stimulus[i]};

            checks++;

            Check_serializer: assert (expected == result)
                    begin 
                    $display("Bit number     %d\nExpected:   %d\nResult:     %d\n",
                                            i, expected, result);
                    passed++;
                end
                    else $error("%m: Failed!!!!!!!\nBit number       %d\nExpected:   %d\nResult:     %d\n",
                                            i, expected, result);
        endfunction : check_serializer


        // ----------------------
        // Print Functions
        // ----------------------

        function void print_stimuli();
            $display("stimulus: %b",
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
    program test_serializer;

        // SystemVerilog "clocking block"
        // Clocking outputs are DUT inputs and vice versa
        clocking cb @(posedge clk);
            // specify skew (how many time units away FROM clock event a signal is sampled or driven)
            // input (sample) skew is implicitly negative
            // the following line means: after positive clockedge, only after 2ns will the rest of the models signal change
            // the data_o will be read 1ns before the active clock edge of the next cycle
            default input #1step output #2; // #1step indicates value read is signal immediately before clock edge
            output  negedge reset;
            output data_i, valid_i;
            input data_o, ready_o, valid_o;
        endclocking

        // ---------------------
        // Apply test stimuli
        // ---------------------
        // Can use the ## operator to delay execution by a specified number of clocking events / clock cycles
        //the initial statement is executed once at the beginning
        initial begin

            // Declare the Stimulus Objects
            Stimulus #(FROM) stim;
            stim = new;

            //Set all inputs to the DUT at the beginning
            reset   = '0;
            data_i  = '0;
            valid_i = '0;

            // --------------------------
            // Test Reset
            // --------------------------
            // Will be applied on negedge of clock!
            cb.reset <= 1;
            repeat(FROM) @(cb);

            //then reset is set to zero and simulatin can start
            cb.reset <= 0;
            @(cb);

            //then the actual testing starts
            // ------------------------------
            // Test 
            // ------------------------------

            if(TESTKNOWN) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Serializer\n",
                         "--------------------------------------------------");
                //here you can insert your specified stimuli
                TestSerializer(stim, 10'b1101001101);

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
                        stim.stimulus=$random;
                        ApplyStimuli(stim);
                            $display("--------------------------------------------------\n",
                                    "Applied stimuli: %b", stim.stimulus); 
                        @(cb iff cb.ready_o == 0); // Clear them in next cycle if they have been eaten
                        ClearStimuli();
                        @(cb iff cb.valid_o == 1);

                        //the check only works with TO=1, otherwise the order is messed up
                        for (int i = 0; i < FROM/TO; i++) begin
                                for(int k=1; k < TO+1; k++) begin
                                stim.check_serializer(cb.data_o[k-1],(k*FROM/TO-1)-i);
                                end
                            @(cb);           
                        end                    
                end
            end
            
            //print how many tests have passed
            stim.pass_statistic();

        end

        // --------------------------------------------------
        // Tests for specified inputs
        // --------------------------------------------------
        task automatic TestSerializer(Stimulus #(FROM) st, logic [FROM-1:0] a);
            $display("--------------------------------------------------\n",
                     "Test Serializer with:\ndata1: %b", a);
            // initialize the stimulus with the bitvector a
            st.set_stimulus(a);
            ApplyStimuli(st);
            @(cb iff cb.ready_o == 0); // Clear them in next cycle if they have been eaten
            ClearStimuli();
            //check all the set stimuli individually
            @(cb iff cb.valid_o == 1);
            for (int i = FROM; !(i==0); i--) begin
                st.check_serializer(cb.data_o,i-1);
                @(cb);           
            end

        endtask : TestSerializer

        // -----------------------------------------------
        // Apply and Clear Stimuli Methods
        // -----------------------------------------------
        // Applies stimuli to the DUT except reset
        task ApplyStimuli(Stimulus #(FROM) st);
            cb.valid_i <= 1;
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

    shift_serializer shift_serializer
    (
        .clk                (clk),   // Clock
        .reset              (reset),   // Asynchronous reset active low
        .data_i             (data_i),   // operand a in (rs1)
        .data_o             (data_o),   // result out
        .valid_i            (valid_i),
        .valid_o            (valid_o),
        .ready_o            (ready_o)
    );



endmodule
