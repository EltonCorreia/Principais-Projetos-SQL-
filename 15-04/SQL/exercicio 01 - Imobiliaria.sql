create database imobiliaria

use imobiliaria

create table tblvendedor(
id_vendedor int not null primary key,
nome_ven varchar(30) not null,
endereco_ven varchar(30) not null,
telefone_ven varchar(30) not null,
)

create table tblcomprador(
id_comprador int not null primary key,
nome_com varchar(30) not null,
endereco_com varchar(30) not null,
telefone_com varchar(11) not null,
)

create table tblfaixaimovel(
id_faixa int not null,
descricao_faixa varchar(30) not null,
)

create table tblestado(
sigla_est int not null,
nome_est varchar(30) not null,
)


/*create table tblimovel(
id_imovel int not null,
coddepto int foreign key references
bairro (codigo)
id_bairro varchar(30) not null,
endereco_ven varchar(30) not null,
telefone_ven varchar(30) not null,
)
/*