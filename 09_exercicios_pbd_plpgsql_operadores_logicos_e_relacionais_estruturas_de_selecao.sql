-- Função para gerar valor aleatório entre limite inferior e superior
CREATE OR REPLACE FUNCTION valor_aleatorio_entre(lim_inferior INT, lim_superior INT)
RETURNS INT AS $$
BEGIN
    RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;

-- 1.1 Programa que verifica se um número é múltiplo de 3 (usando IF ELSE)
DO $$
DECLARE
    valor INT := valor_aleatorio_entre(1, 100);
BEGIN
    RAISE NOTICE 'O valor gerado é: %', valor;
    IF valor % 3 = 0 THEN
        RAISE NOTICE '% é divisível por 3', valor;
    ELSE
        RAISE NOTICE '% não é divisível por 3', valor;
    END IF;
END;
$$;

-- 1.1 Programa que verifica se um número é múltiplo de 3 (usando CASE)
DO $$
DECLARE
    valor INT;
BEGIN
    valor := valor_aleatorio_entre(1, 100);

    RAISE NOTICE 'O valor gerado é: %', valor;

    CASE
        WHEN valor % 3 = 0 THEN
            RAISE NOTICE '% é divisível por 3', valor;
        ELSE
            RAISE NOTICE '% não é divisível por 3', valor;
    END CASE;

END $$;

-- 1.2 Programa que verifica se um número é múltiplo de 3 ou de 5 (usando IF ELSE)
DO $$
DECLARE
    valor INT := valor_aleatorio_entre(1, 100);
BEGIN
    RAISE NOTICE 'O valor gerado é: %', valor;
    IF valor % 3 = 0 THEN
        RAISE NOTICE '% é divisível por 3', valor;
    ELSIF valor % 5 = 0 THEN
        RAISE NOTICE '% é divisível por 5', valor;
    ELSE
        RAISE NOTICE '% não é divisível por 3 ou 5', valor;
    END IF;
END;
$$;

-- 1.2 Programa que verifica se um número é múltiplo de 3 ou de 5 (usando CASE)
DO $$
DECLARE
    valor INT;
BEGIN
    valor := valor_aleatorio_entre(1, 100);

    RAISE NOTICE 'O valor gerado é: %', valor;

    CASE
        WHEN valor % 3 = 0 THEN
            RAISE NOTICE '% é divisível por 3', valor;
        WHEN valor % 5 = 0 THEN
            RAISE NOTICE '% é divisível por 5', valor;
        ELSE
            RAISE NOTICE '% não é divisível por 3 ou 5', valor;
    END CASE;

END;
$$ LANGUAGE plpgsql;

-- 1.3 Função de menu para operações de soma, subtração, multiplicação e divisão (usando IF ELSE)
CREATE OR REPLACE FUNCTION menu(operacao INTEGER, op1 INTEGER, op2 INTEGER)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    IF operacao = 1 THEN
        resultado := op1 || ' + ' || op2 || ' = ' || (op1 + op2);
    ELSIF operacao = 2 THEN
        resultado := op1 || ' - ' || op2 || ' = ' || (op1 - op2);
    ELSIF operacao = 3 THEN
        resultado := op1 || ' * ' || op2 || ' = ' || (op1 * op2);
    ELSIF operacao = 4 THEN
        IF op2 = 0 THEN
            resultado := 'Erro: divisão por zero!';
        ELSE
            resultado := op1 || ' / ' || op2 || ' = ' || (op1 / op2);
        END IF;
    ELSE
        resultado := 'Erro: operação inválida!';
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.3 Função de menu para operações de soma, subtração, multiplicação e divisão (usando CASE)
CREATE OR REPLACE FUNCTION menu(operacao INTEGER, op1 INTEGER, op2 INTEGER)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    CASE operacao
        WHEN 1 THEN
            resultado := op1 || ' + ' || op2 || ' = ' || (op1 + op2);
        WHEN 2 THEN
            resultado := op1 || ' - ' || op2 || ' = ' || (op1 - op2);
        WHEN 3 THEN
            resultado := op1 || ' * ' || op2 || ' = ' || (op1 * op2);
        WHEN 4 THEN
            IF op2 = 0 THEN
                resultado := 'Erro: divisão por zero!';
            ELSE
                resultado := op1 || ' / ' || op2 || ' = ' || (op1 / op2);
            END IF;
        ELSE
            resultado := 'Erro: operação inválida!';
    END CASE;
   
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.4 Função para calcular o preço de venda com base no lucro (usando IF ELSE)
CREATE OR REPLACE FUNCTION lucro(valor INTEGER)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    IF valor <= 20 THEN
        resultado := valor || ' menor que R$20 lucro de 45% valor total = '  || (valor + (valor * 0.45));
    ELSE
        resultado := valor || ' maior que R$20 lucro de 30% valor total = '  || (valor + (valor * 0.30));
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.4 Função para calcular o preço de venda com base no lucro (usando CASE)
CREATE OR REPLACE FUNCTION lucro(valor INTEGER)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    CASE
        WHEN valor <= 20 THEN
            resultado := valor || ' menor que R$20 lucro de 45% valor total = '  || (valor + (valor * 0.45) );
       
        ELSE
             resultado := valor || ' maior que R$20 lucro de 30% valor total = '  || (valor + (valor * 0.30) );
    END CASE;
   
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.5 Função para calcular reajuste salarial de um funcionário (usando IF ELSE)
CREATE OR REPLACE FUNCTION calcular_reajuste(salario NUMERIC)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    IF salario <= 400 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.15)) ||
                     ' Reajuste ganho = ' || salario * 0.15 || ' Percentual 15%';
    ELSIF salario <= 800 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.12)) ||
                     ' Reajuste ganho = ' || salario * 0.12 || ' Percentual 12%';
    ELSIF salario <= 1200 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.10)) ||
                     ' Reajuste ganho = ' || salario * 0.10 || ' Percentual 10%';
    ELSIF salario <= 2000 THEN
        resultado := 'Novo salario = ' || (salario + (salario * 0.07)) ||
                     ' Reajuste ganho = ' || salario * 0.07 || ' Percentual 07%';
    ELSE
        resultado := 'Novo salario = ' || (salario + (salario * 0.04)) ||
                     ' Reajuste ganho = ' || salario * 0.04 || ' Percentual 04%';
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

-- 1.5 Função para calcular reajuste salarial de um funcionário (usando CASE)
CREATE OR REPLACE FUNCTION calcular_reajuste_case(salario NUMERIC)
RETURNS TEXT AS $$
DECLARE
    resultado TEXT;
BEGIN
    CASE
        WHEN salario <= 400 THEN
            resultado := 'Novo salario = ' || (salario + salario * 0.15) ||
                         ' Reajuste ganho = ' || (salario * 0.15) ||
                         ' Percentual 15%';

        WHEN salario <= 800 THEN
            resultado := 'Novo salario = ' || (salario + salario * 0.12) ||
                         ' Reajuste ganho = ' || (salario * 0.12) ||
                         ' Percentual 12%';

        WHEN salario <= 1200 THEN
            resultado := 'Novo salario = ' || (salario + salario * 0.10) ||
                         ' Reajuste ganho = ' || (salario * 0.10) ||
                         ' Percentual 10%';

        WHEN salario <= 2000 THEN
            resultado := 'Novo salario = ' || (salario + salario * 0.07) ||
                         ' Reajuste ganho = ' || (salario * 0.07) ||
                         ' Percentual 07%';

        ELSE
            resultado := 'Novo salario = ' || (salario + salario * 0.04) ||
                         ' Reajuste ganho = ' || (salario * 0.04) ||
                         ' Percentual 04%';
    END CASE;

    RETURN resultado;
END;
$$ LANGUAGE plpgsql;