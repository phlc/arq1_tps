/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_04 Exercicio 05.
*/
module a (output SoP, PoS, input X, Y);
assign SoP = (~X&~Y)|(X&~Y)|(X&Y);
assign PoS = (X|~Y);
endmodule

module b (output SoP, PoS, input X, Y);
assign SoP = (~X&~Y)|(~X&Y)|(X&Y);
assign PoS = (~X|Y);
endmodule

module c (output SoP, PoS, input X, Y, Z);
assign SoP = (~X&~Y&~Z)|(~X&~Y&Z)|(~X&Y&Z)|(X&~Y&Z)|(X&Y&Z);
assign PoS = (X|~Y|Z)&(~X|Y|Z)&(~X|~Y|Z);
endmodule

module d (output SoP, PoS, input X, Y, Z);
assign SoP = (X&Y&Z)|(X&Y&Z)|(X&Y&Z)|(X&Y&Z);
assign PoS = (X|Y|~Z)&(X|~Y|~Z)&(~X|~Y|Z)&(~X|~Y|~Z);
endmodule

module e (output SoP, PoS, input X, Y, W, Z);
assign SoP = (~X&~Y&~W&~Z)|(~X&~Y&~W&Z)|(~X&~Y&W&~Z)|
             (~X&Y&~W&~Z)|(X&~Y&~W&~Z)|(X&~Y&W&~Z)|
             (X&~Y&W&Z)|(X&Y&~W&Z)|(X&Y&W&~Z)|
             (X&Y&W&Z);
assign PoS = (X|Y|~W|~Z)&(X|~Y|W|~Z)&(X|~Y|~W|Z)&(X|~Y|~W|~Z)&
           (~X|Y|W|~Z)&(~X|~Y|W|Z);
endmodule

module Guia_04_04;
// define data
reg X, Y, W, Z;
integer i;
wire sa1, sb1, sc1, sd1, se1, sa2, sb2, sc2, sd2, se2;

//instantiate
a a1 (sa1, sa2, X, Y);
b b1 (sb1, sb2, X, Y);
c c1 (sc1, sc2, X, Y, Z);
d d1 (sd1, sd2, X, Y, Z);
e e1 (se1, se2, X, Y, W, Z);

// initial values
initial
begin : start
i=0; X=1'bx; Y=1'bx; W=1'bx; Z=1'bx;
end

//main
initial
begin : main
//id
$display("Guia 04 Ex. 05");

//monitor
$display("a)");
$display(" SoP(0,2,3) = (x'.y')+(x.y')+(x.y)");
$display(" PoS(1) = X+Y'");

//first signal a)
#1 X=0; Y=0; i=0;

$monitor(" m%0d %4b | M%0d %4b ", i, sa1, i, sa2);

//signals
#1 X=0; Y=1; i=1;
#1 X=1; Y=0; i=2;
#1 X=1; Y=1; i=3;

//first signal b)
#1 X=0; Y=0; i=0;

//monitor
$display("\nb)");
$display(" SoP(0,1,3) = (x'.y')+(x'.y)+(x.y)");
$display(" PoS(2) = X'+Y");
$monitor(" m%0d %4b | M%0d %4b ", i, sb1, i, sb2);

//signals
#1 X=0; Y=1; i=1;
#1 X=1; Y=0; i=2;
#1 X=1; Y=1; i=3;

//first signal c)
#1 X=0; Y=0; Z=0; i=0;

//monitor
$display("\nc)");
$display(" SoP(0,1,3,5,7) = (x'.y'.z')+(x'.y'.z)+(x'.y.z)+(x.y'.z)+(x.y.z)");
$display(" PoS(2,4,6) = (X+Y'+Z).(X'+Y+Z).(X'+Y'+Z)");
$monitor(" m%0d %4b | M%0d %4b ", i, sc1, i, sc2);

//signals
#1 X=0; Y=0; Z=1; i=1;
#1 X=0; Y=1; Z=0; i=2;
#1 X=0; Y=1; Z=1; i=3;
#1 X=1; Y=0; Z=0; i=4;
#1 X=1; Y=0; Z=1; i=5;
#1 X=1; Y=1; Z=0; i=6;
#1 X=1; Y=1; Z=1; i=7;


//first signal d)
#1 X=0; Y=0; Z=0; i=0;

//monitor
$display("\nd)");
$display(" SoP(0,2,4,5) = (x'.y'z')+(x'.y.z')+(x.y'.z')+(x.y'.z)");
$display(" PoS(1,3,6,7) = (X+Y+Z').(Z+Y'+Z')+(X'+Y'+Z)+(X'+Y'+Z')");
$monitor(" m%0d %4b | M%0d %4b ", i, sd1, i, sd2);

//signals
#1 X=0; Y=0; Z=1; i=1;
#1 X=0; Y=1; Z=0; i=2;
#1 X=0; Y=1; Z=1; i=3;
#1 X=1; Y=0; Z=0; i=4;
#1 X=1; Y=0; Z=1; i=5;
#1 X=1; Y=1; Z=0; i=6;
#1 X=1; Y=1; Z=1; i=7;

//first signal e)
#1 X=0; Y=0; W=0; Z=0; i=0;

//monitor
$display("\ne)");
$display(" SoP(0,1,2,4,8,10,11,13,14,15) = (x'.y'.w'.z')+(x'.y'.w'.z)+(x'.y'.w.z')+(x'.y.w'.z')+(x.y'.w'.z')+(x.y'.w.z')+(x.y'.w.z)+(x.y.w'.z)+(x.y.w.z')+(x.y.w.z)");
$display(" PoS(3,5,6,7,9,12) = (X+Y+W'+Z').(X+Y'+W+Z').(X+Y'+W'+Z).(X+Y'+W'+Z').(X'+Y+W+Z').(X'+Y'+W+Z)");
$monitor(" m%0d %4b | M%0d %4b ", i, se1, i, se2);

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
