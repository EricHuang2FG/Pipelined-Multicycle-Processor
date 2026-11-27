module register_32bit (
    input wire aclr,
    input wire clock,
    input wire enable,
    input wire [31:0] data,
    output reg [31:0] q
);
    always @(posedge clock, posedge aclr) begin
        if (aclr)
            q <= 32'b0;
        else if (enable)
            q <= data;
    end

endmodule
