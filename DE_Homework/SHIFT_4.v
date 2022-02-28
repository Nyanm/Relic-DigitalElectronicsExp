module SHIFT_4(
	input [3:0]a,
	input [1:0]d,
	output reg [3:0]y
);

	always@(a or d)
		begin
			case(d)
				2'b00: y = a;
				2'b01: y = {a[0],a[3:1]};
				2'b10: y = {a[2:0],a[3]};
				default: y = 3'bx;
			endcase
	   end
		
endmodule