/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 07
Exemplo0707
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

module AmenorB (output out_s, input in_a0, in_a1, in_b0, in_b1);
//wires
wire not_a1, not_a0, out_and1, out_and2, out_and3;

not NOTa1 (not_a1, in_a1);
not NOTa0 (not_a0, in_a0);

and AND1 (out_and1, not_a1, in_b1);
and AND2 (out_and2, not_a1, not_a0, in_b0);
and AND3 (out_and3, not_a0, in_b1, in_b0);

or OR1(out_s, out_and1, out_and2, out_and3);
endmodule

module AmaiorB (output out_s, input in_a0, in_a1, in_b0, in_b1);
//wires
wire not_b1, not_b0, out_and1, out_and2, out_and3;

not NOTb1 (not_b1, in_b1);
not NOTb0 (not_b0, in_b0);

and AND1 (out_and1, in_a1, not_b1);
and AND2 (out_and2, in_a0, not_b1, not_b0);
and AND3 (out_and3, in_a0, in_a1, not_b0);

or OR1(out_s, out_and1, out_and2, out_and3);
endmodule


module Exemplo0707;

//definicoes

reg[1:0] a, b;
reg select;
wire menor_out, maior_out, s;

AmenorB MENOR1 (menor_out, a[0], a[1], b[0], b[1]);
AmaiorB MAIOR1 (maior_out, a[0], a[1], b[0], b[1]);

mux MUX (s, menor_out, maior_out, select);


initial
begin: main
$display("Exemplo_0707");
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
