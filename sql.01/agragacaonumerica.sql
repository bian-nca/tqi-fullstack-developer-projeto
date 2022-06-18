/* FUNÇÕES NUMERICAS */

create database revisao;
    use revisao;
        CREATE TABLE VENDEDORES(
			IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
			NOME VARCHAR(40),
			SEXO CHAR (1),
			JANEIRO FLOAT (10,2),
			FEVEREIRO FLOAT (10,2),
			MARCO FLOAT (10,2)
		);

INSERT INTO VENDEDORES VALUES(NULL, 'CASSIA', 'F', '76234.89','68346.87', '5756.90');
INSERT INTO VENDEDORES VALUES(NULL, 'MARIA', 'F', '58634.89','78346.87', '4756.90');
INSERT INTO VENDEDORES VALUES(NULL, 'ROMULO', 'M', '76234.89','48346.87', '5756.90');
INSERT INTO VENDEDORES VALUES(NULL, 'CLARA', 'F', '78934.89','68346.87', '6756.90');
INSERT INTO VENDEDORES VALUES(NULL, 'ANTONIO', 'M', '57734.89','38346.87', '7756.90');
INSERT INTO VENDEDORES VALUES(NULL, 'ABBNER', 'M', '67634.89','78346.87', '6756.90');
INSERT INTO VENDEDORES VALUES(NULL, 'CELIA', 'F', '56734.89','58346.87', '6756.90');
INSERT INTO VENDEDORES VALUES(NULL, 'JOAO', 'M', '67834.89','58346.87', '5756.90');


select * from vendedores;
+------------+---------+------+----------+-----------+---------+
| IDVENDEDOR | NOME    | SEXO | JANEIRO  | FEVEREIRO | MARCO   |
+------------+---------+------+----------+-----------+---------+
|          1 | CASSIA  | F    | 76234.89 |  68346.87 | 5756.90 |
|          2 | MARIA   | F    | 58634.89 |  78346.87 | 4756.90 |
|          3 | ROMULO  | M    | 76234.89 |  48346.87 | 5756.90 |
|          4 | CLARA   | F    | 78934.89 |  68346.87 | 6756.90 |
|          5 | ANTONIO | M    | 57734.89 |  38346.87 | 7756.90 |
|          6 | ABBNER  | M    | 67634.89 |  78346.87 | 6756.90 |
|          7 | CELIA   | F    | 56734.89 |  58346.87 | 6756.90 |
|          8 | JOAO    | M    | 67834.89 |  58346.87 | 5756.90 |
+------------+---------+------+----------+-----------+---------+

/* 


> MAX: EXIBE O VALOR MAXIMO DA COLUNA!
> MIN: EXIBE O MENOR VALOR DA COLUNA!
> AVG: EXIBE A MEDIA DA COLUNA!

*/

select max(fevereiro) as maior_valor_fevereiro
from vendedores;

+-----------------------+
| maior_valor_fevereiro |
+-----------------------+
|              78346.87 |
+-----------------------+

select min(fevereiro) as menor_valor_fevereiro
from vendedores;

+-----------------------+
| menor_valor_fevereiro |
+-----------------------+
|              38346.87 |
+-----------------------+

select avg(fevereiro) as media_fevereiro
from vendedores;

+-----------------+
| media_fevereiro |
+-----------------+
|    62096.869141 |
+-----------------+

select max(janeiro) as janeiro_maximo,
    max(fevereiro) as fevereiro_maximo,
    max(marco) as marco_maximo
from vendedores;

+----------------+------------------+--------------+
| janeiro_maximo | fevereiro_maximo | marco_maximo |
+----------------+------------------+--------------+
|       78934.89 |         78346.87 |      7756.90 |
+----------------+------------------+--------------+

select min(janeiro) as minimo_jan,
min(fevereiro) as minimo_fev,
min(marco) as minimo_marco
from vendedores;

+------------+------------+--------------+
| minimo_jan | minimo_fev | minimo_marco |
+------------+------------+--------------+
|   56734.89 |   38346.87 |      4756.90 |
+------------+------------+--------------+

select avg(janeiro) as media_jan,
avg(fevereiro) as media_fev,
avg(marco) as media_marco
from vendedores;

+--------------+--------------+-------------+
| media_jan    | media_fev    | media_marco |
+--------------+--------------+-------------+
| 67497.390625 | 62096.869141 | 6256.899902 |
+--------------+--------------+-------------+


> SOMANDO 

select sum(janeiro) as total_janeiro
from vendedores;

+---------------+
| total_janeiro |
+---------------+
|     539979.12 |
+---------------+

select sum(fevereiro) as total_fev
from vendedores;

+-----------+
| total_fev |
+-----------+
| 496774.95 |
+-----------+

select sum(marco) as total_marco
from vendedores;

+-------------+
| total_marco |
+-------------+
|    50055.20 |
+-------------+

select sum(janeiro) as total_janeiro,
sum(fevereiro) as total_fev,
sum(marco) as total_marco
from vendedores;

+---------------+-----------+-------------+
| total_janeiro | total_fev | total_marco |
+---------------+-----------+-------------+
|     539979.12 | 496774.95 |    50055.20 |
+---------------+-----------+-------------+

/* VENDAS POR SEXO */

SELECT SEXO, SUM(MARCO) AS TOTAL_MARCO
FROM VENDEDORES
GROUP BY SEXO;
+------+-------------+
| SEXO | TOTAL_MARCO |
+------+-------------+
| F    |    24027.60 |
| M    |    26027.60 |
+------+-------------+

SELECT SEXO, SUM(JANEIRO) AS total_janeiro,
SUM(FEVEREIRO) AS total_fev,
SUM(MARCO) AS total_marco
from vendedores
group by sexo;

+------+---------------+-----------+-------------+
| SEXO | total_janeiro | total_fev | total_marco |
+------+---------------+-----------+-------------+
| F    |     270539.56 | 273387.47 |    24027.60 |
| M    |     269439.56 | 223387.48 |    26027.60 |
+------+---------------+-----------+-------------+


/*
> VENDEDOR QUE VENDEU MENOS EM MARÇO E QUAL É O SEU NOME?
> NOME E O VALOR DE QUEM MAIS VENDEU EM MARCO
> ENCONTRE QUEM VENDEU ACIMA DA MÉDIA NO PERÍODO DE FEVEREIRO
*/

01) 

SELECT  NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

+-------+---------+
| NOME  | MARCO   |
+-------+---------+
| MARIA | 4756.90 |
+-------+---------+

02)
SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

+---------+---------+
| NOME    | MARCO   |
+---------+---------+
| ANTONIO | 7756.90 |
+---------+---------+

03)

SELECT NOME, FEVEREIRO FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

+--------+-----------+
| NOME   | FEVEREIRO |
+--------+-----------+
| CASSIA |  68346.87 |
| MARIA  |  78346.87 |
| CLARA  |  68346.87 |
| ABBNER |  78346.87 |
+--------+-----------+

