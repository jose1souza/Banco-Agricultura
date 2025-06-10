DELIMITER //
CREATE TRIGGER tr_insere_fazenda 
AFTER INSERT ON fazenda
FOR EACH ROW
BEGIN 
	INSERT INTO auditoria
(acao_realizada,
tabela,
data_time,
usuario)
VALUES
(CONCAT('INSERT INTO fazenda (nome, localizacao, tamanho_ha, id_produtor_fk) VALUES (', 
        NEW.nome, ', ', NEW.localizacao, ', ', NEW.tamanho_ha, ', ', NEW.id_produtor_fk, ');'),
"Fazenda",
NOW(),
USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_deleta_fazenda
AFTER DELETE ON fazenda
FOR EACH ROW
BEGIN
	INSERT INTO auditoria
(acao_realizada,
tabela,
data_time,
usuario)
VALUES
(CONCAT('DELETE FROM fazenda WHERE id = ', OLD.id_fazenda, ';'),"Fazenda",NOW(),USER());
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER tr_atualiza_fazenda
AFTER UPDATE ON fazenda
FOR EACH ROW
BEGIN
	INSERT INTO auditoria
(acao_realizada,
tabela,
data_time,
usuario)
VALUES
(CONCAT('UPDATE FROM fazenda WHERE id = ', OLD.id_fazenda, ';'),"Fazenda",NOW(),USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_insere_maquinario
AFTER INSERT ON maquinario
FOR EACH ROW
BEGIN
    INSERT INTO auditoria
(acao_realizada,
tabela,
data_time,
usuario)
VALUES
(CONCAT('INSERT INTO maquinario (tipo, modelo, data_aquisicao, valor_hora, id_fazenda_fk) VALUES (', 
        NEW.tipo, ', ', NEW.modelo, ', ', NEW.data_aquisicao, ', ', NEW.valor_hora, ', ', NEW.id_fazenda_fk, ');'),
"Maquinario",
NOW(),
USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_deleta_maquinario
AFTER DELETE ON maquinario
FOR EACH ROW
BEGIN
    INSERT INTO auditoria
(acao_realizada,
tabela,
data_time,
usuario)
VALUES
(CONCAT('DELETE FROM maquinario WHERE id = ', OLD.id_maquinario, ';'),"Maquinario",NOW(),USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_atualiza_maquinario
AFTER UPDATE ON maquinario
FOR EACH ROW
BEGIN
    INSERT INTO auditoria
(acao_realizada,
tabela,
data_time,
usuario)
VALUES
(CONCAT('UPDATE maquinario SET tipo = ', NEW.tipo, ', modelo = ', NEW.modelo, ', data_aquisicao = ', NEW.data_aquisicao, ', valor_hora = ', NEW.valor_hora, ' WHERE id = ', OLD.id_maquinario, ';'),"Maquinario",NOW(),USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_insere_produtor
AFTER INSERT ON produtor
FOR EACH ROW
BEGIN
    INSERT INTO auditoria
(acao_realizada,
tabela,
data_time,
usuario)
VALUES
(CONCAT('INSERT INTO produtor (nome, sobrenome, email, cpf_cnpj, contato) VALUES (', 
        NEW.nome, ', ', NEW.sobrenome, ', ', NEW.email, ', ', NEW.cpf_cnpj, ', ', NEW.contato, ');'),
"Produtor",
NOW(),
USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_deleta_produtor
AFTER DELETE ON produtor
FOR EACH ROW
BEGIN
    INSERT INTO auditoria
(acao_realizada,
tabela,
data_time,
usuario)
VALUES
(CONCAT('DELETE FROM produtor WHERE id = ', OLD.id_produtor, ';'),"Produtor",NOW(),USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER tr_atualiza_produtor
AFTER UPDATE ON produtor
FOR EACH ROW
BEGIN
    INSERT INTO auditoria
(acao_realizada,
tabela,
data_time,
usuario)
VALUES
(CONCAT('UPDATE produtor SET nome = ', NEW.nome, ', sobrenome = ', NEW.sobrenome, ', email = ', NEW.email, ', cpf_cnpj = ', NEW.cpf_cnpj, ', contato = ', NEW.contato, ' WHERE id = ', OLD.id_produtor, ';'),"Produtor",NOW(),USER());
END //
DELIMITER ;
