/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_05  Exemplo 01.
*/
module f5a (output s, input a, b);

wire not_a;
not NOT1 (not_a, a);
and AND1 (s, not_a, b);

endmodule //f5

module f5b (output s, input a, b);

assign s = ~a & b;

endmodule

module test_f5;

reg x;
reg y;
wire a, b;

f5a moduloA (a, x, y);
f5b moduloB (b, x, y);

//main
initial
begin : main
//id
$display("Guia 05 Ex. 01");

//monitor
$display("  x   y   a   b");

//first signal
#1 x=1'b0; y=1'b0;

$monitor("%3b %3b %3b %3b", x, y, a, b);

//signals
#1 x=0; y=1;
#1 x=1; y=0;
#1 x=1; y=1;

end // main
endmodule // Guia
