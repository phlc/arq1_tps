/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_04 Exercicio 04.
*/
module a (output s, input X, Y, Z);
assign s = (X|Y|~Z)&(X|~Y|~Z)&(~X|Y|~Z)&(~X|~Y|~Z);
endmodule

module b (output s, input X, Y, Z);
assign s = (X|Y|Z)&(X|Y|~Z)&(X|~Y|Z)&(~X|Y|~Z)&(~X|~Y|~Z);
endmodule

module c (output s, input X, Y, W, Z);
assign s = (X|Y|W|Z)&(X|Y|W|~Z)&(X|Y|~W|Z)&(X|Y|~W|~Z)&
           (X|~Y|~W|Z)&(~X|Y|W|Z)&(~X|Y|~W|~Z)&(~X|~Y|W|Z);
endmodule

module d (output s, input X, Y, W, Z);
assign s = (X|Y|W|Z)&(X|Y|~W|Z)&(X|~Y|W|Z)&(X|~Y|~W|Z)&
           (X|~Y|~W|~Z)&(~X|Y|~W|Z)&(~X|~Y|W|~Z);
endmodule

module e (output s, input X, Y, W, Z);
assign s = (X|Y|W|Z)&(X|Y|W|~Z)&(X|Y|~W|Z)&(X|~Y|W|Z)&
           (X|~Y|~W|~Z)&(~X|Y|~W|~Z)&(~X|~Y|~W|~Z);
endmodule

module Guia_04_04;
// define data
reg X, Y, W, Z;
integer i;
wire sa, sb, sc, sd, se;

//instantiate
a a1 (sa, X, Y, Z);
b b1 (sb, X, Y, Z);
c c1 (sc, X, Y, W, Z);
d d1 (sd, X, Y, W, Z);
e e1 (se, X, Y, W, Z);

// initial values
initial
begin : start
i=0; X=1'bx; Y=1'bx; W=1'bx; Z=1'bx;
end

//main
initial
begin : main
//id
$display("Guia 04 Ex. 04");

//monitor
$display("a)");
$display(" F(X,Y,Z) = ΠM(1,3,5,7)");
$display(" MAXTERMOS | PoS(1,3,5,7)");

//first signal a)
#1 X=0; Y=0; Z=0; i=0;

$monitor("      M%0d   |   %4b", i, sa);

//signals
#1 X=0; Y=0; Z=1; i=1;
#1 X=0; Y=1; Z=0; i=2;
#1 X=0; Y=1; Z=1; i=3;
#1 X=1; Y=0; Z=0; i=4;
#1 X=1; Y=0; Z=1; i=5;
#1 X=1; Y=1; Z=0; i=6;
#1 X=1; Y=1; Z=1; i=7;

//first signal b)
#1 X=0; Y=0; Z=0; i=0;

//monitor
$display("\nb)");
$display(" F(X,Y,Z) = ΠM(0,1,2,5,7)");
$display(" MAXTERMOS | PoS(0,1,2,5,7)");
$monitor("      m%0d   |   %4b", i, sb);

//signals
#1 X=0; Y=0; Z=1; i=1;
#1 X=0; Y=1; Z=0; i=2;
#1 X=0; Y=1; Z=1; i=3;
#1 X=1; Y=0; Z=0; i=4;
#1 X=1; Y=0; Z=1; i=5;
#1 X=1; Y=1; Z=0; i=6;
#1 X=1; Y=1; Z=1; i=7;

//first signal c)
#1 X=0; Y=0; W=0; Z=0; i=0;

//monitor
$display("\nc)");
$display(" ΠM(0,1,2,3,6,8,11,12)");
$display("  MAXTERMOS | PoS(0,1,2,3,6,8,11,12)");
$monitor("      m%2d   |   %4b", i, sc);

//signals
#1 X=0; Y=0; W=0; Z=1; i=1;
#1 X=0; Y=0; W=1; Z=0; i=2;
#1 X=0; Y=0; W=1; Z=1; i=3;
#1 X=0; Y=1; W=0; Z=0; i=4;
#1 X=0; Y=1; W=0; Z=1; i=5;
#1 X=0; Y=1; W=1; Z=0; i=6;
#1 X=0; Y=1; W=1; Z=1; i=7;
#1 X=1; Y=0; W=0; Z=0; i=8;
#1 X=1; Y=0; W=0; Z=1; i=9;
#1 X=1; Y=0; W=1; Z=0; i=10;
#1 X=1; Y=0; W=1; Z=1; i=11;
#1 X=1; Y=1; W=0; Z=0; i=12;
#1 X=1; Y=1; W=0; Z=1; i=13;
#1 X=1; Y=1; W=1; Z=0; i=14;
#1 X=1; Y=1; W=1; Z=1; i=15;

//first signal d)
#1 X=0; Y=0; W=0; Z=0; i=0;

//monitor
$display("\nd)");
$display(" F(X,Y,W,Z) = ΠM(0,2,4,6,7,10,13)");
$display("  mintermos | PoS(0,2,4,6,7,10,13)");
$monitor("      m%2d   |   %4b", i, sd);

//signals
#1 X=0; Y=0; W=0; Z=1; i=1;
#1 X=0; Y=0; W=1; Z=0; i=2;
#1 X=0; Y=0; W=1; Z=1; i=3;
#1 X=0; Y=1; W=0; Z=0; i=4;
#1 X=0; Y=1; W=0; Z=1; i=5;
#1 X=0; Y=1; W=1; Z=0; i=6;
#1 X=0; Y=1; W=1; Z=1; i=7;
#1 X=1; Y=0; W=0; Z=0; i=8;
#1 X=1; Y=0; W=0; Z=1; i=9;
#1 X=1; Y=0; W=1; Z=0; i=10;
#1 X=1; Y=0; W=1; Z=1; i=11;
#1 X=1; Y=1; W=0; Z=0; i=12;
#1 X=1; Y=1; W=0; Z=1; i=13;
#1 X=1; Y=1; W=1; Z=0; i=14;
#1 X=1; Y=1; W=1; Z=1; i=15;

//first signal e)
#1 X=0; Y=0; W=0; Z=0; i=0;

//monitor
$display("\ne)");
$display(" F(X,Y,W,Z) = ΠM((0,1,2,4,7,11,15)");
$display("  mintermos | PoS(0,1,2,4,7,11,15)");
$monitor("      m%2d   |   %4b", i, se);

//signals
#1 X=0; Y=0; W=0; Z=1; i=1;
#1 X=0; Y=0; W=1; Z=0; i=2;
#1 X=0; Y=0; W=1; Z=1; i=3;
#1 X=0; Y=1; W=0; Z=0; i=4;
#1 X=0; Y=1; W=0; Z=1; i=5;
#1 X=0; Y=1; W=1; Z=0; i=6;
#1 X=0; Y=1; W=1; Z=1; i=7;
#1 X=1; Y=0; W=0; Z=0; i=8;
#1 X=1; Y=0; W=0; Z=1; i=9;
#1 X=1; Y=0; W=1; Z=0; i=10;
#1 X=1; Y=0; W=1; Z=1; i=11;
#1 X=1; Y=1; W=0; Z=0; i=12;
#1 X=1; Y=1; W=0; Z=1; i=13;
#1 X=1; Y=1; W=1; Z=0; i=14;
#1 X=1; Y=1; W=1; Z=1; i=15;

end // main
endmodule // Guia
