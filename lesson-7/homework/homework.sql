#Write a query to find the minimum (MIN) price of a product in the Products table.
select min(price) as min_price
from Products
#Write a query to find the maximum (MAX) Salary from the Employees table.
select max(Salary) as max_salary
from Employees
#Write a query to count the number of rows in the Customers table.
select count(*) as count_Customers
from Customers
#Write a query to count the number of unique product categories from the Products table.
SELECT COUNT(DISTINCT Category) AS Unique_Categories
FROM Products
#Write a query to find the total sales amount for the product with id 7 in the Sales table.
SELECT SUM(SaleAmount) AS Total_Sales_Amount
FROM Sales
WHERE ProductID = 7
#
