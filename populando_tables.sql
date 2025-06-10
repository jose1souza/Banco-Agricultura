-- populando o banco:
USE agricultura; 

INSERT INTO fazenda (nome, localizacao, tamanho_ha, id_produtor_fk) VALUES
('Fazenda São José', 'Zona Rural, São Paulo', 200.50, 2),
('Fazenda São Gonçalo', 'Zona Rural, Cruzilia', 200.50, 10),
('Fazenda Joaquim Ferreira', 'Zona Rural, Muzambinho', 200.50, 11);

INSERT INTO produtor (nome, sobrenome, email, cpf_cnpj, contato) VALUES 
('Carlos', 'Silva', 'carlossilva@gmail.com', '741.852.963-00', '(35)99871-2233'),
('Fernanda', 'Souza', 'fernandasouza@gmail.com', '159.357.456-00', '(35)99632-4871'),
('Ricardo', 'Pereira', 'ricardopereira@gmail.com', '753.951.258-00', '(35)99541-6128'),
('Juliana', 'Almeida', 'julianaalmeida@gmail.com', '852.753.951-00', '(35)99413-7852'),
('Roberto', 'Ferreira', 'robertoferreira@gmail.com', '654.321.987-00', '(35)99785-3216'),
('Tatiane', 'Mendes', 'tatianemendes@gmail.com', '321.654.987-00', '(35)99321-6548'),
('Eduardo', 'Gonçalves', 'eduardogoncalves@gmail.com', '963.258.741-00', '(35)99578-4321');
  
INSERT INTO talhao (nome, tipo_solo, id_fazenda_fk) VALUES
('Talhão 8', 'Argiloso', 30),
('Talhão 9', 'Úmido', 31),
('Talhão 10', 'Árido', 32); 

INSERT INTO cultura (id_cultura, nome) VALUES
(7, 'Lentilha'),
(8, 'Grão de bico'),
(9, 'Cana-de-açúcar'),
(10, 'Feijão'),
(11, 'Arroz'),
(12, 'Mandioca');

INSERT INTO cultivo (data_plantio, data_colheita, producao, id_talhao_fk, id_cultura_fk) VALUES
('2023-10-01', '2024-01-15', 1000.00, 9, 3),
('2023-11-10', '2024-02-20', 85000.50, 10, 4),
('2023-09-01', '2024-01-10', 1200.00, 11, 5),
('2021-11-10', '2022-02-20', 9500.50, 10, 4),
('2021-09-01', '2022-01-10', 11000.00, 11, 5),
('2023-12-01', '2024-04-10', 15050.00, 12, 6);

INSERT INTO funcionario (nome, cargo, salario_hora, contato, id_fazenda_fk) VALUES
('Marcos Pedro', 'Operador de Trator', 20.00, 'mpedro@gmail.com', 17),
('Juliana Souza', 'Técnica de Fertilização', 30.00, 'juliana@gmail.com', 20),
('Paulo Henrique', 'Agrônomo', 25.00, 'paulo@gmail.com', 18),
('Pedro Paulo', 'Controle de pragas', 23.00, 'pepaulo@gmail.com', 19),
('Alex Souza', 'Colheita', 15.00, 'alex@gmail.com', 2),
('Miriam Martins', 'Colheita', 15.00, 'mimartins@gmail.com', 18),
('Felipe Júnior', 'Agrônomo', 25.00, 'juninho@gmail.com', 2);

INSERT INTO maquinario (tipo, modelo, data_aquisicao, valor_hora, id_fazenda_fk) VALUES
('Colheitadeira', 'Case IH 9230', '2022-08-15', 200.00, 19),
('Trator', 'Massey Ferguson 6714', '2021-06-25', 150.00, 19),
('Pulverizador', 'STARA Pulver', '2023-01-10', 90.00, 19);



