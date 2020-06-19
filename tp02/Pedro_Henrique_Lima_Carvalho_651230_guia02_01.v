/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_02 Exercicio 01c.
*/
module Guia_02_01c;
// define data
real x; //decimal
real pwFrac; //potencia de 2 para fracionario
real pwInt; //potencia de 2 para inteiro
integer nums = 0; // contador
integer bits = 0; // contador
reg[0:7] fr [0:4]; //parte fracionaria
reg[7:0] it [0:4]; //parte inteira

// actions
initial
begin : main
fr[0] = 8'b10111000;
it[0] = 0;
fr[1] = 8'b01010000;
it[1] = 0;
fr[2] = 8'b01011000;
it[2] = 0;
fr[3] = 8'b01001000;
it[3] = 1;
fr[4] = 8'b11010000;
it[4] = 8'b00000011;
$display ( "Guia_02 - Ex_01c" );
  while (nums<5) begin
    x=0;
    pwFrac=1.0;
    pwInt=0.5;
    while (bits<8) begin
      pwFrac = pwFrac / 2.0;
      pwInt = pwInt * 2.0;
      if (fr[nums][bits] == 1) begin
        x = x + pwFrac;
      end //if
      if (it[nums][bits] == 1) begin
        x = x + pwInt;
      end //if
      bits=bits+1;
    end//while
    bits = 0;
    $display ( "%0b.%8b(2) = %f(10)" , it[nums], fr[nums], x );
    nums=nums+1;
  end//while
end // main
endmodule // Guia
