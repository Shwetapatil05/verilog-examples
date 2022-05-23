module clock_buffer(mst_clk,buff_clk);
input mst_clk;
output buff_clk;
buf B1( buff_clk,mst_clk);
endmodule
  
