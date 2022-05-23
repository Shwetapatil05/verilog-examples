module ripple_carry_adder(a,b,cin,s,cout);
input[3:0]a,b;
input cin;
output [3:0]s;
output cout;
wire c0,c1,c2;
full_adder1 FA1(.a(a[0]),.b(b[0]),.cin(cin),.sum(s[0]),.carry(c0));
full_adder1 FA2(.a(a[1]),.b(b[1]),.cin(c0),.sum(s[1]),.carry(c1));
full_adder1 FA3(.a(a[2]),.b(b[2]),.cin(c1),.sum(s[2]),.carry(c2));
full_adder1 FA4(.a(a[3]),.b(b[3]),.cin(c2),.sum(s[3]),.carry(cout));
endmodule   