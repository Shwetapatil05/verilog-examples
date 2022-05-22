module half_adder1_tb();
reg a,b;
wire sum,carry;
integer i;
half_adder1 DUT(.a(a),.b(b),.sum(sum),.carry(carry));
initial 
begin
for(i=0;i<4;i=i+1)
begin
{a,b}=i;
#10;
end
end
initial $monitor("input a=%b,b=%b,output sum=%b,carry=%b" ,a,b,sum,carry);
initial #100;
endmodule
