/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_04 Exercicio 01.
*/
module a (output s, input x, y, z);
assign s = ~x&~(y|~z);
endmodule

module b (output s, input x, y, z);
assign s = ~(x|~y)&z;
endmodule

module c (output s, input x, y, z);
assign s = ~(~x&~y)&~z;
endmodule

module d (output s, input x, y, z);
assign s = ~(x&y)&~z;
endmodule

module e (output s, input x, y, z);
assign s = (~x|y)&(y|~z);
endmodule

module Guia_04_01;
// define data
reg x, y, z;
wire sa, sb, sc, sd, se;

//instantiate
a a1 (sa, x, y, z);
b b1 (sb, x, y, z);
c c1 (sc, x, y, z);
d d1 (sd, x, y, z);
e e1 (se, x, y, z);

// initial values
initial
begin : start
x=1'bx; y=1'bx; z=1'bx;
end

//main
initial
begin : main
//id
$display("Guia 04 Ex. 01");

//monitor
$display("a)");
$display(" x'.(y+z')'");
$display(" x y z = sa");

//first signal a)
#1 x=0; y=0; z=0;

$monitor(" %b %b %b = %b", x, y, z, sa);

//signals
#1 x=0; y=0; z=1;
#1 x=0; y=1; z=0;
#1 x=0; y=1; z=1;
#1 x=1; y=0; z=0;
#1 x=1; y=0; z=1;
#1 x=1; y=1; z=0;
#1 x=1; y=1; z=1;

//first signal b)
#1 x=0; y=0; z=0;

//monitor
$display("\nb)");
$display(" (x+y')'.z");
$display(" x y z = sb");
$monitor(" %b %b %b = %b", x, y, z, sb);

//signals
#1 x=0; y=0; z=1;
#1 x=0; y=1; z=0;
#1 x=0; y=1; z=1;
#1 x=1; y=0; z=0;
#1 x=1; y=0; z=1;
#1 x=1; y=1; z=0;
#1 x=1; y=1; z=1;

//first signal c)
#1 x=0; y=0; z=0;

//monitor
$display("\nc)");
$display(" (x'.y')'.z'");
$display(" x y z = sc");
$monitor(" %b %b %b = %b", x, y, z, sc);

//signals
#1 x=0; y=0; z=1;
#1 x=0; y=1; z=0;
#1 x=0; y=1; z=1;
#1 x=1; y=0; z=0;
#1 x=1; y=0; z=1;
#1 x=1; y=1; z=0;
#1 x=1; y=1; z=1;

//first signal d)
#1 x=0; y=0; z=0;

//monitor
$display("\nd)");
$display(" (x.y)'.z'");
$display(" x y z = sd");
$monitor(" %b %b %b = %b", x, y, z, sd);

//signals
#1 x=0; y=0; z=1;
#1 x=0; y=1; z=0;
#1 x=0; y=1; z=1;
#1 x=1; y=0; z=0;
#1 x=1; y=0; z=1;
#1 x=1; y=1; z=0;
#1 x=1; y=1; z=1;

//first signal e)
#1 x=0; y=0; z=0;

//monitor
$display("\ne)");
$display(" (x'+y).(y+z')");
$display(" x y z = sd");
$monitor(" %b %b %b = %b", x, y, z, se);

//signals
#1 x=0; y=0; z=1;
#1 x=0; y=1; z=0;
#1 x=0; y=1; z=1;
#1 x=1; y=0; z=0;
#1 x=1; y=0; z=1;
#1 x=1; y=1; z=0;
#1 x=1; y=1; z=1;
end // main
endmodule // Guia
