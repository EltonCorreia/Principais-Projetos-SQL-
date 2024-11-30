-- Fun��es Agregadas

-- Servem para obter dados estat�sticos no BD, exemplos abaixos:

--------------------------------------------------------------

-- avg() - Retorna a m�dia artim�tica de uma coluna.

-- select avg(salario) from cadfun
-- select avg(distinct salario) from cadfun
-- select avg(salario) from cadfun where depto=3

--------------------------------------------------------------

-- count() - Retorna o valor num�rico inteiro de um campo.

-- select count(*) from cadfun where depto in (3,5)
-- select count(filhos) from cadfun
-- select count(*) from cadfun where salario > 2000

--------------------------------------------------------------

-- max() - Retorna o maior valor de uma coluna.

-- select max(salario) from cadfun

--------------------------------------------------------------

-- min() - Retorna o menor valor de uma coluna.

-- select min(salario) from cadfun

--------------------------------------------------------------

-- sum() - Retorna o resultado de uma soma de uma coluna.

-- select sum(filhos) from cadfun
-- select sum(salario) from cadfun
-- select sum(salario) from cadfun where depto in (3,5)

--------------------------------------------------------------

-- Agrupamento de resultados

--------------------------------------------------------------

-- group by - permite que a apresenta��o dos dados retornados da consulta seja agrupada de acordo com uma determinada condi��o:

-- select depto,count(*) as quantidade from cadfun group by depto
-- select depto,sum(salario) as 'salario total' from cadfun group by depto

-- select codMusica, count(*) from musicaAutor group by codMusica having codMusica < 15
-- select codMusica, count(*) from musicaAutor where codMusica < 15 group by codMusica

--------------------------------------------------------------

-- Subquerie

-- Permitem que seja feita uma pesquisa nos dados de uma tabela com base na exist�ncia ou n�o nos dados de outra tabela.

--Regras:

	-- Toda subquerie deve ser escrita entre par�nteses
	-- S� poder� retornar uma coluna

--------------------------------------------------------------

-- subqueries com in/not

-- Para obter todos os cargos que est�o sem funcion�rios:

	-- select*from cargo where cod_cargo in (select cod_cargo from funcionario)

-- Para obter todos os cargos que n�o tem dependentes:

	-- select*from cargo where cod_cargo in (select cod_cargo from funcionario where cod_func in (select cod_func from dependente))

-- Para obter todos os cargos que est�o cadastrados:

	-- select*from cargo where cod_cargo not in (select cod_cargo from funcionario)

-- Para saber todos os dados dos funcion�rios que tem maior sal�rio:

	-- select*from funcionario where sal_func = (select max(sal_func) from funcionario)

-- Para obter os dados dos funcionarios que possuem dependentes e o menor sal�rio:

	-- select*from funcionario where sal_func = (select min(sal_func) from funcionario where cod_func in (select cod_func from dependente))

-- Para exibir todos os dados de cada funcion�rio e quantidade de dependentes que cada um possui:

	-- select*,(select count(*) from dependente where cod_func = funcionario.cod_func) as qtde_dep from funcionario

-- Para obtermos o c�digo e o nome dos cargos e  quantidade de funcion�rios que cada cargo possui:

	-- select*,(select count(*) from dependente where cod_func = funcionario.cod_func as qtde_dep from funcionario)

--------------------------------------------------------------

-- update e delete com subquerie

-- Para aplicar 10% de aumento para todos os funcion�rios que n�o tenha, dependentes:

	-- UPTADE FUNCIONARIO SET SAL_FUNC = SAL_FUNC * 1.1 WHERE COD_FUNC NOT IN (SELECT COD_FUNC FROM DEPENDENTE)

-- Excluir todos os funcion�rios que n�o tenham dependentes

	-- DELETE FROM FUNCIONARIO WHERE COD_FUNC NOT IN ( SELECT COD_FUNC FROM DEPENDENTE)




