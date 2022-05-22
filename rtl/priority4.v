module priority4(i,y,valid);
input [3:0]i;
output valid;
output [1:0]y;
wire w0,w1,w2,w3;
assign w3= i[3];
assign w2= i[2] & ~i[3];
assign w1= i[1] & ~i[2] & ~i[3];
assign w0= i[0] & ~i[1] & ~i[2] & ~i[3];
assign valid= ~i[0] & ~i[1] & ~i[2] & ~i[3];
assign y[0]= w1|w3;
assign y[1]= w2|w3;
endmodule
