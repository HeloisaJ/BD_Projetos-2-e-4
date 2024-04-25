-- Questão 1
select atividade_extracurricular_id, count(*) from participa_extracurrilar
group by atividade_extracurricular_id;