
module multiplxer_tb();
reg [3:0]i ;
reg [1:0]s ; 
wire y;
integer j,k ;
multiplxer DUT(.i(i),.s(s),.y(y));
initial
begin
for(j=0;j<4;j=j+1)
begin
s = j;
for(k=0;k<16;k=k+1)
begin
i = k ;
#10;
end
end
end
initial $monitor("values of i=%b,s=%b,y=%b",i,s,y);
endmodule