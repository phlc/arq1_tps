/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia01 Exercicio 01c.
*/
module Guia_01_01c;
// define data
// decimals
integer x [0:5];
integer i;

//binary
reg [16:0] b = 0;

// actions
initial
begin : main
x[0] = 27;
x[1] = 51;
x[2] = 721;
x[3] = 123;
x[4] = 366;
$display ( "Guia_01 - Ex_01c" );
for (i = 0; i < 5; i = i + 1) begin
  b = x[i];
  $display ( "%d(10) = %16b(2)" , x[i], b );
end // for
end // main
endmodule // Guia
