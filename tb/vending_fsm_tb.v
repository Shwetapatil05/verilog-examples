
module vending_fsm_tb;
  reg [1:0]coin,
       clk,
       rst ;
wire pr_en;

  vending_fsm dut(.clk(clk),.rst(rst),.coin(coin),.pr_en(pr_en));

always #10 clk=~clk; 

task initialize;
begin
coin=0; 
clk=0;
end
endtask

 
task reset;
begin
@(negedge clk)
rst=1'b1;
@(negedge clk)
rst=1'b0;
end
endtask
  
initial
  begin
    initialize;
    reset;
    coin <=2'b01; 
#10;
    coin <=2'b01;
#10; 
    coin <=2'b01;
#10; 
// reset;
    coin <=2'b10; 
#10;
    coin <=2'b10;
#10; 
    coin <=2'b10; 
#10; 


//reset;
    coin <=2'b00;
#10;
    coin <=2'b00;
#100 $finish;   
    
  end
initial $monitor("rst=%b,clk=%b,coin=%b,pr_en=%b",rst,clk,coin,pr_en);
endmodule


