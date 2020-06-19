/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_03 Exercicio 01c.
*/
module Guia_02_05c;
// define data

reg[7:0] op1 [0:4]; //primeiro operando
reg[7:0] result [0:4]; //resultado

// actions
initial
begin : main
op1[0] = 8'b00001010;
op1[1] = 8'b00001100;
op1[2] = 8'b00101011;
op1[3] = 8'b00010111;
op1[4] = 8'b00011001;

result[0] = ~op1[0];
result[1] = ~op1[1];
result[2] = ~op1[2] + 1;
result[3] = ~op1[3] + 1;
result[4] = ~op1[4] + 1;

$display ( "Guia_03 - Ex_01c" );
  $display ( "a) %b(2) -> C1(a) = %b(2)", op1[0], result[0]);
  $display ( "b) %b(2) -> C1(b) = %b(2)", op1[1], result[1]);
  $display ( "c) %b(2) -> C2(c) = %b(2)", op1[2], result[2]);
  $display ( "d) %b(2) -> C2(d) = %b(2)", op1[3], result[3]);
  $display ( "e) %b(2) -> C2(e) = %b(2)", op1[4], result[4]);

end // main
endmodule // Guia
