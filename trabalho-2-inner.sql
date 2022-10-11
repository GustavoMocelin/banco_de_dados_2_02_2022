/* Aluno: Gustavo Mocelin */

USE sakila;

SELECT
    film.Title as Title,
    city.city as City
FROM
    film
INNER JOIN inventory
    ON film.film_id = inventory.film_id
INNER JOIN rental 
    ON inventory.inventory_id = rental.rental_id
INNER JOIN customer
    ON rental.customer_id = customer.customer_id
INNER JOIN address
    ON customer.address_id = address.address_id
INNER JOIN city
    ON address.city_id = city.city_id
WHERE
    city.city = "Caracas";