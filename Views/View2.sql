CREATE OR REPLACE VIEW informacoesLivros AS -- FUNCIONA, ver todos os dados de um livro, incluindo autor e editora, mais a quantidade de emprestimo e vendas globalmente
	SELECT l.titulo, l.data_publicacao, l.quantidade, l.isbn, l.secao, au.p_nome AS nome_autor, au.sobrenome AS sobrenome_autor, ed.nome AS nome_editora, ed.email AS email_editora,
	(SELECT COUNT(*) FROM emprestimo WHERE emprestimo.livros_id = l.id_livro) AS quant_emprestimos,
	(SELECT COUNT(*) FROM comprar WHERE comprar.livros_id = l.id_livro) AS quant_vendas
	FROM livros AS l, autor AS au JOIN escreveu ON escreveu.autor_id = au.id_autor, editora AS ed JOIN publica ON ed.nome = publica.editora_nome
	WHERE l.id_livro = escreveu.livros_id AND l.id_livro = publica.livros_id;
	
SELECT * FROM informacoesLivros;

-- PROBLEMA: O que fazer se o livro tiver mais de um autor ? Pois da forma como está funcionará com um autor só eu acho