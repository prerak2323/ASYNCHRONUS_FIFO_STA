module fifo_memory(
    input wclk_en,
    input full,
    input wclk,              // Correct clock signal input
    input [7:0] data_in,
    input [3:0] raddr,
    input [3:0] waddr,
    output [7:0] data_out
);

wire wen; 

assign wen = (wclk_en && !full);

register_bank fifo (
    .data_in(data_in),       // 8-bit input data
    .raddr(raddr),           // 4-bit read address (16 locations)
    .waddr(waddr),           // 4-bit write address
    .wen(wen),               // Write enable
    .clk(wclk),              // Connect `wclk` to `clk` input of `register_bank`
    .data_out(data_out)      // 8-bit output data
);

endmodule

