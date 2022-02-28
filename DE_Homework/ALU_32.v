module ALU_32(
	input [31:0]a,b,
	input [2:0]f,
	output reg [31:0]y
);

	always@(f or a or b)
		begin
			case(f)
				3'b000: y = a&b;
				3'b001: y = a|b;
				3'b010: y = a+b;
				3'b100: y = a&(~b);
				3'b101: y = a|(~b);
				3'b110: y = a-b;
				3'b111: y = a<b;
				default:y = 0;
			endcase
		end

endmodule
				