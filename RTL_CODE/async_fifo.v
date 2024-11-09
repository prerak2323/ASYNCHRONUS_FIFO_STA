module async_fifo(
    input wclk,
    input rclk,
    input r_en,
    input w_en,
    input rrst_n,
    input wrst_n,
    input [7:0] data_in,
    output full,
    output empty,
    output [7:0] data_out
);

wire [3:0]waddr, raddr;
wire [4:0]wptr, rptr, g_wptr, g_rptr;

fifo_memory fifomemory(
    w_en,
    full,
    wclk,
    data_in,
    raddr,
    waddr,
    data_out
);

cdc syncA(
rptr,
wclk,wrst_n,
g_rptr);

cdc syncB(
wptr,
rclk,rrst_n,
g_wptr);


rptr_handler rptrhandler(
     g_wptr, //syncronized write pointer
     rclk,
     rrst_n,
     r_en,
     raddr,
     rptr, //gray read pointer to syncronizer
     empty
);





wptr_handler wrpthandler(
    waddr,
    wptr,
    g_rptr,
    full,
    wrst_n,
    wclk,
    w_en
    );   
    
 
endmodule

