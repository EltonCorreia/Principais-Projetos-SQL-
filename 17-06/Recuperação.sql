use master

drop database Funcionarios_Departamentos

create database Funcionarios_Departamentos

use Funcionarios_Departamentos;

create table Funcionarios(
Codigo INT NOT NULL,
PrimeiroNome VARCHAR(60) NOT NULL,
SegundoNome VARCHAR(60) NOT NULL,
UltimoNome VARCHAR(60) NOT NULL,
Datanasci INT NOT NULL,
CPFFunc INT NOT NULL,
RGFunc INT NOT NULL,
Endereco VARCHAR(60) NOT NULL,
CEP INT NOT NULL,
Cidade VARCHAR(60) NOT NULL,
Fone INT NOT NULL,
Funcao VARCHAR(60) NOT NULL,
Salario INT NOT NULL,
CodigoDepartamento INT NOT NULL,
);

create table Departamentos (
CodigoDepartamento INT NOT NULL,
Nome VARCHAR(60) NOT NULL,
Localizacao VARCHAR(60) NOT NULL,
);

insert into Funcionarios(Codigo,PrimeiroNome,SegundoNome,UltimoNome,Datanasci,CPFFunc,RGFunc,Endereco,CEP,Cidade,Fone,Funcao,Salario,CodigoDepartamento) values
(1,'Ana','','de Souza',1,2,3,'Rua Bobo de Alcunha',4,'Diadema',5,'Administradora',1000,10),
(2,'Beatriz','de Lima','Mascarenhas',4,5,6,'Rua Quadricular de Assis',7,'Mooca',8,'Administradora',2000,20),
(3,'Caique','','de Lima',9,10,11,'Rua Imaculada',12,'Nova Iguaçu',13,'Contador',3000,20),
(4,'Danilo','Alexandre','Sourto',14,15,16,'Rua Especiarias',17,'Belford Roxo',18,'Contador',4000,20),
(5,'Liana','Flores','da Costa',17,18,19,'Rua Buraco Barato',20,'Curitiba',21,'Designer',5000,30),
(6,'Laura','Goller','da Silva',22,23,24,'Rua Fim do Coração',25,'Balneário',26,'Designer',6000,30);

insert into Departamentos(CodigoDepartamento,Nome,Localizacao) values
(10,'Administradora X','São Paulo'),
(20,'Contabilidade Y','Rio de Janeiro'),
(30,'Design Z','Santa Catarina');

--2 – Listar todos os campos de funcionários ordenados pela cidade.

select Cidade,PrimeiroNome,SegundoNome,UltimoNome from Funcionarios;

--8 – Liste o salário médio pago pela empresa.

select avg(Salario) as 'Media do salário pago pela empresa' from Funcionarios;

--9 – Liste o nome completo de todos os funcionários que não tenham SegundoNome.

select PrimeiroNome,UltimoNome from Funcionarios where SegundoNome = '';

--6 – Liste o total da folha de pagamento.

select max(Salario) as 'Total da folha de pagamento' from Funcionarios;

--7 – Liste a quantidade de funcionários da empresa.

select max(Codigo) as 'Quantidade de funcionários da empresa' from Funcionarios;
