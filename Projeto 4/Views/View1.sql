/*CREATE OR REPLACE VIEW total_arrecadado_por_pessoa AS -- Versão para postgreSQL, vê o total arrecadado por pessoa na escola
	SELECT
		p_nome, sobrenome, genero, p_tipo,
		(SELECT coalesce(SUM(valor_multa),0) FROM emprestimo WHERE pessoa.id_pessoa = emprestimo.id_pessoa) + 
		(SELECT coalesce(SUM(valor_pag_matricula),0) FROM aluno WHERE pessoa.id_pessoa = aluno.id_pessoa) + 
		(SELECT COALESCE(sum(total), 0) from (SELECT pe.*,(SELECT(sum(custo))
						from atividade_extracurricular as ae
						WHERE pe.atividade_extracurricular_id = ae.id_atividade) as total from participa_extracurrilar as pe JOIN aluno ON pe.aluno_num_matricula = aluno.num_matricula WHERE pessoa.id_pessoa = aluno.id_pessoa) AS q1) + 
		(SELECT COALESCE(sum(total), 0) from (SELECT pref.*, (SELECT(sum(custo))
						from aula_de_reforco as ar
						WHERE pref.aula_de_reforco = ar.id_reforco) as total from participa_reforco as pref JOIN aluno ON pref.aluno_num_matricula = aluno.num_matricula WHERE pessoa.id_pessoa = aluno.id_pessoa) AS q2) +
		(SELECT COALESCE(sum(total), 0) from (SELECT prefe.*, (SELECT(sum(custo))
						from preparatorio as pr
						WHERE prefe.preparatorio_id = pr.id_preparatorio) as total from participa_preparatorio as prefe JOIN aluno ON prefe.aluno_num_matricula = aluno.num_matricula WHERE pessoa.id_pessoa = aluno.id_pessoa) AS q3) +
		(SELECT COALESCE(SUM(custo_livro), 0) FROM comprar WHERE pessoa.id_pessoa = comprar.id_pessoa) as receita_bruta
	FROM pessoa;
		
SELECT * FROM total_arrecadado_por_pessoa;

*/

-- Versão do código acima adaptada para o MariaDB 

CREATE OR REPLACE VIEW total_multa AS
    SELECT id_pessoa, COALESCE(SUM(valor_multa), 0) AS total_multa
    FROM emprestimo
    GROUP BY id_pessoa;

CREATE OR REPLACE VIEW total_pag_matricula AS
    SELECT id_pessoa, COALESCE(SUM(valor_pag_matricula), 0) AS total_pag_matricula
    FROM aluno
    GROUP BY id_pessoa;

CREATE OR REPLACE VIEW total_atividade_extracurricular AS
    SELECT aluno.id_pessoa, COALESCE(SUM(ae.custo), 0) AS total_atividade_extracurricular
    FROM participa_extracurrilar pe
    JOIN aluno ON pe.aluno_num_matricula = aluno.num_matricula
    JOIN atividade_extracurricular ae ON pe.atividade_extracurricular_id = ae.id_atividade
    GROUP BY aluno.id_pessoa;

CREATE OR REPLACE VIEW total_aula_de_reforco AS
    SELECT aluno.id_pessoa, COALESCE(SUM(ar.custo), 0) AS total_aula_de_reforco
    FROM participa_reforco pref
    JOIN aluno ON pref.aluno_num_matricula = aluno.num_matricula
    JOIN aula_de_reforco ar ON pref.aula_de_reforco = ar.id_reforco
    GROUP BY aluno.id_pessoa;

CREATE OR REPLACE VIEW total_preparatorio AS
    SELECT aluno.id_pessoa, COALESCE(SUM(pr.custo), 0) AS total_preparatorio
    FROM participa_preparatorio prefe
    JOIN aluno ON prefe.aluno_num_matricula = aluno.num_matricula
    JOIN preparatorio pr ON prefe.preparatorio_id = pr.id_preparatorio
    GROUP BY aluno.id_pessoa;

CREATE OR REPLACE VIEW total_livro AS
    SELECT id_pessoa, COALESCE(SUM(custo_livro), 0) AS total_livro
    FROM comprar
    GROUP BY id_pessoa;
    
CREATE OR REPLACE VIEW total_arrecadado_por_pessoa AS
    SELECT
        p.id_pessoa,
        p.p_nome,
        p.sobrenome,
        p.genero,
        p.p_tipo,
        COALESCE(tm.total_multa, 0) +
        COALESCE(tpm.total_pag_matricula, 0) +
        COALESCE(tae.total_atividade_extracurricular, 0) +
        COALESCE(tar.total_aula_de_reforco, 0) +
        COALESCE(tp.total_preparatorio, 0) +
        COALESCE(tl.total_livro, 0) AS receita_bruta
    FROM
        pessoa p
        LEFT JOIN total_multa tm ON p.id_pessoa = tm.id_pessoa
        LEFT JOIN total_pag_matricula tpm ON p.id_pessoa = tpm.id_pessoa
        LEFT JOIN total_atividade_extracurricular tae ON p.id_pessoa = tae.id_pessoa
        LEFT JOIN total_aula_de_reforco tar ON p.id_pessoa = tar.id_pessoa
        LEFT JOIN total_preparatorio tp ON p.id_pessoa = tp.id_pessoa
        LEFT JOIN total_livro tl ON p.id_pessoa = tl.id_pessoa;