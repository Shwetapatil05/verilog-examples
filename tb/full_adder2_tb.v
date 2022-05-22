module full_adder2_tb();
reg a,b,c;
wire sum,carry;
integer i;
full_adder2 DUT(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
initial
begin
{a,b,c} = 0;
end
initial
begin
for(i=0;i< 8;i =i+1)
begin
{a,b,c} = i;
#10;
end
#20 $finish;
end
initial
 $monitor("value of a=%b,b=%b,c=%d,sum=%b,carry=%b",a,b,c,sum,carry);
endmodule
 