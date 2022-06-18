create database meubanco;
use meubanco;
create table clientes(
	nome varchar(30) not null,
    cpf varchar(20),
    sexo enum('F', 'M') not null,
    email varchar(50) not null,
    endereco varchar(100) not null,
    telefone varchar(15) not null
    );
 
    desc clientes;

 +----------+---------------+------+-----+---------+-------+
| Field    | Type          | Null | Key | Default | Extra |
+----------+---------------+------+-----+---------+-------+
| nome     | varchar(30)   | NO   |     | NULL    |       |
| cpf      | varchar(20)   | YES  |     | NULL    |       |
| sexo     | enum('F','M') | NO   |     | NULL    |       |
| email    | varchar(50)   | NO   |     | NULL    |       |
| endereco | varchar(100)  | NO   |     | NULL    |       |
| telefone | varchar(15)   | NO   |     | NULL    |       |
+----------+---------------+------+-----+---------+-------+
    
     insert into clientes values('Bianca Narciso', '038.321.342-89', 'F', 'bianca.ohs@Gmail.com', 'Rua Dr Ciro Palmerston, 416, Santa Terezinha', '(34) 997787869');
     insert into clientes values('Steve', '231.343.222-00', 'M', 'steve.harrigton@uol.com', 'Rua Itatiaia, 327, Santo Antonio', '(34) 988340342');
	 insert into clientes values('Joao alberto', '232.111.111-29','M', 'joao@uol.com','Rua Das quedas, 340, Almeidas',  '(34) 9932232');
     
     select * from clientes;

+----------------+----------------+------+-------------------------+----------------------------------------------+----------------+
| nome           | cpf            | sexo | email                   | endereco                                     | telefone       |
+----------------+----------------+------+-------------------------+----------------------------------------------+----------------+
| Bianca Narciso | 038.321.342-89 | F    | bianca.ohs@Gmail.com    | Rua Dr Ciro Palmerston, 416, Santa Terezinha | (34) 997787869 |
| Steve          | 231.343.222-00 | M    | steve.harrigton@uol.com | Rua Itatiaia, 327, Santo Antonio             | (34) 988340342 |
| Joao alberto   | 232.111.111-29 | M    | joao@uol.com            | Rua Das quedas, 340, Almeidas                | (34) 9932232   |
+----------------+----------------+------+-------------------------+----------------------------------------------+----------------+



/* consultar apenas a coluna nome que foi definida como clientes e a coluna email da tabela clientes*/


select nome as 'clientes', email from clientes;
+----------------+-------------------------+
| clientes       | email                   |
+----------------+-------------------------+
| Bianca Narciso | bianca.ohs@Gmail.com    |
| Steve          | steve.harrigton@uol.com |
| Joao alberto   | joao@uol.com            |
+----------------+-------------------------+
 
 /*consultar apenas a coluna nome e telefone da tabela clientes*/

select nome, telefone 
from clientes;
+----------------+----------------+
| nome           | telefone       |
+----------------+----------------+
| Bianca Narciso | (34) 997787869 |
| Steve          | (34) 988340342 |
| Joao alberto   | (34) 9932232   |
+----------------+----------------+

/*consultar apenas a coluna nome e sexo da tabela clientes*/

select nome, sexo 
from clientes;
+----------------+------+
| nome           | sexo |
+----------------+------+
| Bianca Narciso | F    |
| Steve          | M    |
| Joao alberto   | M    |
+----------------+------+

     select nome, sexo /*Irá consultar a coluna nome e sexo apenas dos clientes que tem o sexo como 'Feminino'*/
     from clientes
     where sexo = 'F';


+----------------+------+
| nome           | sexo |
+----------------+------+
| Bianca Narciso | F    |
+----------------+------+

     select nome, sexo /*Irá consultar a coluna nome e sexo apenas dos clientes que têm o sexo como 'Masculino'*/
     from clientes
     where sexo = 'M';

+--------------+------+
| nome         | sexo |
+--------------+------+
| Steve        | M    |
| Joao alberto | M    |
+--------------+------+

    select count(*) as clientes /* Irá fazer uma consulta onde mostrará a quantidade de clientes que tem no meu banco de dados*/
    from clientes;

+----------+
| clientes |
+----------+
|        3 |
+----------+