module example_tb();
reg[2:0]a;
initial 
begin
a<=3'd5;
a<= #5 3'd0;
a<= #10 3'd7;
#20 $finish;
$monitor("value of a=%b",a);
end               
endmodule                                                  
                  
            