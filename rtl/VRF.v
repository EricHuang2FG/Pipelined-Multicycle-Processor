module VRF (
    input wire clock, reset,
    input wire VRFWrite,
    input wire [1:0] vreg1, vreg2, vregw,
    input wire [31:0] vdataw,
    output wire [31:0] vdata1, vdata2
);
    reg [31:0] v [3:0]; // V0, V1, V2, V3 in a 2D array

    // read data into the registers vdata1 and vdata2
    assign vdata1 = v[vreg1];
    assign vdata2 = v[vreg2];

    // write data to the registers V0, V1, V2 and V3
    // this one is synchronous and clocked
    integer i;
    always @(posedge clock, posedge reset) begin
        if (reset) begin
            for (i = 0; i < 4; i = i + 1)
                v[i] <= 32'b0;
        end
        else if (VRFWrite) begin
            v[vregw] <= vdataw;
        end
    end

endmodule
