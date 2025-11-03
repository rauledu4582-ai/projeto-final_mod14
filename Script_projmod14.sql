INSERT INTO socio (bi, nome, morada, telefone, email, data_inscricao, tipo_pagamento) VALUES
('12345678', 'João', 'Porto', '913456098', 'joao@gmail.com', '2024-01-10', 'Mensal'),
('23456789', 'Maria', 'Lisboa', '92345612', 'maria@gmail.com', '2024-02-05', 'Anual'),
('34567890', 'Pedro', 'Braga', '994568123', 'pedro@gmail.com', '2024-03-01', 'Mensal'),
('45678901', 'Ana', 'Coimbra', '910984534', 'ana@gmail.com', '2024-03-15', 'Mensal'),
('56789012', 'Rui', 'Aveiro', '946098125', 'rui@gmail.com', '2024-04-20', 'Anual'),
('67890123', 'Beatriz', 'Faro', '9456990486', 'beatriz@gmail.com', '2024-04-25', 'Mensal'),
('78901234', 'Tiago', 'Setúbal', '9649594037', 'tiago@gmail.com', '2024-05-05', 'Mensal'),
('89012345', 'Carla', 'Lisboa', '946546675643', 'carla@gmail.com', '2024-06-10', 'Anual'),
('90123456', 'Miguel', 'Leiria', '9165467557', 'miguel@gmail.com', '2024-07-15', 'Mensal'),
('01234567', 'Sofia', 'Porto', '912357804', 'sofia@gmail.com', '2024-08-01', 'Anual');

insert INTO professor (nome, especialidade, telefone, email) VALUES
('Carlos', 'Yoga', '920000001', 'carlos@gin.pt'),
('Inês', 'Musculação', '920000002', 'ines@gin.pt'),
('Jorge', 'Natação', '920000003', 'tiago@gin.pt');

INSERT INTO espaco (nome, aula) VALUES
('Sala 1', 'Yoga'),
('Sala 2', 'Musculação'),
('Piscina', 'Natação'),
('Sala 3', 'Body Pump');

INSERT INTO aulas (modalidade, id_prof, id_espaco, horario, duracao) VALUES
('Yoga', 1, 1, '09:00', 60),
('Musculação', 2, 2, '10:30', 90),
('Natação', 3, 3, '12:00', 45),
('Body Pump', 2, 4, '18:10', 60);

INSERT INTO inscricoes (id_socio, id_aula, data_inscricao) VALUES
(1,1,'2024-03-01'),
(2,2,'2024-03-05'),
(3,1,'2024-03-10'),
(4,3,'2024-04-01'),
(5,2,'2024-04-15'),
(6,4,'2024-05-01'),
(7,1,'2024-05-05'),
(8,3,'2024-05-10'),
(9,4,'2024-06-01'),
(10,2,'2024-06-05');

INSERT INTO presencas (id_aula, id_socio, data) VALUES
(1,1,'2024-04-10'),
(1,3,'2024-04-10'),
(2,2,'2024-04-12'),
(3,4,'2024-04-13'),
(2,5,'2024-04-14'),
(4,6,'2024-05-02'),
(4,9,'2024-06-03');

INSERT INTO check_in_out (id_socio, data, hora_entrada, hora_saida) VALUES
(1,'2024-04-10','08:50','10:10'),
(2,'2024-04-12','10:20','12:10'),
(3,'2024-04-10','08:55','10:15'),
(4,'2024-04-13','11:50','13:00'),
(5,'2024-04-14','10:15','12:00');

INSERT INTO produtos (nome, categoria, preco) VALUES
('Camisola Ginásio', 'Roupa', 15.00),
('Calças Desporto', 'Roupa', 25.00),
('Proteína Whey', 'Suplemento', 40.00),
('Barra Energética', 'Suplemento', 2.00);

INSERT INTO vendas (id_socio, data, total) VALUES
(1,'2024-04-15',42.00),
(2,'2024-04-16',27.00);

INSERT INTO vendas_produtos (id_venda, id_produtos, quantidade, subtotal) VALUES
(1,3,1,40.00),
(1,4,1,2.00),
(2,1,1,15.00),
(2,2,1,25.00);

INSERT INTO pagamento(id_socio, tipo_pagamento, valor, data_pagamento) VALUES
(1,'Mensalidade',30.00,'2024-04-01'),
(2,'Anuidade',300.00,'2024-02-05'),
(3,'Mensalidade',30.00,'2024-04-05');

SELECT nome, morada, email, tipo_pagamento
FROM socio
ORDER BY nome ASC;
 
SELECT s.nome AS socio, a.modalidade
FROM inscricoes i
INNER JOIN socio s ON i.id_socio = s.id_socio
INNER JOIN aulas a ON i.id_aula = a.id_aula
ORDER BY s.nome;
 
SELECT nome, email
FROM socio
WHERE email LIKE '%@gmail.com';
 
SELECT tipo_pagamento, COUNT(*) AS total_socios
FROM socio
GROUP BY tipo_pagamento;
 
SELECT AVG(valor) AS media_pagamentos
FROM pagamento;
 
SELECT nome, email
FROM socio
WHERE id_socio IN (
    SELECT id_socio
    FROM pagamento
    WHERE valor > (SELECT AVG(valor) FROM pagamento)
);
 
SELECT s.nome AS socio, a.modalidade, p.nome AS professor, pr.data AS data_presenca
FROM presencas pr
INNER JOIN socio s ON pr.id_socio = s.id_socio
INNER JOIN aulas a ON pr.id_aula = a.id_aula
INNER JOIN professor p ON a.id_prof = p.id_prof
ORDER BY pr.data;

create USER 'socio'@'localhost' IDENTIFIED BY 'senha123';
create  USER 'professor'@'localhost02' IDENTIFIED BY 'senha456';
CREATE USER 'funcionario'@'localhost03' IDENTIFIED BY 'senha789';
CREATE USER 'administrador'@'localhost04' IDENTIFIED BY 'senha012';
 

CREATE ROLE socio;
CREATE ROLE professor;
CREATE ROLE funcionario;
CREATE ROLE administrador;

 
GRANT ALL PRIVILEGES ON ALL TABLES TO administrador;
 
GRANT SELECT ON socio TO Socio;
GRANT SELECT ON pagamento TO Socio;
 
GRANT INSERT, UPDATE, SELECT ON presencas TO Professor;
GRANT SELECT ON aulas TO professor;
GRANT SELECT ON socio TO professor;
 
GRANT INSERT, UPDATE, SELECT ON vendas TO funcionario;
GRANT INSERT, UPDATE, SELECT ON vendas_produtos TO funcionario;
GRANT INSERT, UPDATE, SELECT ON check_in_out TO funcionario;
GRANT INSERT, UPDATE, SELECT ON pagamento TO funcionario;
GRANT SELECT ON socio TO funcionario;
 
 
REVOKE ALL ON pagamento FROM socio, professor;
REVOKE ALL ON vendas FROM socio, professor;
REVOKE ALL ON vendas_produtos FROM socio, professor;