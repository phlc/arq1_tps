/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 07
Exemplo0701
*/
module mux (output out_and, out_or, input in_and, in_or, select);

//wires
wire not_select;


//portas
not NOT1 (not_select, select);
and AND1 (out_and, in_and, select);
and AND2 (out_or, in_or, not_select);

endmodule

module Exemplo0701;

//definicoes

reg a, b, select;
wire and_out, or_out, mux_and, mux_or;

and AND1 (and_out, a, b);
or OR1 (or_out, a, b);

mux MUX1(mux_and, mux_or, and_out, or_out, select);

initial
begin: main
$display("Exemplo_0701");
$display("Pedro Henrique Lima Carvalho 651230");
$display(" a  b  select s_and s_or");

a=1'b0; b=1'b0; select=1'b0;

//monitor
#1 $monitor(" %b  %b     %b     %b    %b", a, b, select, mux_and, mux_or);

#1 a=1'b0; b=1'b1; select=1'b0;
#1 a=1'b1; b=1'b0; select=1'b0;
#1 a=1'b1; b=1'b1; select=1'b0;
#1 a=1'b0; b=1'b0; select=1'b1;
#1 a=1'b0; b=1'b1; select=1'b1;
#1 a=1'b1; b=1'b0; select=1'b1;
#1 a=1'b1; b=1'b1; select=1'b1;

end
endmodule
