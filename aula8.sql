DROP DATABASE IF EXISTS EXERCICIO;
CREATE DATABASE EXERCICIO;
USE EXERCICIO;

DROP TABLE IF EXISTS B;
DROP TABLE IF EXISTS A;

CREATE TABLE B(
    id_b INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_b VARCHAR(255) NOT NULL
);

CREATE TABLE A(
    id_a INTEGER PRIMARY KEY AUTO_INCREMENT,
    name_a VARCHAR(255) NOT NULL,
    id_b INTEGER,
    FOREIGN KEY (id_b) REFERENCES B(id_b)
);



INSERT INTO B(name_b) VALUES
('q'),
('w'),
('e'),
('r'),
('t'),
('y'),
('u');

/*SELECT * FROM B;*/


INSERT INTO A(name_a, id_b) VALUES
('a', 1),
('s', 4),
('d', null),
('f', 5),
('g', null),
('h', null),
('j', null),
('k', 7),
('l', null);

SELECT * FROM A;


SELECT 
    *
FROM
    B
    WHERE B.id_b NOT IN(
        SELECT 
            B.id_b 
            FROM 
                B
        INNER JOIN A
            ON B.id_b = A.id_b  
    );

        



















