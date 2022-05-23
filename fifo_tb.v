module fifo_tb;
reg clk;
reg [7:0] data_in;
reg rd;
reg wr;
reg rst;
wire [7:0] data_out;
wire empty;
wire full;
fifo uut (.clk(clk), .data_in(data_in), .rd(rd), .wr(wr),.data_out(data_out),.rst(rst),.empty(empty), .full(full));
always
begin
#10 clk=~clk;
end
task reset;  
begin
@(negedge clk)
rst=1'b1;
@(negedge clk) 
rst=1'b0;
end
endtask
task initialize;
begin
{clk,rst,rd,wr,data_in}=0;
end
endtask
task enable(input [3:0] i,j);
begin
@(negedge clk)
wr=i;
rd=j;
#10;
end
endtask
task stimulus(input [7:0]k);
begin
@(negedge clk)
data_in=k;
end
endtask
initial
 begin
initialize;
reset;
enable(1'b0,1'b0);
stimulus(8'h1);
#10;
enable(1'b1,1'b0);

stimulus(8'h01);
stimulus(8'h02);
stimulus(8'h03);
stimulus(8'h04);
stimulus(8'h05);
stimulus(8'h06);     
stimulus(8'h07);
stimulus(8'h08);
stimulus(8'h09);
stimulus(8'h0a);
stimulus(8'h0b);
stimulus(8'h0c);
stimulus(8'h0d);
stimulus(8'h0e);
stimulus(8'h0f);

#10;
enable(1'b0,1'b1);
#500 $finish ;

end
initial $monitor("value of clk=%b,rst=%b,rd=%b,wr=%b,data_in=%b,data_out=%b,full=%b,empty=%b",
                    clk,rst,rd,wr,data_in,data_out,full,empty);
endmodule

