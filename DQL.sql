-- Questão 1
select atividade_extracurricular_id, count(*) from participa_extracurrilar
group by atividade_extracurricular_id;

-- Questão 2
SELECT e.nome AS editora, COUNT(l.id_livro) AS quantidade_emprestada
FROM editora e
INNER JOIN publica p ON e.nome = p.editora_nome
INNER JOIN livros l ON p.livros_id = l.id_livro
INNER JOIN emprestimo em ON l.id_livro = em.livros_id
GROUP BY e.nome
ORDER BY quantidade_emprestada DESC;

-- Questão 3
select planos_de_pagamento_id, count(*) from define
group by planos_de_pagamento_id limit 1;

--Questão 4 
SELECT ae.nome, ae.custo, COUNT(pe.aluno_num_matricula) AS total_participantes
FROM atividade_extracurricular ae
LEFT JOIN participa_extracurrilar pe ON ae.id_atividade = pe.atividade_extracurricular_id
GROUP BY ae.nome, ae.custo
ORDER BY total_participantes ASC, ae.custo DESC;
--se quiser apenas um colocar no final " limit 1" vai aparecer a  
--atividade extra curricular mais cara e menos popular

--Questão 5
--Pergunta 1
SELECT 
	(SELECT coalesce(SUM(valor_multa),0) FROM emprestimo) + 
    (SELECT coalesce(SUM(valor_pag_matricula),0) FROM aluno) + 
    (SELECT COALESCE(sum(total), 0) from (SELECT pe.*,(SELECT(sum(custo))
   					from atividade_extracurricular as ae
   					WHERE pe.atividade_extracurricular_id = ae.id_atividade) as total from participa_extracurrilar as pe)) + 
    (SELECT COALESCE(sum(total), 0) from (SELECT pref.*, (SELECT(sum(custo))
   					from aula_de_reforco as ar
   					WHERE pref.aula_de_reforco = ar.id_reforco) as total from participa_reforco as pref)) as receita_bruta

--Pergunta 2