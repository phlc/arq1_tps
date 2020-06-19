/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_03 Exercicio 05c.
*/
module Guia_03_05c;
// define data
reg [7:0] a = 8'b00101010; reg [7:0] a2 = 8'b00001101;
reg [7:0] b = 8'b0101_1011; reg [7:0] b2;
reg [7:0] c; reg [7:0] c2 = 8'hD;
reg [7:0] d = 8'hBC; reg [7:0] d2 = 8'b01001111;
reg [7:0] e = 36; reg [7:0] e2 = 8'h2A;

reg [7:0] r_a;
reg [7:0] r_b;
reg [7:0] r_c;
reg [7:0] r_d;
reg [7:0] r_e;


// actions
initial
begin : main

//base 4
b2[7]=0; b2[6:4]=2; b2[3:1]=5; b2[0]=0;
c[7:6]=0; c[5:4]=3; c[3:2]=1; c[1:0]=2;

r_a = ~a2 + 1; r_a = a + r_a;
r_b = ~b2 + 1; r_b = b + r_b;
r_c = ~c2 + 1; r_c = c + r_c;
r_d = ~d2 + 1; r_d = d + r_d;
r_e = ~e2 + 1; r_e = e + r_e;


$display ( "Guia_03 - Ex_05c" );
  $display ( "a) %b(2) - %b(2) = %b(2)", a, a2, r_a);
  $display ( "b) %b.%b(2) - %d.%d(8) = %b.%b(2)", b[7:4], b[3:0],
                                                  b2[7:4], b2[3:0],
                                                  r_b[7:4], r_b[3:0]);
  $display ( "c) %d%d%d(4) - %0h(16) = %b(2)", c[5:4], c[3:2], c[1:0],
                                                     c2,
                                                     r_c);
  $display ( "d) %h(16) - %b(2) = %b(2)", d, d2, r_d);
  $display ( "e) %d(10) - %0h(16) = %b(2)", e, e2, r_e);

end // main
endmodule // Guia
