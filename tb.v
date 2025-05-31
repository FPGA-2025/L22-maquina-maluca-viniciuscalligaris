`timescale 1ns/1ps

module tb();

reg clk;
reg rst_n;
reg start;
wire [3:0] state;

maquina_maluca dut (
    .clk   (clk),
    .rst_n (rst_n),
    .start (start),
    .state (state)
);


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    always @(posedge clk) begin
        $display("[%0tns] Estado atual: %0d", $time, state);
    end

    initial begin
        $display("\nPrimeiro ciclo: Sem água no reservatório\n");

        rst_n = 0;
        start = 0;

        #20;
        rst_n = 1;

        #10;

        start = 1;
        #10;
        start = 0;

        #200;

        $display("\nSegundo Ciclo: Água já no reservatório\n");

        start = 1;
        #10;
        start = 0;

        #200;

        $display("\nFim da Simulação\n");
        $finish;
    end

endmodule
