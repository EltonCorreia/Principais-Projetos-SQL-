-- Fun��es de data e hora

-- GETDATE() - Retorna a data atual

	-- SELECT GETDATE()

-- DAY() - Retornao dia de uma data fornecida;

	-- SELECT nome, day(dataNascto) FROM funcionario

-- MONTH() - Retorna o m�s de uma data fornecida;

	-- SELECT nome, month(dataNascto) FROM funcionario

-- YEAR() - Retorna o ano de uma data fornecida;

	-- SELECT nome, year(dataNascto) FROM funcionario

-- DATEADD() - Adiciona um n�mero a uma parte da data;

	-- SELECT DATEADD(day, 5, dataNascto) FROM funcionario

-- DATEDIFF() - Apresenta o diferen�a de dias, m�s e ano entre duas datas;

	-- SELECT DATEDIFF(day, dataNascto, GETDATE()) FROM funcionario

-- DATENAME() - Apresenta o nome da parte da data (m�s ou dia da semana).

	-- SELECT DATENAME(weekday, dataNascto) FROM funcionario

-- UNION - Combina os resultados de duas ou mais queries em um �nico result set, retornando todas as linhas pertencentes a todas as queries envolvidas na execu��o.

	--<query> UNION <query>