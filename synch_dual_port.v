module synch_dual_port(clk,rst,write,read,wr_addrs,rd_addrs,data_in,data_out);

parameter RAM_WIDTH =8,
           RAM_DEPTH=16,
           ADDR_SIZE=4;

input clk,rst,write,read;
input [RAM_WIDTH -1 :0] data_in;
input [ADDR_SIZE - 1:0] wr_addrs,rd_addrs;
output reg [RAM_WIDTH-1:0] data_out;

integer i;
reg [RAM_WIDTH -1:0] mem [RAM_DEPTH-1:0];

always @(posedge clk)
begin
if (rst)
begin 
data_out <=0;
for(i=0;i< RAM_DEPTH ;i=i+1)
mem[i] <=0 ;
end 
 else 
 begin
 if (write)
 mem[wr_addrs] <= data_in;
 if (read)
data_out<= mem[rd_addrs];
 end 
 end 
 endmodule   
 