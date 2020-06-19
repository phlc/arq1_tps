/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 07
Exemplo0703
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

module Exemplo0703;

//definicoes

reg a, b, select, select_group;
wire and_out, or_out, nand_out, nor_out, and_or, nand_nor, s;

and AND1 (and_out, a, b);
or OR1 (or_out, a, b);
nand NAND1 (nand_out, a, b);
nor NOR1 (nor_out, a, b);

mux MUX1(and_or, and_out, or_out, select);
mux MUX2(nand_nor, nand_out, nor_out, select);
mux MUX3(s, nand_nor, and_or, select_group);


initial
begin: main
$display("Exemplo_0703");
$display("Pedro Henrique Lima Carvalho 651230");
$display(" a  b  s_group select  S");

a=1'b0; b=1'b0; select_group=1'b0; select=1'b0;

//monitor
#1 $monitor(" %b  %b     %b      %b     %b", a, b, select_group, select, s);

#1 a=1'b0; b=1'b1; select_group=1'b0; select=1'b0;
#1 a=1'b1; b=1'b0; select_group=1'b0; select=1'b0;
#1 a=1'b1; b=1'b1; select_group=1'b0; select=1'b0;

#1 a=1'b0; b=1'b0; select_group=1'b0; select=1'b1;$display("");
#1 a=1'b0; b=1'b1; select_group=1'b0; select=1'b1;
#1 a=1'b1; b=1'b0; select_group=1'b0; select=1'b1;
#1 a=1'b1; b=1'b1; select_group=1'b0; select=1'b1;

#1 a=1'b0; b=1'b0; select_group=1'b1; select=1'b0;$display("");
#1 a=1'b0; b=1'b1; select_group=1'b1; select=1'b0;
#1 a=1'b1; b=1'b0; select_group=1'b1; select=1'b0;
#1 a=1'b1; b=1'b1; select_group=1'b1; select=1'b0;


#1 a=1'b0; b=1'b0; select_group=1'b1; select=1'b1;$display("");
#1 a=1'b0; b=1'b1; select_group=1'b1; select=1'b1;
#1 a=1'b1; b=1'b0; select_group=1'b1; select=1'b1;
#1 a=1'b1; b=1'b1; select_group=1'b1; select=1'b1;

end
endmodule
