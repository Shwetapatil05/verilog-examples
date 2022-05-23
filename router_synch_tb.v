module router_synch_tb();
reg clk, resetn, detect_add, full_0, full_1, full_2, empty_0, empty_1, empty_2,
     write_enb_reg, read_enb_0, read_enb_1, read_enb_2;

reg [1:0]datain;
wire [2:0]write_enb;
wire fifo_full, soft_reset_0, soft_reset_1, soft_reset_2, vld_out_1, vld_out_2, vld_out_0;

router_synch DUT(.clk(clk), .resetn(resetn),  .detect_add(detect_add), .full_0(full_0), .full_1(full_1), .full_2(full_2), 
		.empty_0(empty_0), .empty_1(empty_1), .empty_2(empty_2),  .write_enb_reg(write_enb_reg),  .read_enb_0(read_enb_0), 
		 .read_enb_1(read_enb_1), .read_enb_2(read_enb_2), .datain(datain), .write_enb(write_enb), .fifo_full(fifo_full),
		.soft_reset_0(soft_reset_0),.soft_reset_1(soft_reset_1),.soft_reset_2(soft_reset_2),  .vld_out_1(vld_out_1),
		.vld_out_2(vld_out_2),.vld_out_0(vld_out_0) ); 
				 
//clock generation
always #5 clk=~clk;

 task initialize;
  begin
   clk=1'b0;
   resetn=1'b1;
   write_enb_reg=1'b0;
   detect_add=1'b0;
   {read_enb_0,read_enb_1,read_enb_2}=3'b000;
   {empty_0,empty_1,empty_2}=3'b000;
   {full_0,full_1,full_2}=3'b000;
  end
 endtask

 task reset;   //active low reset
  begin
   @(negedge clk);
   resetn=1'b0;
   @(negedge clk);
   resetn=1'b1;
  end
 endtask

 task write_enb_reg_input(input w);   
  begin
   write_enb_reg=w;
  end
 endtask 

 task detect_add_input(input d);   
  begin
   detect_add=d;
  end
 endtask 

 task read(input r0,r1,r2);   
  begin
   read_enb_0=r0;
   read_enb_1=r1;
   read_enb_2=r2;
  end
 endtask 

 task empty_input(input e0,e1,e2);   
  begin
   empty_0=e0;
   empty_1=e1;
   empty_2=e2;
  end
 endtask             
 
 task full_input(input f0,f1,f2);   
  begin
   full_0=f0;
   full_1=f1;
   full_2=f2;
  end
 endtask 

 task data_input(input [1:0]in);   
  begin
   datain=in;
  end
 endtask 

 task delay;
  #10;
 endtask

initial
 begin
  initialize;
  reset;
  delay;
  detect_add_input(1'b1);
  data_input(2'b10);                              
  read(1'b1,1'b1,1'b0);
  write_enb_reg_input(1'b1);
  full_input(1'b0,1'b0,1'b1);
  empty_input(1'b1,1'b1,1'b0);
  #100;          
 reset;
  delay;
  detect_add_input(1'b1);
  data_input(2'b01);
  read(1'b1,1'b0,1'b1);
  write_enb_reg_input(1'b1);
  full_input(1'b0,1'b1,1'b0);
  empty_input(1'b1,1'b0,1'b1);

  #550 $finish;
 end
endmodule
