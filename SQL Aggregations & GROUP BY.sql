-- The 5 Core Aggregation Functions


SELECT *
FROM orders;


-- COUNT()


-- Total orders(count)
SELECT COUNT(*) AS total_orders
FROM orders;

-- How many unique customers placed orders
SELECT COUNT(DISTINCT `Customer ID`) AS unique_customers
FROM orders;


-- SUM()


-- Calculate total revenue, profit, costs, or quantity sold

-- Total sales revenue
SELECT SUM(`Sales`) AS total_revenue
FROM orders;

-- Total profit
SELECT SUM(`Profit`) As total_profit
FROM orders;


-- AVG


-- Averger sale amount per order
SELECT AVG(`Sales`) AS avg_orders_values
FROM orders;


-- Highet and lowest Sales


-- MIN


-- the smallest sale we recorded
SELECT MIN(`Sales`) AS smallest_sale
FROM orders;


-- MAX


-- the Highest Sales recorded
SELECT MAX(`sales`) AS highest_sale
From orders;


-- GROUP BY: The Segmentation Powerhouse


-- Sales by Region

-- Which region generates the most revenue?
SELECT region,SUM(`Sales`) AS total_sales
FROM orders
GROUP BY region
ORDER BY total_sales DESC;


-- Profit by Category

-- Which product categories are most profitable?
SELECT Category, SUM(`profit`) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_profit DESC;

-- Orders per Customer Segment

-- How many orders come from each customer type
SELECT Segment,COUNT(*) AS order_count
FROM orders
GROUP BY Segment
ORDER BY order_count DESC;


-- Multi-Dimensional

-- What's the sales performance by region AND category
SELECT region,category,SUM(sales) AS total_sales
FROM orders
GROUP BY region, category
ORDER BY region, total_sales DESC;