module vending_fsm(clk,rst,coin,pr_en);

input clk,rst;
input [1:0] coin;
output pr_en;
reg [10:0] counter;
reg time_out;      

parameter s0=3'b000,
          s25=3'b001,
          s50=3'b010,
          s75=3'b011,
          s100=3'b100;
          
reg [2:0] present_state,next_state;

//present state logic
always@(posedge clk)
begin
   if(rst)
     present_state <= s0;
else if(time_out)
     present_state <=s0;
else
    present_state <=next_state;
end

//counter logic
always@(posedge clk)
begin
   if(rst)
      begin
    counter <=0;
    time_out<=0;
      end
   else if(counter==11'b10100000000)
         time_out <=1'b1;
   else
       begin
      counter<= counter+1;
       time_out <= 1'b0;
       end
end

   
//next state logic
always@(*)
begin
     next_state= s0;
     case(present_state)

 s0:begin
       if(coin==2'b00)
           next_state=s25;
      else if(coin==2'b01)
           next_state=s50;
      else if(coin==2'b10)
            next_state=s100;
      else
          next_state=s0;
     end

s25:begin
     if(coin==2'b00)
            next_state=s50;
     else if(coin==2'b01)
            next_state=s75;
     else if(coin==2'b10)
            next_state=s100;
     else
       next_state=s25;
    end

s50: begin
     if(coin==2'b00)
        next_state=s75;
     else if((coin== 2'b01) || (coin==2'b10))
           next_state=s100;
     else
        next_state=s50;
     end

s75:begin
    if((coin==2'b00)||(coin==2'b01)||(coin==2'b10))
           next_state=s100;
     else
         next_state=s75;
     end

s100: next_state=s0;
   endcase
end

assign pr_en=(present_state==s100);

endmodule

 




