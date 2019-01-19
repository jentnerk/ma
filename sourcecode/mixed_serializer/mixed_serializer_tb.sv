// ########################################################
// ###
// ### Toplevel of the Mixed-Structured Serializer
// ###
// ### Written by: Kaja Jentner
// ### January 2019
// ### IEF ETH Zurich
// ########################################################

`include "parameters.vh"

module mixed_serializer_tb;
    // constants
    //timeunit 1ns; //(activate for RTL simulation)
    //`timescale 1 ns / 1 ns; //(activate for gate level simulation)
    localparam int unsigned CLOCK_PERIOD = 10ns;  // Clock period
    localparam int unsigned FROM = `SHIFT_FROM;
    localparam int unsigned TO = `SHIFT_TO;

    // activate and deactive different tests
    localparam logic TESTRAND  = 1'b1; // Enable testing of random inputs
    localparam longint unsigned RANDOM_ROUNDS = 6;   // # of randomized test

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
    logic ready_o;

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
            output data_i;
            input data_o, ready_o;
        endclocking

        // ---------------------
        // Apply test stimuli
        // ---------------------
        // Can use the ## operator to delay execution by a specified number of clocking events / clock cycles
        //the initial statement is executed once at the beginning
        initial begin

            // Declare the Stimulus Objects
            Stimulus #(FROM) stim;
            Stimulus #(FROM) stim1;
            Stimulus #(FROM) stim2;
            stim = new;
            stim1 = new;
            stim2 = new;


            //Set all inputs to the DUT at the beginning
            reset   = '0;
            data_i  = '0;

            // --------------------------
            // Test Reset
            // --------------------------
            // Will be applied on negedge of clock!
            cb.reset <= 1;
            repeat(FROM) @(cb);

            //then reset is set to zero and simulatin can start
            cb.reset <= 0;
            // @(cb);

            //then the actual testing starts
            // ------------------------------
            // Test 
            // ------------------------------
            

            // Special case from 4 to 2 shift and from 2 to one tree 
            // does not work yet
            if(FROM == 4) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Randomized with %d Stimuli\n", (RANDOM_ROUNDS),
                         "--------------------------------------------------");
                    //apply first stimulus
                    stim.stimulus=$random;
                    ApplyStimuli(stim);
                    @(cb); //wait FROM cycles to imitate the slow clock
                    stim2.stimulus=$random;
                    ApplyStimuli(stim2);
                    // repeat(TO) @(cb); //wait FROM cycles to imitate the slow clock
                    // @(cb);@(cb);

                for (longint j = 0; j < RANDOM_ROUNDS/2; j++) begin

                    //check first stimulus
                    $display("--------------------------------------------------\n",
                                            "Applied stimuli: %b", stim.stimulus);
                    for (int i = FROM; !(i==0); i--) begin
                        stim.check_serializer(cb.data_o,i-1);
                        @(cb);           
                    end

                    //apply stimulus 3
                    stim.stimulus = $random;
                    ApplyStimuli(stim);

                    //check second stimulus
                    $display("--------------------------------------------------\n",
                                            "Applied stimuli: %b", stim2.stimulus);                    
                    for (int i = FROM; !(i==0); i--) begin
                        stim2.check_serializer(cb.data_o,i-1);
                        @(cb);           
                    end

                    stim.stimulus=$random;
                    ApplyStimuli(stim2);
                end
                //print how many tests have passed
                stim2.pass_statistic();
            end





            // Randomized Testing
            if(TESTRAND && FROM > 4) begin
                $display("//////////////////////////////////////////////////\n",
                         "--------------------------------------------------\n",
                         "Testing Randomized with %d Stimuli\n", (RANDOM_ROUNDS),
                         "--------------------------------------------------");
                // Create first stimulus
                stim2.stimulus=$random;
                // Apply stimulus
                ApplyStimuli(stim2);
                repeat(TO) @(cb); 
                repeat(TO) @(cb); // wait TO = TREE_FROM cycles until the result appears at the output ready to be checked
                @(cb); @(cb);
                // Checking and Appying more Stimuli
                 for (longint j = 0; j < RANDOM_ROUNDS; j++) begin     
                        stim1.stimulus=stim2.stimulus;
                        // check the stimulus applied before
                        $display("--------------------------------------------------\n",
                                    "Applied stimuli: %b", stim1.stimulus); 

                        for (int i = 0; i < FROM; i++) begin
                                    stim1.check_serializer(cb.data_o,(FROM-1)-i);

                            if(i==0) begin
                                // create second stimulus while checking the second last bit of 
                                // the first stimulus
                                stim2.stimulus=$random;
                                // apply it
                                ApplyStimuli(stim2);
                            end
                          
                            @(cb);    

                        end
                    
                 end

                //print how many tests have passed
                 stim1.pass_statistic();
            end

        end

        // -----------------------------------------------
        // Apply and Clear Stimuli Methods
        // -----------------------------------------------
        // Applies stimuli to the DUT except reset
        task ApplyStimuli(Stimulus #(FROM) st);
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

    toplevel_mixed_serializer toplevel_mixed_serializer
    (
        .clk_i              (clk),  
        .reset_ni           (reset), 
        .data_i             (data_i),   
        .data_o             (data_o),  
        .ready_o            (ready_o)
    );



endmodule
