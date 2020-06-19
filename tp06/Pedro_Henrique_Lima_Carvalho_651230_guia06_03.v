/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_06 Exercicio 03.
*/
module a (output s, input x, y, w, z);
assign s = (~x&~y&~w&z)|(y&w&z)|(y&w&~z)|(~x&w&~z);
endmodule

module b (output s, input x, y, w, z);
assign s = (~x&~y&~z)|(y&~w&~z)|(~x&w&z);
endmodule

module c (output s, input x, y, w, z);
assign s = (~x&~y)|(~w&z)|(x&~y&~w);
endmodule

module d (output s, input x, y, w, z);
assign s = (w&~z)|(y&~w&~z)|(x&~w&~z);
endmodule

module e (output s, input x, y, w,z);
assign s = (~x&~y&~w)|(~x&~y&w&~z)|(x&y&z)|(x&y&w)|(y&w&z)|(x&~y&~w&~z);
endmodule

module Guia_06_03;
// define data
reg x, y, w, z;
integer i;
wire sa, sb, sc, sd, se;

//instantiate
a a1 (sa, x, y, w, z);
b b1 (sb, x, y, w, z);
c c1 (sc, x, y, w, z);
d d1 (sd, x, y, w, z);
e e1 (se, x, y, w, z);

// initial values
initial
begin : start
x=1'b0; y=1'b0; w=1'b0; z=1'b0; i=0;
end

//main
initial
begin : main
//id
$display("Guia 06 Ex. 03");

//monitor
$display("\na) ∑ m ( 1, 2, 6, 7, 14, 15 )");
$display(" Reduzida: (x'.y'.w'.z)+(y.w.z)+(y.w.z')+(x'.w.z')");

$display("  m | Reduzida");
$monitor(" %2d |    %b", i, sa);

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

//first signal b
#1 x=0; y=0; w=0; z=0; i=0;

//monitor
$display("\nb) ∑ m ( 0, 2, 3, 4, 7, 12 )");
$display(" Reduzida: (x'.y'z')+(y.w'z')+(x'.w.z)");

$display("  m | Reduzida");
$monitor(" %2d |    %b", i, sb);

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

//first signal c
#1 x=0; y=0; w=0; z=0; i=0;

//monitor
$display("\nc) ∑ m ( 0, 1, 2, 3, 5, 8, 9, 13 )");
$display(" Reduzida: (x'.y')+(w'.z).(x.y'.w')");

$display("  m | Reduzida");
$monitor(" %2d |    %b", i, sc);

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

//first signal d
#1 x=0; y=0; w=0; z=0; i=0;

//monitor
$display("\nd) ∑ m ( 2, 4, 6, 8, 10, 12, 14 )");
$display(" Reduzida: (w.z')+(y.w'.z')+(x.w'.z')");

$display("  m | Reduzida");
$monitor(" %2d |    %b", i, sd);

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

//first signal e
#1 x=0; y=0; w=0; z=0; i=0;

//monitor
$display("\ne) ∑ m ( 0, 1, 2, 7, 8, 13, 14, 15 )");
$display(" Reduzida: (x.y'.w'.z')+(z'.y'.w')+(x.y.z)+(x.y.w)+(y.w.z)");

$display("  m | Reduzida");
$monitor(" %2d |    %b", i, se);

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
