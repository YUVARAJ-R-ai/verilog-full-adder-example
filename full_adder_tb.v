//-----------------------------------------------------
// Module: full_adder_tb
// Description: Testbench for the full_adder module.
//              Cycles through all 8 input combinations.
//-----------------------------------------------------
`timescale 1ns / 1ps // Timescale for simulation delays

module full_adder_tb;

    // Testbench signals (inputs to DUT)
    reg a,b,cin;

    // Testbench signals (outputs from DUT)
    wire sum,cout;

    // Instantiate the Device Under Test (DUT) - the full_adder
    // Make sure the module name 'full_adder' matches the one in full_adder.v
    full_adder dut (
        .a(a),        // Connect testbench 'a' to DUT's 'a' input
        .b(b),        // Connect testbench 'b' to DUT's 'b' input
        .cin(cin),    // Connect testbench 'cin' to DUT's 'cin' input
        .sum(sum),    // Connect DUT's 'sum' output to testbench 'sum'
        .cout(cout)   // Connect DUT's 'cout' output to testbench 'cout'
    );

    // Test sequence generation
    initial begin
        // Optional: Setup waveform dumping for GTKWave
        $dumpfile("full_adder.vcd"); // Specify the VCD file name
        $dumpvars(0, full_adder_tb); // Dump all variables in this module scope

        $display("Starting Full Adder Testbench...");
        $display("Time (ns) | a | b | cin || sum | cout |");
        $display("----------|---|---|-----||-----|------|");

        // Initialize inputs
        a = 1'b0; // 1'b0 means 1-bit binary value 0
        b = 1'b0;
        cin = 1'b0;
        #10; // Wait 10 nanoseconds

        // Loop through all 8 possible input combinations
        for (integer i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i; // Assign the 3 bits of 'i' directly to a, b, cin
            #10; // Wait 10 ns for outputs to settle after input change
            $display("    %0t    | %b | %b |  %b  ||  %b  |  %b   |",
                     $time, a, b, cin, sum, cout); // Use $time for current sim time
        end

        #20; // Wait a bit longer at the end
        $display("Testbench finished.");
        $finish; // End the simulation
    end

endmodule