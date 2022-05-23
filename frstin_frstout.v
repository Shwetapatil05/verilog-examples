module frstin_frstout( Clk,dataIn,RD,WR,EN,dataOut,Rst,EMPTY,FULL);
input Clk,RD,WR,EN,Rst;
output EMPTY, FULL;
input [7:0]dataIn;
output reg [7:0] dataOut;
reg [3:0] Count = 0;
reg [7:0] FIFO [15:0];
reg [4:0] rd_ptr, wr_ptr;
assign EMPTY = (Count==0)? 1'b1:1'b0;
assign FULL = (Count==4'b1111)? 1'b1:1'b0;
always @ (posedge Clk)
begin
if (EN==0);
else begin
if (Rst) begin
rd_ptr = 0;
wr_ptr = 0;
end
else if (RD ==1'b1 && Count!=0) begin
dataOut = FIFO[rd_ptr];
rd_ptr = rd_ptr+1;
end
else if (WR==1'b1 && Count<16) begin
FIFO[wr_ptr] = dataIn;
wr_ptr = wr_ptr+1;
end
else;
end
if (wr_ptr==4'b1111)
wr_ptr=0;
else if (rd_ptr==4'b1111)
rd_ptr=0;
else;
if (rd_ptr > wr_ptr) begin
Count=rd_ptr-wr_ptr;
end
else if (wr_ptr > rd_ptr)
Count=wr_ptr-rd_ptr;
else;
end
endmodule

