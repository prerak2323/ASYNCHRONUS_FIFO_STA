module wptr_handler(
    output [3:0] waddr,
    output reg [4:0] wptr,
    input [4:0]g_rptr,
    output reg full,
    input wrst_n,
    input wclk,
    input w_en
    );
    
    reg [4:0]wbin; //binary write pointer
    wire [4:0]g_wptr_next, wbin_next;
    wire wfull;

    always @(posedge wclk or negedge wrst_n) 
    begin
        if (!wrst_n) 
        	{wbin, wptr}<=0;
        else 
            {wbin, wptr}<={wbin_next, g_wptr_next};
        
    end
    
    
    assign waddr=wbin[3:0];
    assign wbin_next=wbin + (w_en & ~full);
    
    b2g gray_converter1(wbin_next,g_wptr_next);
  


    assign wfull = (g_wptr_next == {~g_rptr[4:3], g_rptr[2:0]});
        
    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n)
            full <= 1'b0;
        else
            full <= wfull;
    end


endmodule
