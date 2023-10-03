-- CREATE
--
--
--
CREATE DATABASE BIBLIOTECA_RONALDO;

USE BIBLIOTECA_RONALDO;

-- TABELA DE AUTORES
CREATE TABLE AUTORES(
	ID_AUTOR INT PRIMARY KEY,
	NOME_AUTOR VARCHAR (100) NOT NULL,
	DATA_NASCIMENTO_AUTOR CHAR (8)
);

-- TABELA DE LIVROS
CREATE TABLE LIVROS(
	ID_LIVRO INT PRIMARY KEY,
	TITULO VARCHAR(200),
	ID_AUTOR INT NOT NULL REFERENCES AUTORES (ID_AUTOR)
);

-- TABELA DE EMPRESTIMOS
CREATE TABLE EMPRESTIMOS(
	ID_EMPRESTIMO INT PRIMARY KEY,
	ID_LIVRO INT NOT NULL REFERENCES LIVROS (ID_LIVRO),
	DATA_EMPRESTIMO CHAR(8),
	DATA_DEVOLUCAO CHAR (8)
);




-- INSERT
--
--
--
-- INSERINDO DADOS NA TABELA AUTORES
INSERT INTO AUTORES (ID_AUTOR, NOME_AUTOR, DATA_NASCIMENTO_AUTOR) VALUES 
(214, 'J. K. Rowling', '19850615'),
(985, 'Jose de Alencar', '18290321'),
(302, 'Ronaldo Sabino', '20030830'),
(101, 'Bell Hooks', '19520925'),
(736, 'Jorge Amado', '19120810');

-- INSERINDO DADOS NA TABELA LIVROS
INSERT INTO LIVROS (ID_LIVRO, TITULO, ID_AUTOR) VALUES 
(223, 'Tudo Sobre Amor', 101),
(567, 'Harry Potter', 214),
(690, 'Capitaes de Areia', 736),
(984, 'O Fenomeno', 302),
(123, 'Iracema', 985),
(350, 'Senhora', 985),
(500, 'Cacau', 736),
(178, 'Ensinando a transgredir', 101);

-- INSERINDO DADOS NA TABELA EMPRESTIMOS
INSERT INTO EMPRESTIMOS (ID_EMPRESTIMO, ID_LIVRO, DATA_EMPRESTIMO, DATA_DEVOLUCAO) VALUES
(555, 984, '20230401', '20230412'),
(999, 350, '20230515', '20230530'),
(333, 567, '20230710', '20230715'),
(222, 178, '20230713', '20230717'),
(111, 500, '20230801', '20230805'),
(339, 567, '20230801', '20230807'),
(444, 690, '20230802', '20230806'),
(777, 223, '20230807', NULL);




-- SELECT
--
--
--
-- LISTAR TODAS AS COLUNAS DE TODAS AS TABELAS
SELECT * FROM AUTORES;
SELECT * FROM LIVROS;
SELECT * FROM EMPRESTIMOS;

-- LISTAR TODOS OS AUTORES E SEUS LIVROS
SELECT AUTORES.NOME_AUTOR, LIVROS.TITULO
FROM AUTORES
INNER JOIN LIVROS
ON LIVROS.ID_AUTOR = AUTORES.ID_AUTOR;

-- ENCONTRAR TODOS OS LIVROS EMPRESTADOS E SUAS DATAS DE DEVOLUCAO
SELECT LIVROS.TITULO, EMPRESTIMOS.DATA_EMPRESTIMO, EMPRESTIMOS.DATA_DEVOLUCAO
FROM LIVROS
INNER JOIN EMPRESTIMOS
ON EMPRESTIMOS.ID_LIVRO = LIVROS.ID_LIVRO;

-- ENCONTRAR OS LIVROS QUE AINDA NAO FORAM DEVOLVIDOS
SELECT LIVROS.TITULO, EMPRESTIMOS.DATA_EMPRESTIMO, EMPRESTIMOS.DATA_DEVOLUCAO
FROM LIVROS
INNER JOIN EMPRESTIMOS
ON EMPRESTIMOS.ID_LIVRO = LIVROS.ID_LIVRO
WHERE EMPRESTIMOS.DATA_DEVOLUCAO IS NULL;




-- UPDATE
--
--
--
-- ALTERAR O NOME DE UM AUTOR NA TABELA AUTORES
-- BEGIN TRANSACTION;

UPDATE AUTORES
SET NOME_AUTOR = 'Filipe Sabino'
WHERE ID_AUTOR = 302;

-- ROLLBACK TRANSACTION;

SELECT * FROM AUTORES;

-- ALTERAR O TITULO DE ALGUM LIVRO NA TABELA LIVROS
-- BEGIN TRANSACTION

UPDATE LIVROS
SET TITULO = 'ELOGICA'
WHERE ID_LIVRO = 984;

-- ROLLBACK

SELECT * FROM LIVROS;

-- MARCAR UM LIVRO COMO EMPRESTADO E ATUALIZAR A DATA DE EMPRESTIMO E DATA DE DEVOLUCAO NA TABELA EMPRESTIMOS
-- BEGIN TRANSACTION

UPDATE EMPRESTIMOS
SET DATA_EMPRESTIMO = '20230807', DATA_DEVOLUCAO = NULL
WHERE ID_EMPRESTIMO = 111;

-- ROLLBACK

SELECT * FROM EMPRESTIMOS;




-- DELETE
--
--
--
-- BEGIN TRANSACTION;

-- CONSTRUIR O COMANDO PARA PARA DELETAR ALGUM REGISTRO NA TABELA EMPRESTIMOS
DELETE FROM EMPRESTIMOS
WHERE ID_EMPRESTIMO = 555;

SELECT * FROM EMPRESTIMOS;

-- CONSTRUIR O COMANDO PARA PARA DELETAR ALGUM REGISTRO NA TABELA LIVROS
DELETE FROM LIVROS
WHERE ID_LIVRO = 984;

SELECT * FROM LIVROS;

-- CONSTRUIR O COMANDO PARA PARA DELETAR ALGUM REGISTRO NA TABELA AUTORES
DELETE FROM AUTORES
WHERE ID_AUTOR = 302;

SELECT * FROM AUTORES;

-- ROLLBACK