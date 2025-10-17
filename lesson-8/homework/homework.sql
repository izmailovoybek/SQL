#Using Products table, find the total number of products available in each category.
SELECT Category, COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;
#Using Products table, get the average price of products in the 'Electronics' category.
SELECT AVG(Price) AS AveragePrice
FROM Products
WHERE Category = 'Electronics';
#Using Customers table, list all customers from cities that start with 'L'.
SELECT *
FROM Customers
WHERE City LIKE 'L%';
#Using Products table, get all product names that end with 'er'.
SELECT ProductName
FROM Products
WHERE ProductName LIKE '%er';
#Using Customers table, list all customers from countries ending in 'A'.
SELECT *
FROM Customers
WHERE Country LIKE '%A';
#Using Products table, show the highest price among all products.
SELECT MAX(Price) AS HighestPrice
FROM Products;
#Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
SELECT 
    ProductID,
    ProductName,
    StockQuantity,
    CASE 
        WHEN StockQuantity < 30 THEN 'Low Stock'
        ELSE 'Sufficient'
    END AS StockStatus
FROM Products;
#Using Customers table, find the total number of customers in each country
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;
#Using Orders table, find the minimum and maximum quantity ordered.
SELECT MIN(Quantity) AS MinQuantity,
       MAX(Quantity) AS MaxQuantity
FROM Orders;
#Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
SELECT DISTINCT o.CustomerID
FROM Orders o
WHERE o.OrderDate >= '2023-01-01'
  AND o.OrderDate < '2023-02-01'
  AND NOT EXISTS (
    SELECT 1
    FROM Invoices i
    WHERE i.OrderID = o.OrderID
      AND i.CustomerID = o.CustomerID
  );
#Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;
#Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
#Using Orders table, find the average order amount by year.
SELECT 
    YEAR(OrderDate) AS OrderYear,
    AVG(OrderAmount) AS AverageOrderAmount
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;
#Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
  SELECT 
    ProductName,
    CASE 
        WHEN Price < 100 THEN 'Low'
        WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
        WHEN Price > 500 THEN 'High'
    END AS PriceGroup
FROM Products;
#Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
  SELECT 
    City,
    [2012],
    [2013]
FROM
    (SELECT City, Year, Population FROM City_Population) AS SourceTable
PIVOT
(
    SUM(Population)
    FOR Year IN ([2012], [2013])
) AS PivotTable;
#Using Sales table, find total sales per product Id.
SELECT ProductID, SUM(SaleAmount) AS TotalSales
FROM Sales
GROUP BY ProductID;
