module PRIME_NUM(
	input [0:3]a,
	output p, d
);
	
	wire a1,a2,a3,a4,a5,a6,a7,a8,a9;
	
	assign a1 = (~a[0] &  a[1] &  a[3]);
	assign a2 = (~a[0] &  a[2] &  a[3]);
	assign a3 = ( a[1] &  a[2] &  a[3]);
	assign a4 = (~a[0] & ~a[1] &  a[2]);
	assign a5 = ( a[0] & ~a[1] & ~a[2] &  a[3]);
	assign a6 = (~a[0] & ~a[1] &  a[2] &  a[3]);
	assign a7 = (~a[0] &  a[1] &  a[2] & ~a[3]);
	assign a8 = ( a[0] &  a[1] & ~a[2] & ~a[3]);
	assign a9 = ( a[0] &  a[1] &  a[2] &  a[3]);
	
	assign p = a1 | a2 | a3 | a4 | a5;
	assign d = a5 | a6 | a7 | a8 | a9;
	
endmodule