-- II. Questões Dissertativas e Práticas (10 Pontos)

-- Instrução: Responda às perguntas abaixo com comandos SQL ou explicações detalhadas.

-- 11.DML Prático (UPDATE): Escreva o comando SQL necessário para aumentar em
-- 15% o salário de todos os funcionários na tabela funcionários que trabalham
-- no departamento de 'Vendas'.
-- RESPOSTA:
sql UPDATE funcionarios SET salario = salario * 1.15 WHERE departamento = 'Vendas';

-- 12.DML Prático (DELETE): Considerando uma tabela chamada logs, escreva o
-- comando SQL para remover todos os registros de logs que foram criados antes de
-- 01/01/2024.
-- RESPOSTA:
sql DELETE FROM logs WHERE data_criacao < '2024-01-01';

-- 13.DDL Teórico: Explique, de forma resumida, o propósito do comando ALTER
-- TABLE ... DROP COLUMN.
-- RESPOSTA:
-- O propósito do comando ALTER TABLE DROP COLUMN é modificar a estrutura de uma tabela 
-- existente  removendo uma coluna (atributo) específica. Este é um comando da Linguagem de Definição de Dados (DDL).

-- 14.JOIN Teórico: Explique, usando o exemplo de duas tabelas (autores e livros),
-- a principal utilidade do LEFT JOIN no contexto de listagem de dados.
-- RESPOSTA:
-- A principal utilidade do LEFT JOIN é listar todos os registros da tabela da esquerda (principal), mesmo que não haja correspondência (match) na tabela da direita.
-- Exemplo: Se você fizer um LEFT JOIN da tabela autores (esquerda) com a tabela livros (direita), 
-- o resultado listará todos os autores, incluindo aqueles que nunca escreveram nenhum livro (para os quais as colunas de livros retornarão NULL).

-- 15.JOIN Prático (LEFT JOIN): Você tem uma tabela clientes e uma tabela
-- compras. Escreva um comando SQL que retorne o nome de todos os clientes e,
-- se houver, o valor total da sua última compra. Inclua aqueles clientes que nunca
-- compraram.
-- RESPOSTA:
SELECT
    c.nome,
    MAX(cpr.valor_total) AS valor_ultima_compra
FROM
    clientes c
LEFT JOIN
    compras cpr ON c.id_cliente = cpr.id_cliente
GROUP BY
    c.id_cliente, c.nome
ORDER BY
    c.nome;

-- 16.Backup Teórico: Qual a importância da prática de backup em bancos de dados?
-- Cite um cenário de desastre que o backup ajuda a mitigar.
-- RESPOSTA:
-- A importância da prática de backup em bancos de dados é garantir a disponibilidade e
-- a recuperação dos dados após falhas. O backup serve como uma cópia de segurança que permite restaurar o sistema ao seu estado operacional anterior.
-- Cenário de Desastre Mitigado:
-- Falha de Hardware: Como a quebra de um disco rígido (HD) ou servidor.
-- Erro Humano: Como a execução acidental de um comando DELETE ou DROP TABLE sem a cláusula WHERE (ou em produção).
-- Ataque Malicioso/Ransomware: Onde os dados são criptografados ou excluídos.

-- 17.Modelagem Conceitual vs. Lógica: Qual é o objetivo da etapa de Modelagem
-- Lógica e como ela transforma os conceitos da Modelagem Conceitual?
-- RESPOSTA:
-- Modelagem Conceitual: Foca na visão do usuário e do negócio, identificando as entidades, atributos e relacionamentos de alto nível (Ex: N:M, 1:N).
-- Modelagem Lógica: O objetivo é traduzir a visão conceitual para um modelo relacional (tabelas, colunas), tornando-o implementável em qualquer SGBD Relacional.
-- Transformação: Ela converte relacionamentos N:M em tabelas associativas e utiliza Chaves Estrangeiras (FOREIGN KEYS) para representar os relacionamentos 1:N.

-- 18.Chave Primária e Estrangeira: Defina Chave Primária (PRIMARY KEY) e Chave
-- Estrangeira (FOREIGN KEY) e explique como elas trabalham juntas.
-- RESPOSTA:
-- -- Chave Primária (PRIMARY KEY): É um atributo (ou conjunto de atributos) que identifica unicamente cada registro (linha)
-- -- em uma tabela. Garante a integridade da entidade (não pode ser nula e deve ser única).
-- -- Chave Estrangeira (FOREIGN KEY): É um atributo em uma tabela que faz referência à Chave Primária de outra tabela.
-- -- Como trabalham juntas: A Chave Estrangeira implementa o relacionamento entre as tabelas e garante a integridade referencial.
-- -- Ela assegura que um valor só possa existir na coluna da Chave Estrangeira se o mesmo valor existir na Chave Primária da tabela referenciada.

-- 19.SQL Prático (INSERT): Escreva o comando SQL para inserir um novo filme na
-- tabela filmes com os seguintes dados: id_filme = 50, titulo = 'O Grande
-- Mestre', ano_lancamento = 2023.
-- RESPOSTA:
INSERT INTO filmes (id_filme, titulo, ano_lancamento)
VALUES (50, 'O Grande Mestre', 2023);

-- 20.Modelagem Teórico (Normalização): O que é Normalização no contexto de
-- bancos de dados relacionais e qual é o seu principal benefício?
-- RESPOSTA:
-- Normalização é um processo sistemático de organização da estrutura de um banco de dados relacional. 
-- Envolve a decomposição das tabelas para atender a um conjunto de regras (Formas Normais - 1NF, 2NF, 3NF, etc.).
-- Principal Benefício:
-- Redução da Redundância: Evita que a mesma informação seja armazenada em múltiplos locais.
-- Eliminação de Anomalias de Inserção, Atualização e Exclusão: Melhora a consistência e a integridade dos dados.