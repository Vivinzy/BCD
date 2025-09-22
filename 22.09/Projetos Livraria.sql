-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE LIVRARIA;
USE LIVRARIA;
SELECT DATABASE();


CREATE TABLE Livros (
Cod_Livro int auto_increment PRIMARY KEY,
Nome_titulo varchar(255),
Nome_autor varchar (255),
Nome_editora varchar(255),
Tipo_genero varchar(100),
Preco varchar(255),
Quantidade int not null
);

CREATE TABLE Autores (
Cod_autor int auto_increment PRIMARY KEY,
Nome varchar(255),
Nacionalidade Varchar(100),
Data_Nascimento varchar(10)
);

CREATE TABLE Editoras (
Cod_Editora int auto_increment PRIMARY KEY,
Nome_Editora Varchar(255),
Cnpj Varchar(14),
Endereco Varchar(255),
Contato Varchar(9),
Telefone varchar(8),
Cidade varchar(255),
Cod_autor int,
FOREIGN KEY(Cod_autor) REFERENCES Autores (Cod_autor)
);

CREATE TABLE Clientes (
Cod_Cliente int auto_increment PRIMARY KEY,
Nome_Cliente Varchar(255),
Cpf varchar(14),
Email varchar(255),
Telefone varchar(8),
Data_Nascimento varchar(10)
);

CREATE TABLE Vendas (
Cod_Vendas int auto_increment PRIMARY KEY,
Data_Venda varchar(10),
Quantidade int not null,
Valor_total varchar(255),
Cod_Cliente int,
Cod_Livro int,
FOREIGN KEY(Cod_Cliente) REFERENCES Clientes (Cod_Cliente),
FOREIGN KEY(Cod_Livro) REFERENCES Livros (Cod_Livro)
);

CREATE TABLE Produtos (
Cod_autor int,
Cod_Livro int,
FOREIGN KEY(Cod_autor) REFERENCES Autores (Cod_autor),
FOREIGN KEY(Cod_Livro) REFERENCES Livros (Cod_Livro)
)
