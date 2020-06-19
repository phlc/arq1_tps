/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_06 Exercicio 02.
*/
module a (output s, control, input x, y, z);
assign s = (x|y|z)&(~x|~y);
assign control = (x|y|z)&(~x|~y|z)&(~x|~y|~z);
endmodule

module b (output s, control, input x, y, z);
assign s = (y|~z)&(~x|~z);
assign control = (x|y|~z)&(~x|y|~z)&(~x|~y|~z);
endmodule

module c (output s, control, input x, y, z);
assign s = ~z;
assign control = (x|y|~z)&(x|~y|~z)&(~x|y|~z)&(~x|~y|~z);
endmodule

module d (output s, control, input x, y, z);
assign s = (x|y)&(~x|y);
assign control = (x|y|z)&(x|y|~z)&(~x|y|z)&(~x|y|~z);
endmodule

module e (output s, control, input x, y, z);
assign s = (~x|~y|z)&(x|~z)&(y|~z);
assign control = (x|y|~z)&(x|~y|~z)&(~x|y|~z)&(~x|~y|z);
endmodule

module Guia_06_02;
// define data
reg x, y, z;
integer i;
wire sa, ca, sb, cb, sc, cc, sd, cd, se, ce;

//instantiate
a a1 (sa, ca, x, y, z);
b b1 (sb, cb, x, y, z);
c c1 (sc, cc, x, y, z);
d d1 (sd, cd, x, y, z);
e e1 (se, ce, x, y, z);

// initial values
initial
begin : start
x=1'b0; y=1'b0; z=1'b0; i=0;
end

//main
initial
begin : main
//id
$display("Guia 06 Ex. 02");

//monitor
$display("\na) πM(0,6,7)");
$display(" Reduzida: (X+Y+Z).(X'+Y')");
$display(" Controle: (X+Y+Z).(X'+Y'+Z).(X'+Y'+Z')");


$display(" M | Reduzida | Controle");
$monitor(" %0d |    %b     |    %b", i, sa, ca);

//signals
#1 x=0; y=0; z=1; i=1;
#1 x=0; y=1; z=0; i=2;
#1 x=0; y=1; z=1; i=3;
#1 x=1; y=0; z=0; i=4;
#1 x=1; y=0; z=1; i=5;
#1 x=1; y=1; z=0; i=6;
#1 x=1; y=1; z=1; i=7;

//first signal b
#1 x=0; y=0; z=0; i=0;

//monitor
$display("\nb) πM(1,5,7)");
$display(" Reduzida: (Y+Z').(X'.Z')");
$display(" Controle: (X+Y+Z').(X'+Y+Z').(X'+Y'+Z')");

$display(" M | Reduzida | Controle");
$monitor(" %0d |    %b     |    %b", i, sb, cb);

//signals
#1 x=0; y=0; z=1; i=1;
#1 x=0; y=1; z=0; i=2;
#1 x=0; y=1; z=1; i=3;
#1 x=1; y=0; z=0; i=4;
#1 x=1; y=0; z=1; i=5;
#1 x=1; y=1; z=0; i=6;
#1 x=1; y=1; z=1; i=7;

//first signal c
#1 x=0; y=0; z=0; i=0;

//monitor
$display("\nc) πM(1,3,5,7)");
$display(" Reduzida: Z'");
$display(" Controle: (X+Y+Z').(X+Y'+Z').(X'+Y+Z').(X'+Y'+Z')");

$display(" M | Reduzida | Controle");
$monitor(" %0d |    %b     |    %b", i, sc, cc);

//signals
#1 x=0; y=0; z=1; i=1;
#1 x=0; y=1; z=0; i=2;
#1 x=0; y=1; z=1; i=3;
#1 x=1; y=0; z=0; i=4;
#1 x=1; y=0; z=1; i=5;
#1 x=1; y=1; z=0; i=6;
#1 x=1; y=1; z=1; i=7;

//first signal d
#1 x=0; y=0; z=0; i=0;

//monitor
$display("\nd) πM(0,1,4,5)");
$display(" Reduzida: (X+Y).(X'+Y)");
$display(" Controle: (X+Y+Z).(X+Y+Z').(X'+Y+Z).(X'+Y+Z')");

$display(" M | Reduzida | Controle");
$monitor(" %0d |    %b     |    %b", i, sd, cd);

//signals
#1 x=0; y=0; z=1; i=1;
#1 x=0; y=1; z=0; i=2;
#1 x=0; y=1; z=1; i=3;
#1 x=1; y=0; z=0; i=4;
#1 x=1; y=0; z=1; i=5;
#1 x=1; y=1; z=0; i=6;
#1 x=1; y=1; z=1; i=7;

//first signal e
#1 x=0; y=0; z=0; i=0;

//monitor
$display("\nd) πM(1,3,5,6)");
$display(" Reduzida: (X'+Y'+Z).(X+Z').(Y+Z')");
$display(" Controle: (X+Y+Z').(X+Y'+Z').(X'+Y+Z').(X'+Y'+Z)");

$display(" M | Reduzida | Controle");
$monitor(" %0d |    %b     |    %b", i, se, ce);

//signals
#1 x=0; y=0; z=1; i=1;
#1 x=0; y=1; z=0; i=2;
#1 x=0; y=1; z=1; i=3;
#1 x=1; y=0; z=0; i=4;
#1 x=1; y=0; z=1; i=5;
#1 x=1; y=1; z=0; i=6;
#1 x=1; y=1; z=1; i=7;

end // main
endmodule // Guia
