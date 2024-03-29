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