/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 08
Exemplo0801
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

module Exemplo0801;

//definicoes
integer i, j;
reg[3:0] a, b;
wire[4:0] s;
wire out_fa1, cout_fa1, out_fa2, cout_fa2, out_fa3, cout_fa3, out_fa4, cout_fa4;

fulladder FA1 (s[0], cout_fa1, a[0], b[0], 1'b0);
fulladder FA2 (s[1], cout_fa2, a[1], b[1], cout_fa1);
fulladder FA3 (s[2], cout_fa3, a[2], b[2], cout_fa2);
fulladder FA4 (s[3], s[4], a[3], b[3], cout_fa3);


initial
begin: main
$display("Exemplo_0801");
$display("Pedro Henrique Lima Carvalho 651230");
$display("       binario      |    decimal");

a=0; b=0;

//monitor
#1 $monitor("%b + %b = %b | %d + %d = %d ", a, b, s, a, b, s);

for (i = 0; i < 16; i=i+1) begin
  for (j = 0; j < 16; j=j+1) begin
    #1 a=i; b=j;
  end
end
end
endmodule
