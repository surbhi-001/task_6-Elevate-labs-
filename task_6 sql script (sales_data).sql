 create database sales_data;
 use sales_data;
 
 select * from orders;
 select * from products;
 
 SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM orders
GROUP BY year, month
ORDER BY year, month;

SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
    SUM(total_price) AS monthly_revenue
FROM orders
GROUP BY year, month
ORDER BY year, month;

SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_quantity_sold
FROM orders;

SELECT 
    STR_TO_DATE(order_date, '%d-%m-%Y') AS date,
    SUM(total_price) AS daily_revenue
FROM orders
GROUP BY date
ORDER BY date;

SELECT * 
FROM products
ORDER BY price DESC
LIMIT 5;

SELECT 
    p.category,
    SUM(o.total_price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT 
    p.product_name,
    AVG(o.total_price) AS avg_order_price
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY avg_order_price DESC;

SELECT 
    p.category,
    SUM(o.quantity) AS total_quantity
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_quantity DESC
LIMIT 5;

SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
    COUNT(DISTINCT order_id) AS order_count
FROM orders
GROUP BY year, month
ORDER BY year, month;
