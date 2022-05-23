module priority_ckt(i,h,valid);
input [7:0] i;
output [7:0]h;
output valid;
assign valid= ~i[0] & ~i[1] & ~i[2] & ~i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
assign h[7]= i[7];
assign h[6]= i[6] & ~i[7];
assign h[5]= i[5] & ~i[6] & ~i[7];
assign h[4]= i[4] & ~i[5] & ~i[6] & ~i[7];
assign h[3]= i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
assign h[2]= i[2] & ~i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
assign h[1]= i[1] & ~i[2] & ~i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
assign h[0]= i[0] & ~i[1] & ~i[2] & ~i[3] & ~i[4] & ~i[5] & ~i[6] & ~i[7];
endmodule
