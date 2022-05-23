module encoder8to3_behav(i,y,valid);
input [7:0]i;
output reg [2:0]y;
output reg valid;
always @(i)
begin
if(i[7]== 1'b1)
y=3'b111;
else if (i[6]== 1'b1)
y=3'b110;
else if (i[5]== 1'b1)
y=3'b101;
else if (i[4]== 1'b1)
y=3'b100;
else if (i[3]== 1'b1)
y=3'b011;
else if (i[2]== 1'b1)
y=3'b010;
else if (i[1]== 1'b1)
y=3'b001;
else if (i[0]== 1'b1)
y=3'b000;
else 
y=3'bzzz;
if (i== 8'd0)
valid=1'b0;
else
valid=1'b1;
end
endmodule
