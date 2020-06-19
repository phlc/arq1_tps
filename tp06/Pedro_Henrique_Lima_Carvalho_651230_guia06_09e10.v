/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_06 Exercicio 09e10.
*/
module a (output s, control, input x, y, z);
assign s = x&(~z|~y);
assign control = (~(~x|~y)&~(x&y))|~(~x|(y&z));
endmodule

module b (output s, control, input x, y, w, z);
assign s = (x|y)&(x|~y)&(~y|~w|~z);
assign control = (~(~y|w|~x)&~(y&~w&x))|~((y&w&z)|~x);
endmodule


module Guia_06_09e10;
// define data
reg x, y, w, z;
integer i;
wire sa, sb, ca, cb;

//instantiate
a a1 (sa, ca, x, y, z);
b b1 (sb, cb, x, y, w, z);
// initial values
initial
begin : start
x=1'b0; y=1'b0; w=1'b0; z=1'b0; i=0;
end

//main
initial
begin : main
//id
$display("Guia 06 Ex. 09 e 10");

//monitor
$display("\n09) Equacao: ((x'+y')'.(x.y)')+(x'+(y.z))'");
$display(" Reduzida: x.(z'+y')");

$display("  m | x | y | z | Normal | Reduzida");
$monitor(" %2d | %b | %b | %b |    %b   |    %b", i, x, y, z, ca, sa);

//signals
#1 x=0; y=0; z=1; i=1;
#1 x=0; y=1; z=0; i=2;
#1 x=0; y=1; z=1; i=3;
#1 x=1; y=0; z=0; i=4;
#1 x=1; y=0; z=1; i=5;
#1 x=1; y=1; z=0; i=6;
#1 x=1; y=1; z=1; i=7;

//first signal b
#1 x=0; y=0; w=0; z=0; i=0;

//monitor
$display("\n10) Equacao: ((y'+w+x')'.(y.w'.x)')+((y.w.z)+x')'");
$display(" Reduzida: (X+Y).(X+Y').(Y'+W'+Z')");

$display("  M | X | Y | W | Z | Normal | Reduzida");
$monitor(" %2d | %b | %b | %b | %b |   %b    |    %b", i, x, y, w, z, cb, sb);


//signals
#1 x=0; y=0; w=0; z=1; i=1;
#1 x=0; y=0; w=1; z=0; i=2;
#1 x=0; y=0; w=1; z=1; i=3;
#1 x=0; y=1; w=0; z=0; i=4;
#1 x=0; y=1; w=0; z=1; i=5;
#1 x=0; y=1; w=1; z=0; i=6;
#1 x=0; y=1; w=1; z=1; i=7;
#1 x=1; y=0; w=0; z=0; i=8;
#1 x=1; y=0; w=0; z=1; i=9;
#1 x=1; y=0; w=1; z=0; i=10;
#1 x=1; y=0; w=1; z=1; i=11;
#1 x=1; y=1; w=0; z=0; i=12;
#1 x=1; y=1; w=0; z=1; i=13;
#1 x=1; y=1; w=1; z=0; i=14;
#1 x=1; y=1; w=1; z=1; i=15;



end // main
endmodule // Guia
