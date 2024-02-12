USE sakila;
#1
SELECT 
    (SELECT COUNT(*) 
     FROM inventory 
     WHERE film_id = (SELECT film_id FROM film WHERE title = 'Hunchback Impossible')
    ) AS inventory_count;
    
    
#2
SELECT f.title, f.length
FROM film f
WHERE length >(SELECT AVG(length)FROM film);

#3
SELECT f.title, CONCAT(first_name,"",last_name) AS full_name
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.film_id = f.film_id
WHERE a.actor_id IN ( SELECT a.actor_id WHERE f.title = 'Alone Trip');

#4
SELECT f.title , c.name 
FROM film f
JOIN film_category fc 
ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Family';

#5

