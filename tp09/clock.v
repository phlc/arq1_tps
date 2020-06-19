/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 09
Exemplo0901
*/

/*
* Clock Generator
*/
module clock (output clk);
reg clk;

initial
  begin
    clk = 1'b0;
  end

always
  begin
    #12 clk = ~clk;
end
endmodule
/*
module main;

wire clk;
clock CLK1 (clk);

initial begin
$dumpfile("Exemplo_0901.vcd");
$dumpvars;

#120 $finish;
end
endmodule
*/
