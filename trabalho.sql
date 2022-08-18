/* 1 */
USE mysql;

CREATE DATABASE tabela_pets;

USE tabela_pets;

DROP TABLE IF EXISTS pet;

CREATE TABLE pet (
    id_pet              INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome                VARCHAR(255) NOT NULL,
    tipo                ENUM("CACHORRO","GATO"),
    raca                VARCHAR(255) NOT NULL,
    created_at          DATETIME DEFAULT NOW()
);

DESCRIBE pet;

INSERT INTO pet (
    nome,
    tipo,
    raca
)
    VALUES
(
    'FEIJAO',
    'CACHORRO',
    'VIRALATA'
),
(
    'PUFF',
    'CACHORRO',
    'POODLE'
),
(
    'PANDORA',
    'CACHORRO',
    'VIRALA'
),
(
    'LESSI',
    'CACHORRO',
    'LABRADOR'
),
(
    'JADE',
    'CACHORRO',
    'VIRALATA'
),
(
    'XUXA',
    'CACHORRO',
    'POODLE'
),
(
    'ZOUI',
    'CACHORRO',
    'DAUCHER'
),
(
    'CACAU',
    'CACHORRO',
    'DAUCHER'
),
(
    'CARAMELO',
    'CACHORRO',
    'VIRALATA'
),
(
    'PINTADO',
    'CACHORRO',
    'VIRALATA'
),
(
    'AMON',
    'GATO',
    'PERSA'
),
(
    'ARES',
    'GATO',
    'PERSA'
),
(
    'AQUILES',
    'GATO',
    'PERSA'
),
(
    'DRACO',
    'GATO',
    'SIAMES'
),
(
    'BELINHA',
    'GATO',
    'SIAMES'
),
(
    'ALFA',
    'GATO',
    'SIAMES'
),
(
    'AMORA',
    'GATO',
    'MAINE'
),
(
    'CHICO',
    'GATO',
    'MAINE'
),
(
    'FIONA',
    'GATO',
    'BENGAL'
),
(
    'MAIA',
    'GATO',
    'BENGAL'
);

/* 2 */
SELECT * FROM pet;

/* 3 */
SELECT * FROM pet order by id_pet DESC LIMIT 3;

/* 4 */
SELECT * FROM pet order by id_pet DESC LIMIT 3;