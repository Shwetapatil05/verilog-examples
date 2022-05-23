module loop_back_tb();

reg clk,reset;
wire out;

loop_back DUT(clk,reset,out);

initial
begin 
clk = 0;
forever #5clk = ~clk;
end 

initial 
begin 
@(negedge clk)reset = 1;
@(negedge clk)reset = 0;
#200 $finish;
end 

initial $monitor(" input clk=%b, reset=%b,output  out=%b",clk,reset,out);
endmodule

