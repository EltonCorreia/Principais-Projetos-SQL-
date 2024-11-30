USE MASTER 
GO

IF EXISTS(SELECT 1 FROM SYSDATABASES WHERE NAME = 'BD_CDS')
	DROP DATABASE BD_CDS
go
CREATE DATABASE BD_CDS
go

USE BD_CDS
go
Set dateformat DMY
go
CREATE TABLE artista
(
	cod_art int not null primary key,
	nome_art varchar (100) not null unique
)
go
CREATE TABLE gravadora 
(
	cod_grav int not null primary key,
	nome_grav varchar (50) not null unique
)
go
CREATE TABLE categoria 
(
	cod_cat int not null primary key,
	nome_cat varchar (50) not null unique
)
go
CREATE TABLE estado
(
	sigla_estado char (2) not null primary key,
	nome_estado char (20) not null unique
)
go
CREATE TABLE cidade 
(
	cod_cid int not null primary key,
	nome_cid varchar (100) not null unique
)
go
CREATE TABLE cliente 
(
	cod_cli int not null primary key,
	nome_cli varchar (100) not null,
	end_cli varchar (200) not null,
	renda_cli decimal (10,2) not null default  0, 
	sexo_cli char (1) not null default  'F'
)
go
CREATE TABLE conjuge 
(
	nome_conj varchar (100) not null,
	renda_conj decimal (10,2) not null default  0,
	sexo_conj char(1) not null default  'M'
)
go
CREATE TABLE funcionario
(
	cod_func int not null primary key,
	nome_func varchar(100) not null,
	end_func varchar (200) not null,
	salario_func decimal (10,2) not null default 0,
	sexo_func char(1) not null default 'F'
)
go
CREATE TABLE dependente 
(
	cod_dep int not null primary key,
	nome_dep varchar (100) not null,
	sexo_dep char(1) not null default 'M'
)
go
CREATE TABLE titulo 
(
	cod_tit int not null primary key,
	nome_cd varchar (100) not null unique,
	valor_cd decimal (10,2) not null,
	quantidade_restante_no_estoque_da_loja_de_cds numeric (6) not null
)
go
CREATE TABLE pedido
(
	num_ped int not null primary key,
	data_ped date default getdate(),
	valor_ped decimal(10,2) not null default 0
) 
go
CREATE TABLE titulo_pedido
(
	qtdade_cds int not null default 1,
	valor_cd decimal (10,2) not null
)
go 
ALTER TABLE cidade
	add sigla_estado char (2) not null foreign key 
		REFERENCES estado (sigla_estado)
go
ALTER TABLE cliente
	add cod_cid int not null foreign key
		references cidade (cod_cid)
go
ALTER TABLE conjuge
	add cod_cli int not null foreign key
		references cliente (cod_cli)
go
ALTER TABLE dependente
	add cod_func int not null foreign key
		references funcionario (cod_func)
go
ALTER TABLE titulo
	add cod_cat int not null foreign key
		references categoria (cod_cat)
go
ALTER TABLE titulo
	add cod_gravadora int not null foreign key
		references gravadora (cod_grav)
go
ALTER TABLE pedido
	add cod_cli int not null foreign key
		references cliente (cod_cli)
go
ALTER TABLE pedido
	add cod_func int not null foreign key
		references funcionario (cod_func)
go
ALTER TABLE titulo_pedido
	add num_ped int not null foreign key
		references pedido (num_ped)
go
ALTER TABLE titulo_pedido
	add cod_tit int not null foreign key
		references titulo (cod_tit)
go
CREATE TABLE titulo_artista(
	cod_tit int not null foreign key
		references titulo (cod_tit),
	cod_art int not null foreign key
		references artista (cod_art)
)
go
INSERT INTO artista values
(1, 'Marisa Monte'),
(2, 'Gilberto Gil'),
(3, 'Caetano Veloso'),
(4, 'Milton Nascimento'),
(5, 'Legi�o Urbana'),
(6, 'The Beatles'),
(7, 'Rita Lee')
go
INSERT INTO gravadora values
(1, 'Polygram'),
(2, 'EMI'),
(3, 'Som Livre'),
(4, 'Sony Music')
go
INSERT INTO categoria values 
(1, 'MPB'),
(2, 'Trilha Sonora'),
(3, 'Rock Internacional'),
(4, 'Rock Nacional')
go
INSERT INTO estado values 
('SP', 'S�o Paulo'),
('MG', 'Minas Gerais'),
('RJ', 'Rio de Janeiro'),
('ES', 'Esp�rito Santo')
go
INSERT INTO cidade values 
(1, 'S�o Paulo', 'SP'),
(2, 'Sorocaba', 'SP'),
(3, 'Jundia�', 'SP'),
(4, 'Americana', 'SP'),
(5, 'Araracara', 'SP'),
(6, 'Ouro Preto', 'MG'),
(7, 'Cachoeira Itapemirim', 'ES')
go
INSERT INTO cliente values 
(1, 'Jos� Nogueira', 'Rua A', 1500.00 ,'M', 1),
(2, 'Angelo Pereira', 'Rua B', 2000.00 ,'M',1),
(3, 'Al�m Mar Paranhos', 'Rua C', 1500.00 ,'M',1),
(4, 'Catarina Souza', 'Rua D', 892.00 ,'F',1),
(5, 'Vagner Costa', 'Rua E', 950.00 ,'M',1),
(6, 'Antenor da Costa', 'Rua F', 1582.00 ,'M',2),
(7, 'Maria Am�lia de Souza', 'Rua G', 1152.02 ,'F',2),
(8,'Paulo Roberto Silva', 'Rua H', 3250.00 ,'M',2),
(9, 'F�tima Souza', 'Rua I', 632.00 ,'F',3),
(10, 'Joel da Rocha', 'Rua J', 2000.00 ,'M',3)
go
insert into conjuge values 
('Carla Nogueira', 2500.00, 'F',1),
('Emitia Pereira', 5500.00, 'F',2),
('Altiva da Costa', 3000.00, 'F',6),
('Carlos de Souza', 3250.00, 'M',7)
go
insert into funcionario values
(1,'V�nia Gabriela Pereira', 'Rua A', 2500.00,'F'),
(2,'Noberto Pereira da Silva', 'Rua B', 2500.00,'M'),
(3,'Olavo Linhares', 'Rua C', 580.00,'M'),
(4,'Paula da Silva', 'Rua D', 3000.00,'F'),
(5,'Rolando Rocha', 'Rua E', 2000.00,'M')
go
insert into Dependente values 
(1,'Ana Pereira', 'F',1),
(2,'Roberto Pereira', 'M',1),
(3,'Celso Pereira', 'M',1),
(4,'Brisa Linhares', 'F',3),
(5,'Mari Sol Linhares', 'F',3),
(6,'S�nia da Silva', 'F',4)
go

insert into Titulo values 
(1,'Tribalistas',30.00, 1500,1,1),
(2,'Tropic�lia',50.00, 500,1,2),
(3,'Aquele Abra�o',50.00, 600,1,1),
(4,'Refazenda',60.00, 1000,1,2),
(5,'Totalmente Demais',50.00, 2000,1,3),
(6,'Travessia',55.00, 500,1,3),
(7,'Courage',30.00, 200,1,2),
(8,'Legi�o Urbana',20.00, 100,4,4),
(9,'The Beatles',30.00, 300,3,2),
(10,'Rita Lee',30.00, 500,4,1)
go
insert into Pedido values 
(1,'02/05/02',1500.00,1,2),
(2,'02/05/02',50.00,3,4),
(3,'02/06/02',100.00,4,5),
(4,'02/02/03',200.00,1,4),
(5,'02/03/03',300.00,7,5),
(6,'02/03/03',100.00,4,4),
(7,'02/03/03',50.00,5,5),
(8,'02/03/03',50.00,8,2),
(9,'02/03/03',2000.00,2,2),
(10,'02/03/03',3000.00,7,1)
go
INSERT INTO titulo_artista values 
(1 , 2),
(2 , 2),
(3 , 2),
(4 , 2),
(5 , 3),
(6 , 4),
(7 , 4),
(8 , 5),
(9 , 5),
(10 , 7)
go
INSERT INTO titulo_pedido values 
(2 , 30.00, 1 ,1),
(3 , 20.00, 1 ,2),
(1 , 50.00, 2, 1),
(3 , 30.00, 2, 2),
(2 , 40.00, 3, 1),
(3 , 20.00, 4, 2),
(2 , 25.00, 5, 1),
(3 , 30.00, 6, 2),
(1 , 35.00, 6, 3),
(2 , 55.00, 7, 4)


-- 1 - Apresentar todos os clientes solteiros:

SELECT * FROM cliente WHERE cod_cli NOT IN (SELECT cod_cli FROM conjuge)

-- 2 - Apresentar todos os clientes casados:

SELECT * FROM cliente WHERE cod_cli IN (SELECT cod_cli FROM conjuge)

-- 3 - Apresentar todas as categorias que estão sem CD:

SELECT * FROM categoria WHERE cod_cat NOT IN (SELECT cod_cat FROM titulo)

-- 4 - Apresentar todas as gravadoras que nunca gravaram CD:

SELECT * FROM gravadora WHERE cod_grav NOT IN (SELECT cod_grav FROM titulo)

-- 5 - Apresentar apenas os funcionários que tem dependentes e que nunca atenderam a algum pedido:

SELECT * FROM funcionario WHERE cod_func IN (SELECT cod_func FROM dependente WHERE cod_func NOT IN (SELECT cod_func FROM pedido))

-- 6 - Mostrar todos os funcionários que atenderam a pedidos de clientes casados:

SELECT * FROM funcionario WHERE cod_func IN (SELECT cod_func FROM pedido WHERE cod_func IN (SELECT cod_func FROM conjuge))

-- 7 - Apresentar os dados dos clientes que possuem maior renda:

SELECT * FROM cliente WHERE renda_cli = (SELECT MAX(renda_cli) FROM cliente)

-- 8 - Apresentar os dados do CD mais caro:

SELECT * FROM titulo WHERE valor_cd = (SELECT MAX(valor_cd) FROM titulo)

-- 9 - Aplicar um aumento salarial de 20% para todos os funcionarios que não têm dependentes:

UPDATE funcionario SET salario_func = salario_func * 2.2 WHERE cod_func NOT IN (SELECT cod_func FROM dependente)

-- 10 - Aplicar um aumento salarial de 10% para todos os funcionarios que têm dependentes:

UPDATE funcionario SET salario_func = salario_func * 1.1 WHERE cod_func IN (SELECT cod_func FROM dependente)

-- 11 - Aumentar em 100,00 a renda de todos os clientes solteiros:

UPDATE cliente SET renda_cli = renda_cli + 100 WHERE cod_cli NOT IN (SELECT cod_cli FROM conjuge)

-- 12 - Aumentar em 100,00 a renda de todos os clientes solteiros do sexo feminino:

UPDATE cliente SET renda_cli = renda_cli + 100 WHERE cod_cli NOT IN (SELECT cod_cli FROM conjuge WHERE sexo_cli = 'F')

-- 13 - Aumentar em 200,00 a renda de todos os clientes que já fizeram pedidos:

UPDATE cliente SET renda_cli = renda_cli + 200 WHERE cod_cli IN (SELECT cod_cli FROM pedido)

-- 14 - Aumentar em 500,00 a renda de todos os clientes solteiros que já fizeram pedidos:

UPDATE cliente SET renda_cli = renda_cli + 500 WHERE cod_cli NOT IN (SELECT cod_cli FROM conjuge WHERE cod_cli IN (SELECT cod_cli FROM pedido))

-- 15 - Aplicar um desconto de 10% em todos os pedidos onde foi vendido o título de código igual a 1:

-- 16

-- 17 

-- 18