
module updown_counter_tb();
reg clk,rst;
reg [3:0] data_in;
wire [3:0] data_out;
integer i;
updown_counter DUT(.clk(clk),.rst(rst),.data_in(data_in),.data_out(data_out));
always
begin
#10 clk=~clk;
end
task reset;
begin
@(negedge clk)
rst=1'b1;          
@(negedge clk)  
rst=1'b0;  
end
endtask
task initialize;
begin 
{clk,rst,data_in}=0;
end
endtask
task d_ip(input [3:0]i);
begin
@(negedge clk)
data_in =i;                                
end
endtask 
initial
begin
initialize;
reset;
d_ip(4'b0000);
d_ip(4'b0010);
d_ip(4'b0100);
d_ip(4'b0110);
d_ip(4'b1000);
#10 ;
reset;
d_ip(4'b0001);
d_ip(4'b0011);
d_ip(4'b0101);
d_ip(4'b0111);
#10 $finish;

end
initial $monitor("clk=%b,rst=%b,data_in=%b,data_out=%b",clk,rst,data_in,data_out);
endmodule
 
