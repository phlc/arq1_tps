/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_04 Exercicio 02.
*/
module a (output s1, output s2, input x, y);
assign s1 = x&~(x|~y);
assign s2 = 0;
endmodule

module b (output s1, output s2, input x, y);
assign s1 = (~x|y)|(x&y);
assign s2 = ~x|y;
endmodule

module c (output s1, output s2, input x, y);
assign s1 = ~(x&~y)&(~x|y);
assign s2 = ~x|y;

endmodule

module d (output s1, output s2, input x, y);
assign s1 = ~(x&y)|~(~x+~y);
assign s2 = 1;
endmodule

module e (output s1, output s2, input x, y);
assign s1 = ~(y|~x)&(~y|x);
assign s2 = ~y&x;

endmodule

module Guia_04_02;
// define data
reg x, y;
wire sa1, sa2, sb1, sb2, sc1, sc2, sd1, sd2, se1, se2;

//instantiate
a a1 (sa1, sa2, x, y);
b b1 (sb1, sb2, x, y);
c c1 (sc1, sc2, x, y);
d d1 (sd1, sd2, x, y);
e e1 (se1, se2, x, y);

// initial values
initial
begin : start
x=1'bx; y=1'bx;
end

//main
initial
begin : main
//id
$display("Guia 04 Ex. 02");

//monitor
$display("a)");
$display(" x.(x+y')' = 0");
$display(" x y = sa1 = sa2 ");

//first signal a)
#1 x=0; y=0;

$monitor(" %b %b = %b = %b", x, y, sa1, sa2);

//signals
#1 x=0; y=1;
#1 x=1; y=0;
#1 x=1; y=1;

//first signal b)
#1 x=0; y=0;

//monitor
$display("\nb)");
$display(" (x'+y)+(x.y) = x'+ y");
$display(" x y = sb1 = sb2 ");
$monitor(" %b %b = %b = %b", x, y, sb1, sb2);

//signals
#1 x=0; y=1;
#1 x=1; y=0;
#1 x=1; y=1;

//first signal c)
#1 x=0; y=0;

//monitor
$display("\nc)");
$display(" (x.y')'.(x'+y) = x'+ y");
$display(" x y = sc1 = sc2 ");
$monitor(" %b %b = %b = %b", x, y, sc1, sc2);

//signals
#1 x=0; y=1;
#1 x=1; y=0;
#1 x=1; y=1;

//first signal d)
#1 x=0; y=0;

//monitor
$display("\nd)");
$display(" (x.y)'+(x'+y')'  = 1");
$display(" x y = sd1 = sd2 ");
$monitor(" %b %b = %b = %b", x, y, sd1, sd2);

//signals
#1 x=0; y=1;
#1 x=1; y=0;
#1 x=1; y=1;

//first signal e)
#1 x=0; y=0;

//monitor
$display("\ne)");
$display(" (y+x')'.(y'+x) = y'.x");
$display(" x y = se1 = se2 ");
$monitor(" %b %b = %b = %b", x, y, se1, se2);

//signals
#1 x=0; y=1;
#1 x=1; y=0;
#1 x=1; y=1;
end // main
endmodule // Guia
