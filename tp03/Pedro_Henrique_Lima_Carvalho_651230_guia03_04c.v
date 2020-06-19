/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_03 Exercicio 04c.
*/
module Guia_03_04c;
// define data
reg signed[5:0] a = 6'b011011; reg signed[5:0] a2 = 6'b001101;
reg signed[7:0] b = 8'b0101_0101; reg signed[7:0] b2 = 8'b0010_0100;
reg signed[6:0] c; reg signed[6:0] c2;
reg signed[9:0] d = 10'o231; reg signed[9:0] d2 = 10'o123;
reg signed[12:0] e = 13'h9D6; reg signed[12:0] e2 = 13'hA1B;

reg signed[5:0] r_a;
reg signed[7:0] r_b;
reg signed[6:0] r_c;
reg signed[9:0] r_d;
reg signed[12:0] r_e;


// actions
initial
begin : main

c[6]=0; c[5:4]=2; c[3:2]=1; c[1:0]=3;
c2[6]=0; c2[5:4]=1; c2[3:2]=3; c2[1:0]=2;

r_a = ~a2 + 1; r_a = a + r_a;
r_b = ~b2 + 1; r_b = b + r_b;
r_c = ~c2 + 1; r_c = c + r_c;
r_d = ~d2 + 1; r_d = d + r_d;
r_e = ~e2 + 1; r_e = e + r_e;


$display ( "Guia_03 - Ex_04c" );
  $display ( "a) %b(2) - %b(2) = %b(2)", a, a2, r_a);
  $display ( "b) %b.%b(2) - %b.%b(2) = %b.%b(2)", b[7:4], b[3:0],
                                                  b2[7:4], b2[3:0],
                                                  r_b[7:4], r_b[3:0]);
  $display ( "c) %d%d%d(4) - %d%d%d(4) = %d%d%d(4)", c[5:4], c[3:2], c[1:0],
                                                     c2[5:4], c2[3:2], c2[1:0],
                                                     r_c[5:4], r_c[3:2], r_c[1:0]);
  $display ( "d) %o(8) - %o(8) = %o(8)", d, d2, r_d);
  $display ( "e) %0h(16) - %0h(16) = -%0h(16)", e, e2, (~r_e + 1));

end // main
endmodule // Guia
