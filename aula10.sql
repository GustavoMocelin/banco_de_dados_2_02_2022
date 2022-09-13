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
 
 ------ VIEW ------
 Crie uma view que retorna todas as transsações. Por linha deve haver;
 
 nome do carro, modelo do carro, no do carro, nome do vendedor, nome do comprador
 */
DROP DATABASE IF EXISTS aula10;

CREATE DATABASE aula10;

USE aula10;

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

SELECT * FROM carros;


















