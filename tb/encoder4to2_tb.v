module encoder4to2_tb();
reg [3:0]i;
wire [1:0]y;
integer j;
encoder4to2 DUT(.i(i),.y(y));
task initialize;
begin
i=0;
end
endtask
task encoder_ip(input [3:0]j);
begin
i=j;
end
endtask
initial
begin
initialize;
for(j=0;j<16;j=j+1)
begin
encoder_ip(j);
#10;
end
end
initial $monitor("value of i=%b,y=%b",i,y);
endmodule
