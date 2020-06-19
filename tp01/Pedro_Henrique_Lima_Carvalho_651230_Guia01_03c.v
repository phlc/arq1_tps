/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia01 Exercicio 03c.
*/
module Guia_01_03c;
// define data
// decimals
integer x [0:5];
integer i;

//binary
reg [16:0] b;

// actions
initial
begin : main
x[0] = 73;
x[1] = 46;
x[2] = 65;
x[3] = 172;
x[4] = 157;
$display ( "Guia_01 - Ex_03c" );
for (i = 0; i < 5; i = i + 1) begin
  b = x[i];
  $display ( "%d(10) = %d%d%d%d(4) = %o(8) = %x(16)" , x[i], b[7:6], b[5:4], b[3:2], b[1:0], b, b );
end // for
end // main
endmodule // Guia
