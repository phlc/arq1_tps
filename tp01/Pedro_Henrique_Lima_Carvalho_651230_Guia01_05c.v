/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia01 Exercicio 05c.
*/
module Guia_01_05c;
// define data

reg [0:8][7:0] a = "PUC-Minas";
reg [0:5][7:0] b = "2020-1";
reg [0:5][7:0] c = "Brasil";
reg [0:5][7:0] d;
reg [0:7][7:0] e;

//actions
initial
begin : main

d[0] = 084;
d[1] = 097;
d[2] = 114;
d[3] = 100;
d[4] = 101;

e[0] = 8'h42;
e[1] = 8'h2E;
e[2] = 8'h48;
e[3] = 8'h2E;
e[4] = 8'h2D;
e[5] = 8'h4D;
e[6] = 8'h47;

$display ( "Guia_01 - Ex_05c" );


$display ( "PUC-Minas = %x %x %x %x %x %x %x %x %x (16_ASCII)" , a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8] );
$display ( "2020-1 = %x %x %x %x %x %x (16_ASCII)" , b[0], b[1], b[2], b[3], b[4], b[5] );
$display ( "Brasil = %b %b %b %b %b %b (2_ASCII)" , c[0], c[1], c[2], c[3], c[4], c[5] );
$display ( "084 097 114 100 101 = %s" , d );
$display ( "42 2E 48 2E 2D 4D 47 = %s" , e );
end // main
endmodule // Guia
