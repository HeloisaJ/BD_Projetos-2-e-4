-- Questão 1
select atividade_extracurricular_id, count(*) from participa_extracurrilar
group by atividade_extracurricular_id;

-- Questão 2
select editora, count(*) from livros
group by editora;

-- Questão 3
select planos_de_pagamento_id, count(*) from define
group by planos_de_pagamento_id;