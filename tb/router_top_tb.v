
module router_top_tb();
   reg clk,resetn,packet_valid,read_enb_0,read_enb_1,read_enb_2;
   reg [7:0]datain;
   wire vldout_0,vldout_1,vldout_2,err,busy;
   wire [7:0]data_out_0;
   wire [7:0]data_out_1;
   wire [7:0]data_out_2;
    router_top   DUT(.datain(datain),.packet_valid(packet_valid),.clk(clk),.resetn(resetn),.read_enb_0(read_enb_0),.read_enb_1(read_enb_1),
                     .read_enb_2(read_enb_2),.data_out_0(data_out_0),.data_out_1(data_out_1),
                     .data_out_2(data_out_2),.vldout_0(vldout_0),.vldout_1(vldout_1),.vldout_2(vldout_2),.err(err),.busy(busy));
              
    initial 
          clk=1'b0; 
         always #10 clk=~clk;

              task reset;
                  begin
                   resetn=1'b0;
                    {read_enb_0, read_enb_1, read_enb_2, packet_valid, datain}=0;
                     #30;
                      resetn=1'b1;
                       end
                      endtask
         
                 /*task pkt_gen;
               reg [7:0]parity,payload_data,header;
          reg [5:0]pkt_length;
          reg [1:0]addr;
          integer i;
          begin
          @(negedge clk)
          addr=2'b01;
          packet_valid=1'b1;
          pkt_length=6'd10;
          header={pkt_length,addr};
          parity=header;
          datain=parity;
          
          @(negedge clk)
          for(i=0;i<pkt_length;i=i+1)
          begin
          @(negedge clk)
          payload_data=($random)%256;
          datain=payload_data;
          parity=parity^datain;
          end
          
          @(negedge clk)
          packet_valid=1'b0;
          datain=parity;
          @(negedge clk)
          read_enb_2=1'b1;
          end
          endtask*/
task pkt_gen;
   reg[7:0] payload_data,parity,header;
   reg[5:0] payload_len;
   reg[1:0] addr;
   integer i;
 begin 
 @(negedge clk);
  wait(~busy)
  @(negedge clk);
  payload_len=6'd20;
  addr=2'b01;
  header={payload_len,addr};
  parity=1'b0;
  datain=header;
  packet_valid=1'b1;
  parity=parity^header;

   @(negedge clk);
    wait(~busy)
   for(i=0;i<payload_len;i=i+1)
    begin
  @(negedge clk);
   wait(~busy)
   payload_data={$random}%256;
   datain=payload_data;
   parity=parity^payload_data;
@(negedge clk);
    wait(~busy)
   for(i=0;i<payload_len;i=i+1)
    begin
  @(negedge clk);
   wait(~busy)
   payload_data={$random}%256;
   datain=payload_data;
   parity=parity^payload_data;
  end
  @(negedge clk);
    wait(~busy)
  packet_valid=1'b0;
  datain=parity;
@(negedge clk);
read_enb_1=1'b1;
 end
end
 endtask
initial 
          begin
          reset;
          #10;
          pkt_gen;
          #100 reset;
          $finish;
          end
          
          endmodule
