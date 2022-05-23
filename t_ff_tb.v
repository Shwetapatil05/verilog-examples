module t_ff_tb();
reg t,clk,rst;
wire q,qb;
t_ff DUT(.t(t),.clk(clk),.rst(rst),.q(q),.qb(qb));
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
{t,clk}=0;
end
endtask
task t_ip(input k); 
begin
@(negedge clk) 
t=k;
#10;
end 
endtask
initial
begin
initialize;
reset;
t_ip(1);
t_ip(0);
t_ip(1);
t_ip(0);
#10 ;
$finish;
end
initial $monitor("value of t=%b,clk=%b,rst=%b,q=%b,qb=%b", t,clk,rst,q,qb);
endmodule

