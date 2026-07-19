module alu (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [2:0] alu_sel,
    output reg  [7:0] alu_out,
    output reg        carry_out,
    output reg        zero,
    output reg        overflow
);

    reg [8:0] extended_out;

    always @(*) begin
        carry_out = 1'b0;
        overflow  = 1'b0;
        extended_out = 9'b0;

        case (alu_sel)
            3'b000: begin
                extended_out = a + b;
                alu_out   = extended_out[7:0];
                carry_out = extended_out[8];
                overflow  = ((a[7] == b[7]) && (alu_out[7] != a[7]));
            end
            3'b001: begin
                extended_out = a - b;
                alu_out   = extended_out[7:0];
                carry_out = extended_out[8];
                overflow  = ((a[7] != b[7]) && (alu_out[7] != a[7]));
            end
            3'b010: alu_out = a & b;
            3'b011: alu_out = a | b;
            3'b100: alu_out = a ^ b;
            3'b101: alu_out = ~(a | b);
            3'b110: alu_out = a << 1;
            3'b111: alu_out = a >> 1;
            default: alu_out = 8'b0;
        endcase

        zero = (alu_out == 8'b0);
    end

endmodule