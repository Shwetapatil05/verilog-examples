module single_port_ram_tb();
   wire [15:0] data;
   reg  [2:0] addr;
   reg  we,enable;
   reg  [15:0] tempd;

   integer l;

   //Step1 : Instantiate the RAM module and connect the ports
   single_port_ram DUT(.we_in(we),
	   .enable_in(enable),
	   .addr_in(addr),
           .data(data));
   //Understand how the wire data acts like an input during write operation
   assign data=(we && !enable) ? tempd : 16'hzzzz;

   //Tasks for Initialising the inputs
   task initialize();
      begin
	 we=1'b0; enable=1'b0; tempd=16'h0000;
      end
   endtask

   /*Step2 : Write a task named "stimulus" to assign data into
   "addr" and "tempd" inputs through i and j variables*/
   task stimulus(input [2:0]i,
		 input [15:0]j);
      begin
	 addr = i;
	 tempd = j;
      end
   endtask


   //Understand the various tasks used in this testbench
   task write();
      begin
	 we=1'b1;
	 enable=1'b0;
      end
   endtask

   task read();
      begin
	 we=1'b0;
	 enable=1'b1; 
      end
   endtask

   task delay;
      begin
	 #10;
      end
   endtask
		
   //Process to generate stimulus using for loop
   initial
      begin
         initialize;
	 delay;
	 write;
	 for(l=0;l<8;l=l+1)
	    begin
	       stimulus(l,l);
	       delay;
	    end
	       initialize;
	       delay;
	       read;
	 for(l=0;l<8;l=l+1)
	    begin
	       stimulus(l,l);
	       delay;
	    end
	       delay;
	       $finish;
      end
			
   //Use $monitor to display the various inputs and outputs
   initial
      begin
	 $monitor("Values of addr=%d,data=%d,we=%d,enable=%d",we,enable,addr,data);
      end	
				
  

endmodule

