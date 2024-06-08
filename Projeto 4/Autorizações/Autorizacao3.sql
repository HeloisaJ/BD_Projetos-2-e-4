-- Criação da Role:

CREATE ROLE gestao; -- Diretor

GRANT SELECT ON verificar_salas TO gestao;
GRANT SELECT, INSERT, DELETE ON parceria TO gestao;
GRANT SELECT ON informacoes_salario TO gestao;

-- Criação do User:

CREATE USER G1;

-- Associação do User a Role:

GRANT gestao TO G1;