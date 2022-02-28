module RIN_REG(
	input clk,reset,
	input a,b,
	output y
);

	reg [1:0]state,nextstate;
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;

   always@ (posedge clk, posedge reset)
		if (reset) state <= S0;
		else       state <= nextstate;

	always@ (*)
		case(state)
			S0: if(a)	  nextstate = S0;
			    else	 	  nextstate = S1;
			S1: if(b)	  nextstate = S0;
			    else      nextstate = S2;
			S2: if(a | b) nextstate = S2;
			    else      nextstate = S0;
			default:      nextstate = S0;
		endcase
		
	assign y = (state == S2);
	
endmodule