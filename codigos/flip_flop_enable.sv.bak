module ffd (input logic d, en, clk
            input logic q);

always_ff(posedge clk, posedge en)
    if (en) q <= d;

endmodule