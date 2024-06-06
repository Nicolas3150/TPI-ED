module Contador(
    input clk,
    output reg [4:0] direccion_nota,
    output reg [23:0] count_time
);

parameter time_for_note = 6000000; // 60MHz, así cada nota dura medio segundo

initial begin
    count_time = 0;
    direccion_nota = 0;
end

always @(posedge clk) begin
    if (count_time >= time_for_note - 1) begin
        if (direccion_nota < 24) begin
            direccion_nota <= direccion_nota + 1;
        end else begin
            direccion_nota <= 0; // Reiniciar la melodía
        end
        count_time <= 0;
    end else begin
        count_time <= count_time + 1;
    end
end

endmodule
