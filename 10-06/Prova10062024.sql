use master

drop database Empregado_Secoes

create database Empregado_Secoes

use Empregado_Secoes;

create table Empregado(
Numemp int not null,
Nome varchar(60) not null,
Numsec int not null,
Cargo varchar(60) not null,
Chefe varchar(60) not null,
Sal�rio int not null,
Comiss�o varchar(60) not null,
);

create table Se��o(
Numsec int not null,
Nome varchar(60) not null,
Cidade varchar(60) not null,
);

insert into Empregado (Numemp,Nome,Numsec,Cargo,Chefe,Sal�rio,Comiss�o) values
(1,'Ana Maria de Souza',10,'Contadora','Alfredo Campos',1000,100),
(2,'Beatriz de Lima',20,'Desenvolvedora','Dolores Almeida',2000,200),
(3,'Caique Souza',30,'Engenheiro','Alfredo Campos',3000,300),
(4,'Danilo Sortido',40,'Designer','Dolores Almeida',4000,400),
(5,'Patrick Agosto',40,'Presidente','',5000,500);


insert into Se��o (Numsec,Nome,Cidade) values
(10,'Contabilidade','Campinas'),
(20,'Desenvolvimento de sistemas','Santos'),
(30,'Engenharia','Diadema'),
(40,'Design','Campinas');

--1. Mostre os nomes de todas as se��es que ficam em Campinas.

select * from Se��o where Cidade = 'Campinas'; 

--2. Mostre o nome, cargo e n�mero de se��o dos empregados que trabalham nas se��es 20, 30 e 40.

select Nome,Cargo,Numsec from Empregado where Numsec in (20,30,40);

--3. Para cada se��o, mostre o n�mero de se��o, total de empregados e total dos sal�rios (Sal�rio mais Comiss�o).

select count(Numemp), sum(Sal�rio+Comiss�o) from tabela group by cod_empregado;

--4. Mostre qual o sal�rio m�dio de todos os cargos, exceto o de presidente.

select avg(Sal�rio) as 'M�dia dos sal�rios' from Empregado where cargo <> 'Presidente';
