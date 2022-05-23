module asych_dual_port(rd_clk,wr_clk,clr,write,read,wr_addrs,rd_addrs,data_in,data_out);

parameter RAM_WIDTH =16,
           RAM_DEPTH=8,
           ADDR_SIZE=3;

input clr,write,read,rd_clk,wr_clk;
 input [RAM_WIDTH -1 :0] data_in;
input [ADDR_SIZE - 1:0] wr_addrs,rd_addrs;
output reg [RAM_WIDTH-1:0] data_out;

integer i;
 reg [RAM_WIDTH -1:0] mem [RAM_DEPTH-1:0];
always @(posedge rd_clk , posedge clr)
begin
if(clr)
data_out<=0;
else if(read)
data_out<=mem[rd_addrs];   
end


always@(posedge wr_clk,posedge clr)
begin
if(clr)
for(i=0;i< RAM_DEPTH ;i=i+1)
begin
mem[i] <=0 ; 
end
else if(write)
mem[wr_addrs]<=data_in;
end
endmodule
