-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE curso;
USE CURSO;    

-- Tabela Aluno
CREATE TABLE Aluno (
  Id_Aluno INT PRIMARY KEY AUTO_INCREMENT,
  Nome_Aluno VARCHAR(255),
  Email VARCHAR(255),
  Data_Nascimento DATE
);

-- Tabela Curso
CREATE TABLE Curso (
  Id_Curso INT PRIMARY KEY AUTO_INCREMENT,
  Titulo VARCHAR(255),
  Descricao VARCHAR(255),
  Carga_Horaria INT,
  Status VARCHAR(255)
);

-- Tabela Inscrições
CREATE TABLE Inscricoes (
  Id_Inscricao INT PRIMARY KEY AUTO_INCREMENT,
  Data_Inscricao DATE,
  Aluno_Id INT,
  Curso_Id INT,
  FOREIGN KEY (Aluno_Id) REFERENCES Aluno(Id_Aluno),
  FOREIGN KEY (Curso_Id) REFERENCES Curso(Id_Curso)
);

-- Tabela Avaliacoes
CREATE TABLE Avaliacoes (
  Id_Avaliacao INT PRIMARY KEY AUTO_INCREMENT,
  Inscricao_Id INT,
  Nota DECIMAL(5,2),
  Comentario TEXT,
  FOREIGN KEY (Inscricao_Id) REFERENCES Inscricoes(Id_Inscricao)
);

INSERT INTO Aluno (Id_Aluno, Nome_Aluno, Email, Data_Nascimento) VALUES
('01', 'Maria Eduarda', 'Mariaeduarda1@gmail.com', '2009-03-23'),
('02','João Silva', 'joao.silva@email.com', '2000-05-12'),
('03', 'Maria Oliveira', 'maria.oliveira@email.com', '1999-08-23'),
('04', 'Pedro Santos', 'pedro.santos@email.com', '2001-01-15'),
('05', 'Ana Costa', 'ana.costa@email.com', '1998-11-30');

select * from aluno; 

INSERT INTO Curso (Titulo, Descricao, Carga_Horaria, Status) VALUES
('Introdução à Programação Python', 'Curso fundamental para iniciantes, cobrindo lógica de programação, estruturas de dados básicas e a sintaxe da linguagem Python', '40', 'Ativo'),
('Marketing Digital para Pequenos Negócios', 'Aprenda estratégias de marketing online, incluindo SEO, mídias sociais, e-mail marketing e anúncios pagos, focando em resultados para micro e pequenas empresas.', '30', 'Inativo'),
('Excel Avançado: Análise e Visualização de Dados', 'Domine funções complexas, tabelas dinâmicas, gráficos avançados e macros (VBA) para automatizar tarefas e criar dashboards de alto impacto.', '25', 'Ativo'),
('Gestão de Projetos com Metodologias Ágeis (Scrum)', 'Introdução aos princípios da gestão ágil, focando na aplicação prática do framework Scrum para liderar equipes e entregar projetos de forma eficiente.', '20', 'Lotado'),
('Fotografia Digital: Composição e Edição Básica', 'Ensina os fundamentos da fotografia (ISO, abertura, velocidade), técnicas de composição e o uso de software básico para edição e tratamento de imagens.', '15', 'Ativo');

select * from Curso;

INSERT INTO inscricoes (Data_Inscricao, Aluno_Id, Curso_Id) VALUES
('2025-09-01', 01, 01),
('2025-09-01', 02, 03),
('2025-09-02', 03, 01),
('2025-09-03', 04, 02),
('2025-09-04', 05, 04);

select * from inscricoes;

INSERT INTO Avaliacoes (Inscricao_Id, Nota, Comentario) VALUES
(1, 100.50 , 'Ótimo desempenho na primeira parte. Aprofundar mais na análise.'),
(5, 90.20 , 'Trabalho excelente e muito bem fundamentado. Nota máxima no quesito originalidade.'),
(2, 75.00 , 'Conteúdo razoável, mas a organização precisa de melhorias. Revisar a formatação.');

select * from avaliacoes;

UPDATE Aluno
SET Email = 'JoaoSlv@gmail.com'
WHERE Id_Aluno = 2;

UPDATE Curso
SET Carga_Horaria = '20'
WHERE Id_Aluno = 3;

UPDATE Aluno
SET Nome_Aluno = 'Maria Bezerra'
WHERE Id_Aluno = 1;

UPDATE Aluno
SET Nome_Aluno = 'Joao Silva'
WHERE Id_Aluno = 2;

UPDATE Curso
SET Status = 'Inativo'
WHERE Id_Curso = 4;

UPDATE Avaliacoes
SET Nota = '100.00'
WHERE Id_Avaliacao = 2;




