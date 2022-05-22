module encoder8to3_behav_tb();
reg [2:0]i;
wire [7:0]y;
wire valid;
integer j;
encoder8to3_behav DUT(.i(i),.y(y),.valid(valid));
task initialize;
begin
i=0;
end
endtask
task encoder_ip(input [2:0]j);
begin
i=j;
end
endtask
initial
begin
initialize; 
for(j=0;j<8;j=j+1)
begin
encoder_ip(j);
#10;
End
end
initial $monitor("value of i=%b,y=%b,valid=%b",i,y,valid);
endmodule

