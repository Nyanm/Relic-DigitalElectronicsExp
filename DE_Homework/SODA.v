module SODA(
	input clk,reset,
	input i_5c,i_10c,i_25c,
	output o_soda,o_10c,o_20c
);

	reg [2:0]state,nextstate;
	parameter S0  = 3'b000;
	parameter S5  = 3'b001;
	parameter S10 = 3'b010;
	parameter S15 = 3'b011;
	parameter S20 = 3'b100;
	parameter S25 = 3'b101;
	parameter S35 = 3'b110;
	parameter S45 = 3'b111;

   always@ (posedge clk, posedge reset)
		if (reset) state <= S0;
		else       state <= nextstate;

	always@ (*)
		case(state)
			S0 : if(i_5c)       nextstate = S5   ;
				  else if(i_10c) nextstate = S10  ;
				  else if(i_25c) nextstate = S25  ;
				  else           nextstate = state;
			S5 : if(i_5c)       nextstate = S10  ;
				  else if(i_10c) nextstate = S15  ;
				  else if(i_25c) nextstate = S25  ;
				  else           nextstate = state;
			S10: if(i_5c)       nextstate = S15  ;
				  else if(i_10c) nextstate = S20  ;
				  else if(i_25c) nextstate = S35  ;
				  else           nextstate = state;
			S15: if(i_5c)       nextstate = S20  ;
				  else if(i_10c) nextstate = S25  ;
				  else if(i_25c) nextstate = S35  ;
				  else           nextstate = state;
			S20: if(i_5c)       nextstate = S25  ;
			  	  else if(i_10c) nextstate = S25  ;
				  else if(i_25c) nextstate = S45  ;
				  else           nextstate = state;
			S25:    				  nextstate = S0   ;
			S35: 					  nextstate = S0   ;
			S45:                nextstate = S0   ;
			default             nextstate = S0   ;
		endcase
		
	assign o_soda = (state == S25) | (state == S35) | (state == S45);
	assign o_10c  = (state == S35);
	assign o_20c  = (state == S45);
	
endmodule
		