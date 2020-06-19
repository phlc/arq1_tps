/*
Arquitetura de Computadores I - Pucminas
Turno: tarde
Pedro Henrique Lima Carvalho
Mat: 651230
Recuperacao 01 - Exercicios 08 e 09
*/


public class Recuperacao1_8e9{

/*
*dHamming - mede a distancia hamming de dois numeros binarios
*@param String a e String b - numeros binarios como string
*@return int Distancia hammming ou -1 se numeros de tamanhos diferentes
*/		
	public static int dHamming(String a, String b){
		//declaracoes
		int resp = -1;
		int dif = a.length() - b.length();
		
		if(dif==0){
			resp = 0;
		
			//medida distancia hamming
			for (int i=0; i<a.length(); i++){
				if (a.charAt(i) != b.charAt(i))
					resp++;
			}
		}
		return resp;
	}

/*
*bitDifference informa o bit de diferenca se a distanca hamming == 1
*@param String a e String b binarios como string
*@return int bit diferente ou -1 se distancia hamming != 1 
*/
	public static int bitDifference(String a, String b){
		int resp = -1;
		if (dHamming(a, b) == 1){
			for (int i = 0; i<a.length(); i++){
				if (a.charAt(i) != b.charAt(i))
					resp = a.length()-1-i;
			}
		}
		return resp;
	}

/*
*diffString - mostra representacao equilvante da diferenca em caracteres indicada por "_"
*@param String a e String b binarios como string
*@return String representante da diferenca ou "Erro" se tamanhos diferentes
*/
	public static String diffString(String a, String b){
		String resp = "Erro";
		
		if(dHamming(a, b)>=0){
			resp = "";
			for (int i=0; i< a.length(); i++){
				if(a.charAt(i) != b.charAt(i))
					resp = resp + "_";
				else
					resp = resp + a.charAt(i);
			}
		}
		return resp;
	}

/*
*toMinterm - converte o binario em expressao mintermo
*@param - binario no formato string
*@return - String em mintermos
*/
	public static String toMinterm(String a){
		String resp = "";
		for (int i=0; i<a.length(); i++){
			if (a.charAt(i)=='1')
				resp = resp+((char)('a'+i))+".";
			else
				resp = resp+((char)('a'+i))+"'"+".";
		}
		return resp.substring(0, resp.length()-1);
	}

/*
*toMAXTERM - converte o binario em expressao maxtermo
*@param - binario no formato string
*@return - String em maxtermoss
*/
	public static String toMAXTERM(String a){
		String resp = "(";
		for (int i=0; i<a.length(); i++){
			if (a.charAt(i)=='0')
				resp = resp+((char)('A'+i))+"+";
			else
				resp = resp+((char)('A'+i))+"'"+"+";
		}
		return (resp.substring(0, resp.length()-1)+")");
	}
	
/*
*main
*/
	public static void main(String[] args){
		String b13 = "01101";
		String b12 = "01100";
		String b8  = "01000";

		System.out.println(dHamming(b13, b12));
		System.out.println(dHamming(b12, b8));
		System.out.println(dHamming(b13, b8));
		System.out.println(bitDifference(b13, b12));
		System.out.println(bitDifference(b12, b8));
		System.out.println(diffString(b13, b12));
		System.out.println(diffString(b12, b8));
		System.out.println(toMinterm(b13));
		System.out.println(toMinterm(b8));
		System.out.println(toMAXTERM(b13));
		System.out.println(toMAXTERM(b8));
	}
}
