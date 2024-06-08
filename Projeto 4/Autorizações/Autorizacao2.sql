-- Criação da Role:

CREATE ROLE biblioteca;

GRANT SELECT ON informacoes_livros TO biblioteca;
GRANT INSERT, UPDATE, DELETE, SELECT ON livros TO biblioteca;
GRANT INSERT, UPDATE, DELETE, SELECT ON autor TO biblioteca;
GRANT INSERT, UPDATE, DELETE, SELECT ON editora TO biblioteca;
GRANT SELECT, UPDATE ON andar TO biblioteca;
GRANT SELECT ON secretaria TO biblioteca;

-- Talvez fosse uma boa criar um procedure ou um trigger para ao inserir um livro, conectar a tabela escreveu, publica e registra

-- Criação do User:

CREATE USER B1;

-- Associação do User a Role:

GRANT biblioteca TO B1;