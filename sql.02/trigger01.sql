CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

		select now();

END -> FIM
$
CREATE DATABASE AULA40;
 USE AULA40;

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30),
	SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30),
	LOGIN VARCHAR(30)
);

delimiter $


create trigger USUARIO_BACKUP 
delete on usuario
for each ROW
BEGIN
    insert into bkp_usuario values(null, old.idusuario, old.nome, old.login);
END
$

insert into usuario values(null, 'rebecca', 'rebecca2022', 'naodigo')$

delete from usuario
where idusuario = 1$


insert into usuario values(null, 'bianca', 'biannnca', '1234')$
Query OK, 1 row affected (0.09 sec)

mysql> select * from usuario$
+-----------+--------+----------+-------+
| IDUSUARIO | NOME   | LOGIN    | SENHA |
+-----------+--------+----------+-------+
|         2 | bianca | biannnca | 1234  |
+-----------+--------+----------+-------+

 delete from usuario where idusuario = 2$


select * from bkp_usuario$
+----------+-----------+---------+-------------+
| IDBACKUP | IDUSUARIO | NOME    | LOGIN       |
+----------+-----------+---------+-------------+
|        1 |         1 | rebecca | rebecca2022 |
|        2 |         2 | bianca  | biannnca    |
+----------+-----------+---------+-------------+

select * from usuario$

> nao tem nada pois foi apagado, mas foi salvo na tabela bkp_usuario


/* A 41 - COMUNICACAO ENTRE BANCOS */
  
  CRIE DOIS BANCOS DE DADOS PARA QUE HAJA COMUNICAÇÃO ENTRE ELES. 
  
  BANCO DE DADOS LOJA COM OS ATRIBUTOS IDPRODUTO, NOME E VALOR
  BANCO DE DADOS BACKUP DEVERÁ RECEBER OS ATRIBUTOS DO BANCO DE DADOS LOJA
  

  create database loja;
    use loja;

    create table produtos(
        idproduto int primary key auto_increment,
        nome varchar(100) not null,
        valor float (10,2) not null
    );

    create database backup;
    use backup;
    create table backup_produtos(
        idbackup int primary key auto_increment,
        idproduto int, 
        nome varchar(100) not null,
        valor float(10,2) not null
    );

delimiter %

create trigger produtos_backup
after insert on produtos
for each row
BEGIN
    insert into backup.backup_produtos values (null, new.idproduto, new.nome, new.valor);
end
%

insert into produtos values(null, 'CAMISETA INDIE', 25.99);
insert into produtos values(null, 'CAMISETA ROCK', 25.99);

select * from produtos;

+-----------+----------------+-------+
| idproduto | nome           | valor |
+-----------+----------------+-------+
|         1 | CAMISETA INDIE | 25.99 |
|         2 | CAMISETA ROCK  | 25.99 |
+-----------+----------------+-------+

select * from backup_produtos;
+----------+-----------+----------------+-------+
| idbackup | idproduto | nome           | valor |
+----------+-----------+----------------+-------+
|        1 |         1 | CAMISETA INDIE | 25.99 |
|        2 |         2 | CAMISETA ROCK  | 25.99 |
+----------+-----------+----------------+-------+


INSERT INTO PRODUTOS VALUES(NULL,'LIVRO MODELAGEM',50.00);
INSERT INTO PRODUTOS VALUES(NULL,'LIVRO BI',80.00);
INSERT INTO PRODUTOS VALUES(NULL,'LIVRO ORACLE',70.00);
INSERT INTO PRODUTOS VALUES(NULL,'LIVRO SQL SERVER',100.00);

+-----------+------------------+--------+
| idproduto | nome             | valor  |
+-----------+------------------+--------+
|         1 | CAMISETA INDIE   |  25.99 |
|         2 | CAMISETA ROCK    |  25.99 |
|         3 | LIVRO MODELAGEM  |  50.00 |
|         4 | LIVRO BI         |  80.00 |
|         5 | LIVRO ORACLE     |  70.00 |
|         6 | LIVRO SQL SERVER | 100.00 |
+-----------+------------------+--------+

mysql> use backup;
Database changed
mysql> select * from backup_produtos;
+----------+-----------+------------------+--------+
| idbackup | idproduto | nome             | valor  |
+----------+-----------+------------------+--------+
|        1 |         1 | CAMISETA INDIE   |  25.99 |
|        2 |         2 | CAMISETA ROCK    |  25.99 |
|        3 |         3 | LIVRO MODELAGEM  |  50.00 |
|        4 |         4 | LIVRO BI         |  80.00 |
|        5 |         5 | LIVRO ORACLE     |  70.00 |
|        6 |         6 | LIVRO SQL SERVER | 100.00 |
+----------+-----------+------------------+--------+