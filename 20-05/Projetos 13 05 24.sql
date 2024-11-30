use master;

drop database Projeto;

create database Projeto;

use Projeto;

create table Empregado (
CodEmpregado int not null primary key,
NomeInic varchar(60) not null,
NomeInt varchar(60) not null,
NomeFin varchar(60) not null,
DataNasc date,
Endereco varchar(60) not null,
Sexo varchar(1) not null,
Salario decimal(17,2)
);

create table Dependente (
CodDependente int not null primary key,
CodEmpregado int not null,
NomeDependente varchar(60) not null,
SexoDep varchar(1) not null,
DataNascDep date,
TipoDep varchar(1) not null,
foreign key (CodEmpregado) references Empregado (CodEmpregado)
);

create table Cidade (
CodCidade int not null primary key,
NomeCidade varchar(60) not null
);

create table Departamento (
CodDepartamento int not null primary key,
NomeDepartamento varchar(60) not null,
DataInicGer date,
CodEmpregado int not null,
CodCidade int not null,
foreign key (CodEmpregado) references Empregado (CodEmpregado),
foreign key (CodCidade) references Cidade (CodCidade)
);

create table Projeto (
CodProjeto int not null primary key,
NomeProjeto varchar(60) not null,
CodDepartamento int not null,
foreign key (CodDepartamento) references Departamento (CodDepartamento)
);

create table EmpregadoProjeto (
CodEmpregado int not null,
CodProjeto int not null,
Horas int not null,
foreign key (CodEmpregado) references Empregado (CodEmpregado),
foreign key (CodProjeto) references Projeto (CodProjeto)
);

insert into Cidade (CodCidade, NomeCidade) values
(1,'Campo Grande'),
(2,'Dourados'),
(3,'Corumbá'),
(4,'Três Lagoas'),
(5,'Ponta Porã'),
(6,'Rio Verde'),
(7,'Porto Murtinho'),
(8,'Bonito');

insert into Departamento (CodDepartamento, NomeDepartamento, DataInicGer, CodEmpregado, CodCidade) values
(1, 'RH', '2024-05-20', 101, 1),
(2, 'TI', '2024-05-20', 102, 2),
(3, 'Vendas', '2024-05-20', 103, 3),
(4, 'Produção', '2024-05-20', 104, 4);

insert into Projeto (CodProjeto, NomeProjeto, CodDepartamento) values
(101, 'Projeto A', 1),
(102, 'Projeto B', 2),
(103, 'Projeto C', 3),
(104, 'Projeto D', 4);

insert into Empregado (CodEmpregado, NomeInic, NomeInt, NomeFin, DataNasc, Endereco, Sexo, Salario) values
(101, 'João', 'A.', 'Silva', '1990-01-15', 'Rua das Flores, 123', 'M', 5000.00),
(102, 'Maria', 'B.', 'Santos', '1985-03-20', 'Av. Principal, 456', 'F', 5500.00),
(103, 'Pedro', 'C.', 'Oliveira', '1992-07-10', 'Rua Central, 789', 'M', 4800.00),
(104, 'Ana', 'D.', 'Costa', '1998-05-05', 'Rua da Praia, 321', 'F', 5200.00);

insert into Dependente (CodDependente, CodEmpregado, NomeDependente, SexoDep, DataNascDep, TipoDep) values
(1, 101, 'Carlos', 'M', '2010-02-10', 'F'),
(2, 102, 'Laura', 'F', '2015-09-18', 'F'),
(3, 103, 'Lucas', 'M', '2018-04-25', 'F'),
(4, 104, 'Mariana', 'F', '2020-11-30', 'F');

--1 

select * from Empregado

--2

select CodEmpregado, NomeInic, NomeInt, NomeFin from Empregado

--3

select NomeInic, NomeInt, NomeFin from Empregado order by NomeFin

--4

select * from Empregado
where Salario BETWEEN 3000.00 AND 5000.00;

--5

select * from Empregado
where left(NomeFin, 1) = 'S';

--6

select DataNasc
from Empregado
order by DataNasc desc;

--7

select Salario as SalarioOriginal, Salario * 0.9 as SalarioReduzido
from Empregado;

--8

alter table Empregado
add Email varchar(100);

--9

select NomeDependente
from Dependente
where NomeDependente like 'A%' OR NomeDependente like 'B%' OR NomeDependente like 'E%' or NomeDependente like 'R%';

--10

select * from Departamento
join Cidade on Departamento.CodCidade = Cidade.CodCidade
where Cidade.NomeCidade IN ('Rio Verde', 'Bonito', 'Corumbá', 'Dourados');

