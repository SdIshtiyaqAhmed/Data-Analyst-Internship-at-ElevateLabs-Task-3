CREATE INDEX RowID_index on cleaned_sales_data(row_id);
CREATE INDEX ProductID_index on cleaned_sales_data(product_id);
CREATE INDEX ProductName_index on cleaned_sales_data(product_name);
CREATE VIEW AvgSalesProfitCost as
SELECT avg(sales) as avg_sales, avg(profit) as avg_profit, avg(cost) as avg_cost FROM cleaned_sales_data;
CREATE VIEW TotalSalesProfitCost as
SELECT sum(sales) as total_sales, sum(profit) as total_profit, sum(cost) as total_cost FROM cleaned_sales_data;
CREATE VIEW RegionCount as
SELECT region, count(*) as count FROM cleaned_sales_data GROUP by region ORDER by count desc;
SELECT * FROM AvgSalesProfitCost;
SELECT * FROM TotalSalesProfitCost;
Select * FROM RegionCount;
SELECT product_name FROM cleaned_sales_data WHERE ship_mode = "standard class" AND profit > 850 AND quantity < 5;
SELECT product_id, product_name FROM cleaned_sales_data where sales < (SELECT avg(sales) from cleaned_sales_data) ORDER by sales DESC LIMIT 10;
SELECT DISTINCT s1.product_id, s1.product_name, s1.quantity FROM cleaned_sales_data s1 JOIN cleaned_sales_data s2 on s1.quantity = s2.quantity AND s1.ship_mode = "standard class" ORDER by s1.quantity DESC LIMIT 10;
SELECT DISTINCT s1.product_id, s1.product_name, s1.quantity FROM cleaned_sales_data s1 JOIN cleaned_sales_data s2 on s1.quantity = s2.quantity AND s1.ship_mode = "standard class" AND s1.product_id <> s2.product_id ORDER by s1.quantity DESC LIMIT 10;