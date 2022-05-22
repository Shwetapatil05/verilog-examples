module ripple_carry_adder_tb();
reg [3:0] a,b;
reg cin;
wire [3:0]s;
wire cout;
integer i,j;
ripple_carry_adder DUT(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
initial
begin
cin=1'b0;
for(i=0;i<16;i=i+1)
begin
a=i;
for(j=0;j<16;j=j+1)
begin
b=j;
#10;
end
end
end
initial $monitor("value of a=%b,b=%b,cin=%b,s=%b,cout=%b",a,b,cin,s,cout);
endmodule
