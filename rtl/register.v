
module register(clk,resetn,pkt_valid,fifo_full,detect_addr,ld_state,laf_state,full_state,lfd_state,rst_int_reg,data_in,
                          err,parity_done,low_packet_valid,dout);
    input clk,resetn,pkt_valid,fifo_full,detect_addr,ld_state,laf_state,full_state,lfd_state,rst_int_reg;    
    input [7:0]data_in;
    output reg err,parity_done,low_packet_valid;
                output reg[7:0]dout;
  
    reg [7:0] hold_header_byte;
    reg [7:0] fifo_full_state_byte;
    reg [7:0] internal_parity;
    reg [7:0] pkt_parity_byte;
                     
                                                                    
    always@(posedge clk)
    begin
    if (~resetn)
          parity_done<=1'b0;
    else if(ld_state&&~fifo_full&&~pkt_valid)
    parity_done<=1'b1;
    else if (laf_state&&low_packet_valid&& ~parity_done)
    parity_done<=1'b1;
    else if (detect_addr)
    parity_done<=1'b0;
    end
    
    
    always@(posedge clk)
    begin 
    if(~resetn)
    low_packet_valid<=1'b0;
    else if (rst_int_reg)
    low_packet_valid<=1'b0;
    else if(ld_state && ~pkt_valid)
    low_packet_valid<=1'b1;
    end
    
    
    always@(posedge clk)
    begin
        if(~resetn)
         dout<=8'b0;    
    if (detect_addr&&pkt_valid)
    hold_header_byte<=data_in;
    else if(lfd_state)
    dout<=hold_header_byte;
    else if (ld_state&&~fifo_full)
    dout<=data_in;
    else if(ld_state&&fifo_full)
    fifo_full_state_byte<=data_in;
    else if(laf_state)
    dout<=fifo_full_state_byte;
    end
    
    
    always@(posedge clk)
    begin
    if (~resetn)
    internal_parity<=8'b0;
    else if (laf_state)
    internal_parity<=internal_parity^hold_header_byte;
    else if(ld_state && pkt_valid && ~full_state)
    internal_parity<=internal_parity^data_in;
    else if (detect_addr)
    internal_parity<=8'b0;
    end
    
    always@(posedge clk)
    begin 
    pkt_parity_byte<=8'b0;
          if(~pkt_valid && ld_state)
    pkt_parity_byte<=data_in;
    end
    
    always@(posedge clk)
    begin
    if(~resetn)
    err<=1'b0;
    else
    begin
    if (parity_done)
    err<=1'b1;
    else 
    err<=1'b0;
    end
    end
    
    endmodule