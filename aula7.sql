DROP DATABASE IF EXISTS aprendendoleft;

CREATE DATABASE aprendendoleft;

DROP TABLE IF EXISTS classe;
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS professores;

USE aprendendoleft;

CREATE TABLE classe(
    id_classe INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_classe VARCHAR(4) NOT NULL,
    descricao TEXT,
    ano VARCHAR(4) NOT NULL
);

CREATE TABLE alunos (
    id_aluno INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    id_classe INTEGER,
    FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);

CREATE TABLE professores (
    id_professor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    id_classe INTEGER,
    FOREIGN KEY (id_classe) REFERENCES classe(id_classe)
);

INSERT INTO
    classe (nome_classe, descricao, ano)
VALUES
    ('A', 'turma que entrou no inicio do ano', '2021'),
    ('B', 'turma que entrou no meio do ano', '2021');

INSERT INTO
    alunos (nome, sobrenome, documento, id_classe)
VALUES
    ('Bruno', 'Sobrenome do Bruno', 'xx.xxx.xxx.x', 1),
    ('Bryan', 'Sobrenome do Bryan', 'xx.xxx.xxx.x', 1),
    ('Leandro', 'Sobrenome do Leandro', 'xx.xxx.xxx.x', 1),
    ('Luan', 'Sobrenome do Luan', 'xx.xxx.xxx.x', 1),
    ('Lucas', 'Sobrenome do Lucas', 'xx.xxx.xxx.x', 2),
    ('Aryon', 'Sobrenome do Aryon', 'xx.xxx.xxx.x', 2),
    ('Raphael', 'Sobrenome do Raphael', 'xx.xxx.xxx.x', 2),
    ('Leticia', 'Sobrenome do Leticia', 'xx.xxx.xxx.x', 2),
    ('Pedro', 'Sobrenome do Pedro', 'xx.xxx.xxx.x', 2),
    ('Guilherme', 'Sobrenome do Guilherme', 'xx.xxx.xxx.x', 2);

INSERT INTO professores (
    nome,
    sobrenome,
    documento
) VALUES 
    ('Professor E', 'Sobre nome Professor A', 'XX.XXX.XXX-X');

INSERT INTO 
    alunos (nome, sobrenome, documento)
VALUES
    ('Ernani', 'Sobrenome do Ernani', 'xx.xxx.xxx.x');


/* ALUNOS */

SELECT 'ALUNOS - INNER JOIN' AS 'LOG';

SELECT 
    alunos.nome
FROM 
    alunos
INNER JOIN 
    classe 
    ON 
    alunos.id_classe = classe.id_classe;

SELECT 'ALUNOS - LEFT JOIN' AS 'LOG';

SELECT 
    alunos.nome
FROM 
    alunos
LEFT JOIN 
    classe 
    ON 
    alunos.id_classe = classe.id_classe;    


SELECT 'ALUNOS - RIGHT JOIN' AS 'LOG';

SELECT 
    alunos.nome
FROM 
    alunos
RIGHT JOIN 
    classe 
    ON 
    alunos.id_classe = classe.id_classe;   

/* FECHA ALUNOS */

/* PROFESSORES 
- left right inner professores x classe(prof sempre a esquerda)
*/
SELECT 'PROFESSOR - LEFT JOIN' AS 'LOG';

SELECT 
    professores
FROM 
    professores
LEFT JOIN 
    classe 
    ON 
    professores.id_classe = classe.id_classe; 
/* -----------------------------------------*/

SELECT 'PROFESSOR - RIGHT JOIN' AS 'LOG';

SELECT 
    professores
FROM 
    professores
RIGHT JOIN 
    classe 
    ON 
    professores.id_classe = classe.id_classe; 
/* -----------------------------------------*/

SELECT 'PROFESSOR - INNER JOIN' AS 'LOG';

SELECT 
    professores
FROM 
    professores
INNER JOIN 
    classe 
    ON 
    professores.id_classe = classe.id_classe; 

/* - left right inner professores x classe(prof sempre a direita) */
    
SELECT 'PROFESSOR - LEFT JOIN' AS 'LOG';

SELECT 
    professores
FROM 
    classe 
LEFT JOIN 
    professores
    ON 
    professores.id_classe = classe.id_classe; 
/* -----------------------------------------*/

SELECT 'PROFESSOR - RIGHT JOIN' AS 'LOG';

SELECT 
    professores
FROM 
    classe 
RIGHT JOIN 
    professores
    ON 
    professores.id_classe = classe.id_classe; 
/* -----------------------------------------*/

SELECT 'PROFESSOR - INNER JOIN' AS 'LOG';

SELECT 
    professores
FROM 
    classe 
INNER JOIN 
    professores
    ON 
    professores.id_classe = classe.id_classe; 

/* FECHA PROFESSORES */
