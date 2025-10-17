#Write a query that uses an alias to rename the ProductName column as Name in the Products table.
SELECT ProductName AS Name
FROM Products;
SELECT 
    ProductID,
    ProductName AS Name,
    Price,
    Category,
    StockQuantity
FROM Products;
#Write a query that uses an alias to rename the Customers table as Client for easier reference.
SELECT *
FROM Customers AS Client;
SELECT 
    Client.CustomerID,
    Client.FirstName,
    Client.LastName,
    Client.Email,
    Client.Country
FROM Customers AS Client;
#Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
#Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discounted;
#Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
SELECT DISTINCT FirstName, LastName, Country
FROM Customers;
SELECT DISTINCT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Country
FROM Customers;
#Write a query that uses CASE to create a conditional column that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.
SELECT 
    ProductName,
    Price,
    CASE 
        WHEN Price > 1000 THEN 'High'
        ELSE 'Low'
    END AS PriceCategory
FROM Products;
#Use IIF to create a column that shows 'Yes' if StockQuantity > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).
SELECT 
    ProductName,
    StockQuantity,
    IIF(StockQuantity > 100, 'Yes', 'No') AS OverStocked
FROM Products_Discounted;

#Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted tables.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;
#Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;
SELECT ProductName FROM Products_Discounted
EXCEPT
SELECT ProductName FROM Products;
#Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, and 'Affordable' if less, from Products table.
SELECT 
    ProductName,
    Price,
    IIF(Price > 1000, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;
#Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.
SELECT *
FROM Employees
WHERE Age < 25 OR Salary > 60000;
#Update the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5
UPDATE Employees
SET Salary = Salary * 1.10
WHERE DepartmentName = 'HR' OR Emp
