/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_06 Exercicio 01.
*/
module a (output s, control, input x, y, z);
assign s = (~x&z)|(~y&z);
assign control = (~x&~y&z)|(~x&y&z)|(x&~y&z);
endmodule

module b (output s, control, input x, y, z);
assign s = (~y&~z)|(x&~z);
assign control = (~x&~y&~z)|(x&~y&~z)|(x&y&~z);
endmodule

module c (output s, control, input x, y, z);
assign s = (y&~z)|(~y&z);
assign control = (~x&~y&z)|(~x&y&~z)|(x&~y&z)|(x&y&~z);
endmodule

module d (output s, control, input x, y, z);
assign s = z;
assign control = (~x&~y&z)|(~x&y&z)|(x&~y&z)|(x&y&z);
endmodule

module e (output s, control, input x, y, z);
assign s = (~x&~z)|(x&~y);
assign control = (~x&~y&~z)|(~x&y&~z)|(x&~y&~z)|(x&~y&z);
endmodule

module Guia_06_01;
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
$display("Guia 06 Ex. 01");

//monitor
$display("\na) Σm(1, 3, 5)");
$display(" Reduzida: (x'.z)+(y'.z)");
$display(" Controle: (x'.y'.z)+(x'.y.z)+(x.y'.z)");


$display(" m | Reduzida | Controle");
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
$display("\nb) Σm(0, 4, 6)");
$display(" Reduzida: (y'.z')+(x.z')");
$display(" Controle: (x'.y'.z')+(x.y'.z')+(x.y.z')");

$display(" m | Reduzida | Controle");
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
$display("\nc) Σm(1,2,5,6)");
$display(" Reduzida: (y.z')+(y'z)");
$display(" Controle: (x'.y'.z)+(x'.y.z')+(x.y'.z)+(x.y.z')");

$display(" m | Reduzida | Controle");
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
$display("\nd) Σm(1,3,5,7)");
$display(" Reduzida: z");
$display(" Controle: (x'.y'.z)+(x'.y.z)+(x.y'.z)+(x.y.z)");

$display(" m | Reduzida | Controle");
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
$display("\nd) Σm(0,2,4,5)");
$display(" Reduzida: (x'.z')+(x.y')");
$display(" Controle: (x'.y'.z')+(x'.y.z')+(x.y'.z')+(x.y'.z)");

$display(" m | Reduzida | Controle");
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
