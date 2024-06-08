CREATE OR REPLACE VIEW informacoes_salario AS -- FUNCIONA, mostrar o nome, o sobrenome, o tipo de funcionário e o salário (restringir ao setor financeiro)
	SELECT pe.p_nome, pe.sobrenome, pe.p_tipo,
	CASE
		WHEN pe.p_tipo = 'estagiario' THEN (SELECT SUM(valor_hora * horas_trabalhadas) FROM estagiario AS e WHERE pe.id_pessoa = e.id_pessoa) 
	 	WHEN pe.p_tipo = 'professor' THEN (SELECT SUM(valor_hora * horas_trabalhadas) FROM professor AS pr WHERE pe.id_pessoa = pr.id_pessoa) 
		WHEN pe.p_tipo = 'coordenador_pedagogico' THEN (SELECT salario FROM coordenador_pedagogico AS co WHERE pe.id_pessoa = co.id_pessoa)
		WHEN pe.p_tipo = 'funcionario' THEN (SELECT salario FROM funcionario AS f WHERE pe.id_pessoa = f.id_pessoa)
		END AS salario
	FROM pessoa AS pe 
	WHERE pe.p_tipo = 'estagiario' OR pe.p_tipo = 'professor' OR pe.p_tipo = 'coordenador_pedagogico' OR pe.p_tipo = 'funcionario';
	
SELECT * FROM informacoes_salario;

-- Verificar se a ideia é boa