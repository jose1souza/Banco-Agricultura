create table Auditoria (
id_auditoria  int auto_increment primary key,
acao_realizada  varchar(400) not null,
tabela varchar(50) not null,
data_time datetime not null,
usuario varchar(50) not null
);
