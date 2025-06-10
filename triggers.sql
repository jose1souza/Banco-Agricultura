CREATE TRIGGER tr_insere_fazenda 
AFTER INSERT ON fazenda
FOR EACH ROW
BEGIN 
	INSERT INTO auditoria
(id_auditoria,
acao_realizada,
tabela,
data_time,
usuario)
VALUES
("Fazenda",NOW());

END //

CREATE TRIGGER tr_deleta_fazenda

CREATE TRIGGER tr_atualiza_fazenda

CREATE TRIGGER tr_insere_maquinario

CREATE TRIGGER tr_deleta_maquinario

CREATE TRIGGER tr_atualiza_maquinario

CREATE TRIGGER tr_insere_produtor

CREATE TRIGGER tr_deleta_produtor

CREATE TRIGGER tr_atualiza_produtor
