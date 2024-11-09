module cdc(
input [4:0]in,
input clk,rst_n,
output reg [4:0]qb2);
reg [4:0]qb1;

always @(posedge clk)
begin
	if(!rst_n)
	begin
		qb1<=0;
		qb2<=0;
	end
	else
	begin
		qb1<=in;
		qb2<=qb1;
	end
end
endmodule
