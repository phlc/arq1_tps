/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 08
Exemplo0802
*/
module halfsub (output s0, borrow_in, input a, b);
wire not_a;
xor XOR1 (s0, a, b);
not NOT1(not_a, a);
and AND1 (borrow_in, not_a, b);
endmodule

module fulladder (output s, borrows, input a, b, borrowed);
wire out_sub1, bout_sub1, bout_sub2;
halfsub Sub1 (out_sub1, bout_sub1, a, b);
halfsub Sub2 (s, bout_sub2, out_sub1, borrowed);
or OR1(borrows, bout_sub1, bout_sub2);
endmodule

module Exemplo0802;

//definicoes
integer i, j;
reg[3:0] a, b;
wire[4:0] s;
wire bout_fs1, bout_fs2, bout_fs3;

fulladder FS1 (s[0], bout_fs1, a[0], b[0], 1'b0);
fulladder FS2 (s[1], bout_fs2, a[1], b[1], bout_fs1);
fulladder FS3 (s[2], bout_fs3, a[2], b[2], bout_fs2);
fulladder FS4 (s[3], s[4], a[3], b[3], bout_fs3);


initial
begin: main
$display("Exemplo_0802");
$display("Pedro Henrique Lima Carvalho 651230");
$display("  a      b      s  | borrowed");

a=0; b=0;

//monitor
#1 $monitor("%b - %b = %b | %b", a, b, s[3:0], s[4]);

for (i = 0; i < 16; i=i+1) begin
  for (j = 0; j < 16; j=j+1) begin
    #1 a=i; b=j;
  end
end
end
endmodule
