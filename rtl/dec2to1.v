module dec2to1(a,b,w,x,y,z);
input a,b;
output w,x,y,z;
assign w= ~b & ~a;
assign x= b & ~a;
assign y= ~b & a;
assign z=  b & a;
endmodule
  