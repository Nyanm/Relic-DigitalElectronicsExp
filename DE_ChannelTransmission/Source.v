module Source(
	input clk,reset_l,
	input [7:0]data,
	output parity,sync,sdata,
	output [4:0]timeslot
);

	reg [7:0]syn_count;	
	always@(posedge clk or negedge reset_l)
		if (!reset_l)
			syn_count <= 8'b1111_1111;
		else
			syn_count <= syn_count + 8'b1;
			
	reg [7:0]pdata;	
	always@(posedge clk or negedge reset_l)
		if (!reset_l)
			pdata <= 8'b0;
		else if (syn_count[2:0] < 3'b111)
			pdata[7:1] <= pdata[6:0];
		else if (syn_count[2:0] == 3'b111)
			pdata <= data;
		else
			pdata <= pdata;
		
	assign sdata = pdata[7];
	assign sync = (syn_count == 8'b0);
	assign parity = ^data;
	assign timeslot = syn_count[7:3];
	
endmodule
