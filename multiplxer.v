module multiplxer(i,y,s);
input [3:0]i;
input [1:0]s;
output y;
wire w1,w2;
multiplxer2to1 mux1(.a(i[0]),.b(i[1]),.s(s[0]),.y(w1));
multiplxer2to1 mux2(.a(i[2]),.b(i[3]),.s(s[0]),.y(w2));
multiplxer2to1 mux3(.a(w1),.b(w2),.s(s[1]),.y(y));
endmodule

