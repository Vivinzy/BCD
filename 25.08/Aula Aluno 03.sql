CREATE DATABASE aula_15_08_DIOGO;

USE AULA_15_08_DIOGO;

CREATE TABLE alunos (
id INT AUTO_INCREMENT PRIMARY KEY,
NOME VARCHAR (100),
IDADE INT,
CIDADE VARCHAR (50)
);

INSERT INTO alunos (nome, idade, cidade) VALUES
 ('Ana', 20, 'São Paulo'), 
 ('bruno', 22, 'Rio de Janeiro'),
 ('Carla', 10, 'Curitiba'),
 ('Diego', 25, 'Belo Horizonte'),
 ('Eduardo', 29, 'Espirito Santo');

EXPLAIN SELECT * FROM alunos WHERE cidade = 'São Paulo';

SELECT * FROM alunos WHERE cidade = 'São Paulo'


