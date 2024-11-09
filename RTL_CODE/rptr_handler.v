module rptr_handler(
    input [4:0] g_wptr, //syncronized write pointer
    input rclk,
    input rrst_n,
    input r_en,
    output [3:0]raddr,
    output reg [4:0]rptr, //gray read pointer to syncronizer
    output reg empty
);

    reg [4:0]rbin;
    wire [4:0]g_rptr_next, rbin_next;
    wire rempty;

    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rbin <= 0;
            rptr <= 0;
        end else begin
            rbin <= rbin_next;
            rptr <= g_rptr_next;
        end
    end

    assign raddr=rbin[3:0];
    assign rbin_next=rbin+(r_en & ~empty);

    b2g gray_converter2(rbin_next,g_rptr_next);
    
    

    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n)
            empty <= 1'b1; // Set empty to 1 on reset
        else
            empty <= rempty;
    end
    
    assign rempty=(g_rptr_next==g_wptr);
endmodule

