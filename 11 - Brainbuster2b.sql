SELECT count(film_id), rental_rate, rating
FROM film
GROUP BY rental_rate, rating
;