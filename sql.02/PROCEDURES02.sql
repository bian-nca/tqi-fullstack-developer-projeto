/* treinando recapitulando*/

/*
CREATE DATABASE DOMBOSCO;

    use dombosco;

    CREATE TABLE ALUNOS(
            NUMERO INT,
            NOME VARCHAR(30)
    );

    */

CREATE DATABASE PROJETO;
USE PROJETO;

    CREATE TABLE CURSOS(
        IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
        NOME VARCHAR(30) NOT NULL,
        HORAS INT(30) NOT NULL,
        VALOR FLOAT(10,2) NOT NULL
    );

    INSERT INTO CURSOS VALUES(NULL, 'JAVA', 30,500.00);
    INSERT INTO CURSOS VALUES(NULL,'FUNDAMENTOS DE BANCO DE DADOS', 40, 250.65);


    SELECT * FROM CURSOS;


delimiter #

CREATE PROCEDURE cadastro_cursos(nome VARCHAR(30),
        horas INT(30),
        preco FLOAT(10,2))
    BEGIN
        INSERT INTO CURSOS VALUES(NULL,nome, horas, preco);

    END
    #

call cadastro_cursos('PYTHON', 70, 580.00)#
call cadastro_cursos('ALGORITMOS', 80, 300.00)#
call cadastro_cursos('POO BASICO', 90, 870.00)#

DELIMITER ;

SELECT * FROM CURSOS;

+---------+-------------------------------+-------+--------+
| IDCURSO | NOME                          | HORAS | VALOR  |
+---------+-------------------------------+-------+--------+
|       1 | JAVA                          |    30 | 500.00 |
|       2 | FUNDAMENTOS DE BANCO DE DADOS |    40 | 250.65 |
|       3 | PYTHON                        |    70 | 580.00 |
|       4 | ALGORITMOS                    |    80 | 300.00 |
|       5 | POO BASICO                    |    90 | 870.00 |
+---------+-------------------------------+-------+--------+

CALL cadastro_cursos('BI SQL SERVER',35,3000.00);
CALL cadastro_cursos('POWER BI',20,1000.00);
CALL cadastro_cursos('TABLEAU',30,1200.00);

select * from cursos;
+---------+-------------------------------+-------+---------+
| IDCURSO | NOME                          | HORAS | VALOR   |
+---------+-------------------------------+-------+---------+
|       1 | JAVA                          |    30 |  500.00 |
|       2 | FUNDAMENTOS DE BANCO DE DADOS |    40 |  250.65 |
|       3 | PYTHON                        |    70 |  580.00 |
|       4 | ALGORITMOS                    |    80 |  300.00 |
|       5 | POO BASICO                    |    90 |  870.00 |
|       6 | BI SQL SERVER                 |    35 | 3000.00 |
|       7 | POWER BI                      |    20 | 1000.00 |
|       8 | TABLEAU                       |    30 | 1200.00 |
+---------+-------------------------------+-------+---------+

delimiter #

create procedure consultar_nome_valor()
    BEGIN
        select idcurso, nome as 'matéria', valor
        from cursos;
    END
#
    
 call consultar_nome_valor#
+---------+-------------------------------+---------+
| idcurso | matéria                       | valor   |
+---------+-------------------------------+---------+
|       1 | JAVA                          |  500.00 |
|       2 | FUNDAMENTOS DE BANCO DE DADOS |  250.65 |
|       3 | PYTHON                        |  580.00 |
|       4 | ALGORITMOS                    |  300.00 |
|       5 | POO BASICO                    |  870.00 |
|       6 | BI SQL SERVER                 | 3000.00 |
|       7 | POWER BI                      | 1000.00 |
|       8 | TABLEAU                       | 1200.00 |
+---------+-------------------------------+---------+

create procedure consultar_curso_id(idcursoconsulta int)
BEGIN
    select idcurso, nome as 'materia'
    from cursos
    where idcurso = idcursoconsulta;
END
#

call consultar_curso_id(1)#
+---------+---------+
| idcurso | materia |
+---------+---------+
|       1 | JAVA    |
+---------+---------+

 call consultar_curso_id(7)#
+---------+----------+
| idcurso | materia  |
+---------+----------+
|       7 | POWER BI |
+---------+----------+

 call consultar_curso_id(5)#
+---------+------------+
| idcurso | materia    |
+---------+------------+
|       5 | POO BASICO |
+---------+------------+

create procedure consultar_nome(nomecurso varchar(30))
BEGIN
    select idcurso, nome as 'materia', horas, valor
    from cursos
    where nome = nomecurso;
END
#

call consultar_nome("JAVA")#
+---------+---------+-------+--------+
| idcurso | materia | horas | valor  |
+---------+---------+-------+--------+
|       1 | JAVA    |    30 | 500.00 |
+---------+---------+-------+--------+

 call consultar_nome("PYTHON")#
+---------+---------+-------+--------+
| idcurso | materia | horas | valor  |
+---------+---------+-------+--------+
|       3 | PYTHON  |    70 | 580.00 |
+---------+---------+-------+--------+
