/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_02 Exercicio 04c.
*/
module Guia_02_04c;
// define data
reg[0:8] fr [0:4]; //parte fracionaria
reg[7:0] it [0:4]; //parte inteira

// actions
initial
begin : main
fr[0][0:1] = 1; fr[0][2:3] = 3; fr[0][4:5] = 2;
it[0] = 0;
fr[1][0:1] = 3; fr[1][2:3] = 1; fr[1][4:5] = 2; fr[1][6:7] = 0;
it[1] = 0;
fr[2][0:2] = 3; fr[2][3:5] = 5; fr[2][6:8] = 7;
it[2] = 0;
fr[3][0:2] = 3; fr[3][3:5] = 5; fr[3][6:8] = 0;
it[3] = 4;
fr[4][0:3] = 'h6; fr[4][4:7] = 'h7; fr[4][8] = 0;
it[4] = 'hC;
$display ( "Guia_02 - Ex_04c" );

$display ( "%0d.%d%d%d(4) = %0b.%b%b%b(2)" , it[0], fr[0][0:1], fr[0][2:3], fr[0][4:5],
                                             it[0], fr[0][0:1], fr[0][2:3], fr[0][4:5] );
$display ( "%0d.%d%d%d(4) = %0x.%x%x(2)" , it[1], fr[1][0:1], fr[1][2:3], fr[1][4:5],
                                           it[1], fr[1][0:3], fr[1][4:7] );
$display ( "%0d.%d%d%d(8) = %0b.%b%b%b(2)" , it[2], fr[2][0:2], fr[2][3:5], fr[2][6:8],
                                             it[2], fr[2][0:2], fr[2][3:5], fr[2][6:8] );
$display ( "%0d.%d%d%d(8) = %0d%d.%d%d%d%d(4)" , it[3], fr[3][0:2], fr[3][3:5], fr[3][6:8],
                                                 it[3][3:2], it[2][1:0], fr[3][0:1], fr[3][2:3], fr[3][4:5], fr[3][6:7] );
$display ( "%0x.%x%x%x(16) = %0d%d.%d%d%d%d(4)" , it[4], fr[4][0:3], fr[4][4:7], fr[4][8],
                                             it[4][3:2], it[4][1:0], fr[4][0:1], fr[4][2:3], fr[4][4:5], fr[4][6:7] );

end // main
endmodule // Guia
