/*
 ----- CARROS ----
 CRIE UMA tabela de carros com as seguintes colunas
 
 id_carro, nome, modelo, ano
 
 Insira
 Chevette, Chevette , 1995
 Gol, Volkswagem , 2010
 Onix, Chevrolet, 2020
 
 ----- VENDEDORES ----
 Crie uma tabela de vendedores com as seguintes colunas
 
 id_vendedor, nome, sobrenome, cpf
 Jose , Silva, xxx.xxx.xxx-xx
 Fabio, Lima, xxx.xxx.xxx-xx
 
 ------COMPRADORES ------
 
 Crie uma tabela de compradores com as seguintes colunas
 
 id_comprador, nome, sobrenome, cpf
 Odair, Silveira,xxx.xxx.xxx-xx
 
----- Relacao ------

Crie uma tabela que relaciona compradores vendedores e carros

comp_vend_carro
id_comp_vend_carro, id_id_comprador, id_vendedor, id_carro




 ------ VIEW ------
 Crie uma view que retorna todas as transsações. Por linha deve haver;
 
 nome do carro, modelo do carro, no do carro, nome do vendedor, nome do comprador
 */
DROP DATABASE IF EXISTS aula10;

CREATE DATABASE aula10;

USE aula10;

DROP TABLE IF EXISTS carros;
DROP TABLE IF EXISTS vendedores;
DROP TABLE IF EXISTS compradores;
DROP TABLE IF EXISTS comp_vend_carro;


/* CARROS */
CREATE TABLE carros(
    id_carro INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    ano INTEGER
);

INSERT INTO carros(nome, modelo, ano) VALUES
    ('Chevette', 'Chevette', 1995),
    ('Gol', 'Volkswagem', 2010),
    ('Onix', 'Chevrolet', 2020);
/* SELECT * FROM carros; */


/* VENDEDORES */
CREATE TABLE vendedores(
    id_vendedor INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL
);

INSERT INTO vendedores(nome, sobrenome, cpf) VALUES
    ('Jose', 'Silva', 'xxx.xxx.xxx-xx'),
    ('Fabio', 'Lima', 'xxx.xxx.xxx-xx');
/* SELECT * FROM vendedores; */

/* COMPRADORES */
CREATE TABLE compradores(
    id_comprador INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    status_cpf ENUM("OK","NAOOK"),
);

INSERT INTO compradores(nome, sobrenome, cpf) VALUES
    ('Odair', 'Silveira', 'xxx.xxx.xxx-xx', 'OK'),
    ('Jeronimo', 'Dois', 'xxx.xxx.xxx-xx', 'NAOOK');
/* SELECT * FROM compradores;*/

CREATE TABLE comp_vend_carro(
    id_comp_vend_carro INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_comprador INTEGER,
    id_vendedor INTEGER,
    id_carro INTEGER,
    FOREIGN KEY (id_comprador) REFERENCES compradores(id_comprador),
    FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor),
    FOREIGN KEY (id_carro) REFERENCES carros(id_carro)
);


INSERT INTO comp_vend_carro(id_comprador, id_vendedor,id_carro) VALUES (
    (SELECT id_comprador FROM compradores WHERE nome = 'Odair'),
    (SELECT id_vendedor FROM vendedores WHERE nome = 'Jose'),
    (SELECT id_carro FROM carros WHERE nome = 'Gol')
);    

/* SELECT * FROM comp_vend_carro; */

/*
SELECT 
    compradores.nome,
    vendedores.nome,
    carros.nome,
    carros.ano
FROM
    comp_vend_carro 
INNER JOIN
    carros 
    ON comp_vend_carro.id_carro = carros.id_carro
INNER JOIN
    vendedores 
    ON comp_vend_carro.id_vendedor = vendedores.id_vendedor
INNER JOIN
    compradores 
    ON comp_vend_carro.id_comprador = compradores.id_comprador;
   */  

DROP VIEW IF EXISTS select_all_aula10;

CREATE
    VIEW select_all_aula10 
as(
    select 
        carros.nome,
        carros.modelo,
        carros.ano
    from
        carros
    INNER JOIN
            comp_vend_carro
                    ON
                    carros.id_carro = comp_vend_carro.id_carro
    INNER JOIN
            vendedores
                    ON
                    comp_vend_carro.id_vendedor = vendedores.id_vendedor
    INNER JOIN
            compradores
                    ON
                    compradores.id_comprador = comp_vend_carro.id_comprador
);

SELECT * FROM select_all_aula10;

SELECT
    compradores.status_cpf
FROM
    compradores
WHERE
    status_cpf = "OK";




















