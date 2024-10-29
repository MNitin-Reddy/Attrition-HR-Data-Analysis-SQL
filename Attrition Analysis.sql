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

-- Attrition base on the age buckets
-- Age buckets will be - 18-29, 30-39, 40-49,50-59, older than 60
Select case when age <= 29 then "18-29"
when age > 30 and age <= 39 then "30-39"
When age > 40 and age <= 49 then "40-49"
when age >=50 and age <= 59 then "50-59"
else "60 or above"
end as "Age bucket", count(*) as attrition_count
from attrition
where attrition = "Yes"
group by case when age <= 29 then "18-29"
when age > 30 and age <= 39 then "30-39"
When age > 40 and age <= 49 then "40-49"
when age >=50 and age <= 59 then "50-59"
else "60 or above"
end
order by attrition_count desc;
-- attrition count is more for age groups 18-29 and 30-39

SELECT environmentsatisfaction, jobsatisfaction, relationshipsatisfaction,
count(*) as attrition_count
FROM attrition
WHERE attrition = "Yes" and MonthlyIncome > (SELECT AVG(monthlyIncome) FROM attrition)
group by environmentsatisfaction, jobsatisfaction, relationshipsatisfaction
Order BY attrition_count desc;

-- Relation between promotion and attrition
-- promotion buckets 0-3, 4-7, 8-10 and above 10
SELECT CASE WHEN yearssincelastpromotion <=3 then '0-3'
When yearssincelastpromotion >= 4 and yearssincelastpromotion <= 7 then '4-7'
When yearssincelastpromotion >= 8 and yearssincelastpromotion <= 10 then '8-10'
else 'above 10'
end as "Promotion age" , count(*) as attrition_count
from attrition
WHERE attrition = "Yes"
group by  CASE WHEN yearssincelastpromotion <=3 then '0-3'
When yearssincelastpromotion >= 4 and yearssincelastpromotion <= 7 then '4-7'
When yearssincelastpromotion >= 8 and yearssincelastpromotion <= 10 then '8-10'
else 'above 10'
end
ORDER BY attrition_count desc;
-- 0-3 have high attrition i.e delay in promotion may have caused the attrition


-- Attrition based on the job roles (req -  department, job role, count of attrition)

SELECT department, jobrole, count(*) as attrition_count
FROM attrition
WHERE attrition ="Yes"
group by department, jobrole
order by attrition_count desc;
-- Maximum attrition from Reserach and Development department over various job roles
-- followed by the sales department

-- Attrition based on bussiness travel
SELECT businesstravel, count(*) as attrition_count
from attrition
WHERE attrition ="Yes"
group by businessTravel
order by attrition_count desc;

