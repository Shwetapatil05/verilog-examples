module full_adder1_tb();
reg a_in,b_in,c_in;
wire sum_out,carry_out;
integer i;
full_adder1 DUT(.a(a_in),.b(b_in),.cin(c_in),.sum(sum_out),.carry(carry_out));
initial 
begin
for(i=0;i<8;i=i+1)
begin
{a_in,b_in,c_in}=i;
#10;
end
end 
initial $monitor("input a=%b,b=%b,cin=%b,output sum=%b,carry=%b" ,a_in,b_in,c_in,sum_out,carry_out);
initial #100;
endmodule
   