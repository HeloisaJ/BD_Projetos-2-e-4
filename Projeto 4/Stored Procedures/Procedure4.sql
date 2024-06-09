CREATE PROCEDURE parcerias_de_uma_secretaria (IN secretariaId INTEGER)
BEGIN
    SELECT editora_nome
    FROM parceria
    WHERE secretaria_id = secretariaId;
END;

CALL parcerias_de_uma_secretaria(1);