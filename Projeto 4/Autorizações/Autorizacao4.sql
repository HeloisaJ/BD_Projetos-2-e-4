-- Criação da Role:

CREATE ROLE coordenacao;

GRANT SELECT ON aluno TO coordenacao;
GRANT SELECT ON responsavel TO coordenacao;
GRANT SELECT ON aula_de_reforco TO coordenacao;
GRANT SELECT ON projeto_de_extensao TO coordenacao;
GRANT SELECT ON atividade_extracurricular TO coordenacao;

-- Criação do User:

CREATE USER C1;

-- Associação do User a Role:

GRANT coordenacao TO C1;