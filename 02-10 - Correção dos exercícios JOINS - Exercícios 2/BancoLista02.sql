use master
go

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'lista02')
	DROP DATABASE lista02

CREATE DATABASE lista02
go

use lista02
go
Set dateformat DMY
go
use lista02
go
create table cliente
(
	cpf numeric(11) primary key,
	nome varchar(60),
	dtNasc date
)
go
create table Modelo
(
	codMod int primary key,
	Desc_2 varchar(40)
)
go
create table Veiculo
(
	placa char(8)primary key,
	codMod int foreign key 
		references modelo(codMod),
	cpf numeric(11) foreign key
		references cliente (cpf),
	cor varchar(20),
	ano varchar(4)
)
go
create table patio
(
	num int primary key,
	ender varchar(40),
	capacidade int
)
go
create table estaciona
(
	cod int primary key,
	num int foreign key 
		references patio(num),
	placa char(8) foreign key 
		references veiculo(placa),
	dtEntrada date,
	dtSaida date,
	hrSaida varchar(10)
)

Insert into cliente values
(12345679888,'Anderson Coan','10-10-1978'),
(78945613233,'Luiz Ricardo','07-10-1978'),
(45612378955,'José Rubens','15-05-1972'),
(12378965411,'Gerson','10-10-1978'),
(74125896366,'Carlos Querido','08-12-1977'),
(25874136988,'José Mendes','09-01-1985')
go
Insert into modelo values
(1,'Duster'),
(2,'Palio'),
(3,'Pegeout 207'),
(4,'Tucson'),
(5,'Fusca'),
(6,'Gol')
Insert into veiculo values
('JJJ-2020',1,78945613233,'PRATA','2015'),
('JEG-1010',2,12345679888,'VERDE','2000'),
('ELT-2020',3,25874136988,'AZUL','1999'),
('JPG-2020',4,12378965411,'VERMELHO','2008'),
('PNG-2020',5,74125896366,'VERDE','2000'),
('SQL-2015',6,78945613233,'PRETO','2014')
go
Insert into patio values
(1,'AV CECI,2000',50),
(2,'AV TIRADENTES, 615',85),
(3,'AV PAULISTA,2000',150),
(4,'AV JABAQUARA,2000',30),
(5,'AV DOS BANCOS',100),
(6,'AV INDIANOPOLIS,555',50)
go
Insert into estaciona values
(1,1,'JJJ-2020','28-04-2010','28-04-2015','18:05'),
(2,2,'JEG-1010','28-01-2011','01-01-2011','00:05'),
(3,3,'ELT-2020','28-03-2012','30-03-2012','22:05'),
(4,4,'JPG-2020','28-05-2013','29-05-2013','10:45'),
(5,5,'JEG-1010','28-06-2014','22-06-2014','14:15'),
(6,6,'JJJ-2020','28-04-2015','18-04-2015','17:30'),
(7,1,'JJJ-2020','28-01-2015','08-01-2015','13:00'),
(8,2,'SQL-2015','28-01-2015','18-01-2014','15:00'),
(9,1,'JJJ-2020','28-01-2015','15-09-2013','10:22'),
(10,1,'JEG-1010','28-01-2015','15-04-2011','20:18'),
(11,1,'JJJ-2020','28-01-2015','10-01-2010','03:09'),
(12,1,'JJJ-2020','28-01-2015','28-01-2012','23:00')
