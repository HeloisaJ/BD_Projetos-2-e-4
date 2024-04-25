-- Questão 1
select atividade_extracurricular_id, count(*) from participa_extracurrilar
group by atividade_extracurricular_id;

-- Questão 2
select editora, count(*) from livros
group by editora;

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