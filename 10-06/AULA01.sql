-- comentários em uma  linha
/*
comentarios em varias linhas
*/

-- usuario sa
-- senha estesp

/*create database aula01

use aula01 --abre um banco q eu desejo trabalhar

drop database aula01 --deleta o banco de dados, q não estiver em uso. 

use master --acessa outro banco e pode apagar e ai consegue apagar o anterior q estava em uso.

-- criação de uma tabela:
create table tblTipo(
Codigo int not null primary key,
Nome varchar(30) not null)

-- criação de uma tabela com chave primaria composta de 2 campos

create table tblTotalfaturado(
mes int not null,
ano integer,
valor decimal(12,2),
primary key(mes,ano))

--criação de uma tabela com chave estrangeira
create table tblSecao(
codigo int not null primary key,
descricao varchar(20) not null,
coddepto int foreign key references departamento (codigo);

--erro pq não tem tabela departamento no sistema. para corrigir criar primeiro a tabela de referencia no caso departamento

--criação de uma tabela com restrição de preenchimento de Campos:

create table tblAnimal (
codigo int not null primary key,
nome varchar(40) not null,
sexo char(1) check(upper (sexo) = 'm' or upper(sexo) = 'f')
) --transforma o M ou F em maisculo qdo for digitado.

--criação de tabela com algumas regras de integridade

create table tblFuncionario(
codfunc int identity,
nomefun varchar(50),
rgfunc char(15),
sexofunc char default 'f',
salfunc dec(10,2) default 240.00,
constraint pk_func primary key(codfunc),
constraint uq_func unique(rgfunc),
constraint ck_func1 check(sexofunc in ('f','m')),
constraint ck_func2 check(salfunc > 0),*/

--create database tabelaclientes
--use tabelaclientes
--create table tbcliente (
--cod_cli int,
--nome_cli char(30)
--)
--create index tabelaclientes_index on tbcliente (cod_cli, nome_cli)
--insert tbcliente values ('10', 'Juliana')
--select*from tbcliente,

- Adicionando um campo

Alter table add email varchar (20)

- Adicionando uma constaint

Alter table pedido add constaint fk_pedido_cliente foreign key
(codigo_cliente) references cliente (codigo_cliente)

- Alterando o tamanho de um campo

Alter table empregados alter column primeiroNome varchar (100)

- Removendo uma coluna

Alter table empregados DROP COLUMN sexo

(Só funciona caso a tabela já exista!!!)

---------------------------------------------------------------------------------------

- Funções agregadas

- Servem para obtermos dado estatísticos dos registros do banco de dados.

AVG() - retorna a média aritmética de uma coluna

Select avg(salario) from cadfun

Select avg(distinct salario) from cadfun 

Select avg(salario) from caractere depto = 3

Count() - retorna o valor numérico inteiro de um campo

Select count(*) from cadfun where depto in (3,5)

Select count(filhos) from cadfun

Select count(*) from cadfun where salario > 2000

Max() - retorna o maior valor de uma coluna

Select Max(salario) from cadfun

Min() - retorna o menor valor de uma coluna

Select Min(salario) from cadfun

Sum() - retorna o resultado de uma soma de uma coluna

Select Sum(filhos) from cadfun

Select Sum(salario) from cadfun

Select Sum(salario) from cadfun where depto in (3,5)

- Agrupamento de resultados

- O comando GROUP BY permite que a apresentação dos dados retornados da consulta seja agrupada de acordo com uma determinada condição.

Select depto, count(*) as quantidades from cadfun
		group by depto

Select depto,sum(salario) as 'Salario Total' from cadfun
		group by depto

Select codMusica, count(*) from musicaAutor group by codMusica
	having codMusica < 15

Select codMusica, count(*) from musicaAutor where codMusica < 15
	group by codMusica

Mesmo resultado, diferentes formas!