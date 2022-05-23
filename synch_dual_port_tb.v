module synch_dual_port_tb();

parameter RAM_WIDTH =8;
parameter RAM_DEPTH=16;
parameter ADDR_SIZE=4;
parameter t=20;


reg clk,rst,write,read;
reg [RAM_WIDTH-1 :0] data_in;
reg [ADDR_SIZE-1:0] wr_addrs,rd_addrs;
wire  [RAM_WIDTH-1:0] data_out;
integer i;

synch_dual_port DUT (.clk(clk),.rst(rst),.write(write),.read(read),.wr_addrs(wr_addrs),
                               .rd_addrs(rd_addrs),.data_in(data_in),.data_out(data_out));

always             
begin

#(t/2) clk=~clk;
end 

task reset ;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end 
endtask 


task initialize;
begin
{clk,rst,write,read}=0;
end 
endtask

task write_st (input [7:0]a,input [3:0] b,input w,r);
begin
@(negedge clk)
data_in=a;
wr_addrs=b;
write=w;              
read=r;
end 
endtask 

task read_st (input[3:0] a,input w,r);
begin
@(negedge clk)
rd_addrs=a;
read=r;
write=w;
end 
endtask 

initial 
begin  
initialize;                                                                        
reset;
repeat(10)
write_st({$random}%256,{$random}%16,1'b1,1'b0);
read_st ({$random}%16,1'b0,1'b1);
#100 $finish;
end 

initial $monitor("values of clk=%b,rst=%b,write=%b,read=%b,rd_addrs=%b,wr_addrs=%b,data_in=%b,data_out=%b",clk,rst,write,read,wr_addrs,rd_addrs,data_in,data_out);
endmodule
