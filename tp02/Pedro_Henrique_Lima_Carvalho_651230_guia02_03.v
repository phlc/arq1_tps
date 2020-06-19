/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_02 Exercicio 03c.
*/
module Guia_02_03c;
// define data
reg[0:7] fr [0:4]; //parte fracionaria
reg[7:0] it [0:4]; //parte inteira

// actions
initial
begin : main
fr[0] = 8'b10110000;
it[0] = 0;
fr[1] = 8'b10110100;
it[1] = 0;
fr[2] = 8'b10101000;
it[2] = 0;
fr[3] = 8'b11111000;
it[3] = 1;
fr[4] = 8'b11100000;
it[4] = 8'b00001011;
$display ( "Guia_02 - Ex_03c" );

$display ( "%0b.%8b(2) = %0d.%d%d(4)" , it[0], fr[0], it[0], fr[0][0:1], fr[0][2:3] );
$display ( "%0b.%8b(2) = %0o.%o%o(8)" , it[1], fr[1], it[1], fr[1][0:2], fr[1][3:5] );
$display ( "%0b.%8b(2) = %0x.%x%x(16)" , it[2], fr[2], it[2], fr[2][0:3], fr[2][4:7] );
$display ( "%0b.%8b(2) = %0o.%o%o(8)" , it[3], fr[3], it[3], fr[3][0:2], fr[3][3:5] );
$display ( "%0b.%8b(2) = %0x.%x%x(16)" , it[4], fr[4], it[4], fr[4][0:3], fr[4][4:7] );

end // main
endmodule // Guia
