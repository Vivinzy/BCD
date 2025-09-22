-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE SOLAR;
USE SOLAR;
SELECT DATABASE();

CREATE TABLE Clientes (
Nome_Clientes varchar(100),
Cod_Clientes int auto_increment PRIMARY KEY
);

CREATE TABLE Produtos (
Cod_Produto int auto_increment PRIMARY KEY,
Nome_Produto varchar(100)
);

CREATE TABLE Compra (
Cod_Compra int auto_increment PRIMARY KEY,
Cod_Produto int ,
Cod_Clientes int ,
FOREIGN KEY(Cod_Produto) REFERENCES Produtos (Cod_Produto),
FOREIGN KEY (Cod_Clientes) REFERENCES Clientes (Cod_Clientes)
)
