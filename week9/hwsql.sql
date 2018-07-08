use sakila
-- 1a. Display the first and last names of all actors from the table actor
SELECT * FROM actor
SELECT first_name, last_name FROM actor
-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name
SELECT concat(first_name,' ', last_name) AS Actor_Name FROM actor
-- 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
SELECT actor_id, last_name
FROM actor
WHERE first_name LIKE '%JOE%';
-- 2b. Find all actors whose last name contain the letters GEN:
SELECT * FROM actor WHERE last_name LIKE '%GEN%';
-- 2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
SELECT * FROM actor WHERE last_name LIKE '%LI%' ORDER BY last_name ASC, first_name ASC;
-- 2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
SELECT * FROM country
SELECT country_id, country
FROM country
WHERE country in ('Afghanistan', 'Bangladesh','China');
-- 3a. Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.
SELECT * FROM actor
ALTER TABLE actor
	ADD COLUMN middle_name VARCHAR(50)AFTER first_name;
-- 3b. You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs.
ALTER TABLE actor
MODIFY COLUMN middle_name Blob;
-- 3c. Now delete the middle_name column.
ALTER TABLE actor
DROP COLUMN middle_name;
-- 4a. List the last names of actors, as well as how many actors have that last name.
SELECT last_name, COUNT(*) AS 'num'
FROM actor
GROUP BY last_name;
-- 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
SELECT last_name, COUNT(*) AS 'num'
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;
-- 4c. Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
UPDATE actor
SET first_name = 'HARPO'
WHERE actor_id = 172;
SELECT * FROM actor;
-- 4d. Perhaps we were too hasty in changing GROUCHO to HARPO. 
-- It turns out that GROUCHO was the correct name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO.
-- Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER! (Hint: update the record using a unique identifier.)
UPDATE actor
SET first_name = (CASE WHEN first_name = 'HARPO' THEN 'GROUCHO' ELSE 'MUCHO GROUCHO' END)
WHERE actor_id = 172;
-- 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?
SHOW CREATE TABLE address;
-- 6a. Use JOIN to display the first and last names, as well as the address, of each staff member. 
-- Use the tables staff and address:
SELECT * from staff;
SELECT * from address;
SELECT first_name, last_name, address_id
FROM staff
JOIN address
USING (address_id);
-- 6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. 
-- Use tables staff and payment.
SELECT * from staff;
SELECT * from payment;
SELECT staff_id, first_name, last_name, SUM(payment.amount) AS 'total_spent'
FROM staff
JOIN payment
USING (staff_id)
GROUP BY staff_id;
-- 6c. List each film and the number of actors who are listed for that film. 
-- Use tables film_actor and film. Use inner join.
SELECT * FROM film_actor;
SELECT * FROM film;
SELECT title, COUNT(actor_id)
FROM film
INNER JOIN film_actor
USING (film_id)
GROUP BY title;
-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT 'Hunchback Impossible', (SELECT COUNT(*) FROM inventory WHERE film.film_id = inventory.film_id) 
AS 'Number of Copies'
FROM film;
-- 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name:
SELECT * FROM payment;
SELECT * FROM customer;
SELECT customer_id, first_name, last_name, SUM(payment.amount) AS 'total_spent'
FROM payment
JOIN customer
USING (customer_id)
GROUP BY customer_id
ORDER BY last_name;
-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence.
-- As an unintended consequence, films starting with the letters K and Q have also soared in popularity. 
-- Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
SELECT title
FROM film
WHERE title LIKE 'K%' OR title LIKE 'Q%'
AND language_id
IN(
	SELECT language_id
	FROM language
    WHERE name = 'English');
-- 7b. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
  SELECT actor_id
  FROM film_actor
  WHERE film_id IN
  (
   SELECT film_id
   FROM film
   WHERE title = 'Alone Trip'
  )
);
-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. 
-- Use joins to retrieve this information.
SELECT first_name, last_name, email
FROM customer
WHERE address_id
IN (
	SELECT address_id
	FROM address
	WHERE city_id
	IN (
		SELECT city_id
		FROM city
		INNER JOIN country
		USING (country_id)
		WHERE country_id
		IN (
			SELECT country_id
			FROM country
			WHERE country = 'Canada'
		)
	)
);
-- 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as famiy films.
SELECT title
FROM film
WHERE film_id
IN (
	SELECT film_id
	FROM film_category
	WHERE category_id
	IN (
		SELECT category_id
		FROM category
		WHERE name = 'Family'
	)
);
-- 7e. Display the most frequently rented movies in descending order.
SELECT title, A.frequency
FROM (
	SELECT inventory_id, COUNT(*) AS 'frequency'
	FROM rental
	GROUP BY inventory_id
	ORDER BY frequency DESC
) AS A
LEFT JOIN (
	SELECT i.inventory_id, i.film_id, f.title 
	FROM inventory AS i
	LEFT JOIN film AS f
	USING (film_id)
) AS B
USING (inventory_id);
-- 7f. Write a query to display how much business, in dollars, each store brought in.
SELECT A.store_id, SUM(A.amount) AS 'dollars_earned'
FROM (
	SELECT p.staff_id, p.amount, s.store_id
	FROM payment AS p
	LEFT JOIN staff AS s
	USING (staff_id)
) AS A
GROUP BY A.store_id;
-- 7g. Write a query to display for each store its store ID, city, and country.
SELECT C.store_id, C.city, D.country
FROM (
	SELECT A.store_id, B.city, B.country_id
	FROM (
		SELECT s.store_id, s.address_id, a.city_id
		FROM store AS s
		LEFT JOIN address AS a
		USING (address_id)
	) AS A
	LEFT JOIN city AS B
	USING (city_id)
) AS C
LEFT JOIN country as D
USING (country_id);
-- 7h. List the top five genres in gross revenue in descending order. 
-- (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
SELECT D.category_name, SUM(C.amount) AS 'gross_revenue'
FROM (
	SELECT B.film_id, A.amount
	FROM (
		SELECT r.inventory_id, p.rental_id, p.amount
		FROM payment AS p
		LEFT JOIN rental AS r
		USING (rental_id)
	) AS A
	LEFT JOIN inventory AS B
	USING (inventory_id)
) AS C
LEFT JOIN (
	SELECT film_id, c.name AS 'category_name'
	FROM film_category AS f
	LEFT JOIN category AS c
	USING (category_id)
) AS D
USING (film_id)
GROUP BY D.category_name
ORDER BY gross_revenue DESC
LIMIT 5;
-- 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. 
-- If you haven't solved 7h, you can substitute another query to create a view.
CREATE VIEW TOP_5_GENRE_BY_GROSS_REVENUE
AS (
	SELECT D.category_name, SUM(C.amount) AS 'gross_revenue'
	FROM (
		SELECT B.film_id, A.amount
		FROM (
			SELECT r.inventory_id, p.rental_id, p.amount
			FROM payment AS p
			LEFT JOIN rental AS r
			USING (rental_id)
		) AS A
		LEFT JOIN inventory AS B
		USING (inventory_id)
	) AS C
	LEFT JOIN (
		SELECT film_id, c.name AS 'category_name'
		FROM film_category AS f
		LEFT JOIN category AS c
		USING (category_id)
	) AS D
	USING (film_id)
	GROUP BY D.category_name
	ORDER BY gross_revenue DESC
	LIMIT 5
); 
-- 8b. How would you display the view that you created in 8a?
SELECT * FROM TOP_5_GENRE_BY_GROSS_REVENUE;
-- 8c. You find that you no longer need the view `top_five_genres`. Write a query to delete it. */
DROP VIEW TOP_5_GENRE_BY_GROSS_REVENUE;
