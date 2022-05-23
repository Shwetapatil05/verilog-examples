
module priority_8bitto3_tb();
reg [7:0]i;
wire valid;
wire [2:0]y;
integer j;
priority_8bitto3 DUT(.i(i),.y(y),.valid(valid));
initial
begin
for(j=0;j<256;j=j+1)
begin
i = j;
#10;
end
end
initial $monitor("value i=%b,y=%b,valid=%b",i,y,valid);
endmodule