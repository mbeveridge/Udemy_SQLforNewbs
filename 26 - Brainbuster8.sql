#Revenue for Store 1 where film is rated R or PG-13

SELECT
	f.rating as Rating, sum(p.amount) as Revenue
FROM
	film f, inventory i, rental, payment p
WHERE
	f.film_id = i.film_id
	AND i.inventory_id = rental.inventory_id
	AND rental.rental_id = p.rental_id
	AND i.store_id = 1
	AND f.rating in ("R", "PG-13")
GROUP BY
	f.Rating
;