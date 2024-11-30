-- Declaração de variavéis no SQL

/*
DECLARE @a int = 1, @b int = 2, @c varchar = 'A'

--PRINT @a

--PRINT @b

--PRINT @c
*/

-- Exemplo 1

/*
DECLARE @a int = 1, @b int = 2

IF @a > @b

	BEGIN 
		PRINT @a
		PRINT 'É maior que'
		PRINT @b
	END

ELSE

	BEGIN
		PRINT @a
		PRINT 'Não é maior que'
		PRINT @b
	END

PRINT 'Continua'
*/

-- Exemplo 2

IF(SELECT Idade FROM Funcionario WHERE Cod_Func=1)>=50
	BEGIN
		UPDATE Funcionario SET
		Sal_Func = Sal_Func * 1.5 WHERE Cod_Func = 1
	END

-- Exemplo 3 

IF(SELECT Idade FROM Funcionario WHERE Cod_Func = 1) >= 50
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.5 WHERE Cod_Func = 1
	END
ELSE
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.4 WHERE Cod_Func = 1
	END

-- Exemplo 4

DECLARE @idade Tinyint
SELECT @idade = idade FROM Funcionario WHERE Cod_Func = 1
IF @idade >= 50
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.5 WHERE Cod_Func = 1
	END
ELSE IF @idade BETWEEN 40 AND 49
	BEGIN
		UPDATE Funcionario SET Sal_Func = Sal_Func * 1.4 WHERE Cod_Func = 1
	END

-- CASE

-- Analise o valor de uma variável ou coluna de uma tabela com relação a uma lista de condições e retorna um dos resultados dessa lista. Ele evita que sejam utilizados vários comandos IF´s aninhados.

SELECT codFunc, Nome, DataNasc,
	CASE DATEPART(WEEKDAY, DataNasc)
		WHEN 1 THEN 'Domingo'
		WHEN 2 THEN 'Segunda'
		WHEN 3 THEN 'Terça'
		WHEN 4 THEN 'Quarta'
		WHEN 5 THEN 'Quinta'
		WHEN 6 THEN 'Sexta'
		WHEN 7 THEN 'Sábado'
	END AS 'Dia da semana' FROM funcionarios

-- WHILE

-- Faz com que um comando no SQL seja executado repetidamente.

DECLARE @i int = 0
	WHILE @i <= 10
		BEGIN
			PRINT @i
			SET @i += 1
		END

----------------------------------------------------

DECLARE @dezena int, @i int = 0
	WHILE @i < 6
		BEGIN
			SET @dezena = 60*RAND()
			PRINT @dezena
			SET @i += 1
			-- set @i = @i + 1
		END

PRINT 'Boa sorte!'

