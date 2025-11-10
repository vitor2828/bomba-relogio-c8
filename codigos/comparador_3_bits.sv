module comparador_3_bits (input logic [2:0] q1,
                          input logic [2:0] q2,
                          input logic enable,
                          output logic s);

    always_comb begin
        s = 0;
        if (enable) begin
            s = 1;
            for (int i = 0; i < 3; i++) begin
                if (q1[i] != q2[i]) begin
                    s = 0;
                    break;
                end
            end
        end
    end
endmodule