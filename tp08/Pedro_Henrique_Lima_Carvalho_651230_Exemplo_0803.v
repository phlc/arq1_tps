/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 08
Exemplo0803
*/

module Exemplo0803;

//definicoes
integer i, j;
reg[3:0] a, b;
wire[3:0] bitwise;
wire logical;

xnor XNOR0 (bitwise[0], a[0], b[0]);
xnor XNOR1 (bitwise[1], a[1], b[1]);
xnor XNOR2 (bitwise[2], a[2], b[2]);
xnor XNOR3 (bitwise[3], a[3], b[3]);

and(logical, bitwise[0], bitwise[1], bitwise[2], bitwise[3]);

initial
begin: main
$display("Exemplo_0803");
$display("Pedro Henrique Lima Carvalho 651230");
$display("  a      b      bitwise  | logical");

a=0; b=0;

//monitor
#1 $monitor("%b %b %b | %b", a, b, bitwise[3:0], logical);

for (i = 0; i < 16; i=i+1) begin
  for (j = 0; j < 16; j=j+1) begin
    #1 a=i; b=j;
  end
end
end
endmodule
