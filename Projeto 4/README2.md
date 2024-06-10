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

Para garantir que o banco de dados estivesse de acordo com a 3 formas normais foram realizadas as seguintes modificações:

- Foi retirado o campo editora da tabela livros, pois já estava presente na tabela editora e poderia causar inconsistências ao banco.

- Foram retirados os campos limite_inf e limite_sup da tabela faz_parte, pois estavam muito repetitivos.

- Foi adicionada uma chave primária à tabela empréstimo e a comprar, para assim permitir a adição de mais de um registro de uma compra de um usuário para um livro. 

- Houve a retirada dos dados plano de pagamento e valor a pagar da matrícula da tabela aluno, para a formação de uma nova tabela só para planos de pagamento, pois esses dados não estavam direcionados diretamente.

- Retirada dos dados valor da multa e taxa da multa da tabela empréstimo para a formação de uma nova tabela só para multas, pois esses dados não estavam direcionados diretamente.

- Retirado dos dados de endereço da tabela pessoa para a formação de uma nova tabela só para endereço, pois esses dados não estavam direcionados diretamente.

## Triggers

Foram criados 4 triggers:

- Verificar se o custo do livro na compra é valido e atualiza o estoque dos livros.

- Um trigger que oferece 70% de desconto em livros caso o aluno participe de duas ou mais atividades extracurriculares.

- Um trigger para verificar se a quantidade de livros em uma atualização de estoque é válida ou não.

- Um trigger para verificar em uma atualização dos dados de um andar da biblioteca se os valores de quantidade de computadores, estantes, seções e gabinetes são válidos.

## Stored Procedures

Foram criados 4 stored procedures para:

- Calcular o valor total da multa de um empréstimo atrasado.

- Calcular o total de empréstimos que ocorreram em um determinado mês e ano.

- Contar a quantidade de alunos de uma determinada disciplina e série com nota abaixo da média. Assim é possível saber qual disciplina precisa de mais aulas de reforço.

- Mostrar todas as editoras que tem uma parceria com uma secretaria específica.

## CRUD

## Modificações no Banco de Dados

- Adição do campo de quantidade de horas trabalhadas nas tabelas professor e estagiário. Esses campos foram adicionados para permitir o cálculo do salário dos professores e dos estagiários.