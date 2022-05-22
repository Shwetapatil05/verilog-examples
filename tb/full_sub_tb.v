module full_sub_tb();
reg a,b,cin;
wire diff,barrow;
integer i;
full_sub DUT (.a(a),.b(b),.cin(cin),.diff(diff),.barrow(barrow));
initial
begin
{a,b,cin}=0;
for(i=0;i<8;i=i+1)
begin
{a,b,cin}=i;
#10;
end
end
initial $monitor("value of a=%b,b=%b,cin=%b,diff=%b,barrow=%b",a,b,cin,diff,barrow);
endmodule


