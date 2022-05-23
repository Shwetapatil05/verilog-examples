module d_ff_tb();
reg d,clk,rst;
wire q,qb;
d_ff DUT(.d(d),.clk(clk),.rst(rst),.q(q),.qb(qb));
always
begin
#10 clk=~clk;
end 
task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst= 1'b0;
end
endtask 
task initialize;
begin
{d,clk}=0;
end
endtask
task d_ip(input k); 
begin
@(negedge clk) 
d=k;
#10;
end 
endtask
initial
begin
initialize;
reset;
d_ip(1);
d_ip(0);
d_ip(1);
d_ip(0);
#10 ;
$finish;
end
initial $monitor("value of d=%b,clk=%b,rst=%b,q=%b,qb=%b", d,clk,rst,q,qb);
endmodule
