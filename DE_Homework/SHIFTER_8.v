module SHIFTER_8(
	input [7:0]a,
	input f,
	output reg [7:0]y
);

	always@(a or f)
		begin
			case(f)
				0: y = a;
				1: y = {a[6:0],1'b0};
			endcase
	end
	
endmodule