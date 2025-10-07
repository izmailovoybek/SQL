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
