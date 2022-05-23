module priority_encoder_struc_tb();
reg [7:0]i;
wire valid;
wire [2:0]y;
integer j;
priority_encoder_struc DUT(.i(i),.y(y),.valid(valid));
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
