module b2g(
input [4:0]b,
output [4:0]g);


assign g[4]=b[4];
assign g[3]=b[4]^b[3];
assign g[2]=b[3]^b[2];
assign g[1]=b[2]^b[1];
assign g[0]=b[1]^b[0];

endmodule
