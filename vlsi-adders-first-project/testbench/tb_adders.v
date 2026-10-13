`timescale 1ns/1ps

module tb_adders;
    reg a, b, cin;
    wire half_sum, half_carry;
    wire full_sum, full_carry;
    integer i;
    integer errors;

    half_adder dut_half (
        .a(a), .b(b),
        .sum(half_sum), .carry(half_carry)
    );

    full_adder dut_full (
        .a(a), .b(b), .cin(cin),
        .sum(full_sum), .cout(full_carry)
    );

    initial begin
        $dumpfile("adders.vcd");
        $dumpvars(0, tb_adders);

        errors = 0;
        cin = 0;

        $display("HALF ADDER TESTS");
        $display("A B | Sum Carry");
        for (i = 0; i < 4; i = i + 1) begin
            {a, b} = i;
            #10;
            $display("%b %b |  %b    %b", a, b, half_sum, half_carry);
            if (half_sum !== (a ^ b) || half_carry !== (a & b)) begin
                $display("FAIL: half adder input A=%b B=%b", a, b);
                errors = errors + 1;
            end
        end

        $display("");
        $display("FULL ADDER TESTS");
        $display("A B Cin | Sum Cout");
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i;
            #10;
            $display("%b %b  %b  |  %b    %b",
                     a, b, cin, full_sum, full_carry);
            if (full_sum !== (a ^ b ^ cin) ||
                full_carry !== ((a & b) | (a & cin) | (b & cin))) begin
                $display("FAIL: full adder input A=%b B=%b Cin=%b",
                         a, b, cin);
                errors = errors + 1;
            end
        end

        $display("");
        if (errors == 0)
            $display("ALL TESTS PASSED: all 12 input combinations checked.");
        else
            $display("TESTS FAILED: %0d error(s).", errors);

        $finish;
    end
endmodule
