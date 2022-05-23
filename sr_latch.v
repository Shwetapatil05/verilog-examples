module sr_latch(s_in,r_in,en,q,qb);
input s_in,r_in,en;
output q,qb;
wire w1,w2;
and G1(w1,r_in,en);
and G2(w2,s_in,en);
nor G3(q,w1,qb);
nor G4(qb,w2,q);
endmodule
