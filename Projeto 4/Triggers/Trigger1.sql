CREATE TRIGGER verificar_compra 
BEFORE INSERT ON comprar
FOR EACH ROW 
BEGIN -- Nem vai funcionar, não tem como jogar uma exception no MariaDB
    IF new.custo_livro < 0 THEN