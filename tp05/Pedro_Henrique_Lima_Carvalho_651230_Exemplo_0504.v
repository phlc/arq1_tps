/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_05 Exercicio 03 Exemplo 04.
*/
module ex_04 (output s, input a, b);

wire not_nand;

nand NAND1 (not_nand, a, b);
nand NAND2 (s, not_nand, not_nand);

endmodule

module control (output s, input a, b);

assign s = a & b;

endmodule

module test;

reg x;
reg y;
wire a, b;

ex_04 moduloA (a, x, y);
control moduloB (b, x, y);

//main
initial
begin : main
//id
$display("Guia 05 Ex. 04");

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
