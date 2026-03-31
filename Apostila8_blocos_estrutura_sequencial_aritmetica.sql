-- 1.1 Faça um programa que gere um valor inteiro e o exiba
DO $$ 
BEGIN 
	RAISE NOTICE 'O valor gerado é: %', FLOOR(RANDOM() * 100)::INT; 
END; 
$$

-- 1.2 Faça um programa que gere um valor real e o exiba
DO $$ 
DECLARE
    valor NUMERIC := RANDOM() * 10;
BEGIN 
	RAISE NOTICE 'O valor gerado é: %', ROUND(valor,2); 
END; 
$$

-- 1.3 Faça um programa que gere um valor real entre 20 e 30, que represente um valor em celcius e faça a conversao em fahrenheit
DO $$ 
DECLARE
    valor NUMERIC := RANDOM() * (30 - 20 + 1) + 20;
BEGIN 
	RAISE NOTICE 'O valor gerado é: % resultado em Fahrenheit: %', ROUND(valor,2), ROUND( (valor * 1.8) + 32, 2 ) ; 

END; 
$$
-- 1.4 Faça um programa que gere três valores reais a, b, e c e mostre o valor de delta: aquele que calculamos para chegar às potenciais raízes de uma equação do segundo grau.
DO $$ 
DECLARE
    a NUMERIC := RANDOM() * 10;
    b NUMERIC := RANDOM() * 10;
    c NUMERIC := RANDOM() * 10;
    delta NUMERIC;
    x1 NUMERIC;
    x2 NUMERIC;
BEGIN 
	delta :=  (b ^ 2) - (4 * a * c);
  
    RAISE NOTICE 'DELTA %', delta;
END; 
$$

-- 1.5 Faça um programa que gere um número inteiro e mostre a raiz cúbica de seu antecessor e a raiz quadrada de seu sucessor
DO $$ 
DECLARE
    valor INT = FLOOR(RANDOM() * 100)::INT;
    cubica NUMERIC = (valor - 1) ^ (1.0/3);  
    quadrada NUMERIC = (valor + 1) ^ 0.5;    
BEGIN 
    RAISE NOTICE 'valor % cubica % quadrada %', valor, cubica, quadrada;
END; 
$$

-- 1.6 Faça um programa que gere medidas reais de um terreno retangular. Gere também um valor real no intervalo [60, 70] que representa o preço por metro quadrado. O programa deve exibir o valor total do terreno.
DO $$ 
DECLARE
    altura NUMERIC := RANDOM() * 10;
    largura NUMERIC := RANDOM() * 10;
    preco NUMERIC := RANDOM() * (70 - 60 + 1) + 60;
BEGIN 
    RAISE NOTICE 'altura % largura % preco % total %', ROUND(altura,2), ROUND(largura,2), ROUND(preco,2), ROUND(altura * largura * preco,2);
END; 
$$

-- 1.7 Escreva um programa que gere um inteiro que representa o ano de nascimento de uma pessoa no intervalo [1980, 2000] e gere um inteiro que  epresenta o ano atual no intervalo [2010, 2020]. O programa deve exibir a idade da pessoa em anos. Desconsidere detalhes envolvendo dias, meses, anos bissextos etc.
DO $$ 
DECLARE
   ano1 INT = RANDOM() * (2000 - 1980 + 1) + 1980;
   ano2 INT = RANDOM() * (2020 - 2010 + 1) + 2010;
BEGIN 
    RAISE NOTICE 'ano de nascimento % ano atual % idade %', ano1, ano2, ano2 - ano1;
END; 
$$