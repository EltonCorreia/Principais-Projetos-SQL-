use master;

drop database Alunos;

create database Alunos;

use Alunos;

create table Aluno(
Matricula int not null,
Nome varchar(60) not null,
Sexo varchar(1) not null,
Idade int not null,
);

insert into Aluno (Matricula, Nome, Sexo, Idade) values
(1, 'Marcelo Medeiros', 'M', 35),
(2, 'Ana Paula Berlim', 'F', 25),
(3, 'Lucas Silva', 'M', 7),
(4, 'Caroline Silva', 'F', 19),
(5, 'Djalma Medeiros', 'M', 65),
(6, 'Artur Paes', 'M', 5),
(3, 'Eduarda Duda', 'F', 8);

-- Liste todos os alunos do sexo masculino

select * from Aluno where Sexo = 'M';

--  Liste todos os alunos que possuem o sobrenome Medeiros, ordenados por idade

select * from Aluno where Nome LIKE '% Medeiros%' order by Idade;

--  Liste a média de idade dos alunos

select avg(Idade) as 'Média das idades' from Aluno;

--  Mostre a maior idade dos alunos

select Max(Idade) as 'Maior idade' from Aluno;

--  Liste a quantidade de alunos com idade menor que 20 anos

select count(*) as 'Quantidade de alunos com idade menor que 20 anos' from Aluno where Idade < 20;

-- Liste a matricula e a idade do aluno chamado Lucas Silva

select count(Matricula) as 'Matricula do aluno Lucas Silva', max(Idade) as 'Idade do aluno Lucas Silva' from Aluno where Nome = 'Lucas Silva';

--  Liste a quantidade de alunos com idade entre 10 e 20 anos que sejam do sexo masculino

select count(*) as 'Quantidade de alunos com idade entre 10 e 20 anos que sejam do sexo masculino' from Aluno where Sexo = 'M' and Idade >= 10 and Idade <= 20;

-- Liste a quantidade de mulheres cadastradas na tabela Alunos

select count(*) as 'Quantidade de mulheres cadastradas na tabela Alunos' from Aluno where Sexo = 'F';

-- Informe o sexo e a quantidade de ocorrências agrupadas por sexo

select Sexo, count(*) AS 'Quantidade' from Aluno group by Sexo;

--  Liste a quantidade de alunos agrupado por sexo

select count(*) AS 'Quantidade' from Aluno group by Sexo;

-- Liste o nome dos alunos que tem a letra u na quarta posição

select Nome, count(*) as 'Nomes com "u" na quarta posição' FROM Aluno where substring(Nome, 4, 1) = 'u' group by Nome;


