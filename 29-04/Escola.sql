
use master

drop database Escola

create database Escola

use Escola

create table tblalocacao(
cod_turma numeric(6) not null primary key,
nome_sala varchar(30) not null,
dia date,
inicio time,
fim time
)

create table tblaluno(
cod_aluno numeric(6) not null primary key,
nome_aluno varchar(30) not null,
endereco_aluno varchar(50) not null,
bairro_aluno varchar(20) not null,
cidade_aluno varchar(20) not null,
cep_aluno numeric(8) not null,
telefone_aluno varchar(20) not null,
e_mail_aluno varchar(50) not null,
)

create table tblturma(
cod_turma numeric(6) not null primary key,
cod_curso numeric(6) foreign key references tblcurso (cod_curso),
cod_professor numeric(6) foreign key references tblprofessor (cod_professor),
termino_inscricoes date,
inicio_aulas date,
fim_aulas date,
inscritos numeric(3),
tipo_turma varchar(1) not null,
valor_faturado dec(17,2),
valor_turma_fechada dec(17,2),
carga_horaria_ministrada numeric(3)
)

create table tblcontrato(
cod_contrato numeric(6) not null primary key,
nome_firma varchar(50) not null,
contato varchar(20) not null,
telefone_fimra varchar(20) not null,
fax_firma varchar(20) not null,
)

create table tblcurso(
cod_curso numeric(6) not null primary key,
nome_curso varchar(50) not null,
carga_horaria numeric(3) not null,
maximo_alunos numeric(2),
minimo_alunos numeric(2),
preco_turma dec(17,2),
preco_aluno dec(17,2),
equipamento_necessario varchar(80),
)

--inscrição
create table tblinscricao(
cod_turma numeric(6) foreign key references tblturma (cod_turma),
cod_aluno numeric(6) foreign key references tblaluno (cod_aluno),
valor_cobrado dec(17,2),
cod_contrato numeric(6) foreign key references tblcontrato (cod_contrato),
conceito numeric(4)
)


create table tbllaboratorio(
nome_sala varchar(10) not null primary key,
capacidade numeric(3) not null,
equipe_disponivel varchar(80) not null,
)

--ministra
create table tblministra(
cod_professor numeric(6) foreign key references tblprofessor (cod_professor),
cod_curso numeric(6) foreign key references tblcurso (cod_curso),
)

create table tblprofessor(
cod_professor numeric(6) not null primary key,
nome_professor varchar(30) not null,
area varchar(4) not null,
ramal numeric(4) not null,
e_mail_professor varchar(50) not null,
)

--indice
create index ALOCACAO on tblalocacao (cod_turma)

create index ALUNO on tblaluno (cod_aluno)

create index CONTRATO on tblcontrato (cod_contrato)

create index CURSO on tblcurso (cod_curso)

create index INSCRICAO on tblinscricao (cod_turma,cod_aluno,cod_contrato)

create index LABORATORIO on tbllaboratorio (nome_sala)

create index MINISTRA on tblministra (cod_professor,cod_curso)

create index PROFESSOR on tblprofessor (cod_professor)

create index TURMA on tblturma (cod_turma,cod_curso,cod_professor)

--final indice


--campo data
SET DATEFORMAT DMY;

-- Selecionar e converter a data para o formato DD/MM/AAAA
SELECT CONVERT(CHAR, dia, 103) from tblalocacao

SELECT CONVERT(CHAR, termino_inscricoes, 103) from tblturma

SELECT CONVERT(CHAR, inicio_aulas, 103) from tblturma

SELECT CONVERT(CHAR, fim_aulas, 103) from tblturma

--preencher dados

insert into tblalocacao(cod_turma,nome_sala,dia,inicio,fim)
values (1,'SL A','02/08/2024','15:00','16:30')

insert into tblalocacao(cod_turma,nome_sala,dia,inicio,fim)
values (2,'SL B','03/08/2024','15:00','16:30')

insert into tblalocacao(cod_turma,nome_sala,dia,inicio,fim)
values (3,'SL C','04/08/2024','15:00','16:30')

insert into tblalocacao(cod_turma,nome_sala,dia,inicio,fim)
values (4,'SL D','05/08/2024','15:00','16:30')

insert into tblalocacao(cod_turma,nome_sala,dia,inicio,fim)
values (5,'SL E','06/08/2024','15:00','16:30')

--tblaluno
insert into tblaluno(cod_aluno,nome_aluno,endereco_aluno,bairro_aluno,cidade_aluno,cep_aluno,telefone_aluno,e_mail_aluno)
values (1,'João Miguel Silva','Rua 1','Tijuca','Rio de Janeiro','01210000','11985238523','jms@dti.com.br')

insert into tblaluno(cod_aluno,nome_aluno,endereco_aluno,bairro_aluno,cidade_aluno,cep_aluno,telefone_aluno,e_mail_aluno)
values (2,'Miguel Silva','Rua 2','Tijuca','Rio de Janeiro','01210001','11985238524','ms@dti.com.br')

insert into tblaluno(cod_aluno,nome_aluno,endereco_aluno,bairro_aluno,cidade_aluno,cep_aluno,telefone_aluno,e_mail_aluno)
values (3,'Eloisa Silva','Rua 3','Tijuca','Rio de Janeiro','01210002','11985238525','es@dti.com.br')

insert into tblaluno(cod_aluno,nome_aluno,endereco_aluno,bairro_aluno,cidade_aluno,cep_aluno,telefone_aluno,e_mail_aluno)
values (4,'João Silva','Rua 4','Tijuca','Rio de Janeiro','01210003','11985238526','js@dti.com.br')

insert into tblaluno(cod_aluno,nome_aluno,endereco_aluno,bairro_aluno,cidade_aluno,cep_aluno,telefone_aluno,e_mail_aluno)
values (5,'Fatima Maria Santos','Rua 5','Tijuca','Rio de Janeiro','01210004','11985238527','fms@dti.com.br')

--tblcontratos

insert into tblcontrato(cod_contrato,nome_firma,contato,telefone_fimra,fax_firma)
values (1,'Ajax','Monica','11963258741','1136361414')

insert into tblcontrato(cod_contrato,nome_firma,contato,telefone_fimra,fax_firma)
values (2,'SomMD','Luiza Arruda','11963258456','1136361515')

insert into tblcontrato(cod_contrato,nome_firma,contato,telefone_fimra,fax_firma)
values (3,'Luz Fire','Fabio Leonci','11963258123','1136361616')

insert into tblcontrato(cod_contrato,nome_firma,contato,telefone_fimra,fax_firma)
values (4,'Rubi Azul','Vera Silca','11963257889','1136361717')

insert into tblcontrato(cod_contrato,nome_firma,contato,telefone_fimra,fax_firma)
values (5,'Claudio Faria ME','Luis Silva','11963258789','1136361717')

--tblcurso
insert into tblcurso(cod_curso,nome_curso,carga_horaria,maximo_alunos,minimo_alunos,preco_turma,preco_aluno,equipamento_necessario)
values (1,'Codigos Chaves em C#',20,10,5,10.000,1.000,'Computadores')

insert into tblcurso(cod_curso,nome_curso,carga_horaria,maximo_alunos,minimo_alunos,preco_turma,preco_aluno,equipamento_necessario)
values (2,'Codigos Chaves em Android',20,10,5,8000,800,'Computadores')

insert into tblcurso(cod_curso,nome_curso,carga_horaria,maximo_alunos,minimo_alunos,preco_turma,preco_aluno,equipamento_necessario)
values (3,'Codigos Chaves HTML',20,10,5,10000,1000,'Computadores')

insert into tblcurso(cod_curso,nome_curso,carga_horaria,maximo_alunos,minimo_alunos,preco_turma,preco_aluno,equipamento_necessario)
values (4,'Codigos Chaves Rede C#',20,10,5,10000,1000,'Computadores')

insert into tblcurso(cod_curso,nome_curso,carga_horaria,maximo_alunos,minimo_alunos,preco_turma,preco_aluno,equipamento_necessario)
values (5,'Codigos Chaves SQL',20,10,5,10000,1000,'Computadores')

--tblinscricao
insert into tblinscricao(cod_turma,cod_aluno,valor_cobrado,cod_contrato,conceito)
values (1,1,800,1,7,0)

insert into tblinscricao(cod_turma,cod_aluno,valor_cobrado,cod_contrato,conceito)
values (1,2,800,00,2,10,0)

insert into tblinscricao(cod_turma,cod_aluno,valor_cobrado,cod_contrato,conceito)
values (1,3,800,00,3,8,0)

insert into tblinscricao(cod_turma,cod_aluno,valor_cobrado,cod_contrato,conceito)
values (1,4,800,4,7,0)

insert into tblinscricao(cod_turma,cod_aluno,valor_cobrado,cod_contrato,conceito)
values (1,5,800,5,8,0)

--tbllaboratorio
insert into tbllaboratorio (nome_sala,capacidade,equipe_disponivel)
values ('SL A',10,'NoteBook')

insert into tbllaboratorio (nome_sala,capacidade,equipe_disponivel)
values ('SL B',10,'NoteBook')

insert into tbllaboratorio (nome_sala,capacidade,equipe_disponivel)
values ('SL C',10,'NoteBook')

insert into tbllaboratorio (nome_sala,capacidade,equipe_disponivel)
values ('SL D',10,'NoteBook')

insert into tbllaboratorio (nome_sala,capacidade,equipe_disponivel)
values ('SL E',10,'NoteBook')

--tblministra
insert into tblministra(cod_professor,cod_curso)
values (1,5)

insert into tblministra(cod_professor,cod_curso)
values (2,4)

insert into tblministra(cod_professor,cod_curso)
values (3,3)

insert into tblministra(cod_professor,cod_curso)
values (4,2)

insert into tblministra(cod_professor,cod_curso)
values (5,1)

--tblprofessor
insert into tblprofessor(cod_professor,nome_professor,area,ramal,e_mail_professor)
values (1,'Hugo Mendonça','Tecnologia',1234,'hm@dti.com.br')

insert into tblprofessor(cod_professor,nome_professor,area,ramal,e_mail_professor)
values (2,'Luiz Mendonça','Tecnologia',1425,'lm@dti.com.br')

insert into tblprofessor(cod_professor,nome_professor,area,ramal,e_mail_professor)
values (3,'Jose Mendonça','Tecnologia',3698,'jm@dti.com.br')

insert into tblprofessor(cod_professor,nome_professor,area,ramal,e_mail_professor)
values (4,'Maria Mendonça','Tecnologia',1112,'mm@dti.com.br')

insert into tblprofessor(cod_professor,nome_professor,area,ramal,e_mail_professor)
values (5,'Luiza Mendonça','Tecnologia',1212,'lm@dti.com.br')

--tblturma
insert into tblturma(cod_turma,cod_curso,cod_professor,termino_inscricoes,inicio_aulas,fim_aulas,inscritos,tipo_turma,valor_faturado,valor_turma_fechada,carga_horaria_ministrada)
values (1,5,3,30/10/2024,01/12/2024,5,P,5000,10000,40)

insert into tblturma(cod_turma,cod_curso,cod_professor,termino_inscricoes,inicio_aulas,fim_aulas,inscritos,tipo_turma,valor_faturado,valor_turma_fechada,carga_horaria_ministrada)
values (2,'4','3','30/09/2024','01/10/2024','5','P','R$5000,00','R$10000,00','40')

insert into tblturma(cod_turma,cod_curso,cod_professor,termino_inscricoes,inicio_aulas,fim_aulas,inscritos,tipo_turma,valor_faturado,valor_turma_fechada,carga_horaria_ministrada)
values (3,'3','2','30/10/2024','01/12/2024','5','P','R$4000,00','R$8000,00','40')

insert into tblturma(cod_turma,cod_curso,cod_professor,termino_inscricoes,inicio_aulas,fim_aulas,inscritos,tipo_turma,valor_faturado,valor_turma_fechada,carga_horaria_ministrada)
values (4,'2','1','30/10/2024','01/12/2024','5','P','R$5000,00','R$10000,00','40')

insert into tblturma(cod_turma,cod_curso,cod_professor,termino_inscricoes,inicio_aulas,fim_aulas,inscritos,tipo_turma,valor_faturado,valor_turma_fechada,carga_horaria_ministrada)
values (5,'1','5','30/10/2024','01/12/2024','5','P','R$5000,00','R$10000,00','40')

--exercicios

--1 todas as colunas da tabela Aluno

SELECT * FROM tblaluno;

--2 As colunas nome_curso e preco_aluno da tabela curso

SELECT nome_curso, preco_aluno FROM tblcurso;

--3 A coluna nome_curso e a expressão (preco_turma dividido por minimo_alunos) *anotação folha
SELECT nome_curso, preco_turma / minimo_alunos AS preco_por_aluno
FROM tblcurso;

--4 A coluna valor_cobrado da tabela inscrição
SELECT valor_cobrado FROM tblinscricao;

--5 Nome dos alunos, bairro e cidade, ordenados por bairro
SELECT nome_aluno, bairro_aluno, cidade_aluno
FROM tblaluno
ORDER BY bairro_aluno;

--6 Nome dos alunos, bairro e cidade, ordenados por cidade e bairro, nesta ordem.
SELECT nome_aluno, bairro_aluno, cidade_aluno
FROM tblaluno
ORDER BY cidade_aluno, bairro_aluno;

--7 Bairros da tabela alunos.
SELECT DISTINCT bairro_aluno
FROM tblaluno;

--8 Nome dos alunos que moram na Tijuca, ordenados alfabeticamente.

SELECT nome_aluno
FROM tblaluno
WHERE cidade_aluno = 'Tijuca'
ORDER BY nome_aluno;

--8.1 Nome dos alunos que no baiiro do Centro, ordenados alfabeticamente.
SELECT nome_aluno
FROM tblaluno
WHERE bairro_aluno = 'Centro'
ORDER BY nome_aluno;

--9 Nome dos cursos e preços para turma fechada, ordenada da mais cara para mais barata
SELECT nome_curso, preco_turma
FROM tblcurso
WHERE valor_turma_fechada IS NOT NULL
ORDER BY preco_turma DESC;

--10 Os registros da tabela inscrição que tem nota entre 7,0 e 10,0 inclusive.
SELECT *
FROM tblinscricao
WHERE conceito BETWEEN 7.0 AND 10.0;

--11 Inclua um novo professor com os seguintes dados: código 6, seu nome, área "EXTN", ramal 0000
INSERT INTO tblprofessor (cod_professor, nome_professor, area, ramal, e_mail_professor)
VALUES (6, 'Emanoel Faria Santos', 'EXTN', '0000', 'exemplo@dominio.com');






