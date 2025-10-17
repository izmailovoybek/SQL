
#Write a query to select the top 5 employees from the Employees table.
SELECT * FROM Employees
ORDER BY Salary DESC
LIMIT 5;
#Use SELECT DISTINCT to select unique Category values from the Products table.
SELECT DISTINCT Category
FROM Products_Discounted;
#Write a query that filters the Products table to show products with Price > 100.
SELECT * FROM Products_Discounted
WHERE Price > 100;
#Write a query to select all Customers whose FirstName start with 'A' using the LIKE operator.
SELECT * FROM Employees
WHERE FirstName LIKE 'A%';
#Order the results of a Products table by Price in ascending order.
SELECT * FROM Products_Discounted
ORDER BY Price ASC;
#Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and DepartmentName = 'HR'.
SELECT * FROM Employees
WHERE Salary >= 60000 AND DepartmentName = 'HR';
#Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    DepartmentName,
    Salary,
    HireDate,
    Age,
    ISNULL(Email, 'noemail@example.com') AS Email,
    Country
FROM Employees;
#Write a query that shows all products with Price BETWEEN 50 AND 100.
SELECT *FROM Products
WHERE Price BETWEEN 50 AND 100;
#Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table
SELECT DISTINCT Category, ProductName
FROM Products;
#After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.
SELECT DISTINCT Category, ProductName
FROM Products
ORDER BY ProductName DESC;

#Write a query to select the top 10 products from the Products table, ordered by Price DESC.
SELECT TOP 10 * FROM Products
ORDER BY Price DESC;

#Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
SELECT EmployeeID, COALESCE(FirstName, LastName) AS Name
FROM Employees;

#Write a query that selects distinct Category and Price from the Products table.
SELECT DISTINCT Category, Price
FROM Products;

#Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or DepartmentName = 'Marketing'.
SELECT * FROM Employees
WHERE (Age BETWEEN 30 AND 40) OR DepartmentName = 'Marketing';

#Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;

#Write a query to display all products with Price <= 1000 and StockQuantity > 50, sorted by Stock in ascending order.
SELECT * FROM Products
WHERE Price <= 1000 AND StockQuantity > 50
ORDER BY StockQuantity ASC;

#Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
SELECT * FROM Products
WHERE ProductName LIKE '%e%';
