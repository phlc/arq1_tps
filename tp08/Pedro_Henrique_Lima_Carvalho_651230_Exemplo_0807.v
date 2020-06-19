/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 08
Exemplo0807
*/
module equals (output [3:0] bitwise, output logical, input [3:0] a, b);
xnor XNOR0 (bitwise[0], a[0], b[0]);
xnor XNOR1 (bitwise[1], a[1], b[1]);
xnor XNOR2 (bitwise[2], a[2], b[2]);
xnor XNOR3 (bitwise[3], a[3], b[3]);
and(logical, bitwise[0], bitwise[1], bitwise[2], bitwise[3]);
endmodule

module not_equals (output [3:0] bitwise, output logical, input [3:0] a, b);
xor XOR0 (bitwise[0], a[0], b[0]);
xor XOR1 (bitwise[1], a[1], b[1]);
xor XOR2 (bitwise[2], a[2], b[2]);
xor XOR3 (bitwise[3], a[3], b[3]);
or(logical, bitwise[0], bitwise[1], bitwise[2], bitwise[3]);
endmodule

module mux1b(output s, input a, b, select);
wire and1, and2, not_select;
not(not_select, select);
and(and1, a, not_select);
and(and2, b, select);
or(s, and1, and2);
endmodule

module ext1_4 (output [3:0] s, input a);
assign s[0] = a;
assign s[1] = a;
assign s[2] = a;
assign s[3] = a;
endmodule

module mux4b(output [3:0] s, input [3:0] a, b, input select);
wire [3:0] and1, and2, b4_select, not_select;
ext1_4 EXT(b4_select, select);
not nt[3:0] (not_select, b4_select);
and an1[3:0] (and1, not_select, a);
and an2[3:0] (and2, b4_select, b);
or or1[3:0] (s, and1, and2);
endmodule

module Exemplo0807;

//definicoes
integer i, j;
reg select;
reg[3:0] a, b;
wire [3:0] eq_out4, neq_out4, bitwise;
wire eq_out, neq_out, logical;

equals EQ (eq_out4, eq_out, a, b);
not_equals NEQ (neq_out4, neq_out, a, b);

mux4b MUX4B (bitwise, eq_out4, neq_out4, select);
mux1b MUX1B (logical, eq_out, neq_out, select);

initial
begin: main
$display("Exemplo_0807");
$display("Pedro Henrique Lima Carvalho 651230");
$display("  a      b   | bitwise | logic | select");

a=0; b=0; select=0;

//monitor
#1 $monitor("%b   %b  |   %b  |   %b   | %b", a, b, bitwise[3:0], logical, select);

for (i = 0; i < 16; i=i+1) begin
  for (j = 0; j < 16; j=j+1) begin
    #1 a=i; b=j;
  end
end

#1;
$display("");
$display("  a      b   | bitwise | logic | select");
for (i = 0; i < 16; i=i+1) begin
  for (j = 0; j < 16; j=j+1) begin
    #1 a=i; b=j; select=1;
  end
end
end
endmodule
