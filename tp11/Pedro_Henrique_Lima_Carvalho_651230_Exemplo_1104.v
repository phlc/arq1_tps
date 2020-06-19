/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 11
Exemplo_1104.v
*/

// FSM

`include "fsm_101.v"

module Exemplo1104;
reg clk, reset, x;
wire m1;

fsm_101 fsm1 (m1, x, clk, reset);

initial
begin
    $display (" Time   X  FSM");

    //initial values
    clk   = 1;
    reset = 0;
    x     = 0;

    //input signal changing
    #5 reset = 1;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;
    #10 x=1;
    #10 x=0;

    #30 $finish;
end//initial begin

always
#5 clk=~clk;

always @ (posedge clk)
begin
    $display("%4d %4b %4b", $time, x, m1);
end//always at positive edge clocking changing

endmodule
