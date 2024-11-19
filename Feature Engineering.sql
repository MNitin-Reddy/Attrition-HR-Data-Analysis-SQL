USE superstore;


SELECT * FROM salesdata;


-- Feature Enginnering
-- For the analysis we need time of day and day name

-- Creating time of the day column
SELECT time,
(CASE 
	WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
	WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
	ELSE 'Evening' 
END) AS time_of_day
FROM salesdata;

ALTER TABLE salesdata ADD time_of_day VARCHAR(20);

UPDATE salesdata
SET time_of_day = (
	CASE 
		WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
		WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
		ELSE 'Evening' 
	END
);

SELECT time_of_day FROM salesdata;


-- name of the day column

SELECT date,
DATENAME(WEEKDAY, date) AS day_name
FROM sales;

ALTER TABLE sales ADD day_name VARCHAR(10);

UPDATE sales
SET day_name = DATENAME(WEEKDAY,date);

-- month name
SELECT date,
DATENAME(MONTH, date) AS month_name
FROM sales;

ALTER TABLE sales ADD month_name VARCHAR(10);

UPDATE sales
SET month_name = DATENAME(MONTH, date);

SELECT * FROM sales;


-- Updating total column form varchar to numeric
SELECT *
FROM sales
WHERE ISNUMERIC(total) = 0;
-- No invalid values

ALTER TABLE sales
ALTER COLUMN total FLOAT;
