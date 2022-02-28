module SEU(
	input [3:0]a,
	output [7:0]y
);

	assign y = {a[3],a[3],a[3],a[3],a};

endmodule
