-- Generic Analysis
-- 1.How many distinct cities are present in the dataset?
SELECT DISTINCT city FROM sales;
-- 3

-- 2.In which city is each branch situated?
SELECT DISTINCT branch, city FROM sales;
-- A -> Yangon, B -> Mandalay, C-> Naypuitaw

-- Product Sales Analysis
-- 1.How many distinct product lines are there in the dataset?
SELECT COUNT(DISTINCT "Product line") FROM sales;
-- 6 Unique product lines

-- 2.What is the most common payment method?
SELECT payment, COUNT(payment) AS common_payment_method 
FROM sales GROUP BY payment ORDER BY common_payment_method DESC OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY;
-- Ewallet -> 345

-- 3.What is the most selling product line?
SELECT TOP 1 "Product line", count("Product line") AS most_selling_product
FROM sales GROUP BY "Product line" ORDER BY most_selling_product DESC;
-- Fashion Accesories 178

-- 4.What is the total revenue by month?
SELECT month_name, ROUND(SUM(total),2) AS total_revenue
FROM SALES GROUP BY month_name ORDER BY total_revenue DESC;


-- 5.Which month recorded the highest Cost of Goods Sold (COGS)?
SELECT month_name, SUM(cogs) AS total_cogs
FROM sales GROUP BY month_name ORDER BY total_cogs DESC;

-- 6.Which product line generated the highest revenue?
SELECT TOP 1 "Product line", SUM(total) AS total_revenue
FROM sales GROUP BY "Product line" ORDER BY total_revenue DESC;
-- Food and beverages

-- 7.Which city has the highest revenue?
SELECT city, SUM(total) AS total_revenue
FROM sales GROUP BY city ORDER BY total_revenue DESC OFFSET 0 ROWS FETCH NEXT 1 ROW ONLY;
-- Naypyitaw

-- 8.Which product line incurred the highest VAT?
SELECT TOP 1 "Product line", SUM("Tax 5%") as VAT 
FROM sales GROUP BY "Product line" ORDER BY VAT DESC;

SELECT "Tax 5%" FROM sales;

-- 9.Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,'based on whether its sales are above the average.

ALTER TABLE sales ADD COLUMN product_category VARCHAR(20);

UPDATE sales 
SET product_category= 
(CASE 
	WHEN total >= (SELECT AVG(total) FROM sales) THEN "Good"
    ELSE "Bad"
END)FROM sales;

-- 10.Which branch sold more products than average product sold?
SELECT branch, SUM(quantity) AS quantity
FROM sales GROUP BY branch HAVING SUM(quantity) > AVG(quantity) ORDER BY quantity DESC LIMIT 1;

-- 11.What is the most common product line by gender?
SELECT gender, "Product line", COUNT(gender) total_count
FROM sales GROUP BY gender, "Product line" ORDER BY total_count DESC;

-- 12.What is the average rating of each product line?
SELECT "Product line", ROUND(AVG(rating),2) average_rating
FROM sales GROUP BY "Product line" ORDER BY average_rating DESC;
