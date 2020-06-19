/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia01 Exercicio 02c.
*/
module Guia_01_02c;
// define data
// decimals
integer b;
integer i;

//binary
reg [7:0] x [0:5];

// actions
initial
begin : main
x[0] = 8'b00011101;
x[1] = 8'b00010100;
x[2] = 8'b00101101;
x[3] = 8'b00110011;
x[4] = 8'b00111011;
$display ( "Guia_01 - Ex_02c" );
for (i = 0; i < 5; i = i + 1) begin
  b = x[i];
  $display ( "%8b(2) = %d(10)" , x[i], b );
end // for
end // main
endmodule // Guia
