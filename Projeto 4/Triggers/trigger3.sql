CREATE TRIGGER livro_update
BEFORE UPDATE ON livros
FOR EACH ROW
BEGIN
    IF NEW.quantidade < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot update quantidade to a negative value';
    END IF;
END;