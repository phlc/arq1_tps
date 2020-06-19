/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 09
Exemplo0903
*/

//inclusoes
`include "clock.v"

/*
*modulos
*/

module pulse1 (signal, clock);
input clock;
output signal;
reg signal;

always @ ( posedge clock )
begin
  signal = 1'b1;
#4 signal = 1'b0;
#4 signal = 1'b1;
#4 signal = 1'b0;
#4 signal = 1'b1;
#4 signal = 1'b0;
end
endmodule

module pulse2 (signal, clock);
input clock;
output signal;
reg signal;

always @ ( posedge clock )
begin
  signal = 1'b1;
#5 signal = 1'b0;
end
endmodule


module pulse3 (signal, clock);
input clock;
output signal;
reg signal;

always @ ( negedge clock )
begin
  signal = 1'b1;
#15 signal = 1'b0;
#15 signal = 1'b1;
end
endmodule

module pulse4 (signal, clock);
input clock;
output signal;
reg signal;

always @ ( negedge clock )
begin
  signal = 1'b1;
#20 signal = 1'b0;
#20 signal = 1'b1;
#20 signal = 1'b0;
end
endmodule

module main;

wire clock;
clock clk (clock);

wire p1, p2, p3, p4;

pulse1 pls1 (p1, clock);
pulse2 pls2 (p2, clock);
pulse3 pls3 (p3, clock);
pulse4 pls4 (p4, clock);


initial begin
$dumpfile("Exemplo_0903.vcd");
$dumpvars(1, clock,p1, p2, p3, p4);

#480 $finish;

end
endmodule
