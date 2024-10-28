USE demo;

SELECT * FROM attrition;

-- Overall attrition in the organisation
SELECT COUNT(*) as total_employees, 
	count(case when attrition = "Yes" then 1 end) as attrition_count
FROM attrition;
-- Total employees: 1470    ,  attrition_count: 237

-- Relationship between Attrition and Overtime 
-- Impact of overtime in attrition
-- Presence of overtime in attrition
SELECT overtime, COUNT(*) as total_employees
FROM attrition
WHERE attrition = 'Yes'
GROUP BY overtime; 
-- Overtime -> Yes: 127  , No: 110
-- Overtime isn't playing an important role in attrition

-- Presence of relation between rating and attrition
select 
performancerating, COUNT(*) as total_employees
FROM attrition
WHERE attrition ="Yes"
GROUP BY performancerating;
-- rating -> 3: 200  , 4 --> 37
-- There is a negative correlation between rating and attrition
-- as most of the attrition employess gave a lower rating

-- Presence of salary hike and attrition
select 
percentsalaryhike, COUNT(*) as total_employees
FROM attrition
WHERE attrition ="Yes"
GROUP BY percentsalaryhike
ORDER BY total_employees DESC;
-- A lower percethike will cause more attrition
-- There is a negative correlation amongst them