CREATE TRIGGER verificar_compra 
BEFORE INSERT ON comprar
FOR EACH ROW 
BEGIN
    IF NEW.custo_livro > 0 THEN
        UPDATE livros SET quantidade = quantidade-1
        WHERE id_livro = NEW.livros_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot sell a book with negative value';
    END IF;
END;
