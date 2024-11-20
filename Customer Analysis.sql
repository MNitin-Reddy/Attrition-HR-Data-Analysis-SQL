-- 1.How many unique customer types does the data have?
SELECT COUNT(DISTINCT "customer type") FROM sales;
-- 2

-- 2.How many unique payment methods does the data have?
SELECT COUNT(DISTINCT payment) FROM sales;
-- 3

-- 3.Which is the most common customer type?
SELECT "customer type", COUNT("customer type") AS common_customer
FROM sales GROUP BY "customer type" ORDER BY common_customer DESC;
-- Member 501 , Normal - 499

-- 4.Which customer type buys the most?
SELECT "customer type", SUM(total) as total_sales
FROM sales GROUP BY "customer type" ORDER BY total_sales;
-- Members

SELECT "customer type", COUNT(*) AS most_buyer
FROM sales GROUP BY "customer type" ORDER BY most_buyer DESC;

-- 5.What is the gender of most of the customers?
SELECT gender, COUNT(*) AS all_genders 
FROM sales GROUP BY gender ORDER BY all_genders DESC;
-- Female - 501 , male - 499 

-- 6.What is the gender distribution per branch?
SELECT branch, gender, COUNT(gender) AS gender_distribution
FROM sales GROUP BY branch, gender ORDER BY branch;

-- 7.Which time of the day do customers give most ratings?
SELECT time_of_day, AVG(rating) AS average_rating
FROM sales GROUP BY time_of_day ORDER BY average_rating DESC;
-- Afternoon

-- 8.Which time of the day do customers give most ratings per branch?
SELECT branch, time_of_day, AVG(rating) AS average_rating
FROM sales GROUP BY branch, time_of_day ORDER BY average_rating DESC;
-- A - afternoon , C-Evening, C-Afternoon, A-Morning respectively
-- Poor rates from all 3 B 

-- 9.Which day of the week has the best avg ratings?
SELECT day_name, AVG(rating) AS average_rating
FROM sales GROUP BY day_name ORDER BY average_rating DESC;
-- Monday, Friday, Sunday

-- 10.Which day of the week has the best average ratings per branch?
SELECT  branch, day_name, AVG(rating) AS average_rating
FROM sales GROUP BY day_name, branch ORDER BY average_rating DESC;
-- B - Monday, A-Friday, C-Friday