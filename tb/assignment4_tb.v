/*module assignment4_tb();
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
end
initial $monitor("value of a=%b,b=%b,time=%t",a,b,$time);
endmodule */

/*module assignment4_tb();
reg [2:0]a,b;
initial
begin
a=3;
b=4;
a= #10 1;
a<=#10 2;
a<=#20 0;
b<=#30 0;
#100  $finish;
end
initial $monitor("value of a=%b,b=%b,time=%t",a,b,$time);
endmodule*/

/*module assignment4_tb();
reg [2:0]a,b;
initial
begin
a<=2;
a<=4;
b<=6;
a=3;
b=4;
a=1;
#10  $finish;
end
initial $monitor("value of a=%b,b=%b,time=%t",a,b,$time);
endmodule */

/*module assignment4_tb();
reg [2:0]a,b;
initial
begin
a=3;
b=4;
a=1;
a<=2;
a<=4;
b<=6;
#10  $finish;
end
initial $monitor("value of a=%b,b=%b,time=%t",a,b,$time);
endmodule */

module example3_tb();
reg[2:0]a;
initial 
begin
a<=3'd5;
a<= #5 3'd0;
a<= #10 3'd7;
#20 $finish;
$monitor("value of a=%b",a);
end
endmodule       
                       
                         
                         
                      
                         
                