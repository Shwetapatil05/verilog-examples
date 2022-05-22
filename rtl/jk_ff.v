module jk_ff(j,k,clk,rst,q,qb);
input clk,rst,j,k;
output reg q;
output qb;
parameter HOLD=2'b00,
          SET=2'b10,
          RESET=2'b01,
          TOGGLE=2'b11;
always@(posedge clk)
if(rst)
q<=0;
else
begin  
case({j,k})
HOLD :q<= q;
SET :q<= 1;
RESET :q<=0;
TOGGLE :q<=~q;
endcase
end
assign qb=~q;
endmodule    

