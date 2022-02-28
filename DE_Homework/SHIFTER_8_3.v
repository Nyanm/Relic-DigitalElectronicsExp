module SHIFTER_8_3(
	input [1:0]switch,
	input [7:0]a,
	output reg [7:0]y
);

	wire [2:0]f;
	
	assign f[0] = (switch > 0);
	assign f[1] = (switch > 1);
	assign f[2] = (switch > 2);

	wire [7:0]w,x;
	
	SHIFTER_8 SS1(
		.a (a),
		.f (f[0]),
		.y (w)
	);
	SHIFTER_8 SS2(
		.a (w),
		.f (f[1]),
		.y (x)
	);
	SHIFTER_8 SS3(
		.a (x),
		.f (f[2]),
		.y (y)
	);
	
endmodule