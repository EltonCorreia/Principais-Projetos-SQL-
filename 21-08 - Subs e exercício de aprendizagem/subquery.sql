USE MASTER 
GO

IF EXISTS(SELECT 1 FROM SYSDATABASES WHERE NAME = 'subquery')
	DROP DATABASE subquery
go
CREATE DATABASE subquery
go
USE subquery
go
Set dateformat DMY
go
CREATE TABLE CARGO
(
COD_CARGO INT NOT NULL,
NOME_CARGO CHAR(30) NOT NULL,
CONSTRAINT PK_CARGO PRIMARY KEY (COD_CARGO),
CONSTRAINT UQ_CARGO UNIQUE (NOME_CARGO)
)
go
CREATE TABLE FUNCIONARIO
(
COD_FUNC INT NOT NULL,
COD_CARGO INT NOT NULL,
NOME_FUNC CHAR(50) NOT NULL,
SAL_FUNC DECIMAL(10,2) NOT NULL,
RG_FUNC CHAR(15),
CONSTRAINT PK_FUNC PRIMARY KEY(COD_FUNC),
CONSTRAINT UQ_FUNC UNIQUE (RG_FUNC),
CONSTRAINT FK_FUNC FOREIGN KEY (COD_CARGO)
REFERENCES CARGO (COD_CARGO)
)
go
CREATE TABLE DEPENDENTE
(
COD_DEP INT NOT NULL,
COD_FUNC INT NOT NULL,
NOME_DEP CHAR(50) NOT NULL,
CONSTRAINT PK_DEP PRIMARY KEY (COD_DEP),
CONSTRAINT FK_DEP FOREIGN KEY (COD_FUNC)
REFERENCES FUNCIONARIO (COD_FUNC))
go
INSERT CARGO VALUES 
(1,'Diretor Presidente'),
(2,'Diretor de Departamento'),
(3,'Supervisor'),
(4,'Analista de Sistemas'),
(5,'Analista de Negócios')
go
INSERT FUNCIONARIO VALUES
(1,5,'Paulino Reguete',4500.00,'15.253.587'),
(2,5,'Romeu Pompilho',4500.00,'14.258.457'),
(3,3,'Antonieta Antonio',3500.00,'17.258.368'),
(4,3,'Amália Amélia',5500.00,'18.963.458'),
(5,2,'Crisântemo Cristalino',6000.00,'16.258.147'),
(6,1,'Amim Amou Amado',10000.00,'14.235.258')
go
INSERT DEPENDENTE VALUES 
(1,1,'Rosalina Reguete'),
(2,1,'Marcelina Reguete'),
(3,1,'Claudomiro Reguete'),
(4,2,'Amarildo Pomposo'),
(5,2,'Anacleto Pomposo'),
(6,5,'Pepino CrisCntemo'),
(7,5,'Natalino Crisântemo')

-- Subqueries com in/not

--Para obter todos os cargos que estão sem funcionários

SELECT * FROM CARGO WHERE COD_CARGO NOT IN (SELECT COD_CARGO FROM FUNCIONARIO)

--Para obter os cargos que tenham funcionários cadastrados

SELECT * FROM CARGO WHERE COD_CARGO  IN (SELECT COD_CARGO FROM FUNCIONARIO)

--Para obter os cargos dos funcionários que tem dependentes
 
SELECT * FROM CARGO WHERE COD_CARGO IN (SELECT COD_CARGO FROM FUNCIONARIO WHERE COD_FUNC IN (SELECT COD_FUNC FROM DEPENDENTE))

-- Para obter os cargos dos funcionários que não tem dependentes
 
SELECT * FROM CARGO WHERE COD_CARGO IN (SELECT COD_CARGO FROM FUNCIONARIO WHERE COD_FUNC NOT IN (SELECT COD_FUNC FROM DEPENDENTE))

--Subqueries com sinal de =

--Para saber todos os dados do funcionário que tem o maior salário:

SELECT * FROM FUNCIONARIO WHERE SAL_FUNC = (SELECT MAX(SAL_FUNC) FROM FUNCIONARIO)

SELECT * FROM FUNCIONARIO WHERE SAL_FUNC = (SELECT MIN(SAL_FUNC) FROM FUNCIONARIO)

--Para obtermos os dados dos funcionários que possuem dependentes e o menor salário:

SELECT * FROM FUNCIONARIO WHERE SAL_FUNC = (SELECT MIN(SAL_FUNC) FROM FUNCIONARIO WHERE COD_FUNC IN (SELECT COD_FUNC FROM DEPENDENTE)) 

--Para exibir todos os dados de cada funcionário e quantidade de dependentes que cada um possui:

SELECT *, (SELECT COUNT(*) FROM DEPENDENTE WHERE COD_FUNC = FUNCIONARIO.COD_FUNC) AS QTDE_DEP FROM FUNCIONARIO

-- Para obtermos o código e o nome dos cargos e quantidade de funcionários que cada cargo possui:

SELECT * ,(SELECT COUNT(*) FROM FUNCIONARIO WHERE COD_CARGO = CARGO.COD_CARGO) AS QTDE_FUNC FROM CARGO

--UPDATE

--Para aplicar 10% de aumento para todos os funcionários que não tenham dependentes:

UPDATE FUNCIONARIO SET SAL_FUNC = SAL_FUNC * 1.1 WHERE COD_FUNC NOT IN (SELECT COD_FUNC FROM DEPENDENTE)

--DELETE

--Excluir todos os funcionários que não tenham dependentes

DELETE FROM FUNCIONARIO WHERE COD_FUNC NOT IN( SELECT COD_FUNC FROM DEPENDENTE)
