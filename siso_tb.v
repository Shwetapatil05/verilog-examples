module siso_tb();
reg clk,rst;
reg si;
wire so;
siso DUT(.clk(clk),.rst(rst),.si(si),.so(so));
always
begin
#10 clk=~clk;
end
task initialize;
begin
{clk,rst,si}=0;
end
endtask
task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask
task si_ip(input j);
begin
@(negedge clk)
si=j;
end  
endtask
initial
begin
initialize;
reset;
si_ip(1'b1);
si_ip(1'b0);
si_ip(1'b1);
si_ip(1'b0);
end
initial $monitor("value of si=%b,so=%b,clk=%b,rst=%b",si,so,clk,rst);
endmodule
