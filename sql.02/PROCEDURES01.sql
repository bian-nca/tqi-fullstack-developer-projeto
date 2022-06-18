 show tables;
+----------------------+
| Tables_in_comercio   |
+----------------------+
| cliente              |
| endereco             |
| estudantes           |
| jogadores            |
| produto              |
| relatorio            |
| relatorio_estudantes |
| relatorio_homens     |
| relatorio_mulheres   |
| telefone             |
+----------------------+

use comercio;

show tables;

+----------------------+
| Tables_in_comercio   |
+----------------------+
| cliente              |
| endereco             |
| estudantes           |
| jogadores            |
| produto              |
| relatorio            |
| relatorio_estudantes |
| relatorio_homens     |
| relatorio_mulheres   |
| telefone             |
+----------------------+

select * from relatorio_estudantes;

+-----------+----------+------+
| MATRÍCULA | nome     | UF   |
+-----------+----------+------+
|         1 | CARLOS   | GO   |
|         2 | LARISSA  | RJ   |
|         3 | MAURICIO | GO   |
|         4 | BRANCO   | GO   |
|         5 | KARLA    | MG   |
|         6 | DENIS    | SP   |
|         7 | MONICA   | RS   |
|         8 | BIANCA   | MG   |
+-----------+----------+------+

DELIMITER &

CREATE PROCEDURE CLIENTE()
  BEGIN

    SELECT 'CLIENTE' AS CLIENTE;

    END
    &

    CALL CLIENTE&
+---------+
| CLIENTE |
+---------+
| CLIENTE |
+---------+

DROP PROCEDURE CLIENTE&


CREATE PROCEDURE ALUNOS()
  BEGIN

    SELECT 'NOME' AS ALUNOS;

    END
    &

     CALL ALUNOS&
+--------+
| ALUNOS |
+--------+
| NOME   |
+--------+


/* procedures com parametros!!! */

SELECT 10 + 10 AS CONTA;

+-------+
| CONTA |
+-------+
|    20 |
+-------+

DELIMITER $

create procedure conta()
BEGIN
    select 10 + 10 as conta;
END
$


call conta$

+-------+
| CONTA |
+-------+
|    20 |
+-------+





DELIMITER $

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN   
    SELECT NUMERO1 + NUMERO2 AS CONTA;

END 
$

 call conta(150, 150)$
+-------+
| CONTA |
+-------+
|   300 |
+-------+


call conta(300,300)$
+-------+
| CONTA |
+-------+
|   600 |
+-------+

call conta(10000,90000)$
+--------+
| CONTA  |
+--------+
| 100000 |
+--------+

call conta(12000,28000)$
+-------+
| CONTA |
+-------+
| 40000 |
+-------+