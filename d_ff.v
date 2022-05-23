module d_ff(d,clk,rst,q,qb);
input d,clk,rst;
output reg q;
output qb;
always @(posedge clk)
begin
if(rst)
q<=0;
else
q<=d;
end   
assign qb = ~q;
endmodule
                    