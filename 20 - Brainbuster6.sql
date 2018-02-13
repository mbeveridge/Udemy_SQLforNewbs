#Every customer's last rental date
SELECT c.customer_id, first_name, last_name, max(rental_date)
FROM customer c, rental r
WHERE c.customer_id = r.customer_id
GROUP BY c.customer_id
;


#Revenue by each month
SELECT LEFT(payment_date,7) as Month, SUM(amount)
FROM payment
GROUP BY Month
ORDER BY 1
;