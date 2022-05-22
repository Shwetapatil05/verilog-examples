module decoder2to4_tb();
reg [1:0]x;
wire[3:0]y;
integer i;
decoder2to4 DUT(.x(x),.y(y));
initial
begin
for(i=0;i<4;i=i+1)
begin
x=i;
#20;
end
end
initial $monitor("values of x=%b,y=%b",x,y);
endmodule
