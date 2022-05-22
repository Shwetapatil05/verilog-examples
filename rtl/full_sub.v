module full_sub(a,b,cin,diff,barrow);
input a,b,cin;
output diff,barrow;
wire w1,w2,w3;
half_sub h1(.a(a),.b(b),.diff(w1),.barrow(w2));
half_sub h2(.a(w1),.b(cin),.diff(diff),.barrow(w3));
or r1(barrow,w3,w2);
endmodule
    