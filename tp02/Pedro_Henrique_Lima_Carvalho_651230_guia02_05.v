/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_02 Exercicio 05c.
*/
module Guia_02_05c;
// define data
/*
* Convencao: _ separa a parte fracionaira
*/
reg[10:0] op1 [0:4]; //primeiro operando
reg[10:0] op2 [0:4]; //segundo operando
reg[10:0] result [0:4]; //resultado

// actions
initial
begin : main
op1[0] = 11'b0000101_1100; op2[0] = 11'b0000011_1010;
op1[1] = 11'b0001011_1010; op2[1] = 11'b0000010_0100;
op1[2] = 11'b00000100_101; op2[2] = 11'b000000011_01;
op1[3] = 11'b10101_111000; op2[3] = 11'b000000010_11;
op1[4] = 11'b1110101_0000; op2[4] = 11'b0001001_0000;

//operacoes
result[0] = op1[0] + op2[0];
result[1] = op1[1] - op2[1];
result[2] = op1[2] * op2[2];
result[3] = op1[3] / op2[3]; //result[3] = result[3] << 4;
result[4] = op1[4] % op2[4];
$display ( "Guia_02 - Ex_05c" );
  $display ( "%0b.%b(2) + %0b.%b(2) = %0b.%b(2)", op1[0][10:4], op1[0][3:0],
                                                  op2[0][10:4], op2[0][3:0],
                                                  result[0][10:4], result[0][3:0]);
  $display ( "%0b.%b(2) - %0b.%b(2) = %0b.%b(2)", op1[1][10:4], op1[1][3:0],
                                                  op2[1][10:4], op2[1][3:0],
                                                  result[1][10:4], result[1][3:0]);
  $display ( "%0b.%b(2) * %0b.%b(2) = %0b.%b(2)", op1[2][10:3], op1[2][2:0],
                                                  op2[2][10:2], op2[2][1:0],
                                                  result[2][10:5], result[2][4:0]);
  $display ( "%0b.%b(2) \/ %0b.%b(2) = %0b.%b(2)", op1[3][10:6], op1[3][5:0],
                                                  op2[3][10:2], op2[3][1:0],
                                                  result[3][10:4], result[3][3:0]);
  $display ( "%0b.%b(2) mod %0b.%b(2) = %0b.%b(2)", op1[4][10:4], op1[4][3:0],
                                                  op2[4][10:4], op2[4][3:0],
                                                  result[4][10:4], result[4][3:0]);
end // main
endmodule // Guia
