/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 12
Exemplo1201
*/

//JK Flip Flop
module jk (output q, output qnot,
           input j, input k,
           input clk, input preset, input clear);

reg q, qnot;

always @ ( posedge clk or preset or clear )
begin
    if (clear)
    begin q<=0; qnot<=1; end
    else
      if (preset)
      begin q<=1; qnot<=0; end
      else
        if (j&~k)
        begin q<=1; qnot<=0; end
        else
          if (~j&k)
          begin q<=0; qnot<=1; end
          else
            if(j&k)
            begin q<=~q; qnot<=~qnot; end
end
endmodule

module ram1x1 (output out,
               input addr, r_w, clk, in, preset, clear);
wire clk_in, j, k, q, notq;
assign clk_in = addr&r_w&clk;
assign j = in;
assign k = ~in;
jk jk1(q, notq,  j, k, clk_in, preset , clear);
assign out = q&addr;

endmodule

module ram1x4 (output[3:0] out, input[3:0] in,
               input addr, r_w, clk, preset, clear);

wire clk_in, j0, j1, j2, j3, k0, k1, k2, k3;
wire q0, q1, q2, q3, notq0,notq1, notq2, notq3;
assign clk_in = addr&r_w&clk;
assign j0 = in[0];
assign j1 = in[1];
assign j2 = in[2];
assign j3 = in[3];
assign k0 = ~in[0];
assign k1 = ~in[1];
assign k2 = ~in[2];
assign k3 = ~in[3];
jk jk0(q0, notq0, j0, k0, clk_in, preset, clear);
jk jk1(q1, notq1, j1, k1, clk_in, preset, clear);
jk jk2(q2, notq2, j2, k2, clk_in, preset, clear);
jk jk3(q3, notq3, j3, k3, clk_in, preset, clear);
assign out[0] = q0&addr;
assign out[1] = q1&addr;
assign out[2] = q2&addr;
assign out[3] = q3&addr;

endmodule


module main;

//definicoes
reg clk, addr, r_w, preset, clear;
reg[3:0] in;
wire[3:0] out;

ram1x4 ram1 (out, in, addr, r_w, clk, preset, clear);

initial
begin
$display(" addr  r_w   in   out");
    //initial values
    clk    = 0;
    addr   = 0;
    r_w    = 0;
    in     = 0;
    preset = 0;
    clear  = 1;

    //input signal changing
    #4 clear = 0;
    #4 addr = 1; r_w = 1; in = 3;
    #4 addr = 0; r_w = 0; in = 0;
    #4 addr = 1; r_w = 0; in = 0;
    #4 addr = 1; r_w = 1; in = 2;
    #4 addr = 0; r_w = 0; in = 1;
    #4 addr = 1; r_w = 0; in = 1;

    #30 $finish;
end//initial begin

always
#2 clk=~clk;

always @ (negedge clk)
begin
    $display("%4b %4b   %4b %4b", addr, r_w, in, out);
end
endmodule
