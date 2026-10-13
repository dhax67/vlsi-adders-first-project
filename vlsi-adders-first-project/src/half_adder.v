// Half Adder
// Adds two 1-bit inputs and produces Sum and Carry outputs.
module half_adder (
    input  wire a,
    input  wire b,
    output wire sum,
    output wire carry
);
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule
