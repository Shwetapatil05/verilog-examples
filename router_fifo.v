module router_fifo(clk,resetn,soft_reset,read_enb,write_enb,lfd_state,data_in,full,empty,data_out);

input clk,resetn,soft_reset,read_enb,write_enb,lfd_state;
input [7:0]data_in;
output full,empty;
output reg [7:0]data_out;
reg temp;
reg [4:0]wp,rp;
reg [6:0]counter ;
integer i; 

reg [8:0]mem[15:0];

always@(posedge clk)
begin 
if(!resetn)
temp <= 1'b0;
else
temp <= lfd_state;
end 

always@(posedge clk)
begin 

if(!resetn || soft_reset)
begin
for(i=0;i<16;i=i+1)
mem[i] <= 0;
wp <= 0;
end 

else if(write_enb && !full)
begin
mem[wp[3:0]] <= {temp,data_in};
wp <= wp+1;
end

else if(counter == 0)
begin 
wp <= 0;
end 

end

always@(posedge clk)
begin 

if(!resetn)
begin 
data_out <= 8'b0;
rp <= 0;
end 

else if(soft_reset)
begin
data_out <= 8'bz;
rp <= 0;
end 

else if(read_enb && !empty)
begin
data_out <= mem[rp[3:0]];
rp<= rp+1;
end

else if(counter == 0)
begin 
rp <= 0;
data_out <= 8'bz;
end 

end

always@(posedge clk)
begin 

if(!resetn || soft_reset)
counter <= 1;

else if(write_enb && temp)
counter <= data_in[7:2]+1;

else if(read_enb && !empty)
counter <= counter-1;

end

assign empty = (wp == rp)?1'b1:1'b0;
assign full = ({~wp[4],wp[3:0]} == rp[3:0])?1'b1:1'b0;

endmodule




