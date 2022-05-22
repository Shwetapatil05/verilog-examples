module mod12_upcounter(clk,rst,load,data_in,data_out);
input clk,rst,load;
input [3:0]data_in;
output reg [3:0]data_out;
always @(posedge clk)
begin
if(rst)
data_out=4'b0000;
else if(load)
data_out <= data_in;
else
if(data_out>=12)
data_out<=4'b0000;
else             
data_out<=data_out+1;
end
endmodule  
                               
