module sync_updown_counter(clk,rst,load,data_in,data_out,mode_cntrl);
input clk,rst,load,mode_cntrl;
input [3:0]data_in;
output reg [3:0]data_out;
always@(posedge clk)
begin
if(rst)
data_out <=4'b0000;
else if(load)
data_out<=data_in;
else
begin
case (mode_cntrl)
0: data_out<=data_out - 1;
1: data_out<=data_out + 1;
endcase
end
end
endmodule
           