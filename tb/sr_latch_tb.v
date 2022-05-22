module sr_latch_tb();
reg s_in,r_in,en;
wire q,qb;
wire w1,w2;
sr_latch DUT(.s_in(s_in),.r_in(r_in),.en(en),.q(q),.qb(qb));
task initialize;
begin
{s_in,r_in,en}=0;
end
endtask
task en_ip(input i);
begin 
en=i;
end
endtask
task sr_ip(input [1:0]j);
begin
{s_in,r_in}=j;
#10;
end
endtask
initial 
begin
initialize;
en_ip(0);
sr_ip(2'b10);
sr_ip(2'b01);
#10;
en_ip(1);
sr_ip(2'b00);
sr_ip(2'b01);
sr_ip(2'b10);
sr_ip(2'b11);
#10 $finish;
end
initial $monitor("value of s_in=%b,r_in=%b,en=%b,q=%b,qb=%b",s_in,r_in,en,q,qb);
endmodule
