/*Atividade: Crie um banco de dados para registro dos livros na biblioteca
> Necessário guardar os seguintes dados: LIVRO, AUTOR, QUANTAS PÁGINAS, 'SEXO DO LIVRO', ANO DO LIVRO, EDITORA DE PUBLICAÇÃO, 
VALOR DO LIVRO ADQUIRIDO E O ANO ADQUIRIDO, ESTADO DA PUBLICAÇÃO'*/

create database livraria;
    use livraria;

    create table livros(
        livro varchar(100) not null,
        autor varchar(100) not null,
        paginas int(5) not null,
        sexo enum('F', 'M'),
        livro_ano year,
        editora varchar(100) not null,
        valor_livro decimal (5,2) not null, 
        ano_adq year not null,
        estado char(2)
    );

desc livros;

insert into livros values('A mulher na Janela', 'K.J Finn', '230', 'F', '2017', 'INTRISECA', '59.99', '2020', 'MG');
insert into livros values('O pequeno principe', 'Frederick J.K', '120', 'M', '1978', 'PAGANTE', '24.99', '2022', 'SP');
insert into livros values('Deixada para trás', 'Jojo Moyes', '530', 'F', '2002', 'INTRISECA', '34.99', '2018', 'RJ');
insert into livros values('Como eu era antes de Você', 'Jojo Moyes', '384', 'F', '2007', 'INTRISECA', '35.00','2020', 'PR');

/*quantidade total de livros*/

select count(*) as 'quantidade de livros'
from livros;

+----------------------+
| quantidade de livros |
+----------------------+
|                    4 |
+----------------------+

select livro as 'titulo do livro', editora 
from livros;

+---------------------------+-----------+
| tituo do livro            | editora   |
+---------------------------+-----------+
| A mulher na Janela        | INTRISECA |
| O pequeno principe        | PAGANTE   |
| Deixada para trás         | INTRISECA |
| Como eu era antes de Você | INTRISECA |
+---------------------------+-----------+

select livro, estado
from livros
where estado = 'MG';

+--------------------+--------+
| livro              | estado |
+--------------------+--------+
| A mulher na Janela | MG     |
+--------------------+--------+

select livro, sexo
from livros
where sexo = 'M';

+--------------------+------+
| livro              | sexo |
+--------------------+------+
| O pequeno principe | M    |
+--------------------+------+

select livro, sexo
from livros
where sexo = 'F';

+---------------------------+------+
| livro                     | sexo |
+---------------------------+------+
| A mulher na Janela        | F    |
| Deixada para trás         | F    |
| Como eu era antes de Você | F    |
+---------------------------+------+

select autor, sexo, estado as UF
from livros
where sexo = 'F' and (estado= 'SP' or estado='MG');

+----------+------+------+
| autor    | sexo | UF   |
+----------+------+------+
| K.J Finn | F    | MG   |
+----------+------+------+

select livro, autor, sexo, paginas
from livros
where sexo = 'M' and (paginas >50);

+--------------------+---------------+------+---------+
| livro              | autor         | sexo | paginas |
+--------------------+---------------+------+---------+
| O pequeno principe | Frederick J.K | M    |     120 |
+--------------------+---------------+------+---------+