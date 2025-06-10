# task-6--Sales-Trend-Analysis-Using-Aggregations
Overview
This SQL script performs various analyses on an online sales dataset to extract meaningful business insights. The queries focus on monthly sales trends, revenue patterns, and order volumes.

Database Structure
The script works with a table named onlinesales (also referenced as online_sales in one query) which appears to contain transactional sales data.

Key columns used in the analysis:

Date (or date_) - Transaction date

Transaction ID (or transaction_ID) - Unique identifier for orders

Total Revenue - Revenue generated per transaction

Queries and Their Purposes
1. Basic Exploration
SELECT * FROM onlinesales LIMIT 5 - Views first 5 records

DESCRIBE onlinesales - Shows table structure

SHOW COLUMNS FROM onlinesales - Alternative way to view table columns

2. Date Extraction
Extracts month from date field to understand temporal patterns

Converts string dates to proper date format using STR_TO_DATE

3. Key Analytical Queries
a. Monthly Order Volume
sql
SELECT 
    YEAR(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_year,
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_month,
    COUNT(DISTINCT `Transaction ID`) AS order_volume
FROM onlinesales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;
Calculates the number of unique orders per month.

b. Monthly Revenue Analysis
sql
SELECT 
    YEAR(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_year,
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_month,
    SUM(`Total Revenue`) AS monthly_revenue
FROM onlinesales
GROUP BY order_year, order_month;
Calculates total revenue generated each month.

c. Top Performing Months
sql
SELECT 
    YEAR(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_year,
    MONTH(STR_TO_DATE(`Date`, '%Y-%m-%d')) AS order_month,
    SUM(`Total Revenue`) AS monthly_revenue
FROM onlinesales
GROUP BY order_year, order_month
ORDER BY monthly_revenue DESC
LIMIT 6;
Identifies the 6 highest revenue months in descending order.

Usage
To run these queries:
Ensure you have access to the task5 database
Execute the queries in sequence to understand the sales patterns
Modify date formats if your data uses different formatting

Potential Improvements
Add seasonal analysis (quarters, holiday periods)
Include year-over-year comparisons
Add average order value calculations
Incorporate product category analysis if available in the data
This analysis provides a foundation for understanding sales trends and can be expanded based on specific business needs.

