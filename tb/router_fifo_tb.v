module router_fifo_tb();
reg clk,resetn,soft_reset,write_enb,read_enb,lfd_state;
reg [7:0] data_in;
 wire full,empty;
 wire [7:0] data_out;
router_fifo DUT(.clk(clk),.resetn(resetn),.soft_reset(soft_reset),.write_enb(write_enb),.read_enb(read_enb),
             .lfd_state(lfd_state),.data_in(data_in),.full(full),.empty(empty),.data_out(data_out));
always
begin
#10 clk=~clk; 
end 

task initialize;
begin
{clk,resetn,soft_reset,write_enb,read_enb,lfd_state}=1'b0;
end
endtask

task reset;
begin               
@(negedge clk);
resetn=1'b0;
@(negedge clk);
resetn=1'b1;
end
endtask

task s_reset;
begin
@(negedge clk);
soft_reset=1'b1;
@(negedge clk);
soft_reset=1'b0;
end
endtask

task read;
begin
write_enb=1'b0;
@(negedge clk);
read_enb=1'b1;
end
endtask

task pkt_gen;
reg[7:0] payload_data,parity,header;
reg [5:0]payload_len;
reg[1:0] addr;
integer i;
begin
@(negedge clk)
payload_len=6'd4;
addr= 2'b01;
header={payload_len,addr};
data_in=header;
lfd_state=1'b1;
write_enb=1;
for(i=0;i<payload_len;i=i+1)
begin
@(negedge clk);
lfd_state=0;
payload_data={$random}%256;
data_in=payload_data;
end
@(negedge clk)
parity ={$random}%256;
data_in =parity;
end
endtask 

initial               
begin                  
initialize;
reset;
s_reset;
pkt_gen;
#10;
 read;
#100 $finish;
end
endmodule
  














		
                                   

