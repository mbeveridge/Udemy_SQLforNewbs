#Number of distinct films rented each month
SELECT LEFT(rental.rental_date,7) as Month, COUNT(rental.rental_id) as Rentals, COUNT(DISTINCT rental.inventory_id) as Boxes, COUNT(DISTINCT inventory.film_id) as Films
FROM rental, inventory
WHERE rental.inventory_id = inventory.inventory_id
GROUP BY 1
ORDER BY 1
;