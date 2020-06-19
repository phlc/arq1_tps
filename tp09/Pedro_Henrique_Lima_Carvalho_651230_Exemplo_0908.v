/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 09
Exemplo0908
*/

//inclusoes
`include "clock.v"

/*
*modulos
*/

module pulse (signal, clock);
input clock;
output signal;
reg signal;

always @ (clock)
begin
  signal = 1'b1;
#4 signal = 1'b0;
/*
#4 signal = 1'b1;
*/

end
endmodule

module main;

clock clk(clock);
wire p;

pulse pls (p, clock);


initial begin
$dumpfile("Exemplo_0908.vcd");
$dumpvars(1, clock, p);

#480 $finish;

end
endmodule
