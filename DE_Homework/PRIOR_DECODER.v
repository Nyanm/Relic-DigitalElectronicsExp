module PRIOR_DECODER(
	input [7:0]a,
	output reg [2:0]y,
	output reg NONE
);

	always@ (*)
		if (a) NONE <= 0;
		else   NONE <= 1;
		
	always@ (*)
		if      (a[7]) y <= 3'b111;
		else if (a[6]) y <= 3'b110;
		else if (a[5]) y <= 3'b101;
		else if (a[4]) y <= 3'b100;
		else if (a[3]) y <= 3'b011;
		else if (a[2]) y <= 3'b010;
		else if (a[1]) y <= 3'b001;
		else if (a[0]) y <= 3'b000;
		else           y <= 3'bxxx;
	
endmodule