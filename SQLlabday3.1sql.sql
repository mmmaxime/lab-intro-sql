-- LAB SQL Queries - Lesson 2.5
USE SAKILA;
-- 1.Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor;
SELECT first_name, last_name FROM actor WHERE first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT * FROM rental;
SELECT
(SELECT COUNT(*) FROM rental
WHERE DATE(return_date) >= DATE(rental_date)) AS "available",
(SELECT COUNT(*) FROM rental
WHERE return_date IS NULL) AS "rented";
-- We saw that the return date means when a customers has returned the movie, and therefore we have calculated that it means that it has returned. 
-- We considered that the values in null in return_date mean that the movies are rented. 

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT * FROM FILM;
SELECT MAX(length) AS max_duration
from film;
SELECT MIN(length) AS min_duration
FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT * FROM film;
SELECT SEC_TO_TIME(ROUND(AVG(length*60),0)) AS "average" 
FROM film;

-- 5. How many distinct (different) actors' last names are there?
SELECT * FROM actor;
SELECT Count(DISTINCT last_name);

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT * FROM rental;
SELECT DATEDIFF(date'2005-05-24', '2005-06-09')as number_of_days from rental;
-- This was calculated by taking the first rented movie and subtracting it by the last rented movie.

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM rental;
SELECT *,
date_format(rental_date,'%M') AS 'rental_month', 
date_format(rental_date,'%a') AS 'rental_weekday' 
FROM rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT * FROM rental;
SELECT *,
date_format(rental_date,'%M') in ('mon','tues','wed','thurs','fri') AS 'workday', 
date_format(rental_date,'%a') in ('sat','sun') AS 'weekend' 
FROM rental;

-- 9. Get release years.
SELECT * FROM FILM;
SELECT DISTINCT(release_year) FROM film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT * FROM film
WHERE title like '%ARMAGEDDON%'
ORDER BY title ASC;

-- 11. Get all films which title ends with APOLLO.
SELECT * FROM film;
SELECT * from film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.
SELECT * FROM film;
SELECT title,length from film
ORDER BY length desc limit 10;

-- 13. How many films include Behind the Scenes content?
SELECT COUNT(title) FROM film WHERE special_features LIKE '%Behind the scenes%';