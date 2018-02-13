#What store has historically brought the most revenue?

SELECT store.address_id, address.address, sum(payment.amount)
FROM payment, staff, store, address
WHERE payment.staff_id = staff.staff_id AND staff.store_id = store.store_id AND store.address_id = address.address_id
GROUP BY 1
ORDER BY 3 desc
;