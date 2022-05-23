module vending_machine_tb();
    
   //Testbench global variables
   reg  i,j,clock,reset;
   wire x,y;
    
   //Parameter constant for CYCLE
   parameter CYCLE = 10;
    
   //DUT Instantiation
   vending_machine FSM(.i(i),.j(j),
         .clock(clock),
         .reset(reset),
         .x(x),.y(y));

   //Step1 : Generate clock, using parameter "CYCLE"  
   initial
     begin
       clock=1'b0;
       forever #(CYCLE/2) clock=~clock;
     end
   /*Step2 : Write a task named "initialize" to initialize 
            the input din of sequence detector*/
   task initialize;
     begin
       {i,j,reset}=0;
     end
   endtask     
   //Delay task
   task delay(input integer d);
      begin
   #d;
      end
   endtask

   /*Step3 : Write a task named "RESET" to reset the design,
            use delay task for adding delays*/
    task RESET;
      begin
        @(negedge clock);
         reset=1'b1;
        @(negedge clock);
         reset=1'b0;
      end
    endtask
   /*Step4 : Write a task named "stimulus" which provides input to
            design on negedge of clock*/
    task stimulus(input m,input n);
      begin
        @(negedge clock);
         i=m;
     j=n;
      end
    endtask       
   //Process to monitor the changes in the variables
   initial 
      $monitor("reset=%b, clock=%b, i=%b,j=%b, Output x=%b,y=%b",
         reset,clock,i,j,x,y);
  initial
      begin
        $dumpfile("dump.vcd");
        $dumpvars;
      end
   /*Process to generate stimulus by calling the tasks and 
   passing the sequence in an overlapping mode*/    
    initial
      begin
         initialize;
   RESET;
        stimulus(0,0);
        stimulus(1,0);
        stimulus(0,1);
        stimulus(1,1);
        stimulus(0,0);
        stimulus(1,0);
        stimulus(1,1);
   RESET;
        stimulus(1,0);
        stimulus(0,1);
        stimulus(1,1);
        stimulus(1,1);
   delay(10);    
   $finish;
      end
endmodule