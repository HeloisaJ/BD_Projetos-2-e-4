/* L�gico_1: */

CREATE TABLE estagiario (
    valor_hora DECIMAL,
    formacao VARCHAR,
    nome_uni VARCHAR,
    cpf VARCHAR PRIMARY KEY,
    id_pessoa INTEGER
);

CREATE TABLE pessoa (
    p_nome VARCHAR,
    sobrenome VARCHAR,
    genero CHAR,
    rua VARCHAR,
    bairro VARCHAR,
    estado VARCHAR,
    cidade VARCHAR,
    numero INTEGER,
    p_tipo VARCHAR,
    id_pessoa BIGSERIAL PRIMARY KEY
);

CREATE TABLE professor (
    valor_hora DECIMAL,
    formacao VARCHAR,
    cpf VARCHAR PRIMARY KEY,
    id_pessoa INTEGER
);

CREATE TABLE aluno (
    serie INTEGER,
    num_matricula INTEGER PRIMARY KEY,
    matricula_paga BOOLEAN,
    prazo_matricula DATE,
    valor_pag_matricula DECIMAL,
    id_pessoa INTEGER
);

CREATE TABLE responsavel (
    cpf VARCHAR PRIMARY KEY,
    email VARCHAR,
    resp_financeiro BOOLEAN,
    resp_pedagogico BOOLEAN,
    coordenador_pedagogico_cpf VARCHAR,
    id_pessoa INTEGER
);

CREATE TABLE coordenador_pedagogico (
    cpf VARCHAR PRIMARY KEY,
    salario DECIMAL,
    id_pessoa INTEGER
);

CREATE TABLE funcionario (
    cpf VARCHAR PRIMARY KEY,
    funcao VARCHAR,
    salario DECIMAL,
    secretaria_numero INTEGER,
    id_pessoa INTEGER
);

CREATE TABLE planos_de_pagamento (
    id INTEGER PRIMARY KEY,
    prazo DATE,
    valor_mensal BOOLEAN,
    valor_semes BOOLEAN,
    valor_anual BOOLEAN,
    forma_pag VARCHAR
);

CREATE TABLE turma (
    nome VARCHAR PRIMARY KEY,
    quant_alunos INTEGER,
    turno VARCHAR
);

CREATE TABLE sala (
    tamanho INTEGER,
    nome VARCHAR PRIMARY KEY,
    tipo VARCHAR
);

CREATE TABLE projeto_de_extensao (
    id INTEGER PRIMARY KEY,
    online_ou_pres BOOLEAN,
    nome_projeto VARCHAR,
    prazo_inscr DATE,
    professor_cpf VARCHAR
);

CREATE TABLE atividade_extracurricular (
    id INTEGER PRIMARY KEY,
    nome VARCHAR,
    custo DECIMAL,
    professor_cpf VARCHAR
);

CREATE TABLE aula_de_reforco (
    id INTEGER PRIMARY KEY
);

CREATE TABLE disciplina (
    nome_disc VARCHAR PRIMARY KEY,
    serie INTEGER
);

CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    raridade VARCHAR,
    isbn VARCHAR,
    disponibilidade BOOLEAN,
    titulo VARCHAR,
    data_publicacao DATE,
    editora VARCHAR,
    quantidade INTEGER,
    secao VARCHAR
);

CREATE TABLE autor (
    p_nome VARCHAR,
    sobrenome VARCHAR,
    data_morte DATE,
    data_nascimento DATE,
    id INTEGER PRIMARY KEY
);

CREATE TABLE editora (
    nome VARCHAR PRIMARY KEY,
    telefone VARCHAR,
    email VARCHAR
);

CREATE TABLE material_adicional (
    id INTEGER PRIMARY KEY,
    tipo INTEGER,
    quantidade INTEGER,
    disponibilidade BOOLEAN
);

CREATE TABLE secretaria (
    numero INTEGER PRIMARY KEY,
    contato VARCHAR,
    andar_numero INTEGER
);

CREATE TABLE andar (
    numero INTEGER PRIMARY KEY,
    quant_computadores INTEGER,
    quant_estantes INTEGER,
    quant_gabinete INTEGER,
    quanto_secoes INTEGER
);

CREATE TABLE nome_series (
    nome_series VARCHAR,
    coordenador_pedagogico_cpf VARCHAR PRIMARY KEY
);

CREATE TABLE horarios_projeto (
    horarios TIME,
    projeto_de_extensao_id INTEGER PRIMARY KEY
);

CREATE TABLE horarios_extracurricular (
    horarios TIME,
    atividade_extracurricular_id INTEGER PRIMARY KEY
);

CREATE TABLE horarios_reforco (
    horarios TIME,
    aula_reforco_id INTEGER PRIMARY KEY
);

CREATE TABLE depende (
    aluno_num_matricula INTEGER,
    responsavel_cpf VARCHAR
);

CREATE TABLE define (
    planos_de_pagamento_id INTEGER,
    aluno_num_matricula INTEGER
);

CREATE TABLE faz_parte (
    turma_nome VARCHAR,
    aluno_num_matricula INTEGER,
    limite_sup INTEGER,
    limite_inf INTEGER
);

CREATE TABLE participa_projeto (
    aluno_num_matricula INTEGER,
    projeto_de_extensao_id INTEGER
);

CREATE TABLE participa_extracurrilar (
    aluno_num_matricula INTEGER,
    atividade_extracurricular_id INTEGER
);

CREATE TABLE participa_reforco (
    aluno_num_matricula INTEGER,
    aula_de_reforco INTEGER
);

CREATE TABLE ocupa_turma (
    sala_nome VARCHAR,
    turma_nome VARCHAR,
    sala_ocup BOOLEAN
);

CREATE TABLE ensina_aula_de_reforco (
    aula_reforco_id INTEGER,
    disciplina_nome_disc VARCHAR,
    estagiario_cpf VARCHAR
);

CREATE TABLE leciona_disciplina_turma (
    professor_cpf VARCHAR,
    disciplina_nome_disc VARCHAR,
    turma_nome VARCHAR
);

CREATE TABLE ocupa_reforco (
    sala_nome VARCHAR,
    aula_reforco_id INTEGER,
    sala_ocup BOOLEAN
);

CREATE TABLE ligado (
    disciplina_nome_disc VARCHAR,
    nota DECIMAL,
    aluno_num_matricula INTEGER
);

CREATE TABLE emprestimo (
    livros_id INTEGER,
    valor DECIMAL,
    data DATE,
    taxa DECIMAL,
    limite INTEGER,
    prazo_data_inicial DATE,
    prazo_data_final DATE,
    id_pessoa INTEGER
);

CREATE TABLE escreveu (
    livros_id INTEGER,
    autor_id INTEGER
);

CREATE TABLE direitos (
    autor_id INTEGER,
    editora_nome VARCHAR
);

CREATE TABLE publica (
    editora_nome VARCHAR,
    livros_id INTEGER
);

CREATE TABLE possui_material (
    livros_id INTEGER,
    material_adicional_id INTEGER
);

CREATE TABLE parceria (
    secretaria_numero INTEGER,
    editora_nome VARCHAR
);

CREATE TABLE registra (
    secretaria_numero INTEGER,
    livros_id INTEGER
);

CREATE TABLE esta_em (
    andar_numero INTEGER,
    livros_id INTEGER
);
 
ALTER TABLE estagiario ADD CONSTRAINT FK_estagiario_2
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa (id_pessoa);
 
ALTER TABLE professor ADD CONSTRAINT FK_professor_2
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa (id_pessoa);
 
ALTER TABLE aluno ADD CONSTRAINT FK_aluno_2
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa (id_pessoa);
 
ALTER TABLE responsavel ADD CONSTRAINT FK_responsavel_2
    FOREIGN KEY (coordenador_pedagogico_cpf)
    REFERENCES coordenador_pedagogico (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE responsavel ADD CONSTRAINT FK_responsavel_3
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa (id_pessoa);
 
ALTER TABLE coordenador_pedagogico ADD CONSTRAINT FK_coordenador_pedagogico_2
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa (id_pessoa);
 
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_2
    FOREIGN KEY (secretaria_numero)
    REFERENCES secretaria (numero);
 
ALTER TABLE funcionario ADD CONSTRAINT FK_funcionario_3
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa (id_pessoa);
 
ALTER TABLE projeto_de_extensao ADD CONSTRAINT FK_projeto_de_extensao_2
    FOREIGN KEY (professor_cpf)
    REFERENCES professor (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE atividade_extracurricular ADD CONSTRAINT FK_atividade_extracurricular_2
    FOREIGN KEY (professor_cpf)
    REFERENCES professor (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE secretaria ADD CONSTRAINT FK_secretaria_2
    FOREIGN KEY (andar_numero)
    REFERENCES andar (numero)
    ON DELETE RESTRICT;
 
ALTER TABLE nome_series ADD CONSTRAINT FK_nome_series_2
    FOREIGN KEY (coordenador_pedagogico_cpf)
    REFERENCES coordenador_pedagogico (cpf);
 
ALTER TABLE horarios_projeto ADD CONSTRAINT FK_horarios_projeto_2
    FOREIGN KEY (projeto_de_extensao_id)
    REFERENCES projeto_de_extensao (id);
 
ALTER TABLE horarios_extracurricular ADD CONSTRAINT FK_horarios_extracurricular_2
    FOREIGN KEY (atividade_extracurricular_id)
    REFERENCES atividade_extracurricular (id);
 
ALTER TABLE horarios_reforco ADD CONSTRAINT FK_horarios_reforco_2
    FOREIGN KEY (aula_reforco_id)
    REFERENCES aula_de_reforco (id);
 
ALTER TABLE depende ADD CONSTRAINT FK_depende_1
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula)
    ON DELETE RESTRICT;
 
ALTER TABLE depende ADD CONSTRAINT FK_depende_2
    FOREIGN KEY (responsavel_cpf)
    REFERENCES responsavel (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE define ADD CONSTRAINT FK_define_1
    FOREIGN KEY (planos_de_pagamento_id)
    REFERENCES planos_de_pagamento (id)
    ON DELETE RESTRICT;
 
ALTER TABLE define ADD CONSTRAINT FK_define_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE faz_parte ADD CONSTRAINT FK_faz_parte_1
    FOREIGN KEY (turma_nome)
    REFERENCES turma (nome)
    ON DELETE RESTRICT;
 
ALTER TABLE faz_parte ADD CONSTRAINT FK_faz_parte_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE participa_projeto ADD CONSTRAINT FK_participa_projeto_1
    FOREIGN KEY (projeto_de_extensao_id)
    REFERENCES projeto_de_extensao (id)
    ON DELETE SET NULL;
 
ALTER TABLE participa_projeto ADD CONSTRAINT FK_participa_projeto_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE participa_extracurrilar ADD CONSTRAINT FK_participa_extracurrilar_1
    FOREIGN KEY (atividade_extracurricular_id)
    REFERENCES atividade_extracurricular (id)
    ON DELETE SET NULL;
 
ALTER TABLE participa_extracurrilar ADD CONSTRAINT FK_participa_extracurrilar_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE participa_reforco ADD CONSTRAINT FK_participa_reforco_1
    FOREIGN KEY (aula_de_reforco)
    REFERENCES aula_de_reforco (id)
    ON DELETE SET NULL;
 
ALTER TABLE participa_reforco ADD CONSTRAINT FK_participa_reforco_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE ocupa_turma ADD CONSTRAINT FK_ocupa_turma_1
    FOREIGN KEY (sala_nome)
    REFERENCES sala (nome)
    ON DELETE RESTRICT;
 
ALTER TABLE ocupa_turma ADD CONSTRAINT FK_ocupa_turma_2
    FOREIGN KEY (turma_nome)
    REFERENCES turma (nome)
    ON DELETE SET NULL;
 
ALTER TABLE ensina_aula_de_reforco ADD CONSTRAINT FK_ensina_aula_de_reforco_1
    FOREIGN KEY (aula_reforco_id)
    REFERENCES aula_de_reforco (id)
    ON DELETE NO ACTION;
 
ALTER TABLE ensina_aula_de_reforco ADD CONSTRAINT FK_ensina_aula_de_reforco_2
    FOREIGN KEY (disciplina_nome_disc)
    REFERENCES disciplina (nome_disc)
    ON DELETE RESTRICT;
 
ALTER TABLE ensina_aula_de_reforco ADD CONSTRAINT FK_ensina_aula_de_reforco_3
    FOREIGN KEY (estagiario_cpf)
    REFERENCES estagiario (cpf)
    ON DELETE NO ACTION;
 
ALTER TABLE leciona_disciplina_turma ADD CONSTRAINT FK_leciona_disciplina_turma_1
    FOREIGN KEY (professor_cpf)
    REFERENCES professor (cpf)
    ON DELETE NO ACTION;
 
ALTER TABLE leciona_disciplina_turma ADD CONSTRAINT FK_leciona_disciplina_turma_2
    FOREIGN KEY (disciplina_nome_disc)
    REFERENCES disciplina (nome_disc)
    ON DELETE NO ACTION;
 
ALTER TABLE leciona_disciplina_turma ADD CONSTRAINT FK_leciona_disciplina_turma_3
    FOREIGN KEY (turma_nome)
    REFERENCES turma (nome)
    ON DELETE NO ACTION;
 
ALTER TABLE ocupa_reforco ADD CONSTRAINT FK_ocupa_reforco_1
    FOREIGN KEY (sala_nome)
    REFERENCES sala (nome)
    ON DELETE RESTRICT;
 
ALTER TABLE ocupa_reforco ADD CONSTRAINT FK_ocupa_reforco_2
    FOREIGN KEY (aula_reforco_id)
    REFERENCES aula_de_reforco (id)
    ON DELETE SET NULL;
 
ALTER TABLE ligado ADD CONSTRAINT FK_ligado_1
    FOREIGN KEY (disciplina_nome_disc)
    REFERENCES disciplina (nome_disc)
    ON DELETE RESTRICT;
 
ALTER TABLE ligado ADD CONSTRAINT FK_ligado_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE emprestimo ADD CONSTRAINT FK_emprestimo_1
    FOREIGN KEY (livros_id)
    REFERENCES livros (id)
    ON DELETE SET NULL;
 
ALTER TABLE emprestimo ADD CONSTRAINT FK_emprestimo_2
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa (id_pessoa);
 
ALTER TABLE escreveu ADD CONSTRAINT FK_escreveu_1
    FOREIGN KEY (livros_id)
    REFERENCES livros (id)
    ON DELETE RESTRICT;
 
ALTER TABLE escreveu ADD CONSTRAINT FK_escreveu_2
    FOREIGN KEY (autor_id)
    REFERENCES autor (id)
    ON DELETE RESTRICT;
 
ALTER TABLE direitos ADD CONSTRAINT FK_direitos_1
    FOREIGN KEY (autor_id)
    REFERENCES autor (id)
    ON DELETE RESTRICT;
 
ALTER TABLE direitos ADD CONSTRAINT FK_direitos_2
    FOREIGN KEY (editora_nome)
    REFERENCES editora (nome)
    ON DELETE SET NULL;
 
ALTER TABLE publica ADD CONSTRAINT FK_publica_1
    FOREIGN KEY (editora_nome)
    REFERENCES editora (nome)
    ON DELETE RESTRICT;
 
ALTER TABLE publica ADD CONSTRAINT FK_publica_2
    FOREIGN KEY (livros_id)
    REFERENCES livros (id)
    ON DELETE SET NULL;
 
ALTER TABLE possui_material ADD CONSTRAINT FK_possui_material_1
    FOREIGN KEY (livros_id)
    REFERENCES livros (id)
    ON DELETE SET NULL;
 
ALTER TABLE possui_material ADD CONSTRAINT FK_possui_material_2
    FOREIGN KEY (material_adicional_id)
    REFERENCES material_adicional (id)
    ON DELETE SET NULL;
 
ALTER TABLE parceria ADD CONSTRAINT FK_parceria_1
    FOREIGN KEY (secretaria_numero)
    REFERENCES secretaria (numero)
    ON DELETE RESTRICT;
 
ALTER TABLE parceria ADD CONSTRAINT FK_parceria_2
    FOREIGN KEY (editora_nome)
    REFERENCES editora (nome)
    ON DELETE SET NULL;
 
ALTER TABLE registra ADD CONSTRAINT FK_registra_1
    FOREIGN KEY (secretaria_numero)
    REFERENCES secretaria (numero)
    ON DELETE RESTRICT;
 
ALTER TABLE registra ADD CONSTRAINT FK_registra_2
    FOREIGN KEY (livros_id)
    REFERENCES livros (id)
    ON DELETE SET NULL;
 
ALTER TABLE esta_em ADD CONSTRAINT FK_esta_em_1
    FOREIGN KEY (andar_numero)
    REFERENCES andar (numero)
    ON DELETE RESTRICT;
 
ALTER TABLE esta_em ADD CONSTRAINT FK_esta_em_2
    FOREIGN KEY (livros_id)
    REFERENCES livros (id)
    ON DELETE SET NULL;