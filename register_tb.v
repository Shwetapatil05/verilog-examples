module register_tb();
  
   reg clk,resetn,pkt_valid,fifo_full,detect_addr,ld_state,laf_state,full_state,lfd_state,rst_int_reg;
   reg [7:0]data_in;
   wire err,parity_done,low_packet_valid;
   wire [7:0]dout;
integer i;
   
   register DUT (clk,resetn,pkt_valid,fifo_full,detect_addr,ld_state,laf_state,full_state,lfd_state,rst_int_reg,data_in,err,parity_done,low_packet_valid,dout);
   
   
   initial                            
   clk=1'b0; 
   always #10 clk=~clk;
   
   
   task initialize;
   begin
     
   {clk,resetn,pkt_valid,fifo_full,detect_addr,ld_state,laf_state,full_state,lfd_state,rst_int_reg,data_in}=0;
     end
   endtask
    
   task reset;
   begin
   @(negedge clk)
   resetn=1'b0;
   @(negedge clk)
   resetn=1'b1;
   end
   endtask
   
  /* task pkt_gen;
   reg [7:0] parity,payload_data,header;
   reg [5:0] pkt_length;
   reg [1:0] addr;
   integer i;
   begin
   @(negedge clk)
     detect_addr=1'b1;
     pkt_valid=1'b1;
     pkt_length=6'd18;
   addr=2'b01;
     header={pkt_length,addr};
     parity=0^header;
     data_in=header;
   @(negedge clk)
     lfd_state=1'b1;
     detect_addr=1'b0;
     for(i=0;i<pkt_length;i=i+1)
    begin
     @(negedge clk)
     lfd_state=1'b0;
     ld_state=1'b1;
      payload_data={$random}%256;
    data_in=payload_data;
    parity=parity^data_in;
    end
   @(negedge clk)
     pkt_valid=1'b0;
     data_in=parity;
   @(negedge clk)
     ld_state=1'b0;
    end
   endtask*/
task packet1();
reg [7:0]header, payload_data, parity;
reg [5:0]payload_len;
reg [1:0] addr;
begin 
@(negedge clk);
payload_len =6'd8;
parity=0;     
addr=2'b01;
detect_addr=1'b1;
pkt_valid=1'b1;
header={payload_len,addr};
data_in=header;
parity=parity^data_in;
@(negedge clk);
detect_addr=1'b0;
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
data_in=payload_data;
parity=parity^ payload_data;				
end
@(negedge clk);	
pkt_valid=0;
data_in=parity;
@(negedge clk);
ld_state=0;
end    
endtask

   
   initial
   begin 
   initialize;
   reset;
   packet1();
   
   #10;
   $finish;   
   end
   
   endmodule
