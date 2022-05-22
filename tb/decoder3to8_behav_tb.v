module decoder3to8_behav_tb();
reg [2:0]i;
wire [7:0]y;
integer j;
decoder3to8_behav DUT(.i(i),.y(y));
task initialize;
begin 
i=0;
end
endtask
task i_ip(input [2:0]j);
begin  
i=j;
end
endtask
initial
begin
initialize; 
for(j=0;j<8;j=j+1)
begin
i_ip(j);
#10;
end
end
initial $monitor ("value of i=%b,y=%b",i,y);
endmodule
