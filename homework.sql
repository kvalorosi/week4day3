--1. List all customers who live in Texas (use
--JOINs)
SELECT * FROM customer

SELECT * 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

SELECT *
FROM address
INNER JOIN customer
ON customer.address_id = address.address_id

SELECT first_name, last_name, district
FROM address
INNER JOIN customer
ON customer.address_id = address.address_id
WHERE district LIKE 'Texas';

--2. Get all payments above $6.99 with the Customer's Full
--Name
SELECT * FROM payment

SELECT amount
FROM payment
where amount > '6.99';

SELECT amount, last_name, first_name
FROM payment
INNER JOIN customer
ON customer.customer_id = payment.customer_id
WHERE amount > '6.99';

--I skipped this one because I thought it would be hard and it wasn't that bad it turns out.

--3. Show all customers names who have made payments over $175(use
--subqueries)
SELECT * FROM payment

SELECT customer_id, amount 
FROM payment
WHERE amount > '175';

SELECT * FROM customer

SELECT first_name, last_name 
FROM customer;

SELECT first_name, last_name 
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > '175'
)

--I rewatched the class zoom  for this one


--4. List all customers that live in Nepal (use the city
--table)

SELECT * FROM customer 

SELECT * 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

SELECT *
FROM address
INNER JOIN customer
ON customer.address_id = address.address_id

SELECT city, city.city_id
FROM address
INNER JOIN city
ON city.city_id = address.city_id

SELECT first_name, last_name, city
FROM address
INNER JOIN customer
ON customer.address_id = address.address_id
INNER JOIN city
ON city.city_id = address.city_id
WHERE city LIKE 'Nep%';

--Sadly none of our customers live in Nepal

--5. Which staff member had the most
--transactions?

--Wasn't this on Mondays homework, just phrased differently?
SELECT * FROM staff

SELECT staff_id 
FROM staff;

SELECT staff_id
FROM payment;

SELECT COUNT(staff_id)
FROM payment
WHERE staff_id = 1 or staff_id = 2
GROUP BY staff_id;

--I took a different approach to this one, the numbers 
--are difeerent too. However, I'm not sure if the numbers
--this query locates are transactions or if they are just the occurrences of each staff 
--member in the payment table. Below is the same response I gave to this very simliar question on Monday.

SELECT * FROM staff;

SELECT * FROM rental;

SELECT staff_id
FROM rental;

SELECT COUNT(staff_id)
FROM rental
WHERE staff_id = 1 or staff_id = 2
GROUP BY staff_id; 


--6. How many movies of each rating are
--there?
SELECT * FROM inventory

SELECT *
FROM inventory
INNER JOIN film
ON film.film_id = inventory.film_id;

SELECT rating, rating.film_id
FROM film
INNER JOIN inventory
ON inventory.film_id = film.film_id

SELECT rating, COUNT(title)
FROM inventory
INNER JOIN film
ON film.film_id = inventory.film_id
GROUP BY rating
ORDER BY COUNT(title);

--I was going to type out the answer, but obviously
--if you run the query it works! This was so fun, Lots of thought
--with a very satisfying outcome



--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)
SELECT * FROM payment

SELECT customer_id, amount 
FROM payment
WHERE amount = '6.99';

SELECT * FROM customer

SELECT first_name, last_name 
FROM customer;

SELECT first_name, last_name 
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount = '6.99'
)
--Honestly I used the same exact format as a question above and just changed the numbers around
--if this transaction existed I think this sub query would've worked



--8.How many free rentals did our store give away?
SELECT * FROM payment

SELECT amount 
FROM payment
WHERE amount = '0';

SELECT rental_rate
FROM film
WHERE rental_rate = '0';





