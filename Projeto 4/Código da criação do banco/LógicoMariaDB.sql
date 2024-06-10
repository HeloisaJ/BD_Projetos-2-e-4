CREATE TABLE estagiario (
    valor_hora DECIMAL(10, 2) NOT NULL,
    formacao VARCHAR(500),
    nome_uni VARCHAR(500),
    cpf VARCHAR(50) PRIMARY KEY,
    horas_trabalhadas INTEGER,
    id_pessoa INTEGER NOT NULL 
);

CREATE TABLE pessoa (
    p_nome VARCHAR(500) NOT NULL,
    sobrenome VARCHAR(500) NOT NULL,
    genero CHAR NOT NULL,
    p_tipo VARCHAR(50) NOT NULL,
    id_pessoa INTEGER auto_increment PRIMARY KEY,
    id_endereco INTEGER
);

CREATE TABLE endereco(
    rua VARCHAR(500),
    bairro VARCHAR(500),
    estado VARCHAR(500),
    cidade VARCHAR(500),
    numero INTEGER,
    id_endereco INTEGER auto_increment PRIMARY KEY
);

CREATE TABLE professor (
    valor_hora DECIMAL(10, 2) NOT NULL,
    formacao VARCHAR(500),
    cpf VARCHAR(50) PRIMARY KEY,
    horas_trabalhadas INTEGER,
    id_pessoa INTEGER NOT NULL
);

CREATE TABLE aluno (
    serie INTEGER NOT NULL,
    num_matricula INTEGER PRIMARY KEY,
    matricula_paga BOOLEAN NOT NULL,
    prazo_matricula DATE NOT NULL,
    forma_pag VARCHAR(500) NOT NULL,
    prazo_pag DATE NOT NULL,
    id_pessoa INTEGER NOT NULL,
    plano_pag VARCHAR(50)
);

CREATE TABLE pagamento_matricula(
    plano_pag VARCHAR(50) PRIMARY KEY,
    valor_pag_matricula DECIMAL(10, 2) NOT NULL
);

CREATE TABLE responsavel (
    cpf VARCHAR(50) PRIMARY KEY,
    email VARCHAR(500),
    resp_financeiro BOOLEAN NOT NULL,
    resp_pedagogico BOOLEAN NOT NULL,
    coordenador_pedagogico_cpf VARCHAR(50),
    id_pessoa INTEGER NOT NULL
);

CREATE TABLE coordenador_pedagogico (
    cpf VARCHAR(50) PRIMARY KEY,
    salario DECIMAL(10, 2) NOT NULL,
    segmento VARCHAR(500) NOT NULL,
    id_pessoa INTEGER NOT NULL
);

CREATE TABLE funcionario (
    cpf VARCHAR(50) PRIMARY KEY,
    funcao VARCHAR(500),
    salario DECIMAL(10, 2),
    secretaria_id INTEGER,
    id_pessoa INTEGER NOT NULL
);

CREATE TABLE turma (
    nome VARCHAR(500) PRIMARY KEY,
    quant_alunos INTEGER,
    turno VARCHAR(50)
);

CREATE TABLE sala (
    tamanho INTEGER NOT NULL,
    nome VARCHAR(50) PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE evento(
    nome_sala VARCHAR(50) NOT NULL,
    id_evento INTEGER auto_increment PRIMARY KEY,
    palestrante VARCHAR(500) NOT NULL,
    custo_realizacao DECIMAL(10, 2) NOT NULL,
    valor_ingresso DECIMAL(10, 2) NOT NULL,
    lucro DECIMAL(10, 2) NOT NULL,
    quant_ingressos_vendidos INTEGER NOT NULL,
    quant_pessoas_compareceram INTEGER NOT NULL,
    data_evento DATE
);

CREATE TABLE projeto_de_extensao (
    id_projeto INTEGER auto_increment PRIMARY KEY,
    online_ou_pres BOOLEAN NOT NULL,
    nome_projeto VARCHAR(500) NOT NULL,
    prazo_inscr DATE,
    professor_cpf VARCHAR(50)
);

CREATE TABLE atividade_extracurricular (
    id_atividade INTEGER auto_increment PRIMARY KEY,
    nome VARCHAR(500) NOT NULL,
    custo DECIMAL(10, 2) NOT NULL,
    professor_cpf VARCHAR(50)
);

CREATE TABLE preparatorio (
    id_preparatorio INTEGER auto_increment PRIMARY KEY,
    custo DECIMAL(10, 2)
);

CREATE TABLE aula_de_reforco (
    id_reforco INTEGER auto_increment PRIMARY KEY,
    assunto VARCHAR(500) NOT NULL,
    custo DECIMAL(10, 2) NOT NULL
);

CREATE TABLE disciplina (
    nome_disc VARCHAR(500) PRIMARY KEY,
    serie INTEGER
);

CREATE TABLE livros (
    id_livro INTEGER auto_increment PRIMARY KEY,
    raridade BOOLEAN,
    isbn VARCHAR(50) NOT NULL,
    titulo VARCHAR(500) NOT NULL,
    data_publicacao DATE,
    quantidade INTEGER,
    secao VARCHAR(500)
);

CREATE TABLE comprar(
    data_compra DATE NOT NULL,
    custo_livro DECIMAL(10, 2) NOT NULL,
    forma_pag VARCHAR(500) NOT NULL,
    id_pessoa INTEGER NOT NULL,
    livros_id INTEGER NOT NULL,
    id_compra INTEGER auto_increment PRIMARY KEY
);

CREATE TABLE autor (
    p_nome VARCHAR(500) NOT NULL,
    sobrenome VARCHAR(500) NOT NULL,
    data_morte DATE,
    data_nascimento DATE NOT NULL,
    id_autor INTEGER auto_increment PRIMARY KEY
);

CREATE TABLE editora (
    nome VARCHAR(500) PRIMARY KEY,
    telefone VARCHAR(500),
    email VARCHAR(500)
);

CREATE TABLE material_adicional (
    id_material INTEGER auto_increment PRIMARY KEY,
    tipo VARCHAR(500) NOT NULL,
    quantidade INTEGER
);

CREATE TABLE secretaria (
    id_secretaria INTEGER auto_increment PRIMARY KEY,
    contato VARCHAR(500),
    andar_numero INTEGER NOT NULL
);

CREATE TABLE andar (
    numero INTEGER PRIMARY KEY,
    quant_computadores INTEGER,
    quant_estantes INTEGER,
    quant_gabinete INTEGER,
    quanto_secoes INTEGER
);

CREATE TABLE horarios_projeto (
    horarios TIME,
    id_horarios VARCHAR(500) PRIMARY KEY,
    projeto_de_extensao_id INTEGER NOT NULL
);

CREATE TABLE horarios_extracurricular (
    horarios TIME,
    id_horarios VARCHAR(500) PRIMARY KEY,
    atividade_extracurricular_id INTEGER NOT NULL
);

CREATE TABLE horarios_preparatorio(
    horarios TIME,
    preparatorio_id INTEGER NOT NULL,
    id_horarios VARCHAR(500) PRIMARY KEY
);

CREATE TABLE horarios_reforco (
    horarios TIME,
    id_horarios VARCHAR(500) PRIMARY KEY,
    aula_reforco_id INTEGER NOT NULL 
);

CREATE TABLE depende (
    aluno_num_matricula INTEGER NOT NULL,
    responsavel_cpf VARCHAR(50) NOT NULL
);

CREATE TABLE faz_parte (
    turma_nome VARCHAR(500) NOT NULL,
    aluno_num_matricula INTEGER NOT NULL
);

CREATE TABLE participa_projeto (
    aluno_num_matricula INTEGER NOT NULL,
    projeto_de_extensao_id INTEGER NOT NULL
);

CREATE TABLE participa_extracurrilar (
    aluno_num_matricula INTEGER NOT NULL,
    atividade_extracurricular_id INTEGER NOT NULL
);

CREATE TABLE participa_preparatorio ( 
    preparatorio_id INTEGER,
    aluno_num_matricula INTEGER
);

CREATE TABLE participa_reforco (
    aluno_num_matricula INTEGER NOT NULL,
    aula_de_reforco INTEGER NOT NULL
);

CREATE TABLE ocupa_turma (
    sala_nome VARCHAR(500) NOT NULL,
    turma_nome VARCHAR(500) NOT NULL
);

CREATE TABLE ensina_aula_de_reforco (
    aula_reforco_id INTEGER NOT NULL,
    disciplina_nome_disc VARCHAR(500) NOT NULL,
    estagiario_cpf VARCHAR(50) NOT NULL
);

CREATE TABLE leciona_disciplina_turma (
    professor_cpf VARCHAR(50) NOT NULL,
    disciplina_nome_disc VARCHAR(500) NOT NULL,
    turma_nome VARCHAR(500) NOT NULL
);

CREATE TABLE leciona_preparatorio(
    preparatorio_id INTEGER NOT NULL,
    professor_cpf VARCHAR(50) NOT NULL
);

CREATE TABLE ocupa_reforco (
    sala_nome VARCHAR(50) NOT NULL,
    aula_reforco_id INTEGER NOT NULL
);

CREATE TABLE ligado (
    disciplina_nome_disc VARCHAR(500) NOT NULL,
    nota DECIMAL(10, 2) NOT NULL,
    aluno_num_matricula INTEGER NOT NULL
);

CREATE TABLE emprestimo (
    livros_id INTEGER NOT NULL,
    limite INTEGER,
    prazo_data_inicial DATE NOT NULL,
    prazo_data_final DATE,
    id_pessoa INTEGER NOT NULL,
    id_emprestimo INTEGER auto_increment PRIMARY KEY,
    id_multa INTEGER
);

CREATE TABLE multa (
    id_multa INTEGER auto_increment PRIMARY KEY,
    valor_multa DECIMAL(10, 2) NOT NULL,
    taxa_multa DECIMAL(10, 2) NOT NULL
);

CREATE TABLE escreveu (
    livros_id INTEGER NOT NULL,
    autor_id INTEGER NOT NULL
);

CREATE TABLE direitos (
    autor_id INTEGER NOT NULL,
    editora_nome VARCHAR(500) NOT NULL
);

CREATE TABLE publica (
    editora_nome VARCHAR(500) NOT NULL,
    livros_id INTEGER NOT NULL
);

CREATE TABLE possui_material (
    livros_id INTEGER NOT NULL,
    material_adicional_id INTEGER NOT NULL
);

CREATE TABLE parceria (
    secretaria_id INTEGER NOT NULL,
    editora_nome VARCHAR(500) NOT NULL
);

CREATE TABLE registra (
    secretaria_id INTEGER NOT NULL,
    livros_id INTEGER NOT NULL
);

CREATE TABLE esta_em (
    andar_numero INTEGER,
    livros_id INTEGER NOT NULL
);

ALTER TABLE pessoa ADD CONSTRAINT FK_pessoa
    FOREIGN KEY (id_endereco)
    REFERENCES endereco(id_endereco);

ALTER TABLE aluno ADD CONSTRAINT FK_aluno_1
    FOREIGN KEY (plano_pag)
    REFERENCES pagamento_matricula(plano_pag);

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
    FOREIGN KEY (secretaria_id)
    REFERENCES secretaria (id_secretaria);
 
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
 
ALTER TABLE horarios_projeto ADD CONSTRAINT FK_horarios_projeto_2
    FOREIGN KEY (projeto_de_extensao_id)
    REFERENCES projeto_de_extensao (id_projeto);
 
ALTER TABLE horarios_extracurricular ADD CONSTRAINT FK_horarios_extracurricular_2
    FOREIGN KEY (atividade_extracurricular_id)
    REFERENCES atividade_extracurricular (id_atividade);
 
ALTER TABLE horarios_reforco ADD CONSTRAINT FK_horarios_reforco_2
    FOREIGN KEY (aula_reforco_id)
    REFERENCES aula_de_reforco (id_reforco);
 
ALTER TABLE depende ADD CONSTRAINT FK_depende_1
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula)
    ON DELETE RESTRICT;
 
ALTER TABLE depende ADD CONSTRAINT FK_depende_2
    FOREIGN KEY (responsavel_cpf)
    REFERENCES responsavel (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE faz_parte ADD CONSTRAINT FK_faz_parte_1
    FOREIGN KEY (turma_nome)
    REFERENCES turma (nome)
    ON DELETE RESTRICT;
 
ALTER TABLE faz_parte ADD CONSTRAINT FK_faz_parte_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE participa_projeto ADD CONSTRAINT FK_participa_projeto_1
    FOREIGN KEY (projeto_de_extensao_id)
    REFERENCES projeto_de_extensao (id_projeto);
 
ALTER TABLE participa_projeto ADD CONSTRAINT FK_participa_projeto_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE participa_extracurrilar ADD CONSTRAINT FK_participa_extracurrilar_1
    FOREIGN KEY (atividade_extracurricular_id)
    REFERENCES atividade_extracurricular (id_atividade);
 
ALTER TABLE participa_extracurrilar ADD CONSTRAINT FK_participa_extracurrilar_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE participa_reforco ADD CONSTRAINT FK_participa_reforco_1
    FOREIGN KEY (aula_de_reforco)
    REFERENCES aula_de_reforco (id_reforco);
 
ALTER TABLE participa_reforco ADD CONSTRAINT FK_participa_reforco_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE ocupa_turma ADD CONSTRAINT FK_ocupa_turma_1
    FOREIGN KEY (sala_nome)
    REFERENCES sala (nome)
    ON DELETE RESTRICT;

ALTER TABLE evento ADD CONSTRAINT FK_evento_1
    FOREIGN KEY (nome_sala) 
    REFERENCES sala (nome);

ALTER TABLE ocupa_turma ADD CONSTRAINT FK_ocupa_turma_2
    FOREIGN KEY (turma_nome)
    REFERENCES turma (nome);
 
ALTER TABLE ensina_aula_de_reforco ADD CONSTRAINT FK_ensina_aula_de_reforco_1
    FOREIGN KEY (aula_reforco_id)
    REFERENCES aula_de_reforco (id_reforco)
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
    REFERENCES aula_de_reforco (id_reforco);
 
ALTER TABLE ligado ADD CONSTRAINT FK_ligado_1
    FOREIGN KEY (disciplina_nome_disc)
    REFERENCES disciplina (nome_disc)
    ON DELETE RESTRICT;
 
ALTER TABLE ligado ADD CONSTRAINT FK_ligado_2
    FOREIGN KEY (aluno_num_matricula)
    REFERENCES aluno (num_matricula);
 
ALTER TABLE emprestimo ADD CONSTRAINT FK_emprestimo_1
    FOREIGN KEY (livros_id)
    REFERENCES livros (id_livro);
 
ALTER TABLE emprestimo ADD CONSTRAINT FK_emprestimo_2
    FOREIGN KEY (id_pessoa)
    REFERENCES pessoa (id_pessoa);

ALTER TABLE emprestimo ADD CONSTRAINT FK_emprestimo_3
    FOREIGN KEY (id_multa)
    REFERENCES multa (id_multa);

ALTER TABLE comprar ADD CONSTRAINT FK_comprar_1
    FOREIGN KEY (livros_id) 
    REFERENCES livros (id_livro);

ALTER TABLE comprar ADD CONSTRAINT FK_comprar_2
    FOREIGN KEY (id_pessoa) 
    REFERENCES pessoa (id_pessoa);
 
ALTER TABLE escreveu ADD CONSTRAINT FK_escreveu_1
    FOREIGN KEY (livros_id)
    REFERENCES livros (id_livro)
    ON DELETE RESTRICT;
 
ALTER TABLE escreveu ADD CONSTRAINT FK_escreveu_2
    FOREIGN KEY (autor_id)
    REFERENCES autor (id_autor)
    ON DELETE RESTRICT;
 
ALTER TABLE direitos ADD CONSTRAINT FK_direitos_1
    FOREIGN KEY (autor_id)
    REFERENCES autor (id_autor)
    ON DELETE RESTRICT;
 
ALTER TABLE direitos ADD CONSTRAINT FK_direitos_2
    FOREIGN KEY (editora_nome)
    REFERENCES editora (nome);
 
ALTER TABLE publica ADD CONSTRAINT FK_publica_1
    FOREIGN KEY (editora_nome)
    REFERENCES editora (nome)
    ON DELETE RESTRICT;
 
ALTER TABLE publica ADD CONSTRAINT FK_publica_2
    FOREIGN KEY (livros_id)
    REFERENCES livros (id_livro);
 
ALTER TABLE possui_material ADD CONSTRAINT FK_possui_material_1
    FOREIGN KEY (livros_id)
    REFERENCES livros (id_livro);
 
ALTER TABLE possui_material ADD CONSTRAINT FK_possui_material_2
    FOREIGN KEY (material_adicional_id)
    REFERENCES material_adicional (id_material);
 
ALTER TABLE parceria ADD CONSTRAINT FK_parceria_1
    FOREIGN KEY (secretaria_id)
    REFERENCES secretaria (id_secretaria)
    ON DELETE RESTRICT;
 
ALTER TABLE parceria ADD CONSTRAINT FK_parceria_2
    FOREIGN KEY (editora_nome)
    REFERENCES editora (nome);
 
ALTER TABLE registra ADD CONSTRAINT FK_registra_1
    FOREIGN KEY (secretaria_id)
    REFERENCES secretaria (id_secretaria)
    ON DELETE RESTRICT;
 
ALTER TABLE registra ADD CONSTRAINT FK_registra_2
    FOREIGN KEY (livros_id)
    REFERENCES livros (id_livro);
 
ALTER TABLE esta_em ADD CONSTRAINT FK_esta_em_1
    FOREIGN KEY (andar_numero)
    REFERENCES andar (numero)
    ON DELETE RESTRICT;
 
ALTER TABLE esta_em ADD CONSTRAINT FK_esta_em_2
    FOREIGN KEY (livros_id)
    REFERENCES livros (id_livro);

ALTER TABLE horarios_preparatorio ADD CONSTRAINT FK_horarios_preparatorio
    FOREIGN KEY (preparatorio_id) 
    REFERENCES preparatorio (id_preparatorio);

ALTER TABLE participa_preparatorio ADD CONSTRAINT FK_participa_preparatorio_1
    FOREIGN KEY (preparatorio_id) 
    REFERENCES preparatorio (id_preparatorio);

ALTER TABLE participa_preparatorio ADD CONSTRAINT FK_participa_preparatorio_2
    FOREIGN KEY (aluno_num_matricula) 
    REFERENCES aluno (num_matricula);

ALTER TABLE leciona_preparatorio ADD CONSTRAINT FK_leciona_preparatorio_1
    FOREIGN KEY (preparatorio_id) 
    REFERENCES preparatorio (id_preparatorio);

ALTER TABLE leciona_preparatorio ADD CONSTRAINT FK_leciona_preparatorio_2
    FOREIGN KEY (professor_cpf) 
    REFERENCES professor (cpf);