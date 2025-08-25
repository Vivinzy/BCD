CREATE DATABASE EXERCICIO;

USE EXERCICIO;

CREATE TABLE clientes (
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
idade INT NOT NULL
);

INSERT INTO clientes (nome, email, cidade, idade) 
SELECT CONCAT('Cliente_',FLOOR(RAND() *100000)),
CONCAT('cliente', FLOOR(RAND() * 100000),'@teste.com'),
ELT(FLOOR(RAND()*5)+1, 'São Paulo', 'Rio de Janeiro', 'Belo Horizonte', 'Curitiba', 'Salvador'),
FLOOR(18 + (RAND() * 50))
FROM information_schema.tables t1
CROSS JOIN information_schema.tables t2
LIMIT 100000;

EXPLAIN SELECT * FROM clientes WHERE cidade = 'São Paulo';

SELECT * FROM clientes WHERE cidade = 'São Paulo';

CREATE INDEX idx_clientes_cidade ON clientes (cidade);

CREATE INDEX idx_clientes_cidade_idade ON clientes (cidade, idade);

EXPLAIN SELECT * FROM clientes WHERE cidade = 'São Paulo' AND idade>30;

