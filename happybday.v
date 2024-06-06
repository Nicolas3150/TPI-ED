module happybday(
    input clk,
    output reg speaker
);

wire [15:0] frecuencia_de_nota;
wire [4:0] direccion_nota;
wire [23:0] count_time;

ROM rom_inst (
    .direccion_nota(direccion_nota),
    .frecuencia_de_nota(frecuencia_de_nota)
);

Contador contador_inst (
    .clk(clk),
    .direccion_nota(direccion_nota),
    .count_time(count_time)
);

reg [15:0] count;

initial begin
    speaker = 0;
    count = 0;   // Inicializar count en 0
end

always @(posedge clk) begin
    if (count >= frecuencia_de_nota) begin
        speaker <= ~speaker;
        count <= 0;
    end else begin
        count <= count + 1;
    end
end

endmodule
