USE sakila;


EXPLAIN
SELECT
    film.title,
    film.description
FROM
    film
WHERE
    film_id IN (
        SELECT
            inventory.film_id 
        FROM
            inventory
        WHERE
            inventory.inventory_id IN (
                (
                    SELECT 
                        rental.inventory_id
                    FROM
                        rental
                    WHERE
                        rental.customer_id = (
                            SELECT 
                                customer.customer_id
                            FROM
                                customer
                            WHERE
                                customer.email = 'JENNIFER.DAVIS@sakilacustomer.org'                           
                        )
                )
        )
);


/*
show index from customer;
show index from inventory;
show index from film;
show index from rental;
*/
CREATE INDEX idx_email ON customer(email);

show index from customer;


EXPLAIN
SELECT
    film.title
FROM
    film
WHERE
    film_id IN (
        SELECT
            inventory.film_id 
        FROM
            inventory
        WHERE
            inventory.inventory_id IN (
                (
                    SELECT 
                        rental.inventory_id
                    FROM
                        rental
                    WHERE
                        rental.customer_id = (
                            SELECT 
                                customer.customer_id
                            FROM
                                customer
                            WHERE
                                customer.email = 'JENNIFER.DAVIS@sakilacustomer.org'                           
                        )
                )
        )
);

DROP INDEX IF EXISTS  idx_filmtitle;
CREATE INDEX idx_filmtitle ON film(title);



EXPLAIN
SELECT
    film.title
FROM
    film
WHERE
    film_id IN (
        SELECT
            inventory.film_id 
        FROM
            inventory
        WHERE
            inventory.inventory_id IN (
                (
                    SELECT 
                        rental.inventory_id
                    FROM
                        rental
                    WHERE
                        rental.customer_id = (
                            SELECT 
                                customer.customer_id
                            FROM
                                customer
                            WHERE
                                customer.email = 'JENNIFER.DAVIS@sakilacustomer.org'                           
                        )
                )
        )
);

