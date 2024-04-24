insert into pessoa values
('Heloísa', 'Fernanda', 'F', 'rua da rua', 'bairro da rua', 'estado do bairro', 'cidade do estado', '123', 'aluno'),
('Flávio', 'Henrique', 'M', 'num sei', 'tmb num sei', 'Unaited Isteitis', 'Nel Iorki', '321', 'aluno'),
('Pedro', 'Benedito', 'M', 'a', 'b', 'c', 'd', '123456', 'aluno'),
('João', 'Gabriel', 'M', 'd', 'c', 'b', 'a', '758439', 'aluno'),
('Lucas', 'Rodolfo', 'M', 'merecem nota 10', 'concordo', 'estudam demais', 'tenho que passar eles', '987654321', 'professor'),
('Mínimo', 'Taligado', 'M', 'oxe', 'aaaa', 'abcdef', 'oof', '928475829', 'professor'),
('Sheldon', 'Cooper', 'M', 'esse é meu lugar', 'sem ideia', 'sem ideia tambem', 'no idea', '766251592', 'professor'),
('Pai de Heloísa', 'num sei o sobrenome', 'M', 'rua tal', 'no bairro tal', 'no estado tal', 'na cidade tal', '9289182486', 'responsavel'),
('Pai de Flávio', 'num sei o sobrenome', 'M', 'rua tal', 'no bairro tal', 'no estado tal', 'na cidade tal', '3456789', 'responsavel'),
('Pai de Benedito', 'num sei o sobrenome', 'M', 'rua tal', 'no bairro tal', 'no estado tal', 'na cidade tal', '209876', 'responsavel'),
('Pai de João', 'num sei o sobrenome', 'M', 'rua tal', 'no bairro tal', 'no estado tal', 'na cidade tal', '8765432', 'responsavel'),
('Maria', 'Hosana', 'F', 'a', 'b', 'c', 'd', '75456789', 'funcionario'),
(':0', 'surpreso', 'M', 'a', 'b', 'c', 'd', '201048', 'funcionario'),
('Enzo', 'Raivoso', 'M', 'a', 'b', 'c', 'd', '30289402', 'funcionario'),
('tiste', 'num quero estagiar', 'M', 'a', 'b', 'c', 'd', '284832', 'estagiario'),
('Teresa', 'De num sei', 'F', 'a', 'b', 'c', 'd', '0192934', 'estagiario'),
('Branca', 'de Neve', 'F', 'a', 'b', 'c', 'd', '87234', 'estagiario'),
('Alvus', 'Dumbledore', 'F', 'a', 'b', 'c', 'd', '754', 'coordenador_pedagogico');


insert into aluno values
('7', '39487', 'false', '2024-05-20', '1000', '1'),
('1', '39488', 'true', '2024-07-30', '1000', '3'),
('8', '39489', 'true', '2024-03-15', '1000', '2'),
('5', '39490', 'false', '2024-09-10', '1000', '4');

insert into professor values
('50', 'banco de dados', '123.456.789-10', '5'),
('50', 'matematica', '652.000.223-15', '6'),
('50', 'física', '018.183.198-07', '7');

insert into responsavel values
('029.391.193-10', 'seila@gmail.com', 'false', 'true', '000.109.122-99', '8'),
('607.860.130-01', 'seila@gmail.com', 'true', 'true', '000.109.122-99', '9'),
('246.901.250-31', 'seila@gmail.com', 'true', 'false', '000.109.122-99', '10'),
('458.964.690-04', 'seila@gmail.com', 'true', 'false', '000.109.122-99', '11');

insert into funcionario values
('133.157.930-93', 'bibliotecar', '3000', NULL, '12'),
('509.548.290-85', 'limpeza', '3000', NULL, '13'),
('121.999.890-70', 'TI', '3000', NULL, '14');

insert into estagiario values
('10', 'letras', 'UNICAP', '458.964.690-04', '15'),
('10', 'letras', 'UNICAP', '345.905.060-84', '16'),
('10', 'letras', 'UNICAP', '480.820.270-02', '17');

insert into coordenador_pedagogico values
('000.109.122-99', '5000', '18');