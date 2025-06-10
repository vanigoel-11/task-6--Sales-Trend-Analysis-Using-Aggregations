SELECT * FROM task5.OnlineSales
use task5;
show databases;
show tables;
SELECT * FROM `onlinesales` LIMIT 5;
select* from onlinesales;
SELECT EXTRACT(MONTH FROM `Date`) AS order_month FROM  onlinesales LIMIT 10;
describe onlinesales;
SELECT 
    YEAR(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_year,
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_month,
    COUNT(DISTINCT `Transaction ID`) AS order_volume
FROM 
    onlinesales
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;

-- 1. Year & Month extraction
SELECT 
    YEAR(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_year,
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_month
FROM 
    onlinesales
GROUP BY 
    order_year, order_month;

-- 2. Monthly Revenue
SELECT 
    YEAR(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_year,
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_month,
    SUM(`Total Revenue`) AS monthly_revenue
FROM 
    onlinesales
GROUP BY 
    order_year, order_month;

-- 3. Monthly Order Volume
SELECT 
    YEAR(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_year,
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_month,
    COUNT(DISTINCT `Transaction ID`) AS order_volume
FROM 
    onlinesales
GROUP BY 
    order_year, order_month;

-- 4. Monthly Revenue Sorted Descending
SELECT 
    YEAR(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_year,
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_month,
    SUM(`Total Revenue`) AS monthly_revenue
FROM 
    onlinesales
GROUP BY 
    order_year, order_month
ORDER BY 
    monthly_revenue DESC;

-- 5. Top 6 Highest Revenue Months
SELECT 
    YEAR(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_year,
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_month,
    SUM(`Total Revenue`) AS monthly_revenue
FROM 
    onlinesales
GROUP BY 
    order_year, order_month
ORDER BY 
    monthly_revenue DESC
LIMIT 6;

DESCRIBE online_sales;
SELECT 
    YEAR(date_) AS order_year,
    MONTH(date_) AS order_month,
    COUNT(DISTINCT transaction_ID) AS order_volume
FROM 
    online_sales
GROUP BY 
    order_year, order_month
ORDER BY 
    order_year, order_month;
SHOW COLUMNS FROM onlinesales;
