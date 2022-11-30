-- LAB SQL Queries - Lesson 2.6
-- 1. Select unique last names
USE SAKILA;
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*) <= 1;

-- 2. Which last names appear more than once?
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 3. Using the rental table, find out how many rentals were processed by each employee
SELECT * FROM rental;
SELECT staff_id, 
COUNT(*) 
FROM rental 
GROUP BY staff_id;

-- 4.Using the film table, find out how many films were released each year.
SELECT * FROM FILM;
SELECT release_year, 
COUNT(*) 
FROM film 
GROUP BY release_year;

-- 5. Using the film table, find out for each rating how many films were there
SELECT * FROM film;
SELECT rating,
COUNT(*) as moviesrated
FROM film
GROUP BY rating;

-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT * FROM film;
SELECT rating, 
round(AVG(length),2) 
AS averagelength 
FROM film
GROUP BY rating;

-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT * FROM film;
SELECT rating,
ROUND(AVG(length),2)
AS avg_per_rating_type
from film
group by rating
having avg(length)>120;

-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT title,length, 
RANK () OVER(
ORDER BY length DESC
)AS film_ranking
from film
WHERE length !=0 AND length is not null;