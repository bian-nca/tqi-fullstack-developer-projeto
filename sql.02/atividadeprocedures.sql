Atividade

1 - Baseado no banco de dados cursores, crie uma procedure que permita atualizar (update) o nome de um vendedor já
cadastrado a partir do código de vendedor;
/*


> VENDEDORES JÁ CADASTRADOS ATÉ ENTÃO!

select * from vendedores;
+------------+---------+-------+--------+--------+
| IDVENDEDOR | NOME    | JAN   | FEV    | MAR    |
+------------+---------+-------+--------+--------+
|          1 | JOAO    | 12343 | 232332 | 546744 |
|          2 | AUGUSTO | 65465 |  65443 | 653454 |
|          3 | MARLA   | 12432 |  65356 |   8756 |
|          4 | LEANDRA |  4567 |   9676 |   8765 |
|          5 | JONAS   |  3467 |  68756 |  99765 |
|          6 | LARISSA | 54786 |  76889 |   7098 |
+------------+---------+-------+--------+--------+

desc vendedores;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDVENDEDOR | int         | NO   | PRI | NULL    | auto_increment |
| NOME       | varchar(50) | YES  |     | NULL    |                |
| JAN        | int         | YES  |     | NULL    |                |
| FEV        | int         | YES  |     | NULL    |                |
| MAR        | int         | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
*/
delimiter %

create procedure atualizar_vendedor(idvend int,
    nomeatualizado varchar(50))
BEGIN
    update vendedores
    set nome = nomeatualizado
    where idvendedor = idvend;
END
%

delimiter ;

call atualizar_vendedor(1, 'BIANCA');

select * from vendedores;
+------------+---------+-------+--------+--------+
| IDVENDEDOR | NOME    | JAN   | FEV    | MAR    |
+------------+---------+-------+--------+--------+
|          1 | BIANCA  | 12343 | 232332 | 546744 |
|          2 | AUGUSTO | 65465 |  65443 | 653454 |
|          3 | MARLA   | 12432 |  65356 |   8756 |
|          4 | LEANDRA |  4567 |   9676 |   8765 |
|          5 | JONAS   |  3467 |  68756 |  99765 |
|          6 | LARISSA | 54786 |  76889 |   7098 |
+------------+---------+-------+--------+--------+

call atualizar_vendedor(2, 'ALVARO');
call atualizar_vendedor(6, 'ANNA FLAVIA');


SELECT * FROM VENDEDORES;

/*
+------------+-------------+-------+--------+--------+
| IDVENDEDOR | NOME        | JAN   | FEV    | MAR    |
+------------+-------------+-------+--------+--------+
|          1 | BIANCA      | 12343 | 232332 | 546744 |
|          2 | ALVARO      | 65465 |  65443 | 653454 |
|          3 | MARLA       | 12432 |  65356 |   8756 |
|          4 | LEANDRA     |  4567 |   9676 |   8765 |
|          5 | JONAS       |  3467 |  68756 |  99765 |
|          6 | ANNA FLAVIA | 54786 |  76889 |   7098 |
+------------+-------------+-------+--------+--------+
*/






Crie o banco de dados de acordo com a estrutura.

CLIENTE: idcliente, nomecliente, sexo, datanascimento, cpf;
CARRINHOCOMPRA: codcarrinho, idcliente, datapedido, numerocompra, total;
ITEMDECOMPRA: codcarrinho, coditem, valorunitario, quantidade, codproduto;
PRODUTO: codproduto, nomeproduto, quantidade;
HISTORICO: codhistorico, dataemissao, anotacao;
ORDEMDECOMPRA: codrequisicaocompra, codproduto, data, quantidade; 

create database supermecado;
use supermecado;


CREATE TABLE CLIENTE(
 idcliente int,
 nomecliente varchar(60),
 sexo enum('S','N'),
 datanascimento date,
 cpf varchar(11),
 CONSTRAINT pk_cliente PRIMARY KEY (idcliente)
);

CREATE TABLE CARRINHOCOMPRA(
 codcarrinho int,
 idcliente int,
 datapedido date,
 numerocompra varchar(12),
 total decimal(10,2),
 CONSTRAINT pk_carrinhocompra PRIMARY KEY (codcarrinho),
 CONSTRAINT pk_carrinhocompra_cliente FOREIGN KEY (idcliente) REFERENCES cliente(idcliente)
);

CREATE TABLE PRODUTO(
 codproduto int,
 nomeproduto varchar(100),
 valorunitario decimal(10,2),
 quantidade int,
 CONSTRAINT pk_produto PRIMARY KEY (codproduto)
);

CREATE TABLE ITEMDECOMPRA(
 codcarrinho int,
 coditem int,
 quantidade int,
 codproduto int,
 CONSTRAINT pk_itemdecompra PRIMARY KEY (codcarrinho, coditem),
 CONSTRAINT fk_codcarrinho FOREIGN KEY (codcarrinho) REFERENCES carrinhocompra (codcarrinho),
 CONSTRAINT fk_itempedido_produto FOREIGN KEY (codproduto) REFERENCES produto (codproduto)
);

CREATE TABLE HISTORICO(
 codhistorico int,
 dataemissao date,
 anotacao varchar(255),
 CONSTRAINT pk_historico PRIMARY KEY (codhistorico)
);

CREATE TABLE ORDEMCOMPRA(
 codrequisicaocompra int,
 codproduto int,
 data date,
 quantidade int,
 CONSTRAINT pk2_ordemcompra PRIMARY KEY (codrequisicaocompra),
 CONSTRAINT fk2_ordemcompra_produto FOREIGN KEY (codproduto) REFERENCES produto (codproduto)
);


INSERT INTO PRODUTO VALUES (1, 'SSD', 249.50, 10);
INSERT INTO PRODUTO VALUES (2, 'Webcam', 789.00, 10);
INSERT INTO PRODUTO VALUES (3, 'Panini', 1990.00, 10);
INSERT INTO PRODUTO VALUES (4, 'Impressora', 678.00, 10);
INSERT INTO PRODUTO VALUES (5, 'Memória Kingston', 329.00, 10);


3. Crie uma procedure para

A. adicionar um novo produto.

/* TABLE PRODUTO(
 codproduto int,
 nomeproduto varchar(100),
 valorunitario decimal(10,2),
 quantidade int,
 CONSTRAINT pk_produto PRIMARY KEY (codproduto)
);

*/

delimiter &

create procedure add_produto(idproduto int, 
    nomeprod varchar(100),
    valorunip decimal(10,2), 
    quantidadep int)
BEGIN
    insert into produto values(idproduto, nomeprod, valorunip, quantidadep);
end
&

call add_produto(6, 'PEN DRIVE KINGSTON 32GB', 62.00, 1)&
call add_produto(7, 'MONITOR DELL 20 POLEGADAS', 1200.00, 2)&
call add_produto(8, 'Notebook Gamer Alienware m15 R6', 11.3900, 1)&
call add_produto(9, 'Monitor Curvo WQHD 34" Dell S3422DWG', 3.998, 1)&
call add_produto(10, 'HEADSET GAMER SEM FIO ALIENWARE TRI-MODE', 1.200, 1)&

select * from produto&
/*
+------------+------------------------------------------+---------------+------------+
| codproduto | nomeproduto                              | valorunitario | quantidade |
+------------+------------------------------------------+---------------+------------+
|          1 | SSD                                      |        249.50 |         10 |
|          2 | Webcam                                   |        789.00 |         10 |
|          3 | Panini                                   |       1990.00 |         10 |
|          4 | Impressora                               |        678.00 |         10 |
|          5 | Memória Kingston                         |        329.00 |         10 |
|          6 | PEN DRIVE KINGSTON 32GB                  |         62.00 |          1 |
|          7 | MONITOR DELL 20 POLEGADAS                |       1200.00 |          2 |
|          8 | Notebook Gamer Alienware m15 R6          |         11.39 |          1 |
|          9 | Monitor Curvo WQHD 34" Dell S3422DWG     |          4.00 |          1 |
|         10 | HEADSET GAMER SEM FIO ALIENWARE TRI-MODE |          1.20 |          1 |
+------------+------------------------------------------+---------------+------------+
*/

B. atualizar o valor unitário do produto usando como parâmetro o seu respectivo código.

/* TABLE PRODUTO(
 codproduto int,
 nomeproduto varchar(100),
 valorunitario decimal(10,2),
 quantidade int,
 CONSTRAINT pk_produto PRIMARY KEY (codproduto)
);


+------------+------------------------------------------+---------------+------------+
| codproduto | nomeproduto                              | valorunitario | quantidade |
+------------+------------------------------------------+---------------+------------+
|          1 | SSD                                      |        249.50 |         10 |
|          2 | Webcam                                   |        789.00 |         10 |
|          3 | Panini                                   |       1990.00 |         10 |
|          4 | Impressora                               |        678.00 |         10 |
|          5 | Memória Kingston                         |        329.00 |         10 |
|          6 | PEN DRIVE KINGSTON 32GB                  |         62.00 |          1 |
|          7 | MONITOR DELL 20 POLEGADAS                |       1200.00 |          2 |
|          8 | Notebook Gamer Alienware m15 R6          |         11.39 |          1 |
|          9 | Monitor Curvo WQHD 34" Dell S3422DWG     |          4.00 |          1 |
|         10 | HEADSET GAMER SEM FIO ALIENWARE TRI-MODE |          1.20 |          1 |
+------------+------------------------------------------+---------------+------------+

*/
%

create procedure atualizar_valorunitario(idproduto int, 
    valorunitnew decimal(10,2))
BEGIN
    update produto
    set valorunitario = valorunitnew
    where codproduto = idproduto;
end
%

call atualizar_valorunitario(8, 24.00)%
call atualizar_valorunitario(10, 1200.00)%
 call atualizar_valorunitario(9, 12000.00)%

 select * from produto%
/*+------------+------------------------------------------+---------------+------------+
| codproduto | nomeproduto                              | valorunitario | quantidade |
+------------+------------------------------------------+---------------+------------+
|          1 | SSD                                      |        249.50 |         10 |
|          2 | Webcam                                   |        789.00 |         10 |
|          3 | Panini                                   |       1990.00 |         10 |
|          4 | Impressora                               |        678.00 |         10 |
|          5 | Memória Kingston                         |        329.00 |         10 |
|          6 | PEN DRIVE KINGSTON 32GB                  |         62.00 |          1 |
|          7 | MONITOR DELL 20 POLEGADAS                |       1200.00 |          2 |
|          8 | Notebook Gamer Alienware m15 R6          |         24.00 |          1 |
|          9 | Monitor Curvo WQHD 34" Dell S3422DWG     |      12000.00 |          1 |
|         10 | HEADSET GAMER SEM FIO ALIENWARE TRI-MODE |       1200.00 |          1 |
+------------+------------------------------------------+---------------+------------+*/


C. deletar um produto usando como parâmetro o seu respectivo código.


delimiter !

create procedure deletar_produto(idproduto int)
BEGIN
    delete from produto
    where codproduto = idproduto;
end
!

call deletar_produto(6)!
call deletar_produto(10)!


 select * from produto!

 /*
+------------+--------------------------------------+---------------+------------+
| codproduto | nomeproduto                          | valorunitario | quantidade |
+------------+--------------------------------------+---------------+------------+
|          1 | SSD                                  |        249.50 |         10 |
|          2 | Webcam                               |        789.00 |         10 |
|          3 | Panini                               |       1990.00 |         10 |
|          4 | Impressora                           |        678.00 |         10 |
|          5 | Memória Kingston                     |        329.00 |         10 |
|          7 | MONITOR DELL 20 POLEGADAS            |       1200.00 |          2 |
|          8 | Notebook Gamer Alienware m15 R6      |         24.00 |          1 |
|          9 | Monitor Curvo WQHD 34" Dell S3422DWG |      12000.00 |          1 |
+------------+--------------------------------------+---------------+------------+

*/

D. Gerar relatório de todos os produtos em ordem ascendente do valor.

delimiter &

create procedure asc_produto()
BEGIN   
    select codproduto as 'CÓDIGO DO PRODUTO', nomeproduto as 'PRODUTO', valorunitario as 'VALOR UNITÁRIO', quantidade as 'Quantidade'
    from produto
    order by valorunitario;
end 
&

 call asc_produto&
 /*
+-------------------+--------------------------------------+----------------+------------+
| CÓDIGO DO PRODUTO | PRODUTO                              | VALOR UNITÁRIO | Quantidade |
+-------------------+--------------------------------------+----------------+------------+
|                 8 | Notebook Gamer Alienware m15 R6      |          24.00 |          1 |
|                 1 | SSD                                  |         249.50 |         10 |
|                 5 | Memória Kingston                     |         329.00 |         10 |
|                 4 | Impressora                           |         678.00 |         10 |
|                 2 | Webcam                               |         789.00 |         10 |
|                 7 | MONITOR DELL 20 POLEGADAS            |        1200.00 |          2 |
|                 3 | Panini                               |        1990.00 |         10 |
|                 9 | Monitor Curvo WQHD 34" Dell S3422DWG |       12000.00 |          1 |
+-------------------+--------------------------------------+----------------+------------+
*/
E. listar produtos em ordem descendente do valor do produto.

delimiter !

create procedure desc_produto()

BEGIN
    select codproduto as 'CÓDIGO DO PRODUTO', nomeproduto as 'PRODUTO', valorunitario as 'VALOR UNITÁRIO', quantidade as 'Quantidade'
    from produto
    order by valorunitario desc;
end
!

call desc_produto!

/*
+-------------------+--------------------------------------+----------------+------------+
| CÓDIGO DO PRODUTO | PRODUTO                              | VALOR UNITÁRIO | Quantidade |
+-------------------+--------------------------------------+----------------+------------+
|                 9 | Monitor Curvo WQHD 34" Dell S3422DWG |       12000.00 |          1 |
|                 3 | Panini                               |        1990.00 |         10 |
|                 7 | MONITOR DELL 20 POLEGADAS            |        1200.00 |          2 |
|                 2 | Webcam                               |         789.00 |         10 |
|                 4 | Impressora                           |         678.00 |         10 |
|                 5 | Memória Kingston                     |         329.00 |         10 |
|                 1 | SSD                                  |         249.50 |         10 |
|                 8 | Notebook Gamer Alienware m15 R6      |          24.00 |          1 |
+-------------------+--------------------------------------+----------------+------------+


*/



