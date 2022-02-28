module LOGIC_1(
	input a, b, c,
	output y
);

	assign y = (a & c) | (~b & c);
	
endmodule