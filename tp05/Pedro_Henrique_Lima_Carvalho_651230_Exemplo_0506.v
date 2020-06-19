/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_05 Exercicio 05 Exemplo 06.
*/
module ex_06 (output s, input a, b);

wire not_a, not_b;
wire nand_1, nand_2;

nand NOTa (not_a, a, a);
nand NOTb (not_b, b, b);

nand NAND1 (nand_1, not_a, b);
nand NAND2 (nand_2, not_b, a);
nand NAND3 (s, nand_1, nand_2);

endmodule

module control (output s, input a, b);

assign s = a ^ b;

endmodule

module test;

reg x;
reg y;
wire a, b;

ex_06 moduloA (a, x, y);
control moduloB (b, x, y);

//main
initial
begin : main
//id
$display("Guia 05 Ex. 06");

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
