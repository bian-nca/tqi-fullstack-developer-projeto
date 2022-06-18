create database empresa;
    use empresa;
        create table funcionarios(
            idFuncionario int(11),
            nome varchar(100),
            email varchar(200),
            sexo varchar(10),
            departamento varchar(100),
            admissao varchar(10),
            salario int(11),
            cargo varchar(100),
            idRegiao int(11)
        );

        desc funcionarios;

        > 975 inserts foram colocados para essa atividade

        /* ATIVIDADE UTILIZANDO ESSE BANCO DE DADOS EMPRESA */

    01) CRIE A QUERY QUE EXIBA A QUANTIDADE DE FUNCIONÁRIOs

        select count(*) idFuncionario
        from funcionarios;


    02) CRIE A QUERY QUE EXIBA FUNCIONÁRIOS QUE TRABALHAM NO DEPTO DE FILMES OU NO DEPTO DE ROUPAS

        select idfuncionario, nome, sexo, departamento
        from funcionarios
        where (departamento = 'FILMES')
        OR (departamento = 'ROUPAS');


    03) QUANTOS FUNCIONÁRIOS TRABALHAM NO DEPTO DE FILMES E NO DEPTO DE ROUPAS

select count (*) idFuncionario, departamento
from funcionarios
where departamento = 'Filmes';  (21 funcionarios)

select count(*) idFuncionario, departamento
from funcionarios
where departamento = 'Roupas'; (53 funcionarios)

select count(*) idFuncionario, departamento
from funcionarios
where departamento = 'Filmes'
or departamento = 'Roupas';   (74 funcionarios)
posso tirar o "departamento" na primeira linha para mostrar apenas a contagem!

    04) DOS FUNCIONÁRIOS, QUANTOS SÃO DO SEXO FEMININO?

            select count(*) idFuncionario, sexo
            from funcionarios
            where sexo = 'Feminino';
            
            491 funcionarias; 

    05) EXIBA A LISTA DE FUNCIONARIOS FEMININO QUE TRABALHAM NO DEPTO DE LAR OU DE FILMES INCLUA O EMAIL DESSAS PROFISSIONAIS NA LISTA

   select idFuncionario, nome, sexo, email, departamento
   from funcionarios
   where sexo = 'Feminino'
   and (departamento = 'LAR' or departamento = 'FILMES');


    06) EXIBA OS FUNCIONARIOS DO SEXO MASCULINO (QUANTIDADE)

    select count(*) idFuncionario, sexo
    from funcionarios
    where sexo = 'Masculino';

482 funcionarios masculinos;

    07) EXIBA OS FUNCIONARIOS DO SEXO MASCULINO QUE SAO DO SETOR ELETRONICOS

select idFuncionario, nome, sexo, departamento
from funcionarios
where sexo = 'Masculino'
and departamento = 'Eletronicos';