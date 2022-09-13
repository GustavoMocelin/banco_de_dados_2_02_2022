USE sakila;

SELECT 'creating a view' as 'log';

DROP VIEW IF EXISTS select_all_actors;

CREATE 
    VIEW select_all_actors
as 
    (
        SELECT actor.first_name FROM actor
    );

SELECT 'using' as 'log';

SELECT * FROM select_all_actors;





