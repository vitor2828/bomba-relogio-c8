module cronometro(
	input logic clk,
	input logic reset,
	input logic start,
	input logic desarmada,
	
	output logic [3:0] min,
	output logic [3:0] dez_seg,
	output logic [3:0] unid_seg,
	
	output logic explodiu
);
	logic tick;
	logic ativo;
	
	divisor_clock div(
		.clk(clk),
		.reset(reset),
		.tick_1s(tick)
	);
	
	always_ff@(posedge clk, posedge reset) begin
		if(reset) begin
			min<=2;
			dez_seg<=5;
			unid_seg<=9;
			ativo <= 0;
			explodiu <= 0;
		end 
		else if(start) begin
			min<=2;
			dez_seg<=5;
			unid_seg<=9;
			ativo <= 1;
			explodiu <= 0;
		end	
		else if(desarmada) begin
			ativo <= 0;
			explodiu <= 0;
		end
		else if(ativo && tick) begin
		
			if(unid_seg == 0) begin
				unid_seg <= 9;
				
				if (dez_seg == 0) begin
					dez_seg <= 5;
					
					if(min == 0) begin
						//tempo encerrado
						min <= 0;
						dez_seg <= 0;
						unid_seg <= 0;
						ativo <= 0;
						explodiu <= 1;
					
					end else begin
						min <= min - 1;
					end
				end else begin
					dez_seg <= dez_seg - 1;
				end
			end else begin
				unid_seg <= unid_seg - 1;
			end
		end
	end

					
endmodule
