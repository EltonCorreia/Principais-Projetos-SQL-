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
Salário int not null,
Comissão varchar(60) not null,
);

create table Seção(
Numsec int not null,
Nome varchar(60) not null,
Cidade varchar(60) not null,
);

insert into Empregado (Numemp,Nome,Numsec,Cargo,Chefe,Salário,Comissão) values
(1,'Ana Maria de Souza',10,'Contadora','Alfredo Campos',1000,100),
(2,'Beatriz de Lima',20,'Desenvolvedora','Dolores Almeida',2000,200),
(3,'Caique Souza',30,'Engenheiro','Alfredo Campos',3000,300),
(4,'Danilo Sortido',40,'Designer','Dolores Almeida',4000,400),
(5,'Patrick Agosto',40,'Presidente','',5000,500);


insert into Seção (Numsec,Nome,Cidade) values
(10,'Contabilidade','Campinas'),
(20,'Desenvolvimento de sistemas','Santos'),
(30,'Engenharia','Diadema'),
(40,'Design','Campinas');

--1. Mostre os nomes de todas as seções que ficam em Campinas.

select * from Seção where Cidade = 'Campinas'; 

--2. Mostre o nome, cargo e número de seção dos empregados que trabalham nas seções 20, 30 e 40.

select Nome,Cargo,Numsec from Empregado where Numsec in (20,30,40);

--3. Para cada seção, mostre o número de seção, total de empregados e total dos salários (Salário mais Comissão).

select count(Numemp), sum(Salário+Comissão) from tabela group by cod_empregado;

--4. Mostre qual o salário médio de todos os cargos, exceto o de presidente.

select avg(Salário) as 'Média dos salários' from Empregado where cargo <> 'Presidente';
