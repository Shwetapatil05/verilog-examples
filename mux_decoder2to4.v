module mux_decoder2to4(din,s,y);
input [3:0]din;
input [1:0]s;
output y;
wire [3:0]bufin;
dec2to1  dec1(.b(s[0]),.a(s[1]),.w(bufin[0]),.x(bufin[1]),.y(bufin[2]),.z(bufin[3]));
bufif1 BUF1(y,din[0],bufin[0]);
bufif1 BUF2(y,din[1],bufin[1]);
bufif1 BUF3(y,din[2],bufin[2]);
bufif1 BUF4(y,din[3],bufin[3]);
endmodule 