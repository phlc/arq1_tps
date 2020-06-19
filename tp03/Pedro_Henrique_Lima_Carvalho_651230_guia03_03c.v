/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_03 Exercicio 03c.
*/
module Guia_03_03c;
// define data
reg[3:0] a = 4'b1001;
reg[5:0] b = 6'b111011;
reg[5:0] c = 6'b110101;
reg[6:0] d = 7'b1010111;
reg[7:0] e = 8'b10111001;

reg[3:0] r_a;
reg[5:0] r_b;
reg[5:0] r_c;
reg[6:0] r_d;
reg[7:0] r_e;


// actions
initial
begin : main

r_a = ~a + 1;
r_b = ~b + 1;
r_c = ~c + 1;
r_d = ~d + 1;
r_e = ~e + 1;

$display ( "Guia_03 - Ex_03c" );
  $display ( "a) %b(2) -> C2(a) = %d(10)", a, r_a);
  $display ( "b) %b(2) -> C2(b) = %d(10)", b, r_b);
  $display ( "c) %b(2) -> C2(c) = %b(2)", c, r_c);
  $display ( "d) %b(2) -> C2(d) = %b(2)", d, r_d);
  $display ( "e) %b(2) -> C2(e) = %h(16)", e, r_e);

end // main
endmodule // Guia
