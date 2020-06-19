/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 07
Exemplo0706
*/
module mux (output out_s, input in_0, in_1, select);

//wires
wire not_select;
wire on_0, on_1;


//portas
not NOT1 (not_select, select);
and AND1 (on_0, in_0, not_select);
and AND2 (on_1, in_1, select);

or OR1 (out_s, on_1, on_0);

endmodule

module iguais (output out_s, input in_a0, in_a1, in_b0, in_b1);
//wires
wire out_xnor1, out_xnor2;

xnor XNOR1 (out_xnor1, in_a0, in_b0);
xnor XNOR2 (out_xnor2, in_a1, in_b1);
and AND1 (out_s, out_xnor1, out_xnor2);
endmodule

module diferentes (output out_s, input in_a0, in_a1, in_b0, in_b1);
//wires
wire out_xor1, out_xor2;

xor XOR1 (out_xor1, in_a0, in_b0);
xor XOR2 (out_xor2, in_a1, in_b1);
or OR1 (out_s, out_xor1, out_xor2);
endmodule


module Exemplo0706;

//definicoes

reg[1:0] a, b;
reg select;
wire iguais_out, diferentes_out, s;

iguais IGUAIS1 (iguais_out, a[0], a[1], b[0], b[1]);
diferentes DIFERENTES1 (diferentes_out, a[0], a[1], b[0], b[1]);

mux MUX (s, iguais_out, diferentes_out, select);


initial
begin: main
$display("Exemplo_0706");
$display("Pedro Henrique Lima Carvalho 651230");
$display(" a   b   select    S");

a=0; b=0; select=0;

//monitor
#1 $monitor(" %b  %b     %b      %b ", a, b, select, s);

#1 a=0; b=1; select=0;
#1 a=0; b=2; select=0;
#1 a=0; b=3; select=0;
#1 a=1; b=0; select=0;
#1 a=1; b=1; select=0;
#1 a=1; b=2; select=0;
#1 a=1; b=3; select=0;
#1 a=2; b=0; select=0;
#1 a=2; b=1; select=0;
#1 a=2; b=2; select=0;
#1 a=2; b=3; select=0;
#1 a=3; b=0; select=0;
#1 a=3; b=1; select=0;
#1 a=3; b=2; select=0;
#1 a=3; b=3; select=0;

#1 a=0; b=0; select=1;$display("");
#1 a=0; b=1; select=1;
#1 a=0; b=2; select=1;
#1 a=0; b=3; select=1;
#1 a=1; b=0; select=1;
#1 a=1; b=1; select=1;
#1 a=1; b=2; select=1;
#1 a=1; b=3; select=1;
#1 a=2; b=0; select=1;
#1 a=2; b=1; select=1;
#1 a=2; b=2; select=1;
#1 a=2; b=3; select=1;
#1 a=3; b=0; select=1;
#1 a=3; b=1; select=1;
#1 a=3; b=2; select=1;
#1 a=3; b=3; select=1;


end
endmodule
