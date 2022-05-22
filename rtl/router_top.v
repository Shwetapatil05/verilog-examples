module router_top(input clk, resetn, packet_valid, read_enb_0, read_enb_1, read_enb_2,
		  input [7:0]datain, 
		  output vldout_0, vldout_1, vldout_2, err, busy,
                  output [7:0]data_out_0, data_out_1, data_out_2);
wire [2:0] write_enb;
wire [7:0] dout;               

router_fifo FIFO_0(.clk(clk),.resetn(resetn),.soft_reset(soft_reset_0),
                   .write_enb(write_enb[0]),.read_enb(read_enb_0),
                   .lfd_state(lfd_state),.data_in(dout),.full(full_0),
                   .empty(empty_0),.data_out(data_out_0));

router_fifo FIFO_1(.clk(clk),.resetn(resetn),.soft_reset(soft_reset_1),
                   .write_enb(write_enb[1]),.read_enb(read_enb_1),
                   .lfd_state(lfd_state),.data_in(dout),.full(full_1),
                   .empty(empty_1),.data_out(data_out_1));

router_fifo FIFO_2(.clk(clk),.resetn(resetn),.soft_reset(soft_reset_2),
                   .write_enb(write_enb[2]),.read_enb(read_enb_2),
                   .lfd_state(lfd_state),.data_in(dout),.full(full_2),
                   .empty(empty_2),.data_out(data_out_2));

router_fsm FSM (.clk(clk),.resetn(resetn),.packet_valid(packet_valid),
	        .datain(datain[1:0]),.fifo_full(fifo_full),.fifo_empty_0(empty_0),
                .fifo_empty_1(empty_1),.fifo_empty_2(empty_2),.soft_reset_0(soft_reset_0),
                .soft_reset_1(soft_reset_1),.soft_reset_2(soft_reset_2),.parity_done(parity_done),
                .low_packet_valid(low_packet_valid),.write_enb_reg(write_enb_reg),.detect_add(detect_add),
                .ld_state(ld_state),.laf_state(laf_state),.lfd_state(lfd_state),.full_state(full_state),
                .rst_int_reg(rst_int_reg),.busy(busy));

router_synch SYNCH(.clk(clk),.resetn(resetn),.detect_add(detect_add),.write_enb_reg(write_enb_reg),
                   .read_enb_0(read_enb_0),.read_enb_1(read_enb_1),.read_enb_2(read_enb_2),.empty_0(empty_0),
                   .empty_1(empty_1),.empty_2(empty_2),.full_0(full_0),.full_1(full_1),.full_2(full_2),
                   .datain(datain[1:0]),.vld_out_0(vldout_0),.vld_out_1(vldout_1),.vld_out_2(vldout_2),
		   .write_enb(write_enb),.fifo_full(fifo_full),.soft_reset_0(soft_reset_0),.soft_reset_1(soft_reset_1),
                   .soft_reset_2(soft_reset_2));
router_reg  REG(.clk(clk),.resetn(resetn),.packet_valid(packet_valid),
		  .datain(datain),
		  .fifo_full(fifo_full),.detect_add(detect_add),.ld_state(ld_state),.laf_state(laf_state),.full_state(full_state),
.lfd_state(lfd_state),.rst_int_reg(rst_int_reg),
		  .err(err),.parity_done(parity_done),.low_packet_valid(low_packet_valid),
		   .dout(dout));
endmodule				  





