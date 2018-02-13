#This was my 1st solution. It worked, but didn't use temporary table
#Revenue by Actor - Actor's name and amount of revenue (from rentals, not late fees)
SELECT actor.actor_id, actor.first_name, actor.last_name, sum(payment.amount)
FROM payment, rental, inventory, film_actor, actor
WHERE
	payment.rental_id >=1
	AND payment.rental_id = rental.rental_id
	AND rental.inventory_id = inventory.inventory_id
	AND inventory.film_id = film_actor.film_id
	AND film_actor.actor_id = actor.actor_id
GROUP BY 1
ORDER BY 4 desc
;


#This attempt without the payment table didn't work (and probably needs temp table to get around the 'sum(count()) construct', that is probably the issue)
#Revenue by Actor - Actor's name and amount of revenue (from rentals, not late fees)
#count(rental.rental_id) ...will be 1; but if the film has never been rented, the product with rental_rate will be zero
SELECT actor.actor_id, actor.first_name, actor.last_name, sum(film.rental_rate*count(rental.rental_id))
FROM film, rental, inventory, film_actor, actor
WHERE
	rental.inventory_id = inventory.inventory_id
	AND inventory.film_id = film_actor.film_id
	AND film_actor.actor_id = actor.actor_id
GROUP BY 1
ORDER BY 4 desc
;





drop temporary table if exists xxxx;

#comment
create temporary table xxxx
SELECT
FROM
WHERE
GROUP BY
ORDER BY
;


