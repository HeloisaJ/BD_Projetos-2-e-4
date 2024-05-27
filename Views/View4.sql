CREATE OR REPLACE VIEW verificarSalas AS -- FUNCIONA, mostrar quais salas estão ocupadas ou não e por o que elas estão ocupadas
	SELECT s.nome, s.tipo, s.tamanho,
	CASE
		WHEN EXISTS (SELECT * FROM ocupa_reforco AS ocr WHERE s.nome = ocr.sala_nome) THEN 'aula reforço'
		WHEN EXISTS (SELECT * FROM ocupa_turma AS oct WHERE s.nome = oct.sala_nome) THEN 'turma'
		WHEN EXISTS (SELECT * FROM evento AS ev WHERE s.nome = ev.nome_sala) THEN 'evento'
		ELSE NULL
	END AS ocupada_por
	FROM sala AS s;
	
SELECT * FROM verificarSalas;

-- Ver se prefere null ou vazio