SELECT * FROM actor


SELECT *
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id

SELECT *
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id

SELECT title, film.film_id
FROM film_actor
INNER JOIN film
ON film.film_id = film_actor.film_id;

SELECT first_name,last_name
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
WHERE last_name LIKE 'sw%'

--sub queries!!
--1x1 example, build both queries and put them together
-- find out big ballers that we created that have the biggest neg amounts!


SELECT * FROM payment

SELECT customer_id, SUM(amount)
FROM payment 
GROUP BY customer_id
HAVING SUM(amount) < -15000
ORDER BY SUM(amount);

--2nd query

SELECT * from customer;

SELECT first_name, last_name, email
FROM customer
-- the sub query occurs WHERE, FROM, and (technically) SELECT

--where clause example
SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment 
    GROUP BY customer_id
    HAVING SUM(amount) < -15000
    ORDER BY SUM(amount)
)

--from clause example
SELECT first_name, last_name
FROM (
    SELECT title, first_name,last_name
    FROM film_actor
    INNER JOIN actor
    ON actor.actor_id = film_actor.actor_id
    INNER JOIN film
    ON film.film_id = film_actor.film_id
) AS multi 
WHERE title LIKE 'Chea%';

--SELECT clause
SELECT first_name, last_name, (
    SELECT count(*)
    FROM rental
)
FROM customer



