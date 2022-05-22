module decoder3to8(d,y);
input [2:0]d;
output [7:0]y;
assign y[0]= ~d[0] & ~d[1] & ~d[2];
assign y[1]=  d[0] & ~d[1] & ~d[2];
assign y[2]= ~d[0] & d[1] & ~d[2];
assign y[3]= d[0] & d[1] & ~d[2];
assign y[4]= ~d[0] & ~d[1] & d[2];
assign y[5]= d[0] & ~d[1] & d[2];
assign y[6]= ~d[0] & d[1] &d[2];
assign y[7]= d[0] & d[1] & d[2];
endmodule

