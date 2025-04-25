# Data-Analyst-Internship-at-ElevateLabs-Task-3

Dataset from kaggle: [sales_data.csv](https://www.kaggle.com/datasets/imranlukman/amazon-online-sales-dataset)   
Data cleaning and preprocessing: [Data-Analyst-Internship-at-ElevateLabs-Task-1](https://github.com/SdIshtiyaqAhmed/Data-Analyst-Internship-at-ElevateLabs-Task-1)   
Cleaned Dataset: [cleaned_sales_data.csv](https://github.com/SdIshtiyaqAhmed/Data-Analyst-Internship-at-ElevateLabs-Task-3/blob/main/cleaned_sales_data.csv)

Here is a brief overview of the SQL for data analysis process:
- Using the DB Browser for SQLite, create a new database.
- Import the cleaned_sales_data.csv into the database as a table.
- Perform SQL queries on the table.
- Observe and note the output.
- Save the queries in a SQL file.

## The SQL Queries and Outputs noted are:

### Create Indexes:   

#### Index on row_id:  
- CREATE INDEX RowID_index on cleaned_sales_data(row_id);   

#### Index on product_id:    
- CREATE INDEX ProductID_index on cleaned_sales_data(product_id);    

#### Index on product_name:   
- CREATE INDEX ProductName_index on cleaned_sales_data(product_name);

### Created Views:

#### View: Average Sales, Profit, Cost   

CREATE VIEW AvgSalesProfitCost as   
SELECT avg(sales) as avg_sales, avg(profit) as avg_profit, avg(cost) as avg_cost FROM cleaned_sales_data;   
SELECT * FROM AvgSalesProfitCost;   

![image](https://github.com/user-attachments/assets/84b603a2-3ed7-4152-b198-d365bdc2ac1a)

#### View: Total Sales, Profit, Cost   

CREATE VIEW TotalSalesProfitCost as   
SELECT sum(sales) as total_sales, sum(profit) as total_profit, sum(cost) as total_cost FROM cleaned_sales_data;   
SELECT * FROM TotalSalesProfitCost;

![image](https://github.com/user-attachments/assets/6a9604c7-21ac-4efd-b3f0-2dd2970c4131)

#### View: Count of entries by Region   

CREATE VIEW RegionCount as   
SELECT region, count(*) as count FROM cleaned_sales_data GROUP by region ORDER by count desc;   
Select * FROM RegionCount;

![image](https://github.com/user-attachments/assets/6f3163cc-d3f5-49ca-81f8-8dcd6da4ab57)

### Data Analysis Queries:   

#### Products with “Standard Class”, Profit > 850, and Quantity < 5   

SELECT product_name FROM cleaned_sales_data WHERE ship_mode = "standard class" AND profit > 850 AND quantity < 5;   

![image](https://github.com/user-attachments/assets/a6c7f1dc-a654-4223-87c9-47b232ab5118)

#### Top 10 Products below Average Sales   

SELECT product_id, product_name FROM cleaned_sales_data where sales < (SELECT avg(sales) from cleaned_sales_data) ORDER by sales DESC LIMIT 10;   

![image](https://github.com/user-attachments/assets/c9ea56c4-66d4-452e-92d7-ba96fa673a4a)

#### Products with the Same Quantity (Standard Class), May Include Self-Match   

SELECT DISTINCT s1.product_id, s1.product_name, s1.quantity FROM cleaned_sales_data s1 JOIN cleaned_sales_data s2 on s1.quantity = s2.quantity AND s1.ship_mode = "standard class" ORDER by s1.quantity DESC LIMIT 10;   

![image](https://github.com/user-attachments/assets/2cd1710b-1241-4da5-a15c-6c645e6320fa)

#### Products with Same Quantity (Standard Class), Excluding Self-Match   

SELECT DISTINCT s1.product_id, s1.product_name, s1.quantity FROM cleaned_sales_data s1 JOIN cleaned_sales_data s2 on s1.quantity = s2.quantity AND s1.ship_mode = "standard class" AND s1.product_id <> s2.product_id ORDER by s1.quantity DESC LIMIT 10;   

![image](https://github.com/user-attachments/assets/c4fb3337-f110-4af8-a6f4-ccffec9cf473)
