# PROJETO 2 - BANCO DE DADOS
## EQUIPE
- Flávio Simões
- João Gabriel
- Pedro Benedito
- Heloísa Ferreira

## REQUISITOS MÍNIMOS
Foi implementado um banco de dados para o mapeamento de uma escola que apresenta uma biblioteca.

### Entidades 
- Pessoa    
- Aluno     
- Professor 
- Funcionário
- Autor      
- Livro      
- Material Adicional 
- Secretaria 
- Editora    
- Andar      
- Responsável 
- Coordenador pedagógico
- Projeto de extensão 
- Estagiário
- Atividade extracurricular
- Matrícula
- Aula de reforço
- Disciplina
- Turma 
- Sala

### Modelagem Relacional
Um modelo conceitual foi produzido com a ferramenta BrModelo e convertido para
modelo lógico, utilizando o mesmo. Foram realizadas correções no modelo lógico gerado 
pelo BrModelo. 

### DDL
DDL (Data Definition Language) é uma sub-linguagem da linguagem de banco de dados SQL 
(Structured Query Language)
que permite definir tabelas e os elementos pertencentes às tabelas. O código DDL 
foi gerado pelo BrModelo, correções no código foram realizadas.
O código DDL está no arquivo Lógico_1.sql.

### DML
A DML (Data Monipulation Language) é utilizada para para adição, remoção e edição
de dados em uma tabela. O código DML foi escrito utilizando a ferramenta sqliteonline,
disponível em: https://sqliteonline.com/. O código DML está no arquivo DMl.sql.

### 5 perguntas baseadas no SGBD

- <strong>Quais atividades extracurriculares são mais procuradas ?</strong>

A partir disso, pode ser realizada uma análise para determinar como a escola pode lucrar mais de acordo com as atividades extracurriculares mais populares.

- <strong>Quais são as editoras que apresentam os livros mais populares ?</strong>

Com base nessas informações, a EducaLivros pode determinar com mais precisão, quais são as melhores editoras para se manter uma parceria. 

- <strong>Qual o plano de pagamento mais popular ?</strong>

Com base nessas informações, pode ser realizada uma estratégia de marketing para o estimulo de uma determinada forma de pagamento. Por exemplo, poderia ser estimulado o plano de pagamento anual, com o objetivo de evitar a evasão de alunos.

- <strong>Quais são as atividades extracurriculares menos populares, mas que apresentam maior custo ?</strong>

A partir desses dados, a EducaLivros pode analisar qual a melhor alternativa para o futuro dessa atividade extracurrilar, se o ideal seria cancelar essa atividade, ou se deveria investir em uma estratégia de marketing para estimular a adesão a atividade.

- <strong>Qual o total arrecadado pela escola ? E qual a receita média por aluno ?</strong>

Esses dados podem ser utilizados para avaliar o balanço financeiro da escola, pois a partir desses dados, pode ser definido a alocação de recursos para a melhoria do funcionamento da escola. 

### Easter Egg

Tentar estimular os alunos a participarem de projetos de extensão. Se o projeto resultar em um benefício financeiro ou social a comunidade, os alunos desse projeto receberiam um desconto na matrícula, de acordo com o plano de pagamento.

## REQUISITOS ADICIONAIS

###  DQL

DQL (Data Query Language) é uma sublinguagem da linguagem SQL para consulta de dados em tabelas.
As perguntas baseadas no SGBD possuem códigos DQL que respondem elas. O código DQL está no arquivo DQL.sql.

# Projeto 4

## Informações importantes !

Decidimos mudar de PostgreSQL para MariaDB.

## Views

Foram adicionadas 4 Views ao banco de dados:

- totalArrecadadoPorPessoa: Permite visualizar o total arrecadado por pessoa pela EducaLivros.

- informacoesLivros: Permite ver todos os dados de um livro, incluindo autor e editora. Além disso, ele permite ver a quantidade de vezes que um livro foi emprestado ou comprado.

- informacoesSalario: Mostra o nome, o sobrenome, o tipo de funcionário (se é um estagiário, professor, funcionário ou um coordenador) e o seu respectivo salário.

- verificarSalas: Mostra todas as salas e se elas estão ocupadas por um evento, uma aula reforço, uma turma ou se estão vazias no momento.

## Segurança

Foram adicionadas 4 roles para garantir restrições de acesso aos dados do banco:

- Setor financeiro: Dar acesso as informações dos salários dos funcionários da escola e lista dos alunos com as informações de pagamento da matrícula.

- Biblioteca: Permitir que os funcionários da biblioteca somente tenham acesso a parte do banco correspondente a biblioteca, incluindo: livros, editoras, autores, secretarias, entre outros dados.

- Gestão: Permitir acesso as salas, as parcerias da escola com as editoras e as informações dos salários dos funcionários da escola.

- Coordenação: Garantir que os coordenadores tenham acesso as informações dos aluno e do responsáveis, além de ter acesso a lista de aulas de reforço, projetos de extensão e atividades extracurriculares.

## Normalização

Para garantir que o banco de dados estivesse de acordo com a Terceira Forma Normal (3NF) foram realizadas as seguintes modificações:

- Foi retirado o campo editora da tabela livros, pois já estava presente na tabela editora e poderia causar inconsistências ao banco.

- Foram retirados os campos limite_inf e limite_sup da tabela faz_parte, pois estavam muito repetitivos.

## Modificações no Banco de Dados

- Adição do campo de quantidade de horas trabalhadas nas tabelas professor e estagiário. Esses campos foram adicionados para permitir o cálculo do salário dos professores e dos estagiários.

# Imagens

![](/Imagens/Imagem_Lógico.png)

![](/Imagens/Imagem_DQL.png)