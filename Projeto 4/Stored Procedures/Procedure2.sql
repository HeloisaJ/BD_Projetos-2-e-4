CREATE PROCEDURE total_emprestimos_data (IN mes VARCHAR(2), IN ano VARCHAR(4))
BEGIN
    SELECT COUNT(*) AS 'Total'
    FROM emprestimo 
    WHERE TO_CHAR(prazo_data_inicial, 'MM') = mes AND TO_CHAR(prazo_data_inicial, 'YYYY') = ano;
END;

CALL total_emprestimos_data('07', '2024');