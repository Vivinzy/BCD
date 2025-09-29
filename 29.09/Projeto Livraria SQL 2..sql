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
);

INSERT INTO Autores (nome) VALUES
('Macahdo de Assis');
-- ('Paulo Coelho')

-- CONSULTA * TODOS OS DADOS
SELECT * FROM AUTORES, LIVROS;
SELECT * FROM LIVROS;

-- CONSULTA POR CAMPOS
SELECT Nome_titulo FROM LIVROS;
SELECT Nome FROM AUTORES;

-- CONSULTA POR DATA COM CONDIÇÃoptimize
SELECT Nome_titulo, Nome_autor FROM LIVROS
WHERE Quantidade > 2015;

-- CONSULTA POR CRESCENTE E DECRESCENTE
SELECT Nome_titulo, Quantidade FROM LIVROS
ORDER BY Quantidade DESC;

-- CONSULTA POR LIMITE DE RESULTADO
SELECT Nome_titulo FROM LIVROS
LIMIT 5;

-- RENOMEAR COLUNAS COM AS 
SELECT Nome_titulo AS NOME, Nome_autor AS ESCRITOR 
FROM LIVROS;

-- FUNÇÕES AGREGADAS
SELECT COUNT(*) AS TOTAL_LIVROS
FROM LIVROS;

SELECT SUM(Preco) AS TOTAL_LIVROS
FROM LIVROS;

SELECT AVG(Preco) AS TOTAL_LIVROS
FROM LIVROS;

-- AGRUPAMENTOS COM GROUP BY
SELECT Nome_autor, COUNT(*) AS QUANTIDADES
FROM LIVROS
GROUP BY Nome_autor;

-- USO DE AND OU OR
SELECT Nome_titulo, Preco FROM LIVROS
WHERE Nome_titulo = "HARRY" AND Preco > 30;

SELECT Nome_titulo, Preco FROM LIVROS
WHERE Nome_titulo = "HARRY" OR Preco > 30;

-- CONDIÇÕES EXTRAS COM GROUP BY, HAVING E
-- ORDER BY
SELECT Cod_Livro, COUNT(*) AS TOTAL_LIVROS
FROM LIVROS
GROUP BY Cod_Livro
HAVING TOTAL_LIVROS > 5
ORDER BY TOTAL_LIVROS DESC;

-- USO DO LIKE 
SELECT Nome_titulo FROM LIVROS
WHERE Nome_titulo LIKE '%HARRY%';

-- USO DO LIKE COM INICIO POR LETRAS
SELECT Nome_titulo FROM LIVROS
WHERE Nome_titulo LIKE 'H%';

-- USO DO LIKE COM TERMINO POR LETRAS
SELECT Nome_titulo FROM LIVROS
WHERE Nome_titulo LIKE '%RY';

-- USO DO LIKE POR QUANTIDADE DE LETRAS
SELECT Nome_titulo FROM LIVROS
WHERE Nome_titulo LIKE 'H___Y';

-- COMBINANDO SITUAÇÕES
SELECT Nome_titulo, Preco FROM LIVROS
WHERE Nome_titulo LIKE '%HARRY%'
ORDER BY Preco DESC;

INSERT INTO Autores (Nome, Nacionalidade, Data_Nascimento) VALUES
('Machado de Assis', 'Brasileira', '1839-06-21'),
('Clarice Lispector', 'Brasileira', '1920-12-10'),
('Gabriel García Márquez', 'Colombiana', '1927-03-06'),
('Jane Austen', 'Britânica', '1775-12-16'),
('Yuval Noah Harari', 'Israelense', '1976-02-24');

INSERT INTO Editoras (Nome_Editora, Cnpj, Endereco, Contato, Telefone, Cidade) VALUES
('Companhia das Letras', '04595861000100', 'Rua Bandeira, 100', '987654321', '33445566', 'São Paulo'),
('Rocco', '68574930000100', 'Av. Rio Branco, 20', '998877665', '21987654', 'Rio de Janeiro'),
('Record', '03040506000100', 'Travessa da Glória, 5', '900011122', '31223344', 'Rio de Janeiro'),
('Martins Fontes', '11223344000100', 'Rua da Paz, 30', '911122233', '41556677', 'Curitiba'),
('Penguin Books', '22446688000100', 'Fifth Ave, 500', '933344455', '80011223', 'New York');

INSERT INTO Livros (Nome_titulo, Nome_autor, Nome_editora, Tipo_genero, Preco, Quantidade) VALUES
('Dom Casmurro', 'Machado de Assis', 'Editora A', 'Romance', '55.90', 250),
('A Hora da Estrela', 'Clarice Lispector', 'Editora B', 'Ficção', '42.50', 180),
('Cem Anos de Solidão', 'Gabriel García Márquez', 'Editora C', 'Realismo Mágico', '78.00', 300),
('Orgulho e Preconceito', 'Jane Austen', 'Editora D', 'Romance Clássico', '35.99', 150),
('Sapiens: Uma Breve História da Humanidade', 'Yuval Noah Harari', 'Editora E', 'História/Não-Ficção', '99.90', 400);

INSERT INTO Clientes (Nome_Cliente, Cpf, Email, Telefone, Data_Nascimento) VALUES
('Ana Silva', '12345678901', 'ana.silva@email.com', '98887776', '1990-05-15'),
('Bruno Costa', '98765432109', 'bruno.costa@email.com', '97776665', '1985-11-20'),
('Carla Oliveira', '11223344556', 'carla.o@email.com', '96665554', '2000-01-01'),
('Daniel Souza', '65432198700', 'daniel.s@email.com', '95554443', '1976-08-30'),
('Eduarda Lima', '00112233445', 'eduarda.l@email.com', '94443332', '1995-03-25');

INSERT INTO Vendas (Data_Venda, Quantidade, Valor_total, Cod_Cliente, Cod_Livro) VALUES
('2024-09-20', 1, '55.90', 1, 1),   -- Ana bought Dom Casmurro
('2024-09-20', 2, '85.00', 2, 2),   -- Bruno bought two A Hora da Estrela (2 * 42.50)
('2024-09-21', 1, '78.00', 3, 3),   -- Carla bought Cem Anos de Solidão
('2024-09-22', 3, '107.97', 4, 4),  -- Daniel bought three Orgulho e Preconceito (3 * 35.99)
('2024-09-23', 1, '99.90', 5, 5);   -- Eduarda bought Sapiens

SELECT COUNT(*) AS Quantidade_Total_De_Livros
FROM Livros;

SELECT * FROM LIVROS
WHERE Nome_titulo = '%A%' AND PRECO > 100;
