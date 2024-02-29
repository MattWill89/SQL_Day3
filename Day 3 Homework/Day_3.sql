-- 1. List all customers who live in Texas (use JOINs)
SELECT c.*
FROM customers c
JOIN addresses a ON c.address_id = a.address_id
JOIN cities ci ON a.city_id = ci.city_id
JOIN states s ON ci.state_id = s.state_id
WHERE s.state = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT CONCAT(c.first_name, ' ', c.last_name) AS "Customer Full Name", p.amount
FROM payments p
JOIN customers c ON p.customer_id = c.customer_id
WHERE p.amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT CONCAT(first_name, ' ', last_name) AS "Customer Full Name"
FROM customers
WHERE customer_id IN (SELECT customer_id FROM payments WHERE amount > 175);

-- 4. List all customers that live in Nepal (use the city table)
SELECT c.*
FROM customers c
JOIN addresses a ON c.address_id = a.address_id
JOIN cities ci ON a.city_id = ci.city_id
WHERE ci.city = 'Nepal';

-- 5. Which staff member had the most transactions?
SELECT staff_id, COUNT(*) AS transaction_count
FROM payments
GROUP BY staff_id
ORDER BY transaction_count DESC
LIMIT 1;

-- 6. How many movies of each rating are there?
SELECT rating, COUNT(*) AS movie_count
FROM films
GROUP BY rating;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT CONCAT(first_name, ' ', last_name) AS "Customer Full Name"
FROM customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM payments 
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);
