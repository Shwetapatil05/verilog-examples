module router_reg_tb();

reg clk, resetn, packet_valid,fifo_full, detect_add, ld_state, laf_state, full_state, lfd_state, rst_int_reg;
reg [7:0] datain;
wire err, parity_done, low_packet_valid;
wire [7:0]dout;
integer i;
router_reg DUT( .clk(clk),.resetn(resetn),.packet_valid(packet_valid),.fifo_full(fifo_full),.detect_add(detect_add),
		.ld_state(ld_state),.laf_state(laf_state),.full_state(full_state),.lfd_state(lfd_state),
		.rst_int_reg(rst_int_reg),.datain(datain),.err(err),.parity_done(parity_done),.low_packet_valid(low_packet_valid),
		.dout(dout));   


//clock generation
initial clk=1;
always  
begin 
#5 clk=~clk;
end

task initialize();
begin 
datain=0;
end
endtask
	
task reset;
begin
resetn=1'b0;
#10;
resetn=1'b1; 
end
endtask
	
	
task packet1();
reg [7:0]header, payload_data, parity;
reg [5:0]payload_len;
reg [1:0] addr;
begin
@(negedge clk);
payload_len =6'd8;
parity=0;     
addr=2'b01;
detect_add=1'b1;
packet_valid=1'b1;
header={payload_len,addr};
datain=header;
parity=parity^datain;
@(negedge clk);
detect_add=1'b0;
lfd_state=1'b1;
full_state=1'b0;
fifo_full=1'b0;
laf_state=1'b0;
for(i=0;i<payload_len;i=i+1)	
begin
@(negedge clk);	
lfd_state=0;
ld_state=1;
payload_data={$random}%256;
datain=payload_data;
parity=parity^ payload_data;				
end
@(negedge clk);	
packet_valid=0;
datain=parity;
@(negedge clk);
ld_state=0;
end    
endtask

initial
begin
initialize();
reset;
packet1();
#500;
$finish;
end
endmodule
