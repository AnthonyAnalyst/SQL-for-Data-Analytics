USE ecommerce;

SELECT *
FROM orders;

-- String Functions – Cleaning and Organizing Text

-- UPPER() AND LOWER()

-- 1 UPPER()
SELECT
    `Customer Name`,
UPPER(`Customer Name`) AS Name_Uppercase
FROM orders
LIMIT 5;


-- 2 LOWER()
SELECT
    State,
    LOWER(State) AS State_Lowercase
    FROM orders
    LIMIT 5;


-- 3 TRIM

-- Remove Extra Spaces
SELECT
    `State`,
    TRIM(`State`) AS State_Clean,
    LENGTH(`State`) AS Original_Length,
    LENGTH(TRIM(`State`)) AS Clean_Length
    FROM orders
    LIMIT 10;

 -- 4 CONCAT()

 -- Joins two or more pieces of text together.

SELECT
    `Customer Name`,
    City,
    State,
    CONCAT(City, '-', State) AS Full_Location
    FROM orders
    LIMIT 5;

-- 5. LEFT()

-- Extract Characters from the Left
SELECT
`Product Name`,
LEFT(`Product Name`, 15) AS Short_Product_Name
FROM orders
LIMIT 5;

-- 6. RIGHT()

-- Extract Characters from the Right
SELECT
    `Postal Code`,
    RIGHT(`Postal Code`, 4) AS Last_Four_Digits
    FROM orders
    LIMIT 5;

    -- 7 SUBSTRING()

    -- Extract Characters from Anywhere
SELECT
     `Order ID`,
    SUBSTRING(`Order ID`, 4, 7) AS Order_Number_Part
    FROM orders
    LIMIT 5;

-- 8 REPLACE()

-- Finding and Replacing Text
SELECT
`Ship Mode`,
REPLACE(`Ship Mode`, 'Class', 'Priority') AS Updated_Ship_Mode
FROM orders
LIMIT 5;


-- 9. LIKE()

-- Searches for patterns in text using wildcards:
SELECT
    `Product Name`,
    Category,
    Sales
    FROM orders
    WHERE `Product Name` LIKE '%Chair%';

-- Find states starting with 'C'
SELECT DISTINCT State
    FROM orders
    WHERE State LIKE 'C%';

-- Finding product ending with "Table"
SELECT `Product Name`
    FROM orders
    WHERE `Product Name` LIKE '%Table';

-- Finding Exactly five letter
SELECT DISTINCT State
    FROM orders
    WHERE State LIKE '_____';


-- DATE AND TIME FUNCTIONS

-- 1. YEAR()

-- Extracting the Year
SELECT
    `Order Date`,
    YEAR(`Order Date`) AS Order_Year
    FROM orders
    LIMIT 5;

--  total sales by year?
SELECT
    YEAR(`Order Date`) AS Year,
    ROUND(SUM(Sales), 2) AS Total_Sales
    FROM orders
    GROUP BY YEAR(`Order Date`)
    ORDER BY Year;

-- 2. MONTH()

-- Extracting the Month Number
SELECT
    `Order Date`,
    MONTH(`Order Date`) AS Month_Number
    FROM orders
    LIMIT 5;

    -- Finding the months that generate the most revenue
SELECT
    MONTH(`Order Date`) AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
    FROM orders
    GROUP BY MONTH(`Order Date`)
    ORDER BY Month;

 -- 3. MONTHNAME()

-- Returns the full month name (January, February, etc.).
SELECT
`Order Date`,
MONTHNAME(`Order Date`) AS Month_Name
FROM orders
LIMIT 5;

-- Show sales by month with readable names.
SELECT
MONTHNAME(`Order Date`) AS Month,
ROUND(SUM(Sales), 2) AS Total_Sales
FROM orders
GROUP BY MONTHNAME(`Order Date`),
MONTH(`Order Date`)
ORDER BY MONTH(`Order Date`);


-- 4. DAY()

-- Extract the Day of the Month
SELECT
    `Order Date`,
    DAY(`Order Date`) AS Day_Of_Month
    FROM orders
    LIMIT 5;

-- finding the number of orders in a month
SELECT
    DAY(`Order Date`) AS Day,
    COUNT(`Order ID`) AS Order_Count
    FROM orders
    GROUP BY DAY(`Order Date`)
    ORDER BY Day;


-- WEEKDAY()

-- Get the Day of the Week
SELECT
    `Order Date`,
    WEEKDAY(`Order Date`) AS Day_Number,
    CASE
    WHEN WEEKDAY(`Order Date`) = 0 THEN 'Monday'
    WHEN WEEKDAY(`Order Date`) = 1 THEN 'Tuesday'
    WHEN WEEKDAY(`Order Date`) = 2 THEN 'Wednesday'
    WHEN WEEKDAY(`Order Date`) = 3 THEN 'Thursday'
    WHEN WEEKDAY(`Order Date`) = 4 THEN 'Friday'
    WHEN WEEKDAY(`Order Date`) = 5 THEN 'Saturday'
    WHEN WEEKDAY(`Order Date`) = 6 THEN 'Sunday'
    END AS Day_Name
    FROM orders
    LIMIT 5;

-- 6. WEEK()
-- Get the Week Number of the Year

-- Track weekly performance for short-term trends.
SELECT
    `Order Date`,
    WEEK(`Order Date`) AS Week_Number
    FROM orders
    LIMIT 5;

-- Which weeks have the highest sales?
SELECT
    YEAR(`Order Date`) AS Year,
    WEEK(`Order Date`) AS Week,
    ROUND(SUM(Sales), 2) AS Weekly_Sales
    FROM orders
    GROUP BY YEAR(`Order Date`), WEEK(`Order Date`)
    ORDER BY Year, Week;

-- 7 DATEDIFF()

-- Calculate Days Between Two Dates
SELECT
    `Order ID`,
    `Order Date`,
    `Ship Date`,
    DATEDIFF(`Ship Date`, `Order Date`) AS Days_To_Ship
    FROM orders
    LIMIT 10;

-- Which orders took longer than 5 days to ship
SELECT
    `Order ID`,
    `Customer Name`,
    `Order Date`,
    `Ship Date`,
    DATEDIFF(`Ship Date`, `Order Date`) AS Days_To_Ship
    FROM orders
    WHERE DATEDIFF(`Ship Date`, `Order Date`) > 5
    ORDER BY Days_To_Ship DESC;

-- What's the average shipping time by ship mode?
SELECT
    `Ship Mode`,
    ROUND(AVG(DATEDIFF(`Ship Date`, `Order Date`)), 1) AS Avg_Days_To_Ship,
    COUNT(`Order ID`) AS Order_Count
    FROM orders
    GROUP BY `Ship Mode`
    ORDER BY Avg_Days_To_Ship;