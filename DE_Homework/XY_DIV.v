module XY_DIV(
	input clk,reset,
	input a,
	output x,y
);

	reg [1:0]x_state,x_nextstate;
	parameter x0 = 2'b00;
	parameter x1 = 2'b01;
	parameter x2 = 2'b10;
	parameter x3 = 2'b11;
	
	reg [1:0]y_state,y_nextstate;
	parameter y0 = 2'b00;
	parameter y1 = 2'b01;
	parameter y2 = 2'b10;

   always@ (posedge clk, posedge reset)
		if (reset) begin
			x_state <= x0;
			y_state <= y0;
		end
		else       begin
		x_state <= x_nextstate;
		y_state <= y_nextstate;
		end

	always@ (*)
		case(x_state)
			x0: if(a) x_nextstate = x1;
			    else  x_nextstate = x0;
			x1: if(a) x_nextstate = x2;
			    else  x_nextstate = x1;
			x2: if(a) x_nextstate = x3;
			    else  x_nextstate = x2;
			x3:       x_nextstate = x3;
			default:  x_nextstate = x0;
		endcase
			
	always@ (*)
		case(y_state)
			y0: if(a) y_nextstate = y1;
			    else  y_nextstate = y0;
			y1: if(a) y_nextstate = y2;
			    else  y_nextstate = y0;
			y2: if(a) y_nextstate = y2;
			    else  y_nextstate = y0;
			default:  y_nextstate = y0;
		endcase
		
	assign x = (x_state == x3);
	assign y = (y_state == y2);
	
endmodule
				
