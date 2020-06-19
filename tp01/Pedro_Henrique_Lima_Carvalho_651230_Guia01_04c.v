/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia01 Exercicio 04c.
*/
module Guia_01_04c;
// define data
// decimals
integer b;
integer i;

//binary
reg [7:0] x [0:5];

// actions
initial
begin : main
x[0] = 8'b00011011;
x[1] = 8'b00010001;
x[2] = 8'b00101111;
x[3] = 8'b00110101;
x[4] = 8'b00110111;
$display ( "Guia_01 - Ex_04c" );
for (i = 0; i < 5; i = i + 1) begin
  b = x[i];
  $display ( "%8b(2) = %d%d%d%d(4) = %o(8) = %x(16)" , x[i], b[7:6], b[5:4], b[3:2], b[1:0], b, b );
end // for
end // main
endmodule // Guia
