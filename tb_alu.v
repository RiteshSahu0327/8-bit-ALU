`timescale 1ns / 1ps

module tb_alu();

    reg  [7:0] a;
    reg  [7:0] b;
    reg  [2:0] alu_sel;
    wire [7:0] alu_out;
    wire       carry_out;
    wire       zero;
    wire       overflow;

    alu uut (
        .a(a),
        .b(b),
        .alu_sel(alu_sel),
        .alu_out(alu_out),
        .carry_out(carry_out),
        .zero(zero),
        .overflow(overflow)
    );

    initial begin
        a = 8'h00;
        b = 8'h00;
        alu_sel = 3'b000;
        #40;

        a = 8'h05; b = 8'h03; alu_sel = 3'b000; #20;
        a = 8'hFF; b = 8'h01; alu_sel = 3'b000; #20;
        a = 8'h7F; b = 8'h01; alu_sel = 3'b000; #20;

        a = 8'h05; b = 8'h03; alu_sel = 3'b001; #20;
        a = 8'h00; b = 8'h01; alu_sel = 3'b001; #20;
        a = 8'h80; b = 8'h01; alu_sel = 3'b001; #20;

        a = 8'hAA; b = 8'h55; alu_sel = 3'b010; #20;
        a = 8'hAA; b = 8'h55; alu_sel = 3'b011; #20;
        a = 8'hAA; b = 8'h55; alu_sel = 3'b100; #20;
        a = 8'h00; b = 8'h00; alu_sel = 3'b101; #20;

        a = 8'h45; alu_sel = 3'b110; #20;
        a = 8'h45; alu_sel = 3'b111; #20;

        a = 8'h05; b = 8'h05; alu_sel = 3'b001; #20;

        #40;
        $finish;
    end

endmodule