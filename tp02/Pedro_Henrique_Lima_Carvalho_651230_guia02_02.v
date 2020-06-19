/*
* Aluno: Pedro Henrique Lima Carvalho
* Matricula: 651230
* Arquitetura 1 - Tarde
* Guia_02 Exercicio 02c.
*/
module Guia_02_02c;
// define data
real numeros [0:4]; //decimais
real frac; // para parte fracionaria
real inte; //para parte inteira
integer nums = 0; // contador
integer bits = 0; // contador
reg[0:7] fr [0:4]; //parte fracionaria

// actions
initial
begin : main
numeros[0] = 0.12500;
numeros[1] = 0.87500;
numeros[2] = 1.25000;
numeros[3] = 3.75000;
numeros[4] = 14.03125;

$display ( "Guia_02 - Ex_02c" );
  while (nums<5) begin
    frac = numeros[nums]%1;
    inte = numeros[nums]-frac;
    while (bits<8) begin
      frac = frac*2.0;
      if(frac>=1.0)begin
        fr[nums][bits]=1;
        frac = frac-1.0;
      end//if
      else begin
        fr[nums][bits]=0;
      end //else
      bits=bits+1;
    end//while
    bits = 0;
    $display ( "%f(10) = %0b.%8b(2)" , numeros[nums], inte, fr[nums]);
    nums=nums+1;
  end//while
end // main
endmodule // Guia
