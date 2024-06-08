-- Criação da Role:

CREATE ROLE setorFinanceiro;

GRANT SELECT ON informacoes_salario TO setorFinanceiro;
GRANT SELECT ON aluno TO setorFinanceiro;

-- GRANT SELECT ON total_arrecadado_por_pessoa TO setorFinanceiro; (quando funcionar)

-- Criação do User:

CREATE USER SF1;

-- Associação do User a Role:

GRANT setorFinanceiro TO SF1;