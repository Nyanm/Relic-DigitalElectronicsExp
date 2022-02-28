module TRAFFIC(
	input clk,reset,
	input a,b,
	output [1:0]LA,LB
);

	reg [1:0]state,nextstate;
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;
	parameter S3 = 2'b11;

   always@ (posedge clk, posedge reset)
		if (reset) state <= S0;
		else       state <= nextstate;

	always@ (*)
		case(state)
			S0: if(a) nextstate = S0;
				 else  nextstate = S1;
			S1:       nextstate = S2;
			S2: if(b) nextstate = S2;
				 else  nextstate = S3;
			S3:       nextstate = S0;
			default:  nextstate = S0;
		endcase
		
	assign LA[1] = (state == S2) | (state == S3);
	assign LA[0] = (state == S1);
	assign LB[1] = (state == S0) | (state == S1);
	assign LB[0] = (state == S3);
	
endmodule