
module mux_decoder2to4_tb();
reg [3:0]din ;
reg [1:0]s ; 
wire y;
integer j,k ;
mux_decoder2to4 DUT(.din(din),.s(s),.y(y));
initial
begin
for(j=0;j<4;j=j+1)
begin
s= j;
for(k=0;k<16;k=k+1)
begin
din = k ;
#10;
end
end
end
initial $monitor("values of din=%b,s=%b,y=%b",din,s,y);
endmodule
