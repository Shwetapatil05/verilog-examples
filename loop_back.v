module loop_back(clk,reset,out);
input clk,reset;
output reg [7:0]out;
reg [3:0]count;
reg [7:0]temp;

always@(posedge clk)
begin 

if(reset)
begin
count <= 0;
out <= 0;
temp <= 8'b0000_0001;
end 

else if(count[0] == 0 && count != 4'd14)
begin
out <= 8'b0000_0001;
count <= count +1;
end

else if(count[0] == 1 && count != 4'd14)
begin 
out <= temp <<1;
temp <= temp <<1;
count <= count +1;
end

else 
begin
count <= 1;
temp <= 8'b0000_0001;
out <= 8'b0000_0001;
end 
end
endmodule

