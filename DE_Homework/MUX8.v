module MUX8(
	input [2:0] S,
   input d0,d1,d2,d3,d4,d5,d6,d7,
	output reg y);

	always@(*)
		case(S)
			0:y = d0;
			1:y = d1;
			2:y = d2;
			3:y = d3;
			4:y = d4;
			5:y = d5;
			6:y = d6;
			7:y = d7;
			default:y = 1'bz;
		endcase
endmodule