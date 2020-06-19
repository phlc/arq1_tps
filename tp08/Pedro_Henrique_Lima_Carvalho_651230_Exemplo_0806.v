/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 08
Exemplo0806
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

module mux (output s, input a, b, select);
wire not_select, and1, and2;
not (not_select, select);
and (and1, a, not_select);
and (and2, b, select);
or (s, and1, and2);
endmodule

module lu (output [3:0] out, input [3:0] in, input au_lu);
wire out_or;
nor (out_or, in[0], in[1], in[2], in[3]);
mux MUX0(out[0], in[0], out_or, au_lu);
mux MUX1(out[1], in[1], 1'b0, au_lu);
mux MUX2(out[2], in[2], 1'b0, au_lu);
mux MUX3(out[3], in[3], 1'b0, au_lu);
endmodule

module Exemplo0806;

//definicoes
integer h, i, j;
reg select, au_lu;
reg[3:0] a, b;
wire[4:0] p_lu;
wire[3:0] s;
wire or_out, cout_fa1, cout_fa2, cout_fa3, xor_b0, xor_b1, xor_b2, xor_b3;
or(or_out, select, au_lu);
xor (xor_b0, b[0], or_out);
xor (xor_b1, b[1], or_out);
xor (xor_b2, b[2], or_out);
xor (xor_b3, b[3], or_out);


fulladder FA1 (p_lu[0], cout_fa1, a[0], xor_b0, or_out);
fulladder FA2 (p_lu[1], cout_fa2, a[1], xor_b1, cout_fa1);
fulladder FA3 (p_lu[2], cout_fa3, a[2], xor_b2, cout_fa2);
fulladder FA4 (p_lu[3], p_lu[4], a[3], xor_b3, cout_fa3);

lu LU1 (s, p_lu[3:0], au_lu);

initial
begin: main
$display("Exemplo_0806");
$display("Pedro Henrique Lima Carvalho 651230");
$display("  a      b    result | select au_lu");
a=0; b=0; select=0; au_lu=0;

//monitor
#1 $monitor("%b   %b = %b   |    %b     %b ", a, b, s, select, au_lu);

$display("  a      b    result | select au_lu");
  for (i = 0; i < 16; i=i+1) begin
    for (j = 0; j < 16; j=j+1) begin
      #1 a=i; b=j;
    end
  end

select=1;
$display("  a      b    result | select au_lu");
  for (i = 0; i < 16; i=i+1) begin
    for (j = 0; j < 16; j=j+1) begin
      #1 a=i; b=j;
    end
  end

select=0; au_lu=1;
$display("  a      b    result | select au_lu");
  for (i = 0; i < 16; i=i+1) begin
    for (j = 0; j < 16; j=j+1) begin
      #1 a=i; b=j;
    end
  end
end
endmodule
