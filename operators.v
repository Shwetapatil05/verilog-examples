module operators ();
reg [1:0] a=2'b1x, b=2'b01;
reg [4:0] m=5'b010x, n=6, q=5'b0x, o,p;
reg c ,d;
reg [4:0]x=1000,z=4'b1x1x,y,u;
reg [4:0]s=4'b101x;
reg [3:0]e=4'b1x0z,f=4'b1x0z;
reg [4:0]g,h,i,j;
integer t;
initial
begin
c=(a==b);//logical equality//output 0//imp
d=(a>=b);//relational// output x
y=(x>=z);//relational //output x
u=(x<=z);//relational//output x
o=(m&&n);//logical operator//output 1
p=(n&&q);//ogical operator//output x
t=(x*s);//arithematic operator//output x
g=(e==f);//logical equality//output x
h=(e!=f);//logical inequality//output x
i=(e===f);//case equality//output 1
j=(e!==f);//case inequality//output 0

$display(c);
$display(d);
$display(y);
$display(u); 
$display(o);
$display(p);
$display(t);
$display(g);
$display(h);
$display(i);
$display(j);
end
endmodule


