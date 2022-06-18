CREATE DATABASE COMERCIO;

USE COMERCIO;

DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (50) NOT NULL,
	SEXO ENUM('M', 'F') NOT NULL,
	EMAIL VARCHAR (50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO (
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR (40) NOT NULL,
	BAIRRO VARCHAR (40) NOT NULL,
	CIDADE VARCHAR (40) NOT NULL,
	ESTADO CHAR (2) NOT NULL,
	ID_CLIENTE INT UNIQUE,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,

	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE (IDCLIENTE)
);


/* ENDERECO - OBRIGATORIO 
CADASTRO DE SOMENTE UM.

TELEFONE - NAO OBRIGATORIO
CADASTRO DE MAIS DE UM (OPCIONAL) /*

/*
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N */


> INSERINDO INFORMAÇÕES PARA OS CLIENTES  

INSERT INTO CLIENTE VALUES (NULL,'FABIO', 'M', 'FABIO@GMAIL.COM', '767877777');
INSERT INTO CLIENTE VALUES (NULL,'MARLOM', 'M', 'MARLOM@OUTLOOK.COM','5464443466');
INSERT INTO CLIENTE VALUES (NULL, 'CLARA','F','CLARA@CLARA.COM','444444444');
INSERT INTO CLIENTE VALUES (NULL,'BIANCA', 'F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES (NULL,'DIEGO', 'M','DIEGO@UOL.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL, 'MAX', 'M', 'MAX@UOL.COM', '(34) 99023-2302');


> INSERINDO INFORMAÇÕES DOS CLIENTES CADASTRADOS DENTRO DA TABELA ENDEREÇO FAZENDO CONEXÃO POR MEIO DO IDCLIENTE


INSERT INTO ENDERECO VALUES(NULL,'RUA X','CENTRO','ARAGUARI','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA Y','BOTANICO','CAMPINAS','SP',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA W','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA Q','ESTACIO','CATALAO','GO',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA E','LAGOINHA','UBERLANDIA','MG',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA K','CENTRO','ARAGUARI','ES',5);

> inserindo informações de telefones dos clientes cadastrados 


INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);


SELECT NOME, SEXO, EMAIL /*PROJECAO */
FROM CLIENTE /*ORIGEM */
WHERE SEXO - 'M';  /*SELECAO*/ 

/* SELEÇÃO É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTRO 
DE UMA TABELA*/

/*JOIN  -> JUNÇÕES */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

> ATIVIDADE:

/* PROJEÇÃO DE NOME, EMAIL, IDCLIENTE*/

select nome, email, idcliente
from cliente;

/* PROJEÇÃO DE NOME, SEXO, BAIRRO, CIDADE */

select cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade
from cliente
inner join endereco 
on cliente.idcliente = endereco.id_cliente;

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;


/*projeção nome, sexo, bairro, cidade*/

select cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade
from cliente
inner join endereco
on cliente.idcliente = endereco.id_cliente
where sexo = 'F';

select nome, sexo, bairro, cidade
from cliente, endereco
where sexo = 'F';

/* nome, sexo, email, tipo, numero*/

select cliente.nome, cliente.sexo, cliente.email, telefone.tipo, telefone.numero
from cliente
inner join telefone
on cliente.idcliente = telefone.id_cliente;

select nome, sexo, email, tipo, numero
from cliente, telefone;

select nome, sexo, email, tipo, numero
from cliente
	inner join telefone
	on idcliente = id_cliente;

	/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO*/

	select cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade, telefone.tipo, telefone.numero
	from cliente
	inner join endereco
	on cliente.idcliente = endereco.id_cliente
	inner join telefone 
	on cliente.idcliente = telefone.id_cliente;

	+--------+------+----------+-----------+------+----------+
| NOME   | SEXO | BAIRRO   | CIDADE    | TIPO | NUMERO   |
+--------+------+----------+-----------+------+----------+
| FABIO  | M    | BOTANICO | CAMPINAS  | CEL  | 87866896 |
| FABIO  | M    | BOTANICO | CAMPINAS  | RES  | 99667587 |
| FABIO  | M    | BOTANICO | CAMPINAS  | COM  | 66687899 |
| CLARA  | F    | JARDINS  | SAO PAULO | CEL  | 78989765 |
| CLARA  | F    | JARDINS  | SAO PAULO | CEL  | 99766676 |
| MARLOM | M    | ESTACIO  | CATALAO   | COM  | 54768899 |
| MARLOM | M    | ESTACIO  | CATALAO   | CEL  | 88687909 |
| DIEGO  | M    | CENTRO   | ARAGUARI  | CEL  | 78458743 |
| DIEGO  | M    | CENTRO   | ARAGUARI  | RES  | 56576876 |
| DIEGO  | M    | CENTRO   | ARAGUARI  | RES  | 89986668 |
+--------+------+----------+-----------+------+----------+


SELECT CLIENTE.NOME AS "CLIENTE",
	   CLIENTE.SEXO AS "SEXO",
	   ENDERECO.CIDADE AS "MUNICÍPIO",
	   ENDERECO.BAIRRO AS "REGIÃO",
	   TELEFONE.TIPO AS "TIPO DE CONTATO",
	   TELEFONE.NUMERO AS "NÚMERO DE CONTATO"
FROM CLIENTE 
	INNER JOIN ENDERECO 
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN  TELEFONE 
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;


/*INSERT*/

INSERT INTO CLIENTE VALUES(NULL, 'MÔNICA', 'M', NULL, '88438756');
INSERT INTO ENDERECO VALUES(NULL, 'JOAO XV', 'ACLIMAÇÃO', 'UBERLANDIA', 'MG', 7);

SELECT * FROM CLIENTE;
SELECT * FROM ENDERECO;

/*FILTROS*/
SELECT * FROM CLIENTE
WHERE SEXO = 'M';

update cliente
set sexo = 'F'
where idcliente = '7';

select * from cliente
where idcliente = '7';

/*DELETE*/

INSERT INTO CLIENTE VALUES (NULL, 'XYZ', 'M', NULL, 'AAA'); -- USAR PARA O DELETE

DELEETE FROM CLIENTE WHERE IDCLIENTE = 8;


CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(50) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/*ALTER TABLE = ALTERANDO AS TABELAS = CHANGE (COLUNA), TIPAGEM, TAMANHO...    */

mysql> desc produto;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| IDPRODUTO    | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO | varchar(50) | NO   |     | NULL    |                |
| PRECO        | int         | YES  |     | NULL    |                |
| FRETE        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+


alter table PRODUTO
change preco valor float(10,2) not null;


mysql> desc produto;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| IDPRODUTO    | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO | varchar(50) | NO   |     | NULL    |                |
| valor        | float(10,2) | NO   |     | NULL    |                |
| FRETE        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+


/*-----------------------------------------------------------*/
>ALTER TABLE MODIFY 

alter table produto
modify valor varchar(50) not null;


mysql> desc produto;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| IDPRODUTO    | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO | varchar(50) | NO   |     | NULL    |                |
| valor        | varchar(50) | NO   |     | NULL    |                |
| FRETE        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+


/* ---------------------------------------------------------------------------*/
> ADICIONANDO UMA COLUNA

alter table produto
add valor_unitario varchar(70) not null;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
| valor          | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
| valor_unitario | varchar(70) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/*--------------------------------------------------------------------------------*/

APAGANDO COLUNA!!

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;


+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
| valor          | varchar(50) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
| valor_unitario | varchar(70) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+


alter table produto
drop column peso;

ALTER TABLE PRODUTO
DROP COLUMN valor;


/*INSERIR COLUNA EM UMA POSIÇÃO ESPECIFICA*/

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

mysql> desc produto;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int         | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(50) | NO   |     | NULL    |                |
| PESO           | float(10,2) | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
| valor_unitario | varchar(70) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;


/*EXERCICIOS DML*/


INSERT INTO CLIENTE VALUES (NULL, 'LUIZZ', 'M', 'LUIZZ@OI.COM', '678907');
INSERT INTO CLIENTE VALUES (NULL, 'CLAUDIO', 'M', 'CALUDIO@OI.COM', '988887');
INSERT INTO CLIENTE VALUES (NULL, 'CRISTIANO', 'M', NULL, '123433');
INSERT INTO CLIENTE VALUES (NULL, 'MARCIO', 'M', 'MARCIO@OI.COM', '453333');
INSERT INTO CLIENTE VALUES (NULL, 'BIANCA', 'M', 'BIANCA@OI.COM', '984474');
INSERT INTO CLIENTE VALUES (NULL, 'JONATA', 'M', NULL, '098733');
INSERT INTO CLIENTE VALUES (NULL, 'LAURA', 'M', NULL, '736644');
INSERT INTO CLIENTE VALUES (NULL, 'MARCELA', 'M', 'MARCELA@OI.COM', '92873733');
INSERT INTO CLIENTE VALUES (NULL, 'MAX', 'F', 'MAX@OI.COM', '09876');
INSERT INTO CLIENTE VALUES (NULL, 'JHON', 'F', 'JHON@OI.COM', '098763');


SELECT * FROM CLIENTE;

/*CADASTRAR ENDERECO PARA CADA CLIENTE */
INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','CURITIBA','PR',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','GOIANIA','GO',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','ARAGUARI','MG',18);


/*CADASTRAR TELEFONES PARA OS NOVOS CLIENTES */
INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',14);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',14);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',15);




/*

> ATIVIDADE:

01) Relatório que apresente todos os clientes */

create view relatorio as
   select cliente.idcliente as "Código do cliente",
    cliente.nome as "Nome",
    cliente.sexo as "Genêro",
    cliente.email as "E-mail",
    cliente.cpf as "CPF"
from cliente;


mysql> select * from relatorio;
+-------------------+-----------+--------+--------------------+-----------------+
| Código do cliente | Nome      | Genêro | E-mail             | CPF             |
+-------------------+-----------+--------+--------------------+-----------------+
|                 1 | FABIO     | M      | FABIO@GMAIL.COM    | 767877777       |
|                 2 | MARLOM    | M      | MARLOM@OUTLOOK.COM | 5464443466      |
|                 3 | CLARA     | F      | CLARA@CLARA.COM    | 444444444       |
|                 4 | BIANCA    | F      | NULL               | 5687766856      |
|                 5 | DIEGO     | M      | DIEGO@UOL.COM      | 8756547688      |
|                 6 | MAX       | M      | MAX@UOL.COM        | (34) 99023-2302 |
|                 7 | MÔNICA    | M      | NULL               | 88438756        |
|                 9 | LUIZZ     | M      | LUIZZ@OI.COM       | 678907          |
|                10 | CLAUDIO   | M      | CALUDIO@OI.COM     | 988887          |
|                11 | CRISTIANO | M      | NULL               | 123433          |
|                12 | MARCIO    | M      | MARCIO@OI.COM      | 453333          |
|                13 | BIANCA    | M      | BIANCA@OI.COM      | 984474          |
|                14 | JONATA    | M      | NULL               | 098733          |
|                15 | LAURA     | M      | NULL               | 736644          |
|                16 | MARCELA   | M      | MARCELA@OI.COM     | 92873733        |
|                17 | MAX       | F      | MAX@OI.COM         | 09876           |
|                18 | JHON      | F      | JHON@OI.COM        | 098763          |
+-------------------+-----------+--------+--------------------+-----------------+


/*02)Todos os clientes e seus respectivos endereços e telefones */
select cliente.nome, endereco.rua, endereco.bairro, endereco.cidade, endereco.estado
from cliente
inner join endereco
on cliente.idcliente = endereco.id_cliente;
+-----------+--------------------+------------+----------------+--------+
| nome      | rua                | bairro     | cidade         | estado |
+-----------+--------------------+------------+----------------+--------+
| FABIO     | RUA Y              | BOTANICO   | CAMPINAS       | SP     |
| MARLOM    | RUA Q              | ESTACIO    | CATALAO        | GO     |
| CLARA     | RUA W              | JARDINS    | SAO PAULO      | SP     |
| BIANCA    | RUA X              | CENTRO     | ARAGUARI       | MG     |
| DIEGO     | RUA K              | CENTRO     | ARAGUARI       | ES     |
| MAX       | RUA E              | LAGOINHA   | UBERLANDIA     | MG     |
| MÔNICA    | JOAO XV            | ACLIMAÇÃO  | UBERLANDIA     | MG     |
| LUIZZ     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     |
| CLAUDIO   | RUA MAIA LACERDA   | ESTACIO    | RIO DE JANEIRO | RJ     |
| CRISTIANO | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     |
| MARCIO    | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     |
| BIANCA    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     |
| JONATA    | RUA CASTRO ALVES   | LEBLON     | RIO DE JANEIRO | RJ     |
| LAURA     | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     |
| MARCELA   | AV CARLOS BARROSO  | JARDINS    | CURITIBA       | PR     |
| MAX       | ALAMEDA SAMPAIO    | BOM RETIRO | GOIANIA        | GO     |
| JHON      | RUA DA LAPA        | LAPA       | ARAGUARI       | MG     |
+-----------+--------------------+------------+----------------+--------+


/*03) Relação de todos os clientes do sexo masculino (atenção apresente a solução utilizada para a correção de cadastro incorreto quanto ao sexo do cliente)*/

select * from cliente; 

+-----------+-----------+------+--------------------+-----------------+
| IDCLIENTE | NOME      | SEXO | EMAIL              | CPF             |
+-----------+-----------+------+--------------------+-----------------+
|         1 | FABIO     | M    | FABIO@GMAIL.COM    | 767877777       |
|         2 | MARLOM    | M    | MARLOM@OUTLOOK.COM | 5464443466      |
|         3 | CLARA     | F    | CLARA@CLARA.COM    | 444444444       |
|         4 | BIANCA    | F    | NULL               | 5687766856      |
|         5 | DIEGO     | M    | DIEGO@UOL.COM      | 8756547688      |
|         6 | MAX       | M    | MAX@UOL.COM        | (34) 99023-2302 |
|         7 | MÔNICA    | M    | NULL               | 88438756        |
|         9 | LUIZZ     | M    | LUIZZ@OI.COM       | 678907          |
|        10 | CLAUDIO   | M    | CALUDIO@OI.COM     | 988887          |
|        11 | CRISTIANO | M    | NULL               | 123433          |
|        12 | MARCIO    | M    | MARCIO@OI.COM      | 453333          |
|        13 | BIANCA    | M    | BIANCA@OI.COM      | 984474          |
|        14 | JONATA    | M    | NULL               | 098733          |
|        15 | LAURA     | M    | NULL               | 736644          |
|        16 | MARCELA   | M    | MARCELA@OI.COM     | 92873733        |
|        17 | MAX       | F    | MAX@OI.COM         | 09876           |
|        18 | JHON      | F    | JHON@OI.COM        | 098763          |
+-----------+-----------+------+--------------------+-----------------+



> Como visto, foi projetado alguns clientes que são homes, mas estão com o sexo inserido como 'F' feminino,
dessa forma, é necessário a correção desses clientes! Também foi notado que algumas clientes do sexo feminino
estão com o mesmo erro, problema, nesse caso também é necessário a correção do sexo delas para não aparecer
no relatório que será gerado sobre os clientes masculinos!

Usarei a chave primaria, IDCLIENTE, para fazer a correção dessas clientes que estão com o sexo errado.

select idcliente, nome, sexo
from cliente
where sexo = 'F';

+-----------+--------+------+
| idcliente | nome   | sexo |
+-----------+--------+------+
|         3 | CLARA  | F    |
|         4 | BIANCA | F    |
|         7 | MÔNICA | F    |
|        17 | MAX    | F    |
|        18 | JHON   | F    |
+-----------+--------+------+
> IDCLIENTE DOS HOMENS QUE ESTÃO COM O SEXO COMO FEMININO = 17, 18

select idcliente, nome, sexo 
from cliente
where sexo = 'M';


+-----------+-----------+------+
| idcliente | nome      | sexo |
+-----------+-----------+------+
|         1 | FABIO     | M    |
|         2 | MARLOM    | M    |
|         5 | DIEGO     | M    |
|         6 | MAX       | M    |
|         9 | LUIZZ     | M    |
|        10 | CLAUDIO   | M    |
|        11 | CRISTIANO | M    |
|        12 | MARCIO    | M    |
|        13 | BIANCA    | M    |
|        14 | JONATA    | M    |
|        15 | LAURA     | M    |
|        16 | MARCELA   | M    |
+-----------+-----------+------+

> IDCLIENTE DAS MULHERES QUE ESTÃO COM O SEXO COMO MASCULINO = 13, 15, 16

> Hora de atualizarmos os dados!

update cliente
set sexo = 'M'
where idcliente in ('17', '18');

update cliente
set sexo = 'F'
where idcliente in ('13', '15', '16');


select * from cliente;
+-----------+-----------+------+--------------------+-----------------+
| IDCLIENTE | NOME      | SEXO | EMAIL              | CPF             |
+-----------+-----------+------+--------------------+-----------------+
|         1 | FABIO     | M    | FABIO@GMAIL.COM    | 767877777       |
|         2 | MARLOM    | M    | MARLOM@OUTLOOK.COM | 5464443466      |
|         3 | CLARA     | F    | CLARA@CLARA.COM    | 444444444       |
|         4 | BIANCA    | F    | NULL               | 5687766856      |
|         5 | DIEGO     | M    | DIEGO@UOL.COM      | 8756547688      |
|         6 | MAX       | M    | MAX@UOL.COM        | (34) 99023-2302 |
|         7 | MÔNICA    | F    | NULL               | 88438756        |
|         9 | LUIZZ     | M    | LUIZZ@OI.COM       | 678907          |
|        10 | CLAUDIO   | M    | CALUDIO@OI.COM     | 988887          |
|        11 | CRISTIANO | M    | NULL               | 123433          |
|        12 | MARCIO    | M    | MARCIO@OI.COM      | 453333          |
|        13 | BIANCA    | F    | BIANCA@OI.COM      | 984474          |
|        14 | JONATA    | M    | NULL               | 098733          |
|        15 | LAURA     | F    | NULL               | 736644          |
|        16 | MARCELA   | F    | MARCELA@OI.COM     | 92873733        |
|        17 | MAX       | M    | MAX@OI.COM         | 09876           |
|        18 | JHON      | M    | JHON@OI.COM        | 098763          |
+-----------+-----------+------+--------------------+-----------------+

>COMO VISTO, foi corrigido o problema do sexo inserido como errado em alguns clientes!

> Agora irei chamar  apenas meus clientes que estão inseridos com o sexo correto, nesse caso, os homens!

create view relatorio_homens as
select cliente.idcliente as "Código do cliente", cliente.nome, cliente.sexo, cliente.email, cliente.cpf
from cliente
where sexo = 'M';

 select * from relatorio_homens;
+-------------------+-----------+------+--------------------+-----------------+
| Código do cliente | nome      | sexo | email              | cpf             |
+-------------------+-----------+------+--------------------+-----------------+
|                 1 | FABIO     | M    | FABIO@GMAIL.COM    | 767877777       |
|                 2 | MARLOM    | M    | MARLOM@OUTLOOK.COM | 5464443466      |
|                 5 | DIEGO     | M    | DIEGO@UOL.COM      | 8756547688      |
|                 6 | MAX       | M    | MAX@UOL.COM        | (34) 99023-2302 |
|                 9 | LUIZZ     | M    | LUIZZ@OI.COM       | 678907          |
|                10 | CLAUDIO   | M    | CALUDIO@OI.COM     | 988887          |
|                11 | CRISTIANO | M    | NULL               | 123433          |
|                12 | MARCIO    | M    | MARCIO@OI.COM      | 453333          |
|                14 | JONATA    | M    | NULL               | 098733          |
|                17 | MAX       | M    | MAX@OI.COM         | 09876           |
|                18 | JHON      | M    | JHON@OI.COM        | 098763          |
+-------------------+-----------+------+--------------------+-----------------+
/*04) Relatório que contemple todas as mulheres ( Atenção apresente a solução utilizada para a correção de cadastro incorreto quanto ao sexo do cliente)*/

> Como já foi utilizado a correção dos sexo na atividade anterior, irei inserir aqui a relação feita aqui também e depois criar um relatorio apenas para as mulheres

> AS clientes que estavam com o sexo errado eram, utilizando o idcliente, 13, 15 e 16. Assim, fiz a seguinte query para a correção:

update cliente
set sexo = 'F'
where idcliente in ('13', '15', '16');

> a mesma coisa foi utilizada para os clientes homens que estavam com o sexo como feminino...

create view relatorio_mulheres as
select cliente.idcliente as "Código das clientes", cliente.nome, cliente.sexo, cliente.email, cliente.cpf
from cliente
where sexo = 'F';

 SELECT * FROM RELATORIO_MULHERES;
+---------------------+---------+------+-----------------+------------+
| Código das clientes | nome    | sexo | email           | cpf        |
+---------------------+---------+------+-----------------+------------+
|                   3 | CLARA   | F    | CLARA@CLARA.COM | 444444444  |
|                   4 | BIANCA  | F    | NULL            | 5687766856 |
|                   7 | MÔNICA  | F    | NULL            | 88438756   |
|                  13 | BIANCA  | F    | BIANCA@OI.COM   | 984474     |
|                  15 | LAURA   | F    | NULL            | 736644     |
|                  16 | MARCELA | F    | MARCELA@OI.COM  | 92873733   |
+---------------------+---------+------+-----------------+------------+

/*05) Apresente a quantidade de clientes agrupado por sexo;*/

select count(*) as quantidade_clientes, sexo
from cliente
group by sexo;

+---------------------+------+
| quantidade_clientes | sexo |
+---------------------+------+
|                  11 | M    |
|                   6 | F    |
+---------------------+------+

/*06) Projete apenas o id e email dos clientes que morem no centro do rio de janeiro*/

select cliente.idcliente as "Código do cliente",
 cliente.nome, 
 cliente.email as "e-mail",
 endereco.bairro, 
 endereco.cidade as "municipio"
from cliente
inner join endereco
on cliente.idcliente = endereco.id_cliente
where endereco.cidade = 'RIO DE JANEIRO';

+-------------------+-----------+----------------+------------+----------------+
| Código do cliente | nome      | e-mail         | bairro     | municipio      |
+-------------------+-----------+----------------+------------+----------------+
|                10 | CLAUDIO   | CALUDIO@OI.COM | ESTACIO    | RIO DE JANEIRO |
|                11 | CRISTIANO | NULL           | CENTRO     | RIO DE JANEIRO |
|                12 | MARCIO    | MARCIO@OI.COM  | COPACABANA | RIO DE JANEIRO |
|                14 | JONATA    | NULL           | LEBLON     | RIO DE JANEIRO |
+-------------------+-----------+----------------+------------+----------------+

/* 07) PROJETE APENAS O ID E EMAIL DOS CLIENTES QUE MOREM NO CENTRO DO RIO DE JANEIRO E QUE NÃO TENHAM CELULAR */  


select cliente.idcliente as "Código do cliente",
 cliente.nome, 
 cliente.email as "e-mail",
 endereco.bairro, 
 endereco.cidade as "municipio",
 telefone.numero as "NÃO POSSUEM NUMERO"
from cliente
inner join endereco
on cliente.idcliente = endereco.id_cliente
inner join telefone
on cliente.idcliente = telefone.id_cliente
where endereco.cidade = 'RIO DE JANEIRO' and (telefone.numero = '');



/*08) Projete a relação dos clientes e seus respectivos telefone celular e email de todos os clientes do estado do paraná*/

select cliente.idcliente, cliente.nome, cliente.sexo, cliente.email, cliente.cpf, telefone.tipo, telefone.numero, endereco.estado
from cliente
inner join telefone
on cliente.idcliente = telefone.id_cliente
inner join endereco
on cliente.idcliente = endereco.id_cliente
where telefone.tipo = 'CEL' and (endereco.estado = 'SP');

+-----------+-------+------+-----------------+-----------+------+----------+--------+
| idcliente | nome  | sexo | email           | cpf       | tipo | numero   | estado |
+-----------+-------+------+-----------------+-----------+------+----------+--------+
|         1 | FABIO | M    | FABIO@GMAIL.COM | 767877777 | CEL  | 87866896 | SP     |
|         3 | CLARA | F    | CLARA@CLARA.COM | 444444444 | CEL  | 78989765 | SP     |
|         3 | CLARA | F    | CLARA@CLARA.COM | 444444444 | CEL  | 99766676 | SP     |
+-----------+-------+------+-----------------+-----------+------+----------+--------+

/*08) Projete o relatório com o nome, email e telefone celular das mulheres que moram no estado são paulo*/

select  cliente.nome, cliente.email as "e-mail", telefone.tipo, telefone.numero, endereco.estado
from cliente
inner join telefone
on cliente.idcliente = telefone.id_cliente
inner join endereco
on cliente.idcliente = endereco.id_cliente
where sexo = 'F' and (endereco.estado = 'SP') and (telefone.tipo = 'CEL');

+-------+-----------------+------+----------+--------+
| nome  | e-mail          | tipo | numero   | estado |
+-------+-----------------+------+----------+--------+
| CLARA | CLARA@CLARA.COM | CEL  | 78989765 | SP     |
| CLARA | CLARA@CLARA.COM | CEL  | 99766676 | SP     |
+-------+-----------------+------+----------+--------+