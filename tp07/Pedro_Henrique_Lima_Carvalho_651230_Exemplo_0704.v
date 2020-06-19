/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 07
Exemplo0704
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

module mux4x1 (output out_s, input in_00, in_01, in_10, in_11, s_group, select);
//wires
wire out_mux1, out_mux2;

mux MUX1 (out_mux1, in_00, in_01, select);
mux MUX2 (out_mux2, in_10, in_11, select);
mux MUX3 (out_s, out_mux1, out_mux2, s_group);

endmodule

module Exemplo0704;

//definicoes

reg a, b;
reg[1:0] select;
wire or_out, nor_out, xor_out, xnor_or, s;

or OR1 (or_out, a, b);
nor NOR1 (nor_out, a, b);
xor XOR1 (xor_out, a, b);
xnor XNOR1 (xnor_out, a, b);

mux4x1 MUX (s, or_out, nor_out, xor_out, xnor_out, select[1], select[0]);


initial
begin: main
$display("Exemplo_0704");
$display("Pedro Henrique Lima Carvalho 651230");
$display(" a  b   select    S");

a=1'b0; b=1'b0; select=0;

//monitor
#1 $monitor(" %b  %b     %b      %b ", a, b, select, s);

#1 a=1'b0; b=1'b1; select=0;
#1 a=1'b1; b=1'b0; select=0;
#1 a=1'b1; b=1'b1; select=0;

#1 a=1'b0; b=1'b0; select=1;$display("");
#1 a=1'b0; b=1'b1; select=1;
#1 a=1'b1; b=1'b0; select=1;
#1 a=1'b1; b=1'b1; select=1;

#1 a=1'b0; b=1'b0; select=2;$display("");
#1 a=1'b0; b=1'b1; select=2;
#1 a=1'b1; b=1'b0; select=2;
#1 a=1'b1; b=1'b1; select=2;


#1 a=1'b0; b=1'b0; select=3;$display("");
#1 a=1'b0; b=1'b1; select=3;
#1 a=1'b1; b=1'b0; select=3;
#1 a=1'b1; b=1'b1; select=3;


end
endmodule
