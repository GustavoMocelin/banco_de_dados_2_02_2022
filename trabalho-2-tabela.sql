/* Aluno: Gustavo Mocelin */
DROP DATABASE IF EXISTS trabalho_view;
CREATE DATABASE trabalho_view;

USE trabalho_view;

DROP TABLE IF EXISTS pais;
DROP TABLE IF EXISTS cidade;

CREATE TABLE pais(
    id_pais INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
);

CREATE TABLE cidade(
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    id_pais INTEGER,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

INSERT INTO pais(nome) VALUES 
    ("Brasil"),
    ("Estados Unidos"),
    ("Mexico"),
    ("Argentina");

INSERT INTO cidade(nome,id_pais) VALUES 
    ("Araucaria", 1),
    ("Curitiba", 1),
    ("Sao Paulo", 1),
    ("Orlando", 2),
    ("New York", 2),
    ("San Francisco", 2),
    ("Cancun", 3),
    ("Guadalajara", 3),
    ("Tijuana", 3),
    ("Buenos Aires", 4),
    ("Rosario", 4),
    ("Mendoza", 4);


DROP VIEW IF EXISTS pais_e_cidades;

CREATE
    VIEW pais_e_cidades 
as(
    SELECT
        pais.nome as nome_pais,
        cidade.nome as nome_cidade
    FROM
        pais
    INNER JOIN
            cidade
    ON
    pais.id_pais = cidade.id_pais
);

SELECT * FROM pais_e_cidades;