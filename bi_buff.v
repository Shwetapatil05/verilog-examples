 module bi_buff(a,b,cntrl);
inout a,b;
input cntrl;
bufif1 BUF1(b,a,cntrl);
bufif0 BUF2(a,b,cntrl);
endmodule                                    
 