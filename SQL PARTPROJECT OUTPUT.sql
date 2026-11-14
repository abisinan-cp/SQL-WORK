USE shopeasy_db;
select * from orders;
select * from products;

-- 1 Marketing wants to know which cities our orders come from and which payment methods customers use. Give me each as a separate list.
select distinct city ,  payment_mode from orders ;
select distinct city ,  payment_mode from orders where payment_mode = 'upi';
select distinct city ,  payment_mode from orders where payment_mode = 'cash on delivery';
select distinct city ,  payment_mode from orders where payment_mode = 'credit card';
select distinct city ,  payment_mode from orders where payment_mode = 'Net Banking';
select distinct city ,  payment_mode from orders where payment_mode = 'debit card';


-- 2 The catalogue team needs a clean product list showing the product name, category and price, with proper headings.
select distinct product_name , category , price from products ;

-- 3 Finance is auditing the April to June 2026 quarter. Show me all delivered orders from Kochi or Chennai placed in that period.
SELECT * FROM orders WHERE (city = 'Kochi' OR city = 'Chennai') AND order_date BETWEEN '2026-04-01' AND '2026-06-29';

-- 4 The payments team is reviewing card and net banking activity. Show me the orders paid by credit card or net banking where more than 2 units were bought and the order was not cancelled.
SELECT * FROM orders WHERE payment_mode IN ('Credit Card', 'Net Banking') AND quantity > 2 AND order_status <> 'Cancelled';

-- 5  Which products are priced between ₹1,000 and ₹5,000 and are not in the Electronics category?
select * from products where price between 1000.00 and 5000.00 and category <> 'electronics';

-- 6 The website search team is testing premium-sounding product names. Which products have "Pro" or "Max" in their name?
select * from products where product_name like '%pro%' or product_name like '%max%' ;

-- 7 Marketing wants to send a message to customers whose names start with "S". Give me each such customer once.
select * from orders where customer_name like 's%';

-- 8 Show me all cancelled or returned orders where we gave no discount.
select * from orders where order_status = 'cancelled' or order_status = 'returned' and discount_percent is null;


-- 9 Which products launched in 2026 have not received a customer rating yet?
SELECT product_name , launch_date , rating FROM products WHERE YEAR(launch_date) = 2026 AND rating IS NULL;

-- 10 Who are our 5 most expensive products, and what do they cost?
SELECT product_name, price FROM products ORDER BY price DESC LIMIT 5;

-- 11 Give me the full product list sorted by category from A to Z, and within each category with the most expensive product first.
SELECT product_name, category,priceFROM products ORDER BY category ASC, price DESC;

-- 12 Show me our 10 biggest delivered orders: who ordered, from which city, and how much they paid.
SELECT customer_name,city, total_amount FROM orders
WHERE order_status = 'Delivered' ORDER BY total_amount DESC LIMIT 10;

-- 13 Give management a one-line summary of all orders that were not cancelled: how many orders, total revenue, average order value, smallest order and largest order. Use readable headings.
SELECT
    COUNT(*) AS Total_Orders,SUM(total_amount) AS Total_Revenue, 
    ROUND(AVG(total_amount), 2) AS Average_Order_Value, MIN(total_amount) 
    AS Smallest_Order, MAX(total_amount) AS Largest_Order FROM orders WHERE order_status <> 'Cancelled';

-- 14 How many orders do we have in total, how many of them had a discount, and how many different customers have ordered?


-- 15 For delivered orders, show each city with its number of orders and revenue, biggest revenue first.
SELECT city, COUNT(*) AS Total_Orders, SUM(total_amount) AS Total_Revenue
FROM orders
WHERE order_status = 'Delivered'
GROUP BY city
ORDER BY Total_Revenue DESC;

-- 16 For orders that were not cancelled, show each payment method with its number of orders and average order value. Only include methods used on more than 12 orders.
SELECT payment_mode, COUNT(*) AS Total_Orders, ROUND(AVG(total_amount), 2) AS Average_Order_Value
FROM orders
WHERE order_status <> 'Cancelled'
GROUP BY payment_mode
HAVING COUNT(*) > 12;

-- 17 We want to reward loyal customers. Who has placed more than 4 orders (not counting cancelled ones)? Show their name, number of orders and total spend, and give me only the top 5 spenders.
SELECT
    customer_name,
    COUNT(*) AS Total_Orders,
    SUM(total_amount) AS Total_Spend
FROM orders
WHERE order_status <> 'Cancelled'
GROUP BY customer_name
HAVING COUNT(*) > 4
ORDER BY Total_Spend DESC
LIMIT 5;

-- 18 For each product category, show how many products we sell, their average price and the total units in stock. Leave out categories with 3 products or fewer.
SELECT category, COUNT(*) AS Total_Products, ROUND(AVG(price), 2) AS Average_Price,SUM(stock_qty) AS Total_Stock
FROM products
GROUP BY category
HAVING COUNT(*) > 3;

-- 19 Operations wants to find slow cities. Among delivered orders, which cities take more than 6 days on average to deliver? Show the average, slowest first.


-- 20 Looking only at delivered orders placed on or after 1 April 2026, and leaving out Delhi, show the number of orders and revenue for each payment method. Only include methods with revenue above ₹15,000, and show just the top 2.