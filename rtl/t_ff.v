module t_ff(t,clk,rst,q,qb);
input t,clk,rst;
inout q;
output qb;
wire w;
d_ff d1(.d(w),.clk(clk),.rst(rst),.q(q),.qb(qb));
xor x1(w,t,q);
endmodule
