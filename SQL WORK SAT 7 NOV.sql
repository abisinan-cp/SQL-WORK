-- 1
SHOW DATABASES;

-- 2
USE route_mart;
SHOW TABLES;

-- 3 (product_id is the PRIMARY KEY, shown under the Key column)
DESCRIBE products;

-- 4 (check the Null column: NO means the column cannot be empty)
DESCRIBE orders;

-- 5
SELECT * FROM products;

-- 6
SELECT product_name, brand, price FROM products;

-- 7
SELECT product_name, price - 100 AS discounted_price FROM products;

-- 8
SELECT customer_name, city, amount FROM orders;


-- 9
SELECT * FROM products WHERE category = 'Electronics';

-- 10
SELECT * FROM products WHERE price < 500;

-- 11
SELECT * FROM products WHERE brand = 'Logitech' AND price > 1000;

-- 12
SELECT * FROM products WHERE category IN ('Clothing', 'Home');

-- 13
SELECT * FROM products WHERE category <> 'Grocery';

-- 14
SELECT * FROM products
WHERE category = 'Electronics' AND rating > 4.2 AND stock < 100;

-- 15
SELECT * FROM products WHERE price BETWEEN 500 AND 2000;

-- 16
SELECT * FROM products
WHERE brand IN ('Logitech', 'Puma', 'Prestige', 'Philips');

-- 17
SELECT * FROM orders
WHERE status = 'Delivered'
  AND city IN ('Kochi', 'Chennai')
  AND amount > 1500;

-- 18
SELECT * FROM orders
WHERE payment_mode IN ('UPI', 'Card')
  AND amount BETWEEN 1000 AND 3000;

-- 19
SELECT * FROM orders WHERE status <> 'Delivered';

-- 20
SELECT * FROM orders
WHERE order_date BETWEEN '2025-02-01' AND '2025-03-31';

-- 21
SELECT * FROM orders
WHERE customer_name IN ('Arun Kumar', 'Meera Nair', 'Neha Sharma');

-- 22
SELECT * FROM orders
WHERE status NOT IN ('Cancelled', 'Returned')
  AND quantity >= 2
  AND city <> 'Kochi';


-- 23
SELECT * FROM products ORDER BY price DESC;

-- 24
SELECT * FROM products ORDER BY category ASC, rating DESC;

-- 25
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- 26
SELECT * FROM products
WHERE category = 'Electronics'
ORDER BY price ASC LIMIT 3;

-- 27
SELECT product_name, stock FROM products ORDER BY stock DESC LIMIT 5;

-- 28
SELECT * FROM orders ORDER BY order_date DESC LIMIT 5;

-- 29
SELECT * FROM orders
WHERE status = 'Delivered'
ORDER BY amount DESC LIMIT 3;


-- ========== PART D: Business Numbers ==========
-- 30
SELECT COUNT(*) AS total_products FROM products;

-- 31
SELECT COUNT(*) AS total_orders FROM orders;

-- 32
SELECT SUM(amount) AS delivered_revenue FROM orders WHERE status = 'Delivered';

-- 33
SELECT AVG(price) AS avg_home_price FROM products WHERE category = 'Home';

-- 34
SELECT MAX(price) AS highest_price, MIN(price) AS lowest_price
FROM products WHERE category = 'Clothing';

-- 35
SELECT SUM(stock) AS total_units_in_stock FROM products;

-- 36
SELECT AVG(rating) AS avg_electronics_rating
FROM products WHERE category = 'Electronics';

-- 37
SELECT COUNT(*) AS bengaluru_orders, SUM(amount) AS total_amount
FROM orders WHERE city = 'Bengaluru';

-- 38
SELECT SUM(quantity) AS upi_units FROM orders WHERE payment_mode = 'UPI';


-- 39
SELECT category, COUNT(*) AS product_count
FROM products GROUP BY category;

-- 40
SELECT category, AVG(price) AS avg_price
FROM products GROUP BY category;

-- 41
SELECT category, MAX(price) AS highest_price, MIN(price) AS lowest_price
FROM products GROUP BY category;

-- 42
SELECT category, SUM(stock) AS total_stock
FROM products GROUP BY category;

-- 43
SELECT city, COUNT(*) AS order_count
FROM orders GROUP BY city;

-- 44
SELECT city, SUM(amount) AS delivered_total
FROM orders WHERE status = 'Delivered' GROUP BY city;

-- 45
SELECT payment_mode, COUNT(*) AS order_count, SUM(amount) AS total_amount
FROM orders GROUP BY payment_mode;

-- 46
SELECT status, COUNT(*) AS order_count
FROM orders GROUP BY status;

-- 47
SELECT customer_name, SUM(amount) AS total_spending
FROM orders
GROUP BY customer_name
ORDER BY total_spending DESC;

-- 48
SELECT city, COUNT(*) AS delivered_orders
FROM orders
WHERE status = 'Delivered'
GROUP BY city
ORDER BY delivered_orders DESC
LIMIT 3;

-- 49
SELECT category, SUM(quantity) AS units_sold
FROM orders
WHERE status = 'Delivered'
GROUP BY category
ORDER BY units_sold DESC;

-- 50
SELECT payment_mode, SUM(amount) AS total_amount
FROM orders
WHERE city IN ('Kochi', 'Trivandrum')
GROUP BY payment_mode;