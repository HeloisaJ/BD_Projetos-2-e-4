# AVISO

Este é um projeto que eu e meus colegas fizemos para a disciplina de banco de dados 1, que tinha como objetivo formular um banco de dados para uma escola livraria, este repositório contém as duas partes do projeto original (2 e 4), sendo o segundo um aprimoramento do primeiro. Este é um fork do projeto original, caso queira ver mais informações sobre os outros membros do grupo, acesse o link abaixo do nome do repositório.

# MINHA PARTICIPAÇÃO NESTE PROJETO

Fui responsável pela criação do modelo conceitual do banco de dados referente a escola, ajustes do diagrama lógico e criação de parte do código do DQL, na primeira parte do projeto. Na segunda parte do projeto fiquei responsável pelas autorizações, views, stored procedures, adaptação do banco de dados para o MariaDB e um trigger.

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

# Imagens

![](/Imagens/Imagem_Lógico.png)

![](/Imagens/Imagem_DQL.png)
