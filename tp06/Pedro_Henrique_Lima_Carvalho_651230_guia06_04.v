/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_06 Exercicio 04.
*/
module a (output s, input x, y, w, z);
assign s = (y|~w|z)&(x|~y|~w);
endmodule

module b (output s, input x, y, w, z);
assign s = (~y|w|z)&(~x|w|~z)&(x|~y|~w|~z);
endmodule

module c (output s, input x, y, w, z);
assign s = (x|~y|w|z)&(~x|y|w|z)&(~x|~y|~z)&(~x|~y|~w);
endmodule

module d (output s, input x, y, w, z);
assign s = (x&~y)|~z;
endmodule

module e (output s, input x, y, w,z);
assign s = (x|~y)&(~x|~y|~w);
endmodule

module Guia_06_04;
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
$display("Guia 06 Ex. 04");

//monitor
$display("\na) π M ( 2, 6, 7, 10 )");
$display(" Reduzida: (Y+W'+Z).(X+Y'+W')");

$display("  M | Reduzida");
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
$display("\nb) π M ( 4, 7, 9, 12, 13 )");
$display(" Reduzida: (X'+W+Z').(X'+Y'+W).(Y'+W+Z').(X+Y'+Z')");

$display("  M | Reduzida");
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
$display("\nc) π M ( 4, 8, 13, 14, 15 )");
$display(" Reduzida: (X+Y'+W+Z).(X'+Y+W+Z).(X'+Y'+Z').(X'+Y'+W')");

$display("  M | Reduzida");
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
$display("\nd) π M ( 1, 3, 5, 7, 13, 14 )");
$display(" Reduzida: (X+Y+Z').(X+Y'+Z').(X'+Y'+Z') = (X.Y'.Z')");

$display("  M | Reduzida");
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
$display("\ne) π M ( 4, 5, 6, 7, 14, 15 )");
$display(" Reduzida: (X+Y').(X'+Y'+Z')");

$display("  M | Reduzida");
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
