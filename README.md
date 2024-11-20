# Super Store Analytics Project

## Introduction
This project analyses retail sales data spanning multiple branches and cities to uncover patterns in customer behavior, product performance, and revenue trends. Using SQL, we aim to explore key metrics such as branch-wise sales, product line preferences, payment methods, and time-based patterns to derive actionable business insights.

## Objective
The objective is to evaluate branch and city performance, identify high-performing product lines, and understand customer preferences based on demographics, payment methods, and time of purchase. These insights will guide data-driven strategies to improve customer satisfaction, optimize product offerings, and maximize revenue.

## About Data
This project's data was obtained from the Kaggle Superstore Sales Forecasting Competition and it encompasses sales transactions from three branches situated in Mandalay, Yangon, and Naypyitaw, respectively.
| Column            | Description                                   | Data Type        |
|-------------------|-----------------------------------------------|------------------|
| invoice_id        | Invoice of the sales made                     | VARCHAR(30)      |
| branch            | Branch at which sales were made               | VARCHAR(5)       |
| city              | The location of the branch                    | VARCHAR(30)      |
| customer_type     | The type of the customer                       | VARCHAR(30)      |
| gender            | Gender of the customer making purchase        | VARCHAR(10)      |
| product_line      | Product line of the product sold               | VARCHAR(100)     |
| unit_price        | The price of each product                     | DECIMAL(10, 2)   |
| quantity          | The amount of the product sold                 | INT              |
| VAT               | The amount of tax on the purchase             | FLOAT(6, 4)      |
| total             | The total cost of the purchase                | DECIMAL(12, 4)   |
| date              | The date on which the purchase was made       | DATETIME         |
| time              | The time at which the purchase was made       | TIME             |
| payment           | The total amount paid                         | DECIMAL(10, 2)   |
| cogs              | Cost Of Goods sold                            | DECIMAL(10, 2)   |
| gross_margin_pct  | Gross margin percentage                       | FLOAT(11, 9)     |
| gross_income      | Gross Income                                  | DECIMAL(12, 4)   |
| rating            | Rating                                        | FLOAT(2, 1)      |


## Analysis List:

1.	Product Analysis

> Perform an analysis on the data to gain insights into different product lines, determine the top-performing product lines, and identify areas for improvement in other product lines.

2.	Sales Analysis
   
> The objective of this analysis is to address the inquiry regarding the sales trends of the product. The outcomes of this analysis can assist in evaluating the efficiency of each applied sales strategy in the business and determining necessary modifications to increase sales.

3.	Customer Analysis

> This analysis is focused on identifying various customer segments, understanding purchasing trends, and evaluating the profitability associated with each of these customer segments.

## Approach Used
***1.	Data Wrangling***

During this initial phase, the data is examined to detect any NULL or missing values, and strategies for data replacement are implemented to address and substitute these values effectively.
- Build a database
- Create a table and insert the data.
- Select columns with null values in them. Null values are not present in our database because, in creating the tables, NOT NULL was specified for each field, effectively filtering out any null values.

***2.	Feature Engineering***

This will help use generate some new columns from existing ones.
- Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
- Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
- Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

***3.  Exploratory Data Analysis (EDA)***

Conducting exploratory data analysis is essential to address the project's questions and objectives.

## **Insights from Analysis**

### **1. Generic & Product Analysis**
#### **Cities and Branches**
   - The dataset covers **3 cities**: Yangon, Mandalay, Naypyitaw.
   - Branch locations:
     - **A**: Yangon  
     - **B**: Mandalay  
     - **C**: Naypyitaw
#### **Product Lines**
- **6 distinct product lines** are available.
- **Fashion Accessories** is the most sold product line with 178 sales.
- **Food and Beverages** generates the highest revenue and incurs the highest VAT.
#### **Payment Methods**
- **E-wallet** is the most commonly used payment method (345 transactions).
#### **Revenue Trends**
- The highest revenue is recorded in **Naypyitaw**.
- Revenue by month peaks for a specific month (analysis required for strategic campaigns).

### **2. Sales Analysis**
#### **Customer and Revenue Insights**
- **Members** contribute the most revenue and pay the highest VAT.
- Members also outnumber normal customers slightly (**501 vs. 499**).
#### **Time-of-Day and Week Analysis**
- **Afternoon** sees the highest ratings across branches.
- Best average ratings are observed on **Mondays**, followed by **Fridays**.
#### **Branch Performance**
- **Branch A (Yangon)** sold more products than the average.
- **Branch B (Mandalay)** receives lower customer ratings compared to A and C.
#### **Product Performance**
- **Food and Beverages** leads in revenue and VAT.
- Product categories marked as "**Good**" contribute above-average revenue.

### **3. Customer Behavior**
- Gender distribution is nearly balanced (**Female: 501**, **Male: 499**).
- Gender distribution per branch shows no significant biases.
- Customers give the best ratings during the **afternoon**.

## **Recommendations**
#### **1. Improve Branch Performance**
- **Branch B (Mandalay)**: Focus on understanding the reasons behind lower customer ratings (e.g., product availability, customer service issues).
- Consider targeted training or operational improvements.
#### **2. Leverage Time-of-Day Insights**
- Focus promotions or discounts in the **afternoon** to capitalize on higher customer satisfaction.
- Use customer ratings as a measure of service quality during peak times.
#### **3. Enhance Product Strategies**
- **Food and Beverages**: Prioritize its availability, pricing, and promotions, as it leads in revenue.
- Consider introducing more varieties or bundles for **Fashion Accessories**, as it is the most sold product line.
#### **4. Engage Members**
- **Members** contribute the most to revenue and VAT. Develop loyalty programs, targeted offers, and retention strategies to enhance this customer segment.
#### **5. Optimize City-Wise Strategies**
- **Naypyitaw** generates the highest revenue; continue focusing marketing efforts there while investigating potential in Mandalay and Yangon to increase branch performance.
#### **6. Target High-Rating Days**
- Enhance campaigns and advertising on **Mondays and Fridays**, leveraging customer satisfaction trends.
#### **7. Payment Method Insights**
- Encourage using **E-wallets** further by providing cashback or discounts, as it’s already the most preferred payment method.

