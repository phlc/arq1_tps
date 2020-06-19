/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 12
Exemplo1207
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

module ram1x2 (output[1:0] out, input[1:0] in,
               input addr, r_w, clk, preset, clear);

wire clk_in, j0, j1, k0, k1;
wire q0, q1, notq0, notq1;
assign clk_in = addr&r_w&clk;
assign j0 = in[0];
assign j1 = in[1];
assign k0 = ~in[0];
assign k1 = ~in[1];
jk jk0(q0, notq0, j0, k0, clk_in, preset, clear);
jk jk1(q1, notq1, j1, k1, clk_in, preset, clear);
assign out[0] = q0&addr;
assign out[1] = q1&addr;

endmodule

module ram1x4 (output[3:0] out, input[3:0] in,
               input addr, r_w, clk, preset, clear);
wire[1:0] q0, q1;
ram1x2 ram0(q0, in[1:0], addr, r_w, clk, preset, clear);
ram1x2 ram1(q1, in[3:2], addr, r_w, clk, preset, clear);

assign out[0] = q0[0]&addr;
assign out[1] = q0[1]&addr;
assign out[2] = q1[0]&addr;
assign out[3] = q1[1]&addr;

endmodule

module ram1x8 (output[7:0] out, input[7:0]in,
            input addr, r_w, clk, preset, clear);

wire[3:0] q00, q01;
ram1x4 ram00(q00, in[3:0], addr, r_w, clk, preset, clear);
ram1x4 ram01(q01, in[7:4], addr, r_w, clk, preset, clear);

assign out[0] = (q00[0]&addr);
assign out[1] = (q00[1]&addr);
assign out[2] = (q00[2]&addr);
assign out[3] = (q00[3]&addr);
assign out[4] = (q01[0]&addr);
assign out[5] = (q01[1]&addr);
assign out[6] = (q01[2]&addr);
assign out[7] = (q01[3]&addr);

endmodule

module ram1x16 (output[15:0] out, input[15:0]in,
               input addr, r_w, clk, preset, clear);
wire[15:0] q;

ram1x8 ram0(q[7:0], in[7:0], addr, r_w, clk, preset, clear);
ram1x8 ram1(q[15:8], in[15:8], addr, r_w, clk, preset, clear);

assign out = q;
endmodule

module ram4x16 (output[15:0] out, input[15:0]in,
               input[1:0] addr,
               input r_w, clk, preset, clear);
wire[15:0] q00, q01, q10, q11;
wire add00, add01, add10, add11;

assign add00 = ~addr[1]&~addr[0];
assign add01 = ~addr[1]&addr[0];
assign add10 = addr[1]&~addr[0];
assign add11 = addr[1]&addr[0];
reg[15:0] resp;

ram1x16 ram00(q00, in, add00, r_w, clk, preset, clear);
ram1x16 ram01(q01, in, add01, r_w, clk, preset, clear);
ram1x16 ram10(q10, in, add10, r_w, clk, preset, clear);
ram1x16 ram11(q11, in, add11, r_w, clk, preset, clear);

always @ (clk)begin
if (add00)
  resp = q00;
if (add01)
  resp = q01;
if (add10)
  resp = q10;
if (add11)
  resp = q11;
end

assign out = resp;
endmodule

module main;

//definicoes
reg clk, r_w, preset, clear;
reg[1:0] addr;
reg[15:0] in;
wire[15:0] out;

ram4x16 ram1 (out, in, addr, r_w, clk, preset, clear);

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
    #4 addr = 0; r_w = 1; in = 63;
    #8 addr = 1; r_w = 1; in = 1023;
    #8 addr = 2; r_w = 1; in = 4095;
    #8 addr = 3; r_w = 1; in = 65535;
    #8 addr = 0; r_w = 0; in = 0;
    #8 addr = 1; r_w = 0; in = 0;
    #8 addr = 2; r_w = 0; in = 0;
    #8 addr = 3; r_w = 0; in = 0;

    #4 $finish;
end//initial begin

always
#2 clk=~clk;

always @ (negedge clk)
begin
    $display("%4b %4b   %16b %16b", addr, r_w, in, out);
end
endmodule
