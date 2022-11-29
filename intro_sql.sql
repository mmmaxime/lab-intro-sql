-- 1.Use sakila database.
USE sakila;
-- 2. Get all the data from tables actor, film and customer
SELECT * from actor;
SELECT * from film;
SELECT * from customer;
-- 3. Get film titles.
SELECT title from film;
-- 4.Show unique items
SELECT distinct name from language;
-- 5.1. Find out how many stores does the company have?
SELECT COUNT(store_id) from store;
-- 5.2. Find out how many employees staff does the company have?
SELECT COUNT(first_name) from staff;
-- 5.3. Return a list of employee first names only?
SELECT distinct first_name from staff;