module mux4to1_behav_tb();
reg [3:0]i;
reg [1:0]s;
wire o;
integer j,k;
mux4to1_behav DUT (.i(i),.s(s),.o(o));
task initialize;
begin
{s,i}=0;
end 
endtask
task sel_ip(input[1:0]j);
begin
s=j;
end
endtask
task mux_ip(input[3:0]k);
begin
i=k;
end
endtask
initial
begin
initialize;
for(j=0;j<4;j=j+1)
begin
sel_ip(j);
for(k=0;k<16;k=k+1)
begin
mux_ip(k);
#10;
end
end
end
initial $monitor("value of i=%b,s=%b,o=%b",i,s,o);
endmodule
