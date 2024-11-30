-- Passos pra criação de banco:

-- Criação de banco: create database
-- Abrir o banco: use nome_banco
-- Criação de tabelas: create table nome
-- Criação de índice: create index nome on tabela
-- Inserção de valores: insert-declarativo-posicional
-- Manipulação - Select

-- Contéudos pra esse semestre:

--Subquery
--Funções agregadas
--Joins
--Procedures

-- Exercício de revisão:

use master;

drop database Funcionarios;

create database Funcionarios;

use Funcionarios;

create table funcionarios(
Codigo int not null,
Primeironome varchar(60) not null,
Segundonome varchar(60) not null,
Ultimonome varchar(60) not null,
DataNasci date not null,
CPFFunc int not null,
RGFunc varchar(60) not null,
Endereco varchar(60) not null,
CEP int not null,
Cidade varchar(60) not null,
Telefone int not null,
Funcao varchar(60) not null,
Salario int not null,
CodigoDepartamento int not null,
);

create table departamentos(
CodigoDepartamento int not null,
Nome varchar(60) not null,
Localizacao varchar(60) not null,
);

insert into funcionarios (Codigo, Primeironome, Segundonome, Ultimonome, DataNasci, CPFFunc, RGFunc, Endereco, CEP, Cidade, Telefone, Funcao, Salario, CodigoDepartamento) values
(01, 'Marcelo', 'Medeiros', 'da Silva', '19/04/1994', 00000000000, '000000000', 'Rua X', 00000000, 'Guaruja', 00000000, 'Desenvolvedor', 1000, 001),
(02, 'Juliana', '', 'da Costa', '26/11/1985', 00000000000, '00000000X', 'Rua Y', 00000000, 'Diamantina', 00000000, 'Contadora', 2000, 002),
(03, 'Laura', 'Amorin', 'Letterberg', '11/09/1990', 00000000000, '000000000', 'Rua Z', 00000000, 'Recife', 00000000, 'Telefonista', 3000, 003);

insert into departamentos (CodigoDepartamento, Nome, Localizacao) values
(001, 'X Tecnologias', 'Guaruja'),
(002, 'Y Contabilidade', 'Diamantina'),
(003, 'Z Financeiros', 'Recife');

--1 – Listar nome e sobrenome ordenado por sobrenome.

select Primeironome, Segundonome, Ultimonome from funcionarios order by Ultimonome;

--2 – Listar todos os campos de funcionários ordenados pela cidade.

select * from funcionarios order by Cidade;

--3 – Listar os funcionários que possuem salário superior a R$ 1000,00 ordenados pelo nome completo.

select * from funcionarios where Salario >= 1000 order by Primeironome,Segundonome,Ultimonome;

--4 – Listar a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho.

select DataNasci, Primeironome from funcionarios order by DataNasci;

--5 – Listar os funcionários como uma listagem telefônica ordenado pelo UltimoNome, PrimeiroNome e SegundoNome.

select Telefone, Ultimonome, Primeironome, Segundonome from funcionarios order by Ultimonome, Primeironome, Segundonome;

-- 9 – Liste o nome completo de todos os funcionários que não tenham SegundoNome.

select Primeironome, Segundonome, Ultimonome from funcionarios where Segundonome = '';

-- 10 – Liste os nomes dos funcionários que moram em Recife e que exerçam a função de Telefonista.

select Primeironome, Segundonome, Ultimonome from funcionarios where Cidade = 'Recife' and Funcao = 'Telefonista';