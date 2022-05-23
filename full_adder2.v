module full_adder2(a,b,c,sum,carry);
input a,b,c;
output sum ,carry;
wire w1,w2,w3;
half_adder1 HA1(.a(a),.b(b),.sum(w1),.carry(w2));
half_adder1 HA2(.a(w1),.b(c),.sum(sum),.carry(w3));
or OR1(carry,w2,w3);
endmodule
 