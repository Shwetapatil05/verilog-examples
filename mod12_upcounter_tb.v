module mod12_upcounter_tb();
reg clk,rst,load;
reg [3:0]data_in;
wire [3:0]data_out;
parameter t=20;
mod12_upcounter DUT(.clk(clk),.rst(rst),.load(load),.data_in(data_in),.data_out(data_out));
always
begin
#(t/2) clk=~clk;
end 
task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk) 
rst= 1'b0;
end
endtask 
task initialize;
begin
{data_in,load,clk}=0;
end
endtask
task load_ip;
begin
@(negedge clk)
load=1;
data_in=4'b0100;
@(negedge clk)
load=0;
end
endtask
initial
begin
initialize;
reset;
load_ip;
#100;
load_ip;
#500 $finish;
end
initial $monitor("value of clk=%b,rst=%b,load=%b,data_in=%b,data_out=%b",clk,rst,load,data_in,data_out);
endmodule

