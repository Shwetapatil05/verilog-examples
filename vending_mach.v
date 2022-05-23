module vending_mach(din,
               clock,
               rst,
               x,y);

   
parameter idle=2'b00,
          s0=2'b01,
          s1=2'b10;
         

input [1:0]din;
input clock; 
input rst;
output reg x,y;

  reg [1:0] state,
            next_state;

always@(posedge clock, posedge rst)
begin
if(rst)
state<=idle;
else
state<=next_state;
end

always@(din,state)
begin
case (state)
      idle   : case(din) 
               2'b00,2'b01: next_state<=idle;
               2'b10: next_state<=s0;
               2'b11: next_state<=s1;
               endcase
             
      s0   : case(din) 
               2'b00,2'b01: next_state<=s0;
               2'b10: next_state<=s1;
               2'b11: next_state<=idle;
               endcase 
     s1   : case(din) 
               2'b00,2'b01: next_state<=s1;
               2'b10: next_state<=idle;
               2'b11: next_state<=idle;
               endcase
   endcase
end        
      
always@(posedge clock,posedge rst)
begin

case(state)
  idle   : case(din) 
               2'b00,2'b01:{x,y}<=2'b00;
               2'b10:{x,y}<=2'b00;
               2'b11:{x,y}<=2'b00;
               default:{x,y}<=2'b00;
               endcase
             
      s0   : case(din) 
              2'b00,2'b01:{x,y}<=2'b00;
               2'b10: {x,y}<=2'b00;
               2'b11: {x,y}<=2'b10;
               default :{x,y}<=2'b00; 
               endcase
     s1   : case(din) 
               2'b00,2'b01:{x,y}<=2'b00;
               2'b10: {x,y}<=2'b10;
               2'b11: {x,y}<=2'b11;
               default :{x,y}<=2'b00;
               endcase
   endcase
end        
endmodule