-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Alunos (
nome  varchar(255),
email varchar (255),
data_nascimento  date,
Cod_alunos int primary key auto_increment PRIMARY KEY
)

CREATE TABLE Faz (
Cod_Inscrições int primary key auto_increment,
Cod_alunos int primary key auto_increment,
FOREIGN KEY(Cod_alunos) REFERENCES Alunos (Cod_alunos)
)

CREATE TABLE Inscrições+Avaliações (
Cod_Inscrições int primary key auto_increment,
alunos_id varchar (255),
cursos_id int fk,
data_inscricao date,
Cod_avaliacao int primary key auto_increment,
inscrição_id fk,
nota decimal,
comentario varchar (255),
PRIMARY KEY(Cod_Inscrições,Cod_avaliacao)
)

CREATE TABLE Refere-se (
Cod_cursos int primary key auto_increment,
Cod_Inscrições int primary key auto_increment,
FOREIGN KEY(/*erro: ??*/) REFERENCES Inscrições+Avaliações (Cod_Inscrições,Cod_avaliacao)
)

CREATE TABLE Cursos (
Cod_cursos int primary key auto_increment PRIMARY KEY,
titulos varchar (255),
descrição varchar (255),
carga_horaria int (4),
status varchar (255)
)

ALTER TABLE Faz ADD FOREIGN KEY(/*erro: ??*/) REFERENCES Inscrições+Avaliações (Cod_Inscrições,Cod_avaliacao)
ALTER TABLE Refere-se ADD FOREIGN KEY(Cod_cursos) REFERENCES Cursos (Cod_cursos)
