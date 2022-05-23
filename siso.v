module siso(clk,rst,si,so);
input clk,rst;
input si;
output so;
reg [3:0] register;

always@( posedge clk)
begin
if(rst)
register<=4'b0000;
else
register[0]<=si;
register[1]<=register[0];
register[2]<=register[1];
register[3]<=register[2];
end
assign so= register[3];

endmodule
