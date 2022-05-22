module asych_dual_port_tb();

parameter RAM_WIDTH =16;
parameter RAM_DEPTH=8;
parameter ADDR_SIZE=3;
parameter t=20;


reg rd_clk,wr_clk,clr,write,read;
reg [RAM_WIDTH-1 :0] data_in;
reg [ADDR_SIZE-1:0] wr_addrs,rd_addrs;
wire  [RAM_WIDTH-1:0] data_out;

asych_dual_port DUT (.rd_clk(rd_clk),.wr_clk(wr_clk),.clr(clr),.write(write),.read(read),.wr_addrs(wr_addrs),
                               .rd_addrs(rd_addrs),.data_in(data_in),.data_out(data_out));
                                    
always             
begin
#(t/2) rd_clk= ~rd_clk; 
end

always
begin 
#(t/2) wr_clk= ~wr_clk;
end 

task  clear ;
begin
clr=1'b1;
#30;
clr=1'b0;
end 
endtask 


task initialize;
begin
{rd_addrs,wr_addrs,data_in,rd_clk,wr_clk,clr,write,read}=0;
end 
endtask

task write_st (input [15:0]a,input [2:0] b,input w,input r);
begin
@(negedge wr_clk)
data_in=a;
wr_addrs=b;
write=w;              
read=r;
#10;
end 
endtask 

task read_st (input[2:0] a,input w , input r);
begin
@(negedge  rd_clk)
rd_addrs=a;
read=r;
write=w;
end 
endtask 

initial 
begin  
initialize;                                                                        
clear;

repeat(10)
write_st({$random}%65536,{$random}%8,1'b1,1'b0);
repeat(10)
read_st ({$random}%8,1'b0,1'b1);
#100 $finish;
end 

initial $monitor("values of rd_clk=%b,wr_clk=%b,clr=%b,write=%b,read=%b,rd_addrs=%b,wr_addrs=%b,data_in=%b,data_out=%b",
                              rd_clk,wr_clk,clr,write,read,wr_addrs,rd_addrs,data_in,data_out);
endmodule

