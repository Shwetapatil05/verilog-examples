module priority_encoder_struc(i,y,valid);
input [7:0]i;
output [2:0]y;
output valid;
wire[7:0] w;
priority_ckt  PC1(.i(i),.h(w),.valid(valid));
binary_encoder BE1(.h(w),.y(y));
endmodule