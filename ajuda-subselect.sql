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
); 

/* criar tabela produto empresa*/