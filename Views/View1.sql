CREATE OR REPLACE VIEW totalArrecadadoPorPessoa AS -- FUNCIONA, vê o total arrecadado por pessoa na escola
	SELECT
		p_nome, sobrenome, genero, p_tipo,
		(SELECT coalesce(SUM(valor_multa),0) FROM emprestimo WHERE pessoa.id_pessoa = emprestimo.id_pessoa) + 
		(SELECT coalesce(SUM(valor_pag_matricula),0) FROM aluno WHERE pessoa.id_pessoa = aluno.id_pessoa) + 
		(SELECT COALESCE(sum(total), 0) from (SELECT pe.*,(SELECT(sum(custo))
						from atividade_extracurricular as ae
						WHERE pe.atividade_extracurricular_id = ae.id_atividade) as total from participa_extracurrilar as pe JOIN aluno ON pe.aluno_num_matricula = aluno.num_matricula WHERE pessoa.id_pessoa = aluno.id_pessoa)) + 
		(SELECT COALESCE(sum(total), 0) from (SELECT pref.*, (SELECT(sum(custo))
						from aula_de_reforco as ar
						WHERE pref.aula_de_reforco = ar.id_reforco) as total from participa_reforco as pref JOIN aluno ON pref.aluno_num_matricula = aluno.num_matricula WHERE pessoa.id_pessoa = aluno.id_pessoa)) +
		(SELECT COALESCE(sum(total), 0) from (SELECT prefe.*, (SELECT(sum(custo))
						from preparatorio as pr
						WHERE prefe.preparatorio_id = pr.id_preparatorio) as total from participa_preparatorio as prefe JOIN aluno ON prefe.aluno_num_matricula = aluno.num_matricula WHERE pessoa.id_pessoa = aluno.id_pessoa)) +
		(SELECT COALESCE(SUM(custo_livro), 0) FROM comprar WHERE pessoa.id_pessoa = comprar.id_pessoa) as receita_bruta
	FROM pessoa;
		
SELECT * FROM totalArrecadadoPorPessoa;

-- Dúvidas:

-- Ver se tudo bem ter retirado o valor de evento, já que evento não é necessariamente conectado a pessoa

-- Ver o que fazer com empréstimo, pois ele só está pegando o valor da multa, acha melhor retirar, prefere que adicione algum método ou coluna da tabela com o valor da multa mesmo