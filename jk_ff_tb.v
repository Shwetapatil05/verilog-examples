module jk_ff_tb();
reg clk,rst,j,k;
wire q,qb;
parameter HOLD=2'b00,
          SET=2'b10,
          RESET=2'b01,
          TOGGLE=2'b11;
parameter t=20;
jk_ff DUT(.clk(clk),.rst(rst),.j(j),.k(k),.q(q),.qb(qb));
always
begin
#(t/2) clk=~clk;
end     
task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk )
rst= 1'b0;
end 
endtask 
task initialize;
begin 
{j,k,clk}=0;
end
endtask
task jk_ip(input [1:0]i); 
begin
@(negedge clk)
{j,k}=i;
#10;
end 
endtask
initial 
begin
initialize;
reset;   
jk_ip(2'b00);
jk_ip(2'b01);
jk_ip(2'b10);
jk_ip(2'b11);
jk_ip(2'b10);
jk_ip(2'b11);
#500 $finish;
end
initial $monitor("value j=%b ,k=%b ,clk=%b,rst=%b,q=%b,qb=%b",j,k,clk,rst,q,qb);
endmodule


