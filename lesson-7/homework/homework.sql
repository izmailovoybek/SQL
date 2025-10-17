
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
#Write a query to calculate the average age of employees in the Employees table.
SELECT AVG(Age) AS AverageAge
FROM Employees;
#Write a query to count the number of employees in each department.
SELECT DepartmentName, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentNam
#Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
SELECT 
    Category,
    MIN(Price) AS MinPrice,
    MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;
#Write a query to calculate the total sales per Customer in the Sales table.
SELECT CustomerID, 
       SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY CustomerID;
#Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName).
SELECT DeptID
FROM Employees
GROUP BY DeptID
HAVING COUNT(*) > 5;
  
#Write a query to calculate the total sales and average sales for each product category from the Sales table.
SELECT Category,
       SUM(SaleAmount) AS TotalSales,
       AVG(SaleAmount) AS AverageSales
FROM Sales
GROUP BY Category;
#Write a query to count the number of employees from the Department HR.
SELECT COUNT(*) AS HR_EmployeeCount
FROM Employees
WHERE DepartmentName = 'HR';
  
#Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).
SELECT DeptID,
       MAX(Salary) AS HighestSalary,
       MIN(Salary) AS LowestSalary
FROM Employees
GROUP BY DeptID;
#Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).
SELECT DeptID,
       AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DeptID;
#Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName).
  SELECT DeptID,
       AVG(Salary) AS AvgSalary,
       COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DeptID;
#Write a query to filter product categories with an average price greater than 400.
SELECT Category
FROM Products
GROUP BY Category
HAVING AVG(Price) > 400;
#Write a query that calculates the total sales for each year in the Sales table.
SELECT 
    YEAR(SaleDate) AS SaleYear,
    SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate)
ORDER BY SaleYear;
#Write a query to show the list of customers who placed at least 3 orders.
SELECT CustomerID
FROM Sales
GROUP BY CustomerID
HAVING COUNT(*) >= 3;
