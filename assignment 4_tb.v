module assignment 4_tb();
reg [2:0]a,b;
initial
begin
a=3;
b=4;
a<=#10 2;
a= #10 1;
a<=#20 0;
b<=#30 0;
#100  $finish;
initial $monitor("time=%t,a=%b,b=%b",time,a,b);
endmodule          