drop database if exists estoque;
create database estoque;

use estoque;

drop table if exists usuarios;
drop table if exists cargos;
drop table if exists empresas;
drop table if exists produtos;
drop table if exists clientes;
drop table if exists clientes_produtos;
drop table if exists usuarios_produtos;

create table cargos (
    id_cargo integer not null primary key auto_increment,
    cargo varchar(255)
);

desc cargos;

create table usuarios (
    id_usuario integer not null primary key auto_increment,
    nome_usuario varchar(255),
    endereco_usuario varchar(255),
    id_cargo integer,
    foreign key (id_cargo) references cargos (id_cargo)
);

desc usuarios;

create table empresas (
    id_empresa integer not null primary key auto_increment,
    nome_empresa varchar(255)
);

desc empresas;

create table produtos (
    id_produto integer not null primary key auto_increment,
    nome_produto varchar(255),
    preco_compra float,
    preco_venda float,
    quantidade integer,
    id_empresa integer,
    foreign key (id_empresa) references empresas (id_empresa)
);

desc produtos;

create table clientes (
    id_cliente integer not null primary key auto_increment,
    nome_cliente varchar(255),
    cpf_cnpj_cliente varchar(255),
    endereco_cliente varchar(255)
);

desc clientes;

create table clientes_produtos (
    id_cliente integer,
    id_produto integer,
    foreign key (id_cliente) references clientes (id_cliente),
    foreign key (id_produto) references produtos (id_produto)
);

desc clientes_produtos;

create table usuarios_produtos (
    id_usuario integer,
    id_produto integer,
    foreign key (id_usuario) references usuarios (id_usuario),
    foreign key (id_produto) references produtos (id_produto)
);

desc usuarios_produtos;

insert into cargos (cargo) values
('Vendedor'),
('Secretario'),
('Gerente'),
('Diretor');

select * from cargos;

insert into usuarios (nome_usuario, endereco_usuario, id_cargo) values
('Alex', 'Rua das Alexes, 233', 1),
('Mario', 'Rua dos Mario, 555', 4),
('Janaina', 'Av. Janaina, 32', 1),
('Maria', 'Rua das Marias, 43', 3),
('Jonathan', 'Rua dos Maromba, 111', 2);

select * from usuarios;

insert into empresas (nome_empresa) values
('Sony'),
('Microsoft'),
('Nintendo');

select * from empresas;

insert into produtos (nome_produto, preco_compra, preco_venda, quantidade, id_empresa) values
('PlayStation 5 Digital Edition', 3800, 4500, 15, 1),
('Xbox Series S', 1500, 2200, 20, 2),
('Xbox Series X', 4000, 4800, 8, 2),
('Nintendo Switch Lite', 2260, 3000, 12, 3),
('DualShock 5', 250, 400, 32, 1),
('Mario Collection', 150, 300, 7, 3);

select * from produtos;

insert into clientes (nome_cliente, cpf_cnpj_cliente, endereco_cliente) values
('Afonso', '123.456.789-00', 'Av. Martim Afonso, 22'),
('Elizabeth', '000.000.000-00', 'No castelo');

select * from clientes;

insert into clientes_produtos (id_cliente, id_produto) values
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Afonso'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xbox Series S')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Elizabeth'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Nintendo Switch Lite')         
    ),
    (
        (SELECT id_cliente FROM clientes WHERE clientes.nome_cliente = 'Elizabeth'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Mario Collection')         
    );

select * from clientes_produtos;

insert into usuarios_produtos (id_usuario, id_produto) values
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Alex'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'PlayStation 5 Digital Edition')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Alex'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xbox Series S')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Alex'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xbox Series X')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Alex'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Nintendo Switch Lite')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Alex'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'DualShock 5')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Alex'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Mario Collection')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Mario'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'PlayStation 5 Digital Edition')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Mario'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xbox Series S')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Mario'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xbox Series X')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Mario'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Nintendo Switch Lite')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Mario'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'DualShock 5')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Mario'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Mario Collection')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Janaina'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'PlayStation 5 Digital Edition')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Janaina'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xbox Series S')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Janaina'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xbox Series X')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Janaina'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Nintendo Switch Lite')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Janaina'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'DualShock 5')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Janaina'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Mario Collection')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Maria'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'PlayStation 5 Digital Edition')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Maria'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xbox Series S')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Maria'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Xbox Series X')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Maria'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Nintendo Switch Lite')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Maria'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'DualShock 5')         
    ),
    (
        (SELECT id_usuario FROM usuarios WHERE usuarios.nome_usuario = 'Maria'),
        (SELECT id_produto FROM produtos WHERE produtos.nome_produto = 'Mario Collection')         
    );
    

select * from usuarios_produtos; 

/* Exercicio 1 */

select 
    (
        select 
            nome_cliente 
        from 
            clientes 
        where 
            id_cliente = (
                select 
                    id_cliente 
                from 
                    clientes_produtos 
                where 
                    clientes_produtos.id_produto = produtos.id_produto
                )

    ) as nome_cliente,
    produtos.nome_produto,
    produtos.preco_compra
from 
    produtos 
where 
    id_produto IN (
        select 
            id_produto 
        from 
            clientes_produtos
)
LIMIT
    3;

/* Exercicio 2 */

select 
    (
        select 
            nome_cliente 
        from 
            clientes 
        where 
            id_cliente = (
                select 
                    id_cliente 
                from 
                    clientes_produtos 
                where 
                    clientes_produtos.id_produto = produtos.id_produto
                )

    ) as nome_cliente,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
from 
    produtos 
where 
    id_produto IN (
        select 
            id_produto 
        from 
            clientes_produtos
)
ORDER BY
    produtos.quantidade desc;

/* Exercicio 3 */

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
from
    clientes 
INNER JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
INNER JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
INNER JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;

/* Exercicio 4 */

SELECT 
    clientes.nome_cliente,
    clientes.cpf_cnpj_cliente,
    empresas.nome_empresa,
    produtos.nome_produto,
    produtos.preco_compra,
    produtos.quantidade
from
    clientes 
LEFT JOIN clientes_produtos
    ON clientes.id_cliente = clientes_produtos.id_cliente
LEFT JOIN produtos
    ON clientes_produtos.id_produto = produtos.id_produto
LEFT JOIN empresas
    ON produtos.id_empresa = empresas.id_empresa
ORDER BY produtos.preco_compra DESC;