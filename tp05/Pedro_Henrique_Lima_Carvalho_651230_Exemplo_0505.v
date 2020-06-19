/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_05 Exercicio 04 Exemplo 05.
*/
module ex_05 (output s, input a, b);

wire not_nor;

nor NOR1 (not_nor, a, b);
nor NOR2 (s, not_nor, not_nor);

endmodule

module control (output s, input a, b);

assign s = a | b;

endmodule

module test;

reg x;
reg y;
wire a, b;

ex_05 moduloA (a, x, y);
control moduloB (b, x, y);

//main
initial
begin : main
//id
$display("Guia 05 Ex. 05");

//monitor
$display("  x   y   NOR   Controle");

//first signal
#1 x=1'b0; y=1'b0;

$monitor("%3b %3b %4b %8b", x, y, a, b);

//signals
#1 x=0; y=1;
#1 x=1; y=0;
#1 x=1; y=1;

end // main
endmodule // Guia
