/*
Arquitetura de Computadores I - Pucminas
Pedro Henrique Lima Carvalho
Matricula: 651230
Turno: Tarde
Guia 11
FSM_000or111.v
*/

// FSM

//constant definitions
`define found 1
`define notfound 0

//FSM
module fsm_000or111 (y, x, clk, reset);
output y;
input x;
input clk;
input reset;

reg y;

parameter    //state identifiers
start = 4'b0000,
id0   = 4'b0001,
id00  = 4'b0010,
id000 = 4'b1000, //signal found
id1   = 4'b0100,
id11  = 4'b0101,
id111 = 4'b1111;

reg[3:0] E1;//current state variables
reg[3:0] E2;//next state logic output

//next state logic
always @(x or E1)
begin
  case (E1)
  start:
    if (x)
      E2 = id1;
    else
      E2 = id0;
  id1:
    if (x)
      E2 = id11;
    else
      E2 = id0;
  id11:
    if (x)
      E2 = id111;
    else
      E2 = id0;
  id0:
    if (x)
      E2 = id1;
    else
      E2 = id00;
  id00:
    if (x)
      E2 = id1;
    else
      E2 = id000;
  default: //undefined state
    E2 = 4'bxxxx;
  endcase
end //always at signal or state changing

//state variables
always @ ( posedge clk or negedge reset )
  begin
  if (reset)
    E1=E2; //updates current state
  else
    E1=0; //reset
  end //always at signal changing

//output logic
always @ (E1)
  begin
  y=E1[3]; //first bit of state value (MOORE indicator)
end //always at state changing
endmodule //Moore_1101
