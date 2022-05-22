module priority4_tb();
reg [3:0]i;
wire valid;
wire [1:0]y;
integer j;
priority4 DUT(.i(i),.y(y),.valid(valid));
initial
begin
for(j=0;j<16;j=j+1)
begin
i = j;
#10;
end
end
initial $monitor("value i=%b,y=%b,valid=%b",i,y,valid);
endmodule
