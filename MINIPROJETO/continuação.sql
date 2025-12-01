CREATE DATABASE MINI_PROJETO;
USE MINI_PROJETO;

CREATE TABLE VEICULO (
Cod_Veiculo INT PRIMARY KEY,
Ano INT(4),
Placa VARCHAR(10),
Modelo VARCHAR(50),
Marca VARCHAR(50)00
);

CREATE TABLE CLIENTE (
Cod_Cliente INT PRIMARY KEY,
telefone VARCHAR(15),
cpf VARCHAR(14),
Nome VARCHAR(100)
);

CREATE TABLE MECANICO (
Cod_Mecanico INT PRIMARY KEY,
Especialidade VARCHAR(50),
Nome VARCHAR(100)
);

CREATE TABLE SERVICO (
Cod_Veiculo INT PRIMARY KEY,
Valor DECIMAL(10,2),
Descricao VARCHAR(100)
);

CREATE TABLE PECA (
Cod_Peca INT PRIMARY KEY,
Estoque INT,
Nome VARCHAR(100),
Valor_unitario DECIMAL(10,2)
);

CREATE TABLE ORDEM_SERVICO (
Status VARCHAR(20),
Observacao VARCHAR(100),
Data_Abertura VARCHAR(9),
Cod_OS INT PRIMARY KEY,
Data_Fechamento VARCHAR(100)
);

CREATE TABLE POSSUI (
Cod_Veiculo INT,
Cod_Cliente INT,
FOREIGN KEY(Cod_Veiculo) REFERENCES VEICULO (Cod_Veiculo),
FOREIGN KEY(Cod_Cliente) REFERENCES CLIENTE (Cod_Cliente)
);

CREATE TABLE RECEBE (
Cod_Veiculo INT,
Cod_OS INT,
FOREIGN KEY(Cod_Veiculo) REFERENCES VEICULO (Cod_Veiculo),
FOREIGN KEY(Cod_OS) REFERENCES ORDEM_SERVICO (Cod_OS)
);

CREATE TABLE TEM (
Cod_Veiculo INT,
Cod_OS INT,
FOREIGN KEY(Cod_Veiculo) REFERENCES SERVICO (Cod_Veiculo),
FOREIGN KEY(Cod_OS) REFERENCES ORDEM_SERVICO (Cod_OS)
);

CREATE TABLE USA (
Cod_Peca INT,
Cod_OS INT,
FOREIGN KEY(Cod_Peca) REFERENCES PECA (Cod_Peca),
FOREIGN KEY(Cod_OS) REFERENCES ORDEM_SERVICO (Cod_OS)
);

CREATE TABLE EXECUTADA (
Cod_Mecanico INT,
Cod_OS INT,
FOREIGN KEY(Cod_Mecanico) REFERENCES MECANICO (Cod_Mecanico)
);

INSERT INTO CLIENTE (Cod_Cliente, Nome, Telefone, CPF) VALUES
(1, 'Maria Silva', '11987654321', '111.111.111-11'),
(2, 'João Souza', '11912345678', '222.222.222-22'),
(3, 'Carlos Ferreira', '11998765432', '333.333.333-33'),
(4, 'Ana Paula', '11988887777', '444.444.444-44'),
(5, 'Pedro Alvares', '11955554444', '555.555.555-55');

INSERT INTO veiculo (Cod_Veiculo, Placa, Modelo, Marca, Ano) VALUES
(1, 'AAA1111', 'Focus', 'Ford', 2018),
(2, 'BBB2222', 'Gol', 'Volkswagen', 2015),
(3, 'CCC3333', 'Fiesta', 'Ford', 2019), 
(4, 'DDD4444', 'Palio', 'Fiat', 2010),
(5, 'EEE5555', 'Virtus', 'Volkswagen', 2021),
(6, 'FFF6666', 'Sandero', 'Renault', 2017);

INSERT INTO MECANICO (Cod_Mecanico, Nome, Especialidade) VALUES
(1, 'Ricardo', 'Motor'),
(2, 'Eduardo', 'Eletrica'),
(3, 'Fernanda', 'Injeção Eletrônica'),
(4, 'Carlos', 'Freios'); 

INSERT INTO PECA (Cod_Peca, estoque, Nome, Valor_unitario) VALUES
(10, '70', 'Oleo Sintético', 70.00),
(11,'70', 'Filtro de Ar', 25.00), 
(12,'400', 'Pastilha Freio', 250.00), 
(13, '900', 'Bateria 60A', 450.00), 
(14, '250', 'Vela Ignição', 20.00);

INSERT INTO SERVICO (Cod_Veiculo, Valor, Descricao) VALUES
(100, '50.00', 'Serviço padrão de troca de óleo'),
(101, '80.00', 'Verificação e troca de pastilhas'),
(102, '120.00', 'Check-up completo do sistema elétrico'),
(103, '90.00', 'Alinhamento e balanceamento');

INSERT INTO ORDEM_SERVICO (Cod_OS, Data_Abertura, Data_Fechamento, Status) VALUES
(101, '2025-10-01', '2025-10-03', 'Concluída'), 
(102, '2025-11-20', NULL, 'Em Execução'), 
(103,'2025-11-22', NULL, 'Aguardando Peça'), 
(104, '2025-05-01', '2025-05-05', 'Concluída'), 
(105, '2025-11-23', NULL, 'Em Execução'); 

INSERT INTO OS_Pecas (Cod_OS, Cod_Peca, Quantidade_Usada, Preco_Unitario_Cobrado) VALUES
(101, 10, 4, 70.00),
(102, 12, 1, 250.00),
(103, 13, 1, 450.00);

INSERT INTO OS_Servicos (Cod_OS, Cod_Servico, Preco_Cobrado) VALUES
(101, 100, 50.00),
(102, 101, 80.00),
(102, 102, 120.00);

INSERT INTO OS_Mecanicos (Cod_OS, Cod_Mecanico) VALUES
(101, 1),
(102, 1),
(102, 2),
(103, 3), 
(105, 4); 

SELECT * FROM VEICULO WHERE Marca = 'Ford';

SELECT DISTINCT c.Nome
FROM CLIENTE
JOIN ORDEM_SERVICO os ON c.Cod_Cliente = os.Cod_Cliente
WHERE os.Data_Abertura >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

SELECT * FROM MECANICO WHERE Especialidade = 'Injeção Eletrônica';

SELECT * FROM ORDEM_SERVICO WHERE Status = 'Aguardando Peça';

SELECT * FROM PECA WHERE Qtd_Estoque < 5;

SELECT Placa, Modelo
FROM VEICULO 
WHERE (
    SELECT COUNT(*)
    FROM ORDEM_SERVICO os
    WHERE Cod_Veiculo = Cod_Veiculo
) > 1;

SELECT DISTINCT os.*
FROM ORDEM_SERVICO os
JOIN OS_Mecanicos osm ON os.Cod_OS = osm.Cod_OS
WHERE osm.Cod_Mecanico = 3;


SELECT Nome_Peca, Preco_Venda FROM PECA WHERE Preco_Custo > 200.00;

UPDATE PECA SET Preco_Venda = Preco_Venda * 1.05 WHERE Fabricante = 'Bosch';

UPDATE ORDEM_SERVICO SET Status = 'Concluída' WHERE Cod_OS = 105 AND Status = 'Em Execução';

UPDATE ORDEM_SERVICO
SET Data_Conclusao = CURDATE(), Status = 'Concluída'
WHERE Status = 'Em Execução'
  AND Data_Abertura < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

UPDATE PECA SET Qtd_Estoque = Qtd_Estoque * 2 WHERE Cod_Peca = 20;

ALTER TABLE CLIENTE ADD COLUMN Email VARCHAR(100);

ALTER TABLE MECANICO MODIFY COLUMN Especialidade VARCHAR(150);

ALTER TABLE ORDEM_SERVICO DROP COLUMN Observacao;

ALTER TABLE PECA ADD CONSTRAINT chk_preco_venda_custo CHECK (Preco_Venda >= Preco_Custo);

SELECT
    os.Cod_OS,
    c.Nome AS Nome_Cliente,
    v.Placa,
    os.Data_Abertura
FROM ORDEM_SERVICO os
JOIN CLIENTE c ON os.Cod_Cliente = c.Cod_Cliente
JOIN VEICULO v ON os.Cod_Veiculo = v.Cod_Veiculo;

SELECT
    p.Nome_Peca,
    osp.Quantidade_Usada
FROM OS_Pecas osp
JOIN PECA p ON osp.Cod_Peca = p.Cod_Peca
WHERE osp.Cod_OS = 50;

SELECT m.Nome
FROM MECANICO m
JOIN OS_Mecanicos osm ON m.Cod_Mecanico = osm.Cod_Mecanico
WHERE osm.Cod_OS = 75;

SELECT
    Placa,
    Modelo,
    Nome AS Nome_Proprietario
FROM VEICULO v
JOIN CLIENTE c ON v.Cod_Cliente = c.Cod_Cliente;

SELECT v.Placa, v.Modelo
FROM VEICULO v
INNER JOIN ORDEM_SERVICO os ON v.Cod_Veiculo = os.Cod_Veiculo
WHERE os.Status = 'Em Execução';

SELECT DISTINCT c.Nome
FROM CLIENTE c
INNER JOIN VEICULO v ON c.Cod_Cliente = v.Cod_Cliente
WHERE v.Marca = 'Volkswagen';

SELECT DISTINCT m.Nome
FROM MECANICO m
INNER JOIN OS_Mecanicos osm ON m.Cod_Mecanico = osm.Cod_Mecanico;

SELECT DISTINCT s.Nome_Servico
FROM SERVICO s
INNER JOIN OS_Servicos oss ON s.Cod_Servico = oss.Cod_Servico;

SELECT c.Nome, os.Cod_OS
FROM CLIENTE c
LEFT JOIN ORDEM_SERVICO os ON c.Cod_Cliente = os.Cod_Cliente;

SELECT m.Nome, COUNT(osm.Cod_OS) AS Total_OS
FROM MECANICO m
LEFT JOIN OS_Mecanicos osm ON m.Cod_Mecanico = osm.Cod_Mecanico
GROUP BY m.Nome
ORDER BY Total_OS DESC;

SELECT p.Nome_Peca, COALESCE(SUM(osp.Quantidade_Usada), 0) AS Total_Vendido
FROM PECA p
LEFT JOIN OS_Pecas osp ON p.Cod_Peca = osp.Cod_Peca
GROUP BY p.Nome_Peca
ORDER BY Total_Vendido DESC;

SELECT v.Placa, v.Modelo, MAX(os.Data_Abertura) AS Data_Ultima_OS
FROM VEICULO v
LEFT JOIN ORDEM_SERVICO os ON v.Cod_Veiculo = os.Cod_Veiculo
GROUP BY v.Placa, v.Modelo;

SELECT os.Cod_OS, c.Nome AS Nome_Cliente
FROM CLIENTE c
RIGHT JOIN ORDEM_SERVICO os ON c.Cod_Cliente = os.Cod_Cliente;

SELECT s.Nome_Servico, oss.Cod_OS
FROM OS_Servicos oss
RIGHT JOIN SERVICO s ON oss.Cod_Servico = s.Cod_Servico;

SELECT osm.Cod_OS, m.Nome AS Nome_Mecanico
FROM OS_Mecanicos osm
INNER JOIN MECANICO m ON osm.Cod_Mecanico = m.Cod_Mecanico;

SELECT v.Placa, v.Modelo, os.Cod_OS
FROM ORDEM_SERVICO os
RIGHT JOIN VEICULO v ON os.Cod_Veiculo = v.Cod_Veiculo;

SELECT Nome FROM CLIENTE
WHERE Cod_Cliente IN (
    SELECT Cod_Cliente
    FROM ORDEM_SERVICO
    GROUP BY Cod_Cliente
    HAVING COUNT(Cod_OS) > 3
);

SELECT DISTINCT p.Nome_Peca
FROM PECA p
JOIN OS_Pecas osp ON p.Cod_Peca = osp.Cod_Peca
WHERE osp.Cod_OS IN (
    SELECT Cod_OS FROM OS_Mecanicos WHERE Cod_Mecanico = 4
);

SELECT Placa, Modelo FROM VEICULO
WHERE Cod_Veiculo NOT IN (
    SELECT DISTINCT Cod_Veiculo FROM ORDEM_SERVICO
);

SELECT Nome_Servico, Preco_Mao_Obra
FROM SERVICO
WHERE Preco_Mao_Obra > (SELECT AVG(Preco_Mao_Obra) FROM SERVICO);

SELECT
    COALESCE(SUM(oss.Preco_Cobrado), 0) +
    COALESCE(SUM(osp.Preco_Unitario_Cobrado * osp.Quantidade_Usada), 0) AS Faturamento_Total
FROM ORDEM_SERVICO os
LEFT JOIN OS_Servicos oss ON os.Cod_OS = oss.Cod_OS
LEFT JOIN OS_Pecas osp ON os.Cod_OS = osp.Cod_OS
WHERE os.Cod_OS = 100;

SELECT AVG(DATEDIFF(Data_Conclusao, Data_Abertura)) AS Tempo_Medio_Dias
FROM ORDEM_SERVICO
WHERE Status = 'Concluída' AND Data_Conclusao IS NOT NULL;

SELECT COUNT(*) AS Total_Veiculos FROM VEICULO;

SELECT SUM(Qtd_Estoque * Preco_Custo) AS Valor_Inventario_Total FROM PECA;

SELECT AVG(Preco_Mao_Obra) AS Preco_Medio_Servico FROM SERVICO;

SELECT Marca, COUNT(*) AS Total_Por_Marca FROM VEICULO GROUP BY Marca;

SELECT MONTH(Data_Abertura) AS Mes, COUNT(*) AS Total_OS
FROM ORDEM_SERVICO
GROUP BY Mes
ORDER BY Mes;

SELECT Status, COUNT(*) AS Total_Por_Status FROM ORDEM_SERVICO GROUP BY Status;

SELECT COUNT(*) AS Total_OS_Concluidas FROM ORDEM_SERVICO WHERE Status = 'Concluída';

SELECT
    SUM(COALESCE(oss.Preco_Cobrado, 0) + COALESCE(osp.Preco_Unitario_Cobrado * osp.Quantidade_Usada, 0)) AS Faturamento_Fiat
FROM ORDEM_SERVICO os
JOIN VEICULO v ON os.Cod_Veiculo = v.Cod_Veiculo
LEFT JOIN OS_Servicos oss ON os.Cod_OS = oss.Cod_OS
LEFT JOIN OS_Pecas osp ON os.Cod_OS = osp.Cod_OS
WHERE v.Marca = 'Fiat' AND os.Data_Abertura >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

SELECT AVG(Preco_Mao_Obra) AS Preco_Medio_Motor FROM SERVICO WHERE Especialidade = 'Motor';

SELECT os.Cod_Cliente,
    SUM(COALESCE(oss.Preco_Cobrado, 0) + COALESCE(osp.Preco_Unitario_Cobrado * osp.Quantidade_Usada, 0)) AS Gasto_Total
FROM ORDEM_SERVICO os
LEFT JOIN OS_Servicos oss ON os.Cod_OS = oss.Cod_OS
LEFT JOIN OS_Pecas osp ON os.Cod_OS = osp.Cod_OS
GROUP BY os.Cod_Cliente
HAVING Gasto_Total > 5000.00;

SELECT Cod_Peca, SUM(Quantidade_Usada) AS Total_Vendido
FROM OS_Pecas
GROUP BY Cod_Peca
HAVING Total_Vendido > 100;

SELECT m.Especialidade, COUNT(osm.Cod_OS) AS Total_OS_Trabalhadas
FROM MECANICO m
JOIN OS_Mecanicos osm ON m.Cod_Mecanico = osm.Cod_Mecanico
GROUP BY m.Especialidade
HAVING Total_OS_Trabalhadas > 20;

SELECT m.Nome, COUNT(osm.Cod_OS) AS Total_OS_Trabalhadas
FROM MECANICO m
JOIN OS_Mecanicos osm ON m.Cod_Mecanico = osm.Cod_Mecanico
GROUP BY m.Nome
ORDER BY Total_OS_Trabalhadas DESC
LIMIT 1;

CREATE INDEX idx_veiculos_placa ON VEICULO (Placa);

CREATE INDEX idx_os_cod_veiculo ON ORDEM_SERVICO (Cod_Veiculo);
