/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_04 Exercicio 03.
*/
module a (output s, input x, y, z);
assign s = (~x&~y&z)|(~x&y&~z)|(~x&y&z)|(x&~y&z);
endmodule

module b (output s, input x, y, z);
assign s = (~x&~y&z)|(~x&y&~z)|(x&~y&~z)|(x&~y&z);
endmodule

module c (output s, input x, y, w, z);
assign s = (~x&~y&~w&z)|(~x&~y&w&~z)|(~x&y&w&~z)|
           (~x&y&w&z)|(x&~y&~w&z)|(x&~y&w&~z)|
           (x&~y&w&z);
endmodule

module d (output s, input x, y, w, z);
assign s = (~x&~y&~w&~z)|(~x&~y&w&~z)|(~x&y&~w&z)|
           (~x&y&w&~z)|(~x&y&w&z)|(x&~y&w&~z)|
           (x&y&~w&z);
endmodule

module e (output s, input x, y, w, z);
assign s = (~x&~y&~w&z)|(~x&~y&w&~z)|(~x&~y&w&z)|
           (~x&y&~w&z)|(x&~y&~w&~z)|(x&y&~w&z);
endmodule

module Guia_04_03;
// define data
reg x, y, w, z;
integer i;
wire sa, sb, sc, sd, se;

//instantiate
a a1 (sa, x, y, z);
b b1 (sb, x, y, z);
c c1 (sc, x, y, w, z);
d d1 (sd, x, y, w, z);
e e1 (se, x, y, w, z);

// initial values
initial
begin : start
i=0; x=1'bx; y=1'bx; w=1'bx; z=1'bx;
end

//main
initial
begin : main
//id
$display("Guia 04 Ex. 03");

//monitor
$display("a)");
$display(" f(x,y,z) = Σm(1,2,3,5)");
$display(" mintermos | SoP(1,2,3,5)");

//first signal a)
#1 x=0; y=0; z=0; i=0;

$monitor("      m%0d   |   %4b", i, sa);

//signals
#1 x=0; y=0; z=1; i=1;
#1 x=0; y=1; z=0; i=2;
#1 x=0; y=1; z=1; i=3;
#1 x=1; y=0; z=0; i=4;
#1 x=1; y=0; z=1; i=5;
#1 x=1; y=1; z=0; i=6;
#1 x=1; y=1; z=1; i=7;

//first signal b)
#1 x=0; y=0; z=0; i=0;

//monitor
$display("\nb)");
$display(" f(x,y,z) = Σm(1,2,4,5)");
$display(" mintermos | SoP(1,2,4,5)");
$monitor("      m%0d   |   %4b", i, sb);

//signals
#1 x=0; y=0; z=1; i=1;
#1 x=0; y=1; z=0; i=2;
#1 x=0; y=1; z=1; i=3;
#1 x=1; y=0; z=0; i=4;
#1 x=1; y=0; z=1; i=5;
#1 x=1; y=1; z=0; i=6;
#1 x=1; y=1; z=1; i=7;

//first signal c)
#1 x=0; y=0; w=0; z=0; i=0;

//monitor
$display("\nc)");
$display(" f(x,y,w,z) = Σm(1,2,6,7,9,10,11)");
$display("  mintermos | SoP(1,2,6,7,9,10,11)");
$monitor("      m%2d   |   %4b", i, sc);

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

//first signal d)
#1 x=0; y=0; w=0; z=0; i=0;

//monitor
$display("\nd)");
$display(" f(x,y,w,z) = Σm(0,2,5,6,7,10,13)");
$display("  mintermos | SoP(0,2,5,6,7,10,13)");
$monitor("      m%2d   |   %4b", i, sd);

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

//first signal e)
#1 x=0; y=0; w=0; z=0; i=0;

//monitor
$display("\ne)");
$display(" f(x,y,w,z) = Σm(1,2,3,5,8,13)");
$display("  mintermos | SoP(1,2,3,5,8,13)");
$monitor("      m%2d   |   %4b", i, se);

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
