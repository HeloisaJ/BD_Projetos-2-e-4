CREATE PROCEDURE alunos_abaixo_da_media (IN nomeDisciplina VARCHAR(500), IN valorSerie INTEGER)
BEGIN
    SELECT COUNT(*)
    FROM ligado
    WHERE disciplina_nome_disc = nomeDisciplina
    AND valorSerie = (SELECT serie FROM aluno WHERE num_matricula = aluno_num_matricula) 
    AND nota < 7;
END;

CALL alunos_abaixo_da_media('física', 7);