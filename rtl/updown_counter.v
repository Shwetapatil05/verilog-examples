module updown_counter(clk,rst,data_in,data_out);
input clk,rst;
input [3:0] data_in;
output  reg [3:0] data_out;
always@(posedge clk)
begin
if(rst)
data_out<=4'b0000;
else if(data_in[0]== 0)
data_out<=data_out +1;
else 
data_out<= data_out - 1;
end
endmodule                                                        

               