-- Funções Agregadas

-- Servem para obter dados estatísticos no BD, exemplos abaixos:

--------------------------------------------------------------

-- avg() - Retorna a média artimética de uma coluna.

-- select avg(salario) from cadfun
-- select avg(distinct salario) from cadfun
-- select avg(salario) from cadfun where depto=3

--------------------------------------------------------------

-- count() - Retorna o valor numérico inteiro de um campo.

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

-- group by - permite que a apresentação dos dados retornados da consulta seja agrupada de acordo com uma determinada condição:

-- select depto,count(*) as quantidade from cadfun group by depto
-- select depto,sum(salario) as 'salario total' from cadfun group by depto

-- select codMusica, count(*) from musicaAutor group by codMusica having codMusica < 15
-- select codMusica, count(*) from musicaAutor where codMusica < 15 group by codMusica

--------------------------------------------------------------

-- Subquerie

-- Permitem que seja feita uma pesquisa nos dados de uma tabela com base na existência ou não nos dados de outra tabela.

--Regras:

	-- Toda subquerie deve ser escrita entre parênteses
	-- Só poderá retornar uma coluna

--------------------------------------------------------------

-- subqueries com in/not

-- select*from cargo where cod_cargo in (select cod_cargo from funcionario)
-- select*from cargo where cod_cargo in (select cod_cargo from funcionario where cod_func in (select cod_func from dependente))

-- select*from cargo where cod_cargo not in (select cod_carfo from funcionario)
-- select*from funcionario where sal_func = (select max(sal_func) from funcionario)

-- select*from funcionario where sal_func = (select min(sal_func) from funcionario where cod_func in (select cod_func from dependente))
-- select*,(select count(*) from dependente where cod_func = funcionario.cod_func) as qtde_dep from funcionario

-- select*,(select count(*) from dependente where cod_func = funcionario.cod_func as qtde_dep from funcionario)

--------------------------------------------------------------

-- update e delete com subquerie




