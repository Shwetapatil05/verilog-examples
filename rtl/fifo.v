module fifo( clk,data_in,rd,wr,data_out,rst,empty,full);
input clk,rst,rd,wr;
input [7:0] data_in;
output reg [7:0] data_out;
output empty,full;
integer i;

parameter fifo_depth=16,
           fifo_width=8,
            fifo_addrs=4;

reg [fifo_width-1:0] fifo [fifo_depth-1:0];
reg [fifo_addrs:0] rd_ptr,wr_ptr;

always@(posedge clk)
begin
if(rst)  
begin
data_out<=0;
rd_ptr<= 0;
wr_ptr <=0;
for(i=0;i<fifo_depth;i=i+1)
fifo[i]=0; 
end
else if(wr && !full) 
begin
fifo[wr_ptr]<=data_in;
wr_ptr<=wr_ptr+1;
end
else if(rd && !empty)
begin
data_out <= fifo[rd_ptr];
rd_ptr <=rd_ptr+1;
end
else if(empty)
begin
wr_ptr <=0;
rd_ptr <=0;
end
end
assign empty= (rd_ptr == 16)?1'b1:1'b0;
assign full= (wr_ptr == 16)?1'b1:1'b0;

endmodule 
