/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_03 Exercicio 02c.
*/
module Guia_03_02c;
// define data
reg[5:0] a;
reg[7:0] b = 8'h4D;
reg[5:0] c;
reg[6:0] d;
reg[7:0] e = 8'hE4;

reg[5:0] r_c;
reg[6:0] r_d;
reg[7:0] r_e;


// actions
initial
begin : main

a[5:4] = 3; a[3:2] = 1; a[1:0] = 2;
c[5:4] = 0; c[3:2] = 3; c[1:0] = 1;
d[6] = 1; d[5:3] = 3; d[2:0] = 7;

r_c = ~c + 1;
r_d = ~d + 1;
r_e = ~e + 1;

$display ( "Guia_03 - Ex_02c" );
  $display ( "a) 312(4) -> C1(a) = %b(2)", ~a);
  $display ( "b) 4D(16) -> C1(b) = %b(2)", ~b);
  $display ( "c) 31(4) -> C2(c) = %b(2)", r_c);
  $display ( "d) 137(8) -> C2(d) = %b(2)", r_d);
  $display ( "e) E4(16) -> C2(e) = %b(2)", r_e);

end // main
endmodule // Guia
