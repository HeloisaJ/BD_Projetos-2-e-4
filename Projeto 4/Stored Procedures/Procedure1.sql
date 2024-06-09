CREATE PROCEDURE calculo_multa (IN idEmprestimo INTEGER)
BEGIN
    DECLARE vm DECIMAL(10, 2);
    DECLARE taxa DECIMAL(10, 2);
    DECLARE prazo DATE;
    DECLARE idMulta INTEGER;
    DECLARE total_multa DECIMAL(10, 2); 
    
    SELECT prazo_data_final, id_multa INTO prazo, idMulta FROM emprestimo WHERE idEmprestimo = id_emprestimo;
    SELECT valor_multa, taxa_multa INTO vm, taxa FROM multa WHERE idMulta = id_multa;

    IF prazo < CURDATE() THEN
        SET total_multa = vm + (DATEDIFF(CURDATE(), prazo) * taxa);
    ELSE
        SET total_multa = 0;
    END IF;

    SELECT total_multa AS 'Total Multa';
END;

CALL calculo_multa(6);