/* 1. Show all the transaction that are made in mumbai */
SELECT * 
FROM transactions
where market_code = 'Mark002';

/* 2. Show the distinct Product codes that are sold in Mumbai */
SELECT distinct product_code 
FROM transactions 
WHERE market_code = 'Mark002';

/* 3. Show the transaction where currency is US Dollars */
SELECT * 
FROM transactions 
WHERE currency = 'USD';

/* 4. Show transactions in 2020 join by date table */
SELECT transactions.*,date.*
FROM transactions 
INNER JOIN date 
ON transactions.order_date = date.date
WHERE date.year = 2020;

/* 5.Show total revenue in year 2020 */
SELECT SUM(transactions.sales_amount) AS total_revenue
FROM transactions
INNER JOIN date ON 
transactions.order_date = date.date
WHERE 
date.year = 2020;
    
/* 6. Show total revenue in year 2020, January Month */
SELECT sum(transactions.sales_amount) AS Jan_revenu_2020
FROM transactions
INNER JOIN date 
ON transactions.order_date = date.date
WHERE date.year = 2020 and date.month_name = 'January';

/* 7. Show total revenue in year 2020 in Mumbai */
SELECT sum(transactions.sales_amount) AS Jan_revenu_2020
FROM transactions
INNER JOIN date 
ON transactions.order_date = date.date
WHERE date.year = 2020 and transactions.market_code = 'Mark002';

/* product generated the most revenue */
SELECT products.product_type, 
SUM(transactions.sales_amount) AS total_revenue
FROM transactions
JOIN products ON transactions.product_code = products.product_code
GROUP BY product_type
ORDER BY total_revenue DESC
LIMIT 1;


