/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_05 Exercicio Extra 07 Exemplo 08.
*/
module ex_08 (output s, input a, b);

wire not_a;

nand NOTa (not_a, a, a);

nand NAND1 (s, not_a, b);

endmodule

module control (output s, input a, b);

assign s = a | ~b;

endmodule

module test;

reg x;
reg y;
wire a, b;

ex_08 moduloA (a, x, y);
control moduloB (b, x, y);

//main
initial
begin : main
//id
$display("Guia 05 Ex. 08");

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
