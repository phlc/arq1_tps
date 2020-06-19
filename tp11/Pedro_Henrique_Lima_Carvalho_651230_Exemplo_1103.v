/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 11
Exemplo_1103.v
*/

// Mealy-Moore FSM

`include "moore_1010.v"

module Exemplo1103;
reg clk, reset, x;
wire m1;

moore_1010 moore1 (m1, x, clk, reset);

initial
begin
    $display (" Time   X  Moore");

    //initial values
    clk   = 1;
    reset = 0;
    x     = 0;

    //input signal changing
    #5 reset = 1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;

    #30 $finish;
end//initial begin

always
#5 clk=~clk;

always @ (posedge clk)
begin
    $display("%4d %4b %4b", $time, x, m1);
end//always at positive edge clocking changing

endmodule
