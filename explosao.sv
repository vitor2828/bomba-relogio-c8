module explosao(

			input logic clk,
			output logic [6:0] hex7,
			output logic [6:0] hex6,
			output logic [6:0] hex5,
			output logic [6:0] hex4,
			output logic [6:0] hex3,
			output logic [6:0] hex2,
			output logic [6:0] hex1,
			output logic [6:0] hex0,
			output logic [17:0] leds
		);
	
	typedef enum logic [1:0] {ESTADO1, ESTADO2, ESTADO3} statetype;
	statetype state, nextstate;
	
	always_ff @(posedge clk)
		state <= nextstate;

	always_comb
		case (state)

			ESTADO1: nextstate = ESTADO2;
			
			ESTADO2: nextstate = ESTADO3;

			ESTADO3: nextstate = ESTADO1;

			default: nextstate = ESTADO1;
		endcase

	always_comb
		case (state)

			ESTADO1:		begin
							hex7 = 7'b0101110;
							hex6 = 7'b1011101;
							hex5 = 7'b1110010;
							hex4 = 7'b1101100;
							hex3 = 7'b0000001;
							hex2 = 7'b1100000;
							hex1 = 7'b0001000;
							hex0 = 7'b1000001;
							leds = 18'b100101101100101111;
						end

			ESTADO2:		begin
							hex7 = 7'b1011110;
							hex6 = 7'b0101101;
							hex5 = 7'b0000010;
							hex4 = 7'b0011100;
							hex3 = 7'b1110001;
							hex2 = 7'b0010000;
							hex1 = 7'b1111000;
							hex0 = 7'b0110001;
							leds = 18'b011010110000101111;
						end

			ESTADO3:		begin
							hex7 = ~7'b0101110;
							hex6 = ~7'b1011101;
							hex5 = ~7'b1110010;
							hex4 = ~7'b1101100;
							hex3 = ~7'b0000001;
							hex2 = ~7'b1100000;
							hex1 = ~7'b0001000;
							hex0 = ~7'b1000001;
							leds = ~18'b100101101100101111;
						end

			default:		begin
							hex7 = 7'b0101110;
							hex6 = 7'b1011101;
							hex5 = 7'b1110010;
							hex4 = 7'b1101100;
							hex3 = 7'b0000001;
							hex2 = 7'b1100000;
							hex1 = 7'b0001000;
							hex0 = 7'b1000001;
							leds = 18'b100101101100101111;
						end
		endcase
endmodule