CREATE DATABASE IF NOT EXISTS aprenderjoin CHARACTER SET utf8mb4;
USE aprenderjoin;


DROP TABLE IF EXISTS garcom_restaurantes;
DROP TABLE IF EXISTS garcom;
DROP table IF EXISTS restaurantes;
DROP table IF EXISTS cidade;
DROP table IF EXISTS estado;

CREATE TABLE estado (
    id_estado INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    regiao ENUM('sul','sudeste','centro-oeste','nordeste','norte')
);


CREATE TABLE cidade (
    id_cidade INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    id_estado INTEGER NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);


INSERT INTO
    estado (nome, regiao)
VALUES
    ('Parana','sul'),
    ('Sao Paulo','sudeste'),
    ('Rio de Janeiro','sudeste'),
    ('Bahia','nordeste'),
    ('Pernambuco','nordeste'),
    ('Para','norte'),
    ('Mato Grosso','centro-oeste');

SET @idParana:=(SELECT id_estado FROM estado WHERE estado.nome = "Parana");
SET @idSaoPaulo:=(SELECT id_estado FROM estado WHERE estado.nome = "Sao Paulo");
SET @idRioDeJaneiro:=(SELECT id_estado FROM estado WHERE estado.nome = "Rio de Janeiro");
SET @idBahia:=(SELECT id_estado FROM estado WHERE estado.nome = "Bahia");
SET @idPernambuco:=(SELECT id_estado FROM estado WHERE estado.nome = "Pernambuco");
SET @idPara:=(SELECT id_estado FROM estado WHERE estado.nome = "Para");
SET @idMatoGrosso:=(SELECT id_estado FROM estado WHERE estado.nome = "Mato Grosso");

INSERT INTO cidade (nome, id_estado) VALUES 
    ('Curitiba', @idParana),
    ('Londrina', @idParana),
    ('Paranagua', @idParana),
    ('Sao Paulo', @idSaoPaulo),
    ('Sorocaba', @idSaoPaulo),
    ('Rio de Janeiro', @idRioDeJaneiro),
    ('Niteroi', @idRioDeJaneiro),
    ('Mage', @idRioDeJaneiro),
    ('Porto Real', @idRioDeJaneiro),
    ('Petropoles', @idRioDeJaneiro),
    ('Salvador', @idBahia),
    ('Feira de Santana', @idBahia),
    ('Recife', @idPernambuco),
    ('Olinda', @idPernambuco),
    ('Petrolina', @idPernambuco),   
    ('Belem', @idPara),
    ('Cuiaba', @idMatoGrosso);


SELECT * FROM cidade;


SELECT nome FROM estado WHERE id_estado = (SELECT id_estado FROM cidade WHERE nome ='Petropoles');

SELECT 
    *
FROM 
    cidade
INNER JOIN 
    estado ON  estado.id_estado = cidade.id_estado 
WHERE
    cidade.nome = 'Petropoles';



CREATE TABLE restaurantes (
    id_restaurante INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    descricao VARCHAR(255),
    id_cidade INTEGER,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

SET @idCuritibaCidade := (SELECT    id_cidade       FROM cidade WHERE nome = 'Curitiba');
SET @idSaoPauloCidade := (SELECT    id_cidade       FROM cidade WHERE nome = 'Sao Paulo');
SET @idRiodeJaneiroCidade := (SELECT id_cidade   FROM cidade WHERE nome = 'Rio de Janeiro');
SET @idPetropolesCidade := (SELECT id_cidade     FROM cidade WHERE nome = 'Petropoles');
SET @idFeiraDeSantanaCidade := (SELECT id_cidade FROM cidade WHERE nome = 'Feira de Santana');

select @idFeiraDeSantanaCidade as 'cidade';

INSERT INTO restaurantes (nome, descricao, id_cidade) VALUES
    ('Comida Mineira','Comida tipica de minas, voc?? nao viu o no nome?',@idCuritibaCidade),
    ('Fogo de Chao','Acho que ve costela de fogo de ch??o',@idSaoPauloCidade),
    ('Frang??o','Uma homenagem a odos os galeiros frangos',@idRiodeJaneiroCidade),
    ('Pizza Maromba','S?? pode comer aqui se voc?? usa bomba',@idPetropolesCidade),
    ('Pertuti','Sei la, j?? tou sem ideia para descricao',@idFeiraDeSantanaCidade);


SELECT * FROM restaurantes;



SELECT 'restaurantes antes -------------' as 'INFO';

SELECT 
    *
FROM
    restaurantes
INNER JOIN cidade ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    restaurantes.nome = 'Comida Mineira';

SELECT 'cidades antes -------------' as 'INFO';

SELECT 
    *
FROM
    cidade
INNER JOIN restaurantes ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    restaurantes.nome = 'Comida Mineira';




SELECT 'controlando colunas -------------' as 'INFO';


SELECT 
    cidade.nome            as nome_da_cidade,
    restaurantes.nome      as nome_do_restaurante,
    restaurantes.descricao as descricao_do_restaurante
FROM
    cidade
INNER JOIN 
    restaurantes 
        ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    restaurantes.nome = 'Comida Mineira';



SELECT 'com like -------------' as 'INFO';


SELECT 
    cidade.nome            as nome_da_cidade,
    restaurantes.nome      as nome_do_restaurante,
    restaurantes.descricao as descricao_do_restaurante
FROM
    cidade
INNER JOIN 
    restaurantes 
        ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    restaurantes.nome LIKE '%M%';



SELECT 'transformando em uma tabela -------------' as 'INFO';

SELECT
    t1.nome_da_cidade,
    t1.nome_do_restaurante
FROM
(
    SELECT 
        cidade.nome            as nome_da_cidade,
        restaurantes.nome      as nome_do_restaurante,
        restaurantes.descricao as descricao_do_restaurante
    FROM
        cidade
    INNER JOIN 
        restaurantes 
            ON restaurantes.id_cidade = cidade.id_cidade
    WHERE
        restaurantes.nome LIKE '%M%'
) as t1  

WHERE
    t1.nome_da_cidade = 'Curitiba'
;



SELECT 'com mais de um INNER JOIN -------------' as 'INFO';

SELECT 
    cidade.nome as nome_da_cidade,
    estado.nome as nome_do_estado,
    restaurantes.nome as nome_do_restaurante
FROM 
    restaurantes
INNER JOIN
    cidade
        ON restaurantes.id_cidade = cidade.id_cidade
INNER JOIN
    estado
        ON cidade.id_estado = estado.id_estado
WHERE
    restaurantes.nome LIKE "Comida M%";





INSERT INTO restaurantes (nome, descricao) VALUES
    ('Restaurante que nao esta em cidade alguma','Descricao ja esta no nome');


SELECT 
    "Fazendo busca com cidade na esquerda em registro sem relacao entre ambas tabelas"
AS
    "LOG";

SELECT
    * 
FROM
    cidade
INNER JOIN
    restaurantes
    ON
        cidade.id_cidade = restaurantes.id_cidade
WHERE
    restaurantes.nome = 'Restaurante que nao esta em cidade alguma';


SELECT 
    "Fazendo busca com restaurante na esquerda em registro sem relacao entre ambas tabelas"
AS
    "LOG";

SELECT
    * 
FROM
    restaurantes
INNER JOIN
    cidade
    ON
        cidade.id_cidade = restaurantes.id_cidade
WHERE
    restaurantes.nome = 'Restaurante que nao esta em cidade alguma';


SELECT 
    "Traga tudo"
AS
    "LOG";

SELECT
    cidade.nome,
    restaurantes.nome 
FROM
    restaurantes
INNER JOIN
    cidade
    ON
        cidade.id_cidade = restaurantes.id_cidade;


INSERT INTO restaurantes (nome, descricao, id_cidade) VALUES
    ('Mc Donalds',  '3 Bigmacs',             @idCuritibaCidade),
    ('Habbibs',     'Homem bomba',           @idCuritibaCidade),
    ('Terrazo',     'Restaurante de rico',   @idCuritibaCidade),
    ('Calabouco',   'mais rico ainda',       @idCuritibaCidade);


SELECT 
    * 
FROM 
    restaurantes
INNER JOIN 
    cidade ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    cidade.nome = 'Curitiba';



INSERT INTO restaurantes (nome, descricao, id_cidade) VALUES
    ('Comida Mineira','Comida tipica de minas, voc?? nao viu o no nome?',@idSaoPauloCidade);


SELECT 
    * 
FROM 
    restaurantes
INNER JOIN 
    cidade ON restaurantes.id_cidade = cidade.id_cidade
WHERE
    cidade.nome IN ('Curitiba','Sao Paulo');



CREATE TABLE garcom (
    id_garcom INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    experiencia ENUM('junior', 'pleno', 'senior'),
    tipo_documento ENUM('cpf','rg'),
    documento VARCHAR(255)
);

INSERT INTO 
    garcom (nome, experiencia, tipo_documento, documento)
VALUES
    ('Jorge','junior','cpf',    '08600000000'),
    ('Fernando','pleno','cpf',  '08600000000'),
    ('Roberto','pleno','rg',    '100000000'),
    ('Alexandre','pleno','rg',  '100000000'),    
    ('Odair','pleno','rg',      '100000000'),
    ('Gerson','senior','cpf',   '08600000000'),
    ('Pedro','senior','cpf',    '08600000000'),
    ('Joao','senior','cpf',     '08600000000');

SELECT * FROM garcom;        



CREATE TABLE garcom_restaurantes (
    id_restaurante INTEGER NOT NULL,
    id_garcom INTEGER NOT NULL,
    dia_semana ENUM('segunda', 'terca', 'quarta', 'quinta', 'sexta', 'sabado', 'domingo'),
    FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id_restaurante),
    FOREIGN KEY (id_garcom) REFERENCES garcom(id_garcom)        
);

INSERT INTO 
    garcom_restaurantes (id_restaurante, id_garcom, dia_semana)
VALUES
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Pizza Maromba'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jorge'),
        'segunda'         
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Pertuti'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jorge'),
        'terca'
    ),

    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Restaurante que nao esta em cidade alguma'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jorge'),
        'quarta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Mc Donalds'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jorge'),
        'quinta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Calabouco'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jorge'),
        'sexta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Pizza Maromba'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Jorge'),
        'segunda'         
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Pertuti'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Gerson'),
        'terca'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Mc Donalds'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Gerson'),
        'quinta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Calabouco'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Gerson'),
        'sexta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Pizza Maromba'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Odair'),
        'segunda'         
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Pertuti'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Odair'),
        'terca'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Restaurante que nao esta em cidade alguma'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Odair'),
        'quarta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Mc Donalds'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Odair'),
        'quinta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Calabouco'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Odair'),
        'sexta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Pizza Maromba'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Alexandre'),
        'segunda'         
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Pertuti'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Alexandre'),
        'terca'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Restaurante que nao esta em cidade alguma'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Alexandre'),
        'quarta'
    ),
    (
        (SELECT id_restaurante FROM restaurantes WHERE restaurantes.nome = 'Mc Donalds'),
        (SELECT id_garcom FROM garcom WHERE garcom.nome = 'Alexandre'),
        'quinta'
    );
    
SELECT
    garcom.nome as nome_garcom,
    restaurantes.nome as nome_restaurante,
    garcom_restaurantes.dia_semana as dia_semana
FROM
    garcom
INNER JOIN
    garcom_restaurantes ON garcom.id_garcom = garcom_restaurantes.id_garcom
INNER JOIN
    restaurantes ON garcom_restaurantes.id_restaurante = restaurantes.id_restaurante
WHERE
    garcom.nome IN ('Jorge', 'Odair', 'Gerson'); 







