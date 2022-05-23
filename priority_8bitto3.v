
module priority_8bitto3(i,y,valid);
input [7:0]i;
output [2:0]y;
output valid;
wire [7:0]w;
assign valid= ~i[0] & ~i[1] & ~i[2] & ~i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
assign w[7]= i[7];
assign w[6]= i[6] & ~i[7];
assign w[5]= i[5] & ~i[6] & ~i[7];
assign w[4]= i[4] & ~i[5] & ~i[6] & ~i[7];
assign w[3]= i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
assign w[2]= i[2] & ~i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
assign w[1]= i[1] & ~i[2] & ~i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
assign w[0]= i[0] & ~i[1] & ~i[2] & ~i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
assign y[0]= w[1]|w[3]|w[5]|w[7];
assign y[1]= w[2]|w[3]|w[6]|w[7];
assign y[2]= w[4]|w[5]|w[6]|w[7];
endmodule
