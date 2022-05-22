 module bi_buff_tb();
wire a,b;
reg cntrl;
reg a_temp,b_temp;
integer i;
bi_buff DUT(.a(a),.b(b),.cntrl(cntrl));
assign a= (cntrl)?a_temp:1'bz;
assign b= (~cntrl)?b_temp:1'bz;
initial 
begin
for(i=0;i<16;i=i+1)
begin
{a_temp,b_temp,cntrl}=i;
#10;
end
end
initial $monitor("value of a=%b,b=%b,cntrl=%b",a,b,cntrl);
endmodule
  