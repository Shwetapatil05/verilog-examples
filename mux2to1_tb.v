module mux2to1_tb();
reg a,b,s;
wire y;
integer i,j;
mux2to1 DUT(.a(a),.b(b),.s(s),.y(y));
initial
begin
for(i= 0;i< 1;i= i+1)
begin 
s = i;
for(j= 0;j< 4;j= j+1)
{a,b}=j;
#10;
end
end
initial $monitor("values of a=%b,b=%b,s=%s,y=%b",a,b,s,y);
initial
#50 $finish;
endmodule

