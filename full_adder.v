//-----------------------------------------------------
// Module: full_adder
// Description: A simple Full Adder using dataflow modeling.
// Inputs: a, b, cin
// Outputs: sum, cout
//-----------------------------------------------------
module full_adder (
    input  wire a,    // Input A
    input  wire b,    // Input B
    input  wire cin,  // Carry In
    output wire sum,  // Sum output
    output wire cout  // Carry Out
);

    // Calculate Sum using XOR
    assign sum = a ^ b ^ cin;

    // Calculate Carry Out using AND/OR logic
    assign cout = (a & b) | (a & cin) | (b & cin);
    // Alternative calculation: assign cout = (a & b) | (cin & (a ^ b));

endmodule