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
valoe decimal(12,2),
primary key(mes,ano))

--criação de uma tabela com chabe estrangeira
create table tblSecao(
codigo int not null primary key,
descricao varchar(20) not null,
coddepto int foreign key references
departamento (codigo)
) --erro pq não tem tabela departamento no sistema. para corrigir criar primeiro a tabela de referencia no caso departamento

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

create database tabelaclientes

use tabelaclientes

create table tbcliente (
cod_cli int,
nome_cli char(30)
)

create index tabelaclientes_index on tbcliente (cod_cli, nome_cli)

insert tbcliente values ('10', 'Juliana')

select*from tbcliente