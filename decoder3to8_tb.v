module decoder3to8_tb();
reg [2:0]d;
wire [7:0]y;
integer i;
decoder3to8 DUT(.d(d),.y(y));
initial
begin
for(i=0;i<8;i=i+1)
begin
d=i;
#10;
end
end
initial $monitor("value of d=%b,y=%b",d,y);
endmodule
