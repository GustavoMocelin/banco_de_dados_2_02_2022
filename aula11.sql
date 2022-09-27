DROP DATABASE IF EXISTS aula8;
CREATE DATABASE aula8;

USE aula8;

CREATE TABLE IF NOT EXISTS editora(
    editora_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

INSERT INTO editora (nome, endereco) VALUES
    ('Abril', 'Rua Abcd 111'),
    ('Madras', 'Rua Dcb 222'),
    ('Globo', 'Rua Xsg 222');

SELECT * FROM editora;
show index FROM editora;

/* EXPLAIN SELECT * FROM editora WHERE nome = 'Globo'; */

CREATE INDEX idx_editora ON editora(nome);

show index FROM editora;

EXPLAIN SELECT * FROM editora WHERE nome = 'Globo';
/* 
SELECT * FROM editora;
DROP TABLE editora;

CREATE TABLE IF NOT EXISTS editora(
    editora_id INTEGER,
    nome VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

INSERT INTO editora (nome, endereco) VALUES
    ('Abril', 'Rua Abcd 111'),
    ('Madras', 'Rua Dcb 222'),
    ('Globo', 'Rua Xsg 222');

SEM INDICE RETORNA VAZIO

show index FROM editora;
*/























