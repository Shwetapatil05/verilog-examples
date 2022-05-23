module frstin_frstout_tb;
reg Clk;
reg [7:0] dataIn;
reg RD;
reg WR;
reg EN;
reg Rst;
wire [7:0] dataOut;
wire EMPTY;
wire FULL;
integer i;
frstin_frstout uut (.Clk(Clk), .dataIn(dataIn), .RD(RD), .WR(WR), .EN(EN),
.dataOut(dataOut),.Rst(Rst),.EMPTY(EMPTY), .FULL(FULL));
initial begin
Clk = 1'b0;
dataIn = 8'h0;
RD = 1'b0;
WR = 1'b0;
EN = 1'b0;
Rst = 1'b1;
#100;
EN = 1'b1;
Rst = 1'b1;
#20;
Rst = 1'b0;
WR = 1'b1;
dataIn = 8'h0;
#10;
dataIn = 8'h1;
#10;
dataIn = 8'h2;
#10;
dataIn = 8'h3;
#10;
dataIn = 8'h4;
#10;
dataIn = 8'h5;
#10;
dataIn = 8'h6;
#10;
dataIn = 8'h7;
#10;
dataIn = 8'h8;
#10;
dataIn = 8'h9;
#10;
dataIn = 8'ha;
#10;
dataIn = 8'hb;
#10;
dataIn = 8'hc;
#10;
dataIn = 8'hd;
#10;
dataIn = 8'he;
#10;
dataIn = 8'hf;
#20;
WR = 1'b0;
RD = 1'b1;      
end
always #10 Clk = ~Clk;
initial #1000 $finish;
endmodule

