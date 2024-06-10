CREATE TRIGGER andar_update
BEFORE UPDATE ON andar
FOR EACH ROW
BEGIN
    IF NEW.quant_computadores < 0 OR NEW.quant_estantes < 0 OR NEW.quant_gabinete < 0 OR NEW.quanto_secoes < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot update to a negative value';
    END IF;
END;