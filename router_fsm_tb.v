module router_fsm_tb();

reg clk,resetn, packet_valid;
reg [1:0]datain;
reg fifo_full, fifo_empty_0, fifo_empty_1, fifo_empty_2, soft_reset_0, soft_reset_1, soft_reset_2, parity_done, low_packet_valid;
wire write_enb_reg, detect_add, ld_state, laf_state, lfd_state, full_state, rst_int_reg, busy;

router_fsm DUT  ( .clk(clk),.resetn(resetn), .packet_valid(packet_valid), .datain(datain),.fifo_full(fifo_full), 
		.fifo_empty_0(fifo_empty_0),.fifo_empty_1(fifo_empty_1),.fifo_empty_2(fifo_empty_2),
                .soft_reset_0(soft_reset_0),.soft_reset_1(soft_reset_1),.soft_reset_2(soft_reset_2), 
                .parity_done(parity_done),.low_packet_valid(low_packet_valid),.write_enb_reg(write_enb_reg), 
		.detect_add(detect_add),.ld_state(ld_state), .laf_state(laf_state),.lfd_state(lfd_state),
	        .full_state(full_state), .rst_int_reg(rst_int_reg), .busy(busy)  );
								  
//clock generation       
initial clk=1;
always
begin 
#5 clk=~clk;
end
	
task reset;
begin
@(negedge clk);
resetn=1'b0;
@(negedge clk);
resetn=1'b1;
end
endtask

task initialize;
begin
clk=1'b0;
resetn=1'b1;
packet_valid=1'b0;
datain=2'b00;
fifo_full=1'b0;
{fifo_empty_0,fifo_empty_1,fifo_empty_2}=3'b000;
{soft_reset_0,soft_reset_1,soft_reset_2}=3'b000;
parity_done=1'b0;
low_packet_valid=1'b0;
end
endtask

        
                 task t1();
                  begin
          @(negedge clk);
          packet_valid=1;
          datain=2'b00;
          fifo_empty_0=1;
          @(negedge clk);
          @(negedge clk);
          packet_valid=0;
          fifo_full=0;
          @(negedge clk);
          @(negedge clk);
          fifo_full=0;
          end
          endtask
          
          task t2();
                  begin
          @(negedge clk);
          packet_valid=1;
          datain=2'b01;
          fifo_empty_1=1;
          @(negedge clk);
          @(negedge clk);
          fifo_full=1;
          @(negedge clk);
          fifo_full=0;
          @(negedge clk);
          parity_done=0;
          low_packet_valid=1;
          @(negedge clk);
          @(negedge clk);
          fifo_full=0;
          end 
          endtask
          
          
          task t3();
          begin
          @(negedge clk);
          packet_valid=1;
          datain=2'b10;
          fifo_empty_2=1;
          @(negedge clk);
          @(negedge clk);
          fifo_full=1;
          @(negedge clk);
          fifo_full=0;
          @(negedge clk);
          parity_done=0;
          low_packet_valid=0;
          @(negedge clk);
          packet_valid=0;
          fifo_full=0;
          @(negedge clk);
          @(negedge clk);
          fifo_full=0;
          end
          endtask
          
          task t4();
                  begin
          @(negedge clk);
          packet_valid=1;
          datain=2'b00;
          fifo_empty_0=1;
          @(negedge clk);
          @(negedge clk);
          packet_valid=0;
          fifo_full=0;
          @(negedge clk);
          @(negedge clk);
          fifo_full=1;
          @(negedge clk);
          fifo_full=0;
          @(negedge clk);
          parity_done=1;
          end
          endtask
          
          initial
          begin 
          initialize;
          reset;
          #10 t1();
          #20 t2();
          #20 t3();
          #20 t4();
#100 $finish;
end 
endmodule
