module half_sub(a,b,diff,barrow);
input a,b;
output diff,barrow;
assign diff= a^b;
assign barrow= ~a & b;
endmodule         
    
               