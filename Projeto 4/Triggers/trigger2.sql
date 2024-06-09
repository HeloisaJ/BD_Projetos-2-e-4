CREATE TRIGGER comprar_desconto
BEFORE INSERT ON comprar
FOR EACH ROW
BEGIN
    DECLARE participa_extracurrilar_count INT;
    SELECT COUNT(*) INTO participa_extracurrilar_count
    FROM participa_extracurricular
    WHERE aluno_num_matricula = (SELECT num_matricula FROM aluno WHERE id_pessoa = NEW.id_pessoa);
    
    IF participa_extracurrilar_count > 2 THEN
        SET NEW.custo_livro = NEW.custo_livro + (NEW.custo_livro * 0.3);
    END IF;
END;