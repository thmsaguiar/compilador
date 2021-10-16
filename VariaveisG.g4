grammar VariaveisG;

@header {
      import java.util.*;
      import java.util.Scanner;
}
@members {
      Variavel x = new Variavel();
      ControleVariavel cv = new ControleVariavel();
      String saida="";
      int escopo;
      int tipo;
      String nome;
}

init: declara 'inicio' AB {saida += "public class Saida{\n";}
                        {saida += "\tpublic static void main(String args[]){\n";}
            declara
            bloco
            FB
            'fim' {saida += "\n\t}\n";}
                        {saida += "}\n";}
                        {System.out.println(saida);};

declara:    (tipo 
                  ID {saida += $ID.text;
                        x = new Variavel($ID.text, tipo, 0);
                        boolean resultado = cv.adiciona(x);
                        if(!resultado){
                              System.out.println("A variavel "+x.getNome()+" ja foi declarada");
                              System.exit(0);
                        }
                     }
                  PV {saida += ";\n";}
                  )*;


tipo:( 'inteiro' {saida += "\tint ";
                          tipo = 1;
                         }
       | 'caracter'{saida += "\tchar ";
                          tipo = 2;
                          }
       | 'flutuante'{saida += "\tfloat ";
                          tipo = 3;
                          }
       );

bloco: (cmd)*;

cmd: cmdatrib | cmdse | cmdimpressao | cmdleitura | cmdwhile | cmdfor ;

cmdse: 'se'
      {
      saida += "\n\tif (";
      } comparacao 
      {
      saida += ")";
      }'entao' AB 
      {
      saida += "{\n\t";
      } bloco FB 
      {
      saida += "\n\t}\n";      
      }('senao'
      {
      saida += "else";
      } AB
      {
      saida += "{\n\t";
      } bloco FB 
      {
      saida += "\n\t}\n";
      })?;

comparacao: (ID {saida += $ID.text;}| NUM{saida += $NUM.text;}) oprel (ID {saida += $ID.text;}| NUM{saida += $NUM.text;});

cmdatrib:      ID {Variavel var1 = cv.busca($ID.text); saida += $ID.text;}
            Op_atrib {saida += " = ";}
            (ID {Variavel var2 = cv.busca($ID.text);                  
                   if(var1.getTipo()!=var2.getTipo()){
                        System.out.println("Atribuição invalida");
                        System.exit(0);
                   }
                saida += $ID.text+";";}
            | NUM{saida += $NUM.text;})
            ;

cmdimpressao: 'imprima'
      {
      saida += "\tSystem.out.println(";
      } ID{
      saida+=$ID.text+")";
      } 
      PV
      {
      saida += ";";
      };

cmdleitura: 'leia' 
            {
            saida+="\tScanner sc = new Scanner(";
            } ID 
            {
            saida+=$ID.text+")";
            }PV {saida+=";\n";};

cmdwhile: 'enquanto'
      {
      saida += "\twhile (";
      } comparacao 
      {
      saida += "){\n\t";
      } bloco FB 
      {
      saida += "\n\t}";      
      };

cmdfor: 'para' AP
      {
      saida += "\tfor (";
      } cmdatrib ';'
      {
      saida += "; ";
      } comparacao ';'
      {
      saida += "; ";      
      } ID 
      {
      saida+=$ID.text;
      } op (ID {saida += $ID.text;}| NUM{saida += $NUM.text;}) FP AB 
      {
      saida += ") {\n\t";
      } bloco FB
      {
      saida += "\n\t}";
      };

op: ('+'{saida += " + ";} | '-'{saida += " - ";} | '/'{saida += " / ";} | '*'{saida += " * ";});
oprel: ('>'{saida += " > ";} | '<'{saida += " < ";} | '>='{saida += " >= ";} | '<='{saida += " <= ";} | '=='{saida += " == ";} | '!='{saida += " != ";}) ;

ID: [A-Za-z]+;
NUM: [0-9]+.?[0-9]*;
PV: ';';
AC: '{' ;
FC: '}' ;
AP: '(' ;
FP: ')' ;
AB: '[';
FB: ']';

Op_atrib: '=';
WS: [ \t\r\n]+ -> skip;