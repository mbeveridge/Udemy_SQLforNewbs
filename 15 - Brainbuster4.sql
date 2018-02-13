SELECT film.title, count(rental.rental_id)
FROM film, inventory, rental
WHERE film.film_id = inventory.film_id AND inventory.inventory_id = rental.inventory_id
GROUP BY title
;