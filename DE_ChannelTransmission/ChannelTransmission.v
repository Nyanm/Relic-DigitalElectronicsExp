module ChannelTransmission(
	input [7:0]data_in,
	input reset_l,clk,
	output [7:0]data_out,
	output parity,
	output [4:0]TS_in,TS_out
);

wire sync,par_check,sdata;

Source S
(
	.data     (data_in),
	.clk      (clk),
	.reset_l  (reset_l),
	.parity   (par_check),
	.sync     (sync),
	.sdata    (sdata),
	.timeslot (TS_in)
);

Destination D
(
	.sync		 (sync),
	.clk		 (clk),
	.parity	 (par_check),
	.sdata	 (sdata),
	.pdata    (data_out),
	.timeslot (TS_out),
	.check	 (parity),
	.reset_l  (reset_l)
);

endmodule