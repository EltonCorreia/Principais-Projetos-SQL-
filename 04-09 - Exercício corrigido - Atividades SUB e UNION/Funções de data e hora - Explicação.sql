-- Funções de data e hora

-- GETDATE() - Retorna a data atual

	-- SELECT GETDATE()

-- DAY() - Retornao dia de uma data fornecida;

	-- SELECT nome, day(dataNascto) FROM funcionario

-- MONTH() - Retorna o mês de uma data fornecida;

	-- SELECT nome, month(dataNascto) FROM funcionario

-- YEAR() - Retorna o ano de uma data fornecida;

	-- SELECT nome, year(dataNascto) FROM funcionario

-- DATEADD() - Adiciona um número a uma parte da data;

	-- SELECT DATEADD(day, 5, dataNascto) FROM funcionario

-- DATEDIFF() - Apresenta o diferença de dias, mês e ano entre duas datas;

	-- SELECT DATEDIFF(day, dataNascto, GETDATE()) FROM funcionario

-- DATENAME() - Apresenta o nome da parte da data (mês ou dia da semana).

	-- SELECT DATENAME(weekday, dataNascto) FROM funcionario

-- UNION - Combina os resultados de duas ou mais queries em um único result set, retornando todas as linhas pertencentes a todas as queries envolvidas na execução.

	--<query> UNION <query>