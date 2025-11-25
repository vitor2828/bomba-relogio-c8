module divisor_clock(
	input logic clk,
	input logic reset,
	output logic tick_1s //pulso de 1 ciclo por seg
);
	parameter FREQ = 5; //50MHz. FREQ=5000000, foi usado 5 apenas para teste
	int contador;
	
	always_ff@(posedge clk, posedge reset) begin
		if(reset) begin
			contador <= 0;
			tick_1s <= 0;
		end else begin
			if (contador == FREQ - 1) begin
			contador <= 0;
			tick_1s <= 1; // Gera o pulso
			end else begin
				contador <= contador + 1;
				tick_1s <= 0;
			end
		end
	end
endmodule
