USE agricultura; 

-- 2 inserts teste
INSERT INTO maquinario (tipo, modelo, data_aquisicao, valor_hora, id_fazenda_fk) VALUES
('Tobata', 'HQ12', '2020-08-15', 250.00, 17);
INSERT INTO funcionario (nome, cargo, salario_hora, contato, id_fazenda_fk) VALUES
('Zé Ricardo', 'Administrador', 18.00, 'zericardo@gmail.com', 2);

-- 2 update teste
update maquinario set data_aquisicao = '2020-01-01' where id_maquina = 21;
update funcionario set cargo = 'Administrador chefe' where id_funcionario = 13;

-- 2 delete teste
delete from maquinario where id_maquina = 21;
delete from funcionario where id_funcionario = 13;

select * from auditoria;
