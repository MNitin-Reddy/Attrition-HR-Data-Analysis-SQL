USE superstore;

-- Sales Analysis
-- 1.Number of sales made in each time of the day per weekday
SELECT day_name, time_of_day, COUNT("invoice id") AS total_sales
FROM sales GROUP BY day_name, time_of_day HAVING day_name NOT IN ('Sunday','Saturday');

SELECT day_name, time_of_day, COUNT(*) AS total_sales
FROM sales WHERE day_name NOT IN ('Saturday','Sunday') GROUP BY day_name, time_of_day;

-- 2.Identify the customer type that generates the highest revenue.
SELECT TOP 1 "customer type", SUM(total) AS total_sales
FROM sales GROUP BY "customer type" ORDER BY total_sales DESC;

-- 3.Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, SUM("Tax 5%") AS total_VAT
FROM sales GROUP BY city ORDER BY total_VAT DESC OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY;
-- 5265.17

-- 4.Which customer type pays the most in VAT?
SELECT TOP 1 "customer type", SUM("Tax 5%") AS total_VAT
FROM sales GROUP BY "customer type" ORDER BY total_VAT DESC;
-- Member 7820.164