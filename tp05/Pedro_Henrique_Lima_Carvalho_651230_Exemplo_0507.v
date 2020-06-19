/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_05 Exercicio 06 Exemplo 07.
*/
module ex_07 (output s, input a, b);

wire not_a, not_b;
wire nor_1, nor_2;

nor NOTa (not_a, a, a);
nor NOTb (not_b, b, b);

nor NOR1 (nor_1, not_b, a);
nor NOR2 (nor_2, not_a, b);
nor NOR3 (s, nor_1, nor_2);

endmodule

module control (output s, input a, b);

assign s = ~(a ^ b);

endmodule

module test;

reg x;
reg y;
wire a, b;

ex_07 moduloA (a, x, y);
control moduloB (b, x, y);

//main
initial
begin : main
//id
$display("Guia 05 Ex. 07");

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
