module register_senha_A (
	input logic clk,
	input logic en,
	input logic [3:0] d,
	output logic [3:0] q
);

	always_ff@(posedge clk, posedge en) begin
		if (en) begin
			q <= d;
		end
	end
		
endmodule

