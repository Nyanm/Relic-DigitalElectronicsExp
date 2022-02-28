module Destination(
	input sync,clk,parity,reset_l,
	input sdata,
	output [7:0]pdata,
	output [4:0]timeslot,
	output check
);

	reg [7:0]syn_count;
	always@(posedge clk)
		if (sync)
			syn_count <= 8'b0000_0000;
		else
			syn_count <= syn_count + 8'b1;
			
	reg [7:0]cdata;
	always@(posedge clk)
		cdata <= {cdata[6:0], sdata};

	reg [7:0]odata;
	always@(posedge clk)
		if (syn_count[2:0] == 3'b111)
			odata <= cdata;
		else
			odata <= odata;
			
	reg [1:0]par = 2'b00;
	always@(posedge clk)
		if (syn_count[2:0] == 3'b111)
			par <= {par[0], parity};
		else
			par <= par;
			
	assign pdata = odata;
	assign check = par[1]^(^pdata);
	assign timeslot = syn_count[7:3]; 
			
endmodule