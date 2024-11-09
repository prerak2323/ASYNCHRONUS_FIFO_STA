module register_bank (
    input wire [7:0] data_in,       // 8-bit input data
    input wire [3:0] raddr,         // 4-bit read address (16 locations)
    input wire [3:0] waddr,         // 4-bit write address
    input wire wen,                 // Write enable
    input wire clk,                 // Clock
    output wire [7:0] data_out      // 8-bit output data
);
    // Define 16 registers, each 8 bits wide
    wire [7:0] registers [15:0];    // 16x8-bit register array
    
    // Generate write logic: 16 DFFs for each bit in each register (128 DFFs total)
    genvar i, j;
    generate
        for (i = 0; i < 16; i = i + 1) begin : reg_block
            for (j = 0; j < 8; j = j + 1) begin : bit_block
                wire write_enable = (waddr == i) && wen;  // Enable DFF if waddr matches and wen is high
                DFF dff_inst (
                    .clk(clk),
                    .d(data_in[j]),
                    .q(registers[i][j]),
                    .wen(write_enable)
                );
            end
        end
    endgenerate

    // Read logic: Use a 16-to-1 MUX to select the output data based on raddr
    mux16to1_8bit read_mux (
        .sel(raddr),
        .in0(registers[0]), .in1(registers[1]), .in2(registers[2]), .in3(registers[3]),
        .in4(registers[4]), .in5(registers[5]), .in6(registers[6]), .in7(registers[7]),
        .in8(registers[8]), .in9(registers[9]), .in10(registers[10]), .in11(registers[11]),
        .in12(registers[12]), .in13(registers[13]), .in14(registers[14]), .in15(registers[15]),
        .out(data_out)
    );

endmodule

// D flip-flop with write enable for each bit in the register
module DFF (
    input wire clk,
    input wire d,       // Data input
    input wire wen,     // Write enable for individual bit
    output reg q        // Data output
);
    always @(posedge clk) begin
        if (wen)        // Update only if write enable is high
            q <= d;
    end
endmodule

// 16-to-1 multiplexer for 8-bit data output
module mux16to1_8bit (
    input wire [3:0] sel,       // 4-bit select line to choose register
    input wire [7:0] in0, in1, in2, in3, in4, in5, in6, in7,
    input wire [7:0] in8, in9, in10, in11, in12, in13, in14, in15,
    output wire [7:0] out       // 8-bit output data
);
    assign out = (sel == 4'd0) ? in0  :
                 (sel == 4'd1) ? in1  :
                 (sel == 4'd2) ? in2  :
                 (sel == 4'd3) ? in3  :
                 (sel == 4'd4) ? in4  :
                 (sel == 4'd5) ? in5  :
                 (sel == 4'd6) ? in6  :
                 (sel == 4'd7) ? in7  :
                 (sel == 4'd8) ? in8  :
                 (sel == 4'd9) ? in9  :
                 (sel == 4'd10) ? in10 :
                 (sel == 4'd11) ? in11 :
                 (sel == 4'd12) ? in12 :
                 (sel == 4'd13) ? in13 :
                 (sel == 4'd14) ? in14 :
                 in15;
endmodule

