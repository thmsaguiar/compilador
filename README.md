# Compilador com ANTLR4
![antlr](https://img.shields.io/badge/antlr-v4.9.2-blue)
![GitHub repo size](https://img.shields.io/github/repo-size/thmsaguiar/compilador)


## ANTLR e GRAMMAR
O Another Tool for Language Recognition, mais conhecido como ANTLR, é uma ferramenta utilizada para gerar compiladores. Ele é contruído em JAVA. A gramática valida as expressões regulares criadas para a linguagem de programação. Para compilar a gramática na sua máquina é necessário ter o java instalado e configurado corretamente assim como a instalação do antlr.

## O Compilador
O compilador recebe como entrada o arquivo `Programa.txt` onde contêm o programa escrito na linguagem criada, e faz conversão para a Linguagem Java. Este compilador foi criado como trabalho da matéria de Compiladores da Universidade Anhembi Morumbi do curso de Ciência da Computação.

## Sintaxe da Linguagem
A presente linguagem permite a declaração de variável global, a declaração do inicio do programa é dada por:

```
<declaração variáveis> inicio [ <declaração variáveis | bloco de comandos> ] fim
```

### Índice

1. [Declaração de variável](#declaracao)
2. [Bloco de comandos](#comandos)
  1. [Atribuicao](#subparagraph1)
  2. [Leitura](#subparagraph2)
  3. [Impressão](#subparagraph3)
  4. [Condicional If](#subparagraph4)
  5. [Repetição While](#subparagraph5)
  6. [Repetição For](#subparagraph6)

## Declaração de variável <a name="declaracao"></a>
Nesta linguagem existem três tipos de variáveis, `inteiro`, `flutuante` e `caracter`. O `identificador` é um conjunto de letras de `a-z`, sendo maiúsculas ou minúsculas. Que são declaradas da seguinte forma:
```
<tipo> identificador ;
```

## Bloco de comandos <a name="comandos"></a>
Um bloco de comando é composto pelos comando `atribuição`, `leitura`, `impressão`, `condicional` e `repetição`. Suas respectivas sintaxe são:

### 1. Atribuição <a name="subparagraph1"></a>
Para realizar uma atribuição é necessário a declaração prévia da variável. Sendo declarada previamente podemos fazer a atribuição com:
```
<identificador> = <identificador | número> ;
```
### 2. Leitura <a name="subparagraph2"></a>
Para ler uma dado de uma variável utilizamos:
```
leia <identificador> ;
```
### 3. Impressão <a name="subparagraph3"></a>
O método de impressão ou `print` é feito somente para impressão de variáveis. Como pode ser visto em sua sintaxe:
```
imprima <identificador> ;
```
### 4. Condicional If <a name="subparagraph4"></a>
Se deseja realizar uma estrutura condição temos a estrutra `se` definida em:
```
se <identificador | número> operador_relacional <identificador | número> entao [ <bloco de comandos> ] 
```
### 5. Repetição While <a name="subparagraph5"></a>
Para repetir um bloco de comandos podemos utilizar o `enquanto` definido em:
```
enquanto <identificador | número> operador_relacional <identificador | número> entao [ <bloco de comandos> ] 
```
### 6. Repetição For <a name="subparagraph6"></a>
Além da repetição while podemos usar `para` que é como se fosse o `for` da linguagem Java. Sua sintaxe é:
```
para ( <atribuição> ;  <identificador> operador_relacional <identificador | número> ; operador_matematico <identificador | número> ) [ <bloco de comandos> ]
```
## Executar
Se deseja fazer um teste na sua máquina, coloque todos os arquivos na mesma pasta do seu `antlr4` e `grun`. Após isso execute no prompt, na pasta que contêm os arquivos, o comando `antlr4 VariaveisG.g4`, que gerará os arquivos `Lexer` e `Parser` da gramática, então compile todos os arquivos `.java` com `javac *.java`. Para finalizar execute o comando `grun VariaveisG init Programa.txt` que compilara o nosso arquivo de linguagem e retornará um programa equivalente em linguagem Java.
## Obrigado por ficar até aqui!

Espero que tenha ajudado você nos seus estudos!! Se tiver interesse em criar sua própria linguagem dê uma olhada nesse outro [projeto](https://github.com/thmsaguiar/antlr4grammarif).

<div align="center">
  
  [!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/thmsaguiar)
  
</div>
