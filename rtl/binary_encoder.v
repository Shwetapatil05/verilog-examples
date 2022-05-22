module binary_encoder(h,y);
input [7:0] h;
output [2:0]y;
assign y[0]= h[1]|h[3]|h[5]|h[7];
assign y[1]= h[2]|h[3]|h[6]|h[7];
assign y[2]= h[4]|h[5]|h[6]|h[7];
endmodule
