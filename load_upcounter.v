module load_upcounter(clk,rst,load,data_in,q);
input clk,rst,load;
input [3:0]data_in;
output reg [3:0]q;
always @(posedge clk)
begin
if(rst)
q<=0;
else if(load)
q<=data_in;
else 
q<= q+1;
end
endmodule     
                  