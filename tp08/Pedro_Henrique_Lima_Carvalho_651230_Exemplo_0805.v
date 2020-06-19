/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 08
Exemplo0805
*/
module halfadder (output s0, carry_out, input a, b);
xor XOR1 (s0, a, b);
and AND1 (carry_out, a, b);
endmodule

module fulladder (output s, carry_out, input a, b, carry_in);
wire out_adder1, cout_adder1, cout_adder2;
halfadder Adder1 (out_adder1, cout_adder1, a, b);
halfadder Adder2 (s, cout_adder2, out_adder1, carry_in);
or OR1(carry_out, cout_adder1, cout_adder2);
endmodule

module Exemplo0805;

//definicoes
integer i;
reg[3:0] a;
wire[3:0] not_a;
not NOTA[3:0](not_a, a);
wire[3:0] s;
wire gnd, cout_fa1, cout_fa2, cout_fa3;

fulladder FA1 (s[0], cout_fa1, not_a[0], 1'b0, 1'b1);
fulladder FA2 (s[1], cout_fa2, not_a[1], 1'b0, cout_fa1);
fulladder FA3 (s[2], cout_fa3, not_a[2], 1'b0, cout_fa2);
fulladder FA4 (s[3], gnd, not_a[3], 1'b0, cout_fa3);


initial
begin: main
$display("Exemplo_0805");
$display("Pedro Henrique Lima Carvalho 651230");

a=0;

//monitor
#1 $monitor("%b 2'complement = %b ", a, s);

for (i = 0; i < 16; i=i+1) begin
    #1 a=i;
end
end
endmodule
