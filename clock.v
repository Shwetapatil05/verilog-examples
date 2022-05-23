module clock;
reg clk;
initial clk=0;
always #10 clk=~clk;
endmodule                   
         