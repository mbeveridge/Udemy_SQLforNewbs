#[activeUsers] : For active customers : Show all columns from customer table, and the phone from address table
SELECT c.customer_id, c.first_name, c.last_name, c.email, c.create_date, c.last_update, a.phone
FROM customer c, address a
WHERE c.active = 1
	AND c.address_id = a.address_id
ORDER BY 1
;


#[activeUsers] : An alternate way to write the query
SELECT c.*, a.phone
FROM customer c JOIN address a ON c.address_id = a.address_id
WHERE c.active = 1
ORDER BY 1
;


#[rewardUsers] : For customers with at least 30 rentals : customer_id, number of rentals, last rental date ...from rental table
SELECT r.customer_id, count(r.rental_id), max(r.rental_date)
FROM rental r
GROUP BY 1
HAVING count(r.rental_id) >=30
ORDER BY 1
;


/* -----------------------------------------------------------------------------
1ST BRAINBUSTER (BB1) : For rewardUsers who are also activeUsers : customer_id, email, first_name in a list. Use JOIN
----------------------------------------------------------------------------- */
drop temporary table if exists activeUsers;
drop temporary table if exists rewardUsers;

#comment activeUsers
create temporary table activeUsers
SELECT c.*, a.phone
FROM customer c JOIN address a ON c.address_id = a.address_id
WHERE c.active = 1
ORDER BY 1
;

#comment rewardUsers
create temporary table rewardUsers
SELECT r.customer_id, count(r.rental_id), max(r.rental_date)
FROM rental r
GROUP BY 1
HAVING count(r.rental_id) >=30
ORDER BY 1
;

#Query the 2 temporary tables
SELECT aU.customer_id, aU.email, aU.first_name
FROM activeUsers aU JOIN rewardUsers rU ON aU.customer_ID = rU.customer_ID
ORDER BY 1
;


/* -----------------------------------------------------------------------------
2ND BRAINBUSTER (BB2) : For ALL rewardUsers : customer_id, email, phone (of those who are also activeUsers) in a list. Use LEFT JOIN
----------------------------------------------------------------------------- */
drop temporary table if exists activeUsers;
drop temporary table if exists rewardUsers;

#comment activeUsers ...as for BB1
create temporary table activeUsers
SELECT c.*, a.phone
FROM customer c JOIN address a ON c.address_id = a.address_id
WHERE c.active = 1
ORDER BY 1
;

#comment rewardUsers ...edited to get rU.email (no email in rental table)
create temporary table rewardUsers
SELECT r.customer_id, c.email, count(r.rental_id), max(r.rental_date)
FROM rental r JOIN customer c ON r.customer_ID = c.customer_ID
GROUP BY 1
HAVING count(r.rental_id) >=30
ORDER BY 1
;

#Query the 2 temporary tables
SELECT rU.customer_id, rU.email, aU.phone
FROM rewardUsers rU LEFT JOIN activeUsers aU ON rU.customer_ID = aU.customer_ID
ORDER BY 1
;