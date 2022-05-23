
module vending_mach_tb;
  reg [1:0] din,
       clock,
       rst;
  wire x,y;
  
  vending_mach dut(din,
               clock,
               rst,
               x,y);

task initialize;
begin
din=0; 
clock=0;
end
endtask

 
task reset;
begin
@(negedge clock)
rst=1'b1;
@(negedge clock)
rst=1'b0;
end
endtask
 
always #10 clock=~clock;
    
initial
  begin
    initialize;
    reset;
    din <=2'b10; 
#10;
    din <=2'b10;
#10;
    din <=2'b10;
#10;
reset;
    din <=2'b11;
#10;
    din <=2'b11;
#10 $finish;   
    
  end
initial $monitor("rst=%b,clock=%b,din=%b,x=%b,y=%b",rst,clock,din,x,y);
endmodule