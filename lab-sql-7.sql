-- 1. In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd,
-- Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
-- So we do not want to include this last name in our output. 
-- Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.


SELECT * FROM SAKILA.ACTOR;

SELECT DISTINCT LAST_NAME FROM SAKILA.ACTOR
GROUP BY LAST_NAME;

SELECT LAST_NAME
FROM SAKILA.ACTOR
GROUP BY LAST_NAME
HAVING COUNT(*) = 1;


-- 2. Which last names appear more than once? We would use the same logic as in the previous 
-- question but this time we want to include the last names of the actors where the last name was present more than once

SELECT LAST_NAME
FROM SAKILA.ACTOR
GROUP BY LAST_NAME
HAVING COUNT(*) > 1;


-- 3.Using the rental table, find out how many rentals were processed by each employee.

SELECT * FROM SAKILA.RENTAL;

SELECT COUNT(*), STAFF_ID
FROM SAKILA.RENTAL
GROUP BY STAFF_ID;

-- 4.Using the film table, find out how many films were released each year.


SELECT * FROM SAKILA.FILM;

SELECT COUNT(*), RELEASE_YEAR
FROM SAKILA.FILM
GROUP BY RELEASE_YEAR;

-- 5.Using the film table, find out for each rating how many films were there.

SELECT COUNT(*), RATING
FROM SAKILA.FILM
GROUP BY RATING;


-- 6.What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT * FROM SAKILA.FILM;

SELECT RATING, ROUND(AVG(LENGTH), 2) AS AVG_LENGTH
FROM SAKILA.FILM
GROUP BY RATING
ORDER BY AVG_LENGTH ASC;

-- 7.Which kind of movies (rating) have a mean duration of more than two hours?

SELECT RATING, ROUND(AVG(LENGTH), 2) AS AVG_LENGTH
FROM SAKILA.FILM
GROUP BY RATING
HAVING AVG_LENGTH > 120;
