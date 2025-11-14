SELECT * 
FROM samplesuperstore;

-- FILTERING IN USING WHERE STATEMEMT 


-- select all the oreders from the EAST region
SELECT *
FROM samplesuperstore
WHERE Region ="East";


-- all orders for furniuture category
SELECT *
FROM samplesuperstore
WHERE Category= "Furniture";

-- high value sales(sales above 500)
SELECT *
FROM samplesuperstore
WHERE Sales >500;


-- SORTING DATA USING ORDER BY.

-- Highest sales first
SELECT *
FROM Samplesuperstore
ORDER BY Sales DESC;


-- Most profitable Orders
SELECT *
FROM samplesuperstore
ORDER BY Profit DESC;


-- Highest sales from texas.
SELECT *
FROM samplesuperstore
WHERE State ="texas"
ORDER BY Sales DESC;


-- Most profitable cities(5 rowa)
SELECT City, profit
FROM samplesuperstore
ORDER BY Profit DESC
LIMIT 5;
