/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_05 Exercicio 01 Exemplo 02.
*/
module ex_02 (output s, input a, b);

wire not_a;
wire not_b;

nand NOTa (not_a, a, a);
nand NOTb (not_b, b, b);
nand NANDab (s, not_a, not_b);

endmodule //ex_02

module control (output s, input a, b);

assign s = a | b;

endmodule

module test;

reg x;
reg y;
wire a, b;

ex_02 moduloA (a, x, y);
control moduloB (b, x, y);

//main
initial
begin : main
//id
$display("Guia 05 Ex. 02");

//monitor
$display("  x   y   NAND   Controle");

//first signal
#1 x=1'b0; y=1'b0;

$monitor("%3b %3b %4b %8b", x, y, a, b);

//signals
#1 x=0; y=1;
#1 x=1; y=0;
#1 x=1; y=1;

end // main
endmodule // Guia
