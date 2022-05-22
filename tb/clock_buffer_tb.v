module clock_buffer_tb();
reg mst_clk;
wire buff_clk;
integer t1,t2,t3,t4,t5,t6,p1,p2;
clock_buffer DUT(.buff_clk(buff_clk),.mst_clk(mst_clk));
task freq();
begin

@(posedge mst_clk) t1=$time;
@(posedge mst_clk) t2=$time;
t3=t2-t1;
@(posedge buff_clk) t4=$time;
@(posedge buff_clk) t5=$time;
t6=t5-t4;
if(t3==t6)
begin
$display("t1=%b,t2=%b,t3=%b,t4=%b,t5=%b,t6=%b",t1,t2,t3,t4,t5,t6);
$display("frequency of mst_clk and buff_clk are equal");
end
end
endtask
  
task phase();
fork
@(posedge mst_clk) p1=$time;
@(posedge buff_clk) p2=$time;
begin
#10;
if(p1==p2)
begin
$display("p1=%b,p2=%b",p1,p2);
$display("phase are equal");
end
else
begin
$display("p1=%b,p2=%b",p1,p2);
$display("phase are  not equal");
end
end
join
endtask

initial                       
fork
freq;
phase;
join

initial
begin
mst_clk=0;
 forever #5 mst_clk=~mst_clk;
end
initial #100 $finish;
endmodule

