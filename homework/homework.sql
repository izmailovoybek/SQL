#Define the following terms: data, database, relational database, and table.
  
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2)
);

#List five key features of SQL Server.
CREATE TRIGGER trg_UpdateTime
ON Employees
AFTER UPDATE
AS
BEGIN
    UPDATE Employees SET LastModified = GETDATE() WHERE EmployeeID IN (SELECT EmployeeID FROM inserted);
END;

#Create a new database in SSMS named SchoolDB.

CREATE DATABASE SchoolDB;
SELECT name 
FROM sys.databases 
WHERE name = 'SchoolDB';

#Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
  CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
SELECT * FROM Students;

#Describe the differences between SQL Server, SSMS, and SQL.
  Component	Role	Example
SQL Server Database engine (stores data) Runs in the background
SSMS Tool/interface to manage SQL Server Used to write and execute queries
SQL Language to query and manage data SELECT * FROM Students;

#Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
SELECT Name, Age FROM Students;
INSERT INTO Students (StudentID, Name, Age)
VALUES (1, 'John Doe', 20);

-- Update an existing student
UPDATE Students
SET Age = 21
WHERE StudentID = 1;

-- Delete a student
DELETE FROM Students
WHERE StudentID = 1;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- Alter a table (add a column)
ALTER TABLE Students
ADD Email VARCHAR(100);

-- Drop a table
DROP TABLE Courses;

-- Truncate a table (remove all rows, faster than DELETE)
TRUNCATE TABLE Students;


-- Grant SELECT permission to a user
GRANT SELECT ON Students TO User1;

-- Revoke SELECT permission from a user
REVOKE SELECT ON Students FROM User1;

#Write a query to insert three records into the Students table.
INSERT INTO Students (StudentID, Name, Age)
VALUES 
    (1, 'Alice Johnson', 20),
    (2, 'Brian Smith', 22),
    (3, 'Carla Rivera', 19);

SELECT * FROM Students;
----------------------------------
----- *** Asosiy darajadagi vazifalar (10) *** -----
----- 1. Ustunlar bilan xodimlar jadvalini yarating: EmpID INT, Ism (VARCHAR(50)) va Ish haqi (DECIMAL(10,2)).
create database homework_02
use homework_02
create table xodimlar (EmpID INT, Ism VARCHAR(50), Ish_haqi DECIMAL(10,2))
select * from xodimlar


----- 2. Turli xil INSERT INTO yondashuvlaridan foydalangan holda 
----- Xodimlar jadvaliga uchta yozuvni kiriting (bir qatorli va bir nechta qatorli qo'shimchalar).
INSERT INTO xodimlar values 
	(1, 'Jasur', 5020.5)
INSERT INTO xodimlar values 
	(2, 'Sardor', 5000.2),
	(3, 'Guli', 5050.5),
	(4, 'Nilu', 4000.1)
select * from xodimlar

----- 3. Xodimning ish haqini 7000 ga yangilang, bunda EmpID = 1.
update xodimlar
set Ish_haqi = 7000
where EmpID = 1
select * from xodimlar

----- 4. EmpID = 2 bo'lgan Xodimlar jadvalidan yozuvni o'chiring.
delete xodimlar
where EmpID = 2
select * from xodimlar

----- 5. DELETE, TRUNCATE va DROP o'rtasidagi farqga qisqacha ta'rif bering.
-- delete -> jadval ichidagi qatorlarni o'chiradi where orqali shart berib tanlab o'chirish ham mumkin;
-- truncate -> jadvaldagi barcha ma'lumotlarni o'chiradi where orqali shart berib bo'lmaydi;
-- drop -> jadvalni butunlay o'chirib tashlaydi.

----- 6. Xodimlar jadvalidagi Ism ustunini VARCHAR(100) ga o'zgartiring.
ALTER TABLE xodimlar
ALTER COLUMN Ism VARCHAR(100);
select * from xodimlar
EXEC sp_help xodimlar;

----- 7. Xodimlar jadvaliga yangi bo'lim bo'limi (VARCHAR(50)) qo'shing.
ALTER TABLE xodimlar
ADD Bolim VARCHAR(50);
select * from xodimlar

----- 8. Ish haqi ustunining ma'lumotlar turini FLOAT ga o'zgartiring.
ALTER TABLE xodimlar
ALTER COLUMN Ish_haqi FLOAT;
select * from xodimlar
EXEC sp_help xodimlar;

----- 9. DepartamentID (INT, PRIMARY KEY) va DepartmentName (VARCHAR(50)) ustunlari bilan boshqa bo'limlar jadvalini yarating.
CREATE TABLE bolimlar (DepartamentID INT PRIMARY KEY, DepartmentName VARCHAR(50))
select * from bolimlar

----- 10. Xodimlar jadvalidan barcha yozuvlarni tuzilishini o'chirmasdan olib tashlang.
delete xodimlar
select * from xodimlar

----- *** O'rta darajadagi vazifalar (6) *** -----
----- 1. INSERT INTO SELECT usuli yordamida Bo'limlar jadvaliga beshta yozuvni kiriting 
----- (siz xohlagan narsani ma'lumot sifatida yozishingiz mumkin).
INSERT INTO bolimlar values
(1, 'Tashqi'),
(2, 'Ichki'),
(3, 'Savdo'),
(4, 'Kadr'),
(5, 'Bux')
select * from bolimlar

----- 2. Ish haqi > 5000 bo'lgan barcha xodimlar bo'limini "Menejment" ga yangilang.
INSERT INTO xodimlar values 
	(1, 'Jasur', 5020.5, 'Tashqi'),
	(2, 'Sardor', 5000.2, 'Ichki'),
	(3, 'Guli', 5050.5, 'Savdo'),
	(4, 'Nilu', 4000.1, 'Tashqi')

update xodimlar
set Bolim = 'Menejment'
where Ish_haqi > 5000
select * from xodimlar

----- 3. Barcha xodimlarni olib tashlaydigan, lekin jadval tuzilmasini buzilmasdan saqlaydigan so'rov yozing.
truncate table xodimlar
select * from xodimlar

----- 4. Xodimlar jadvalidan bo'lim ustunini tashlang.
ALTER TABLE xodimlar
DROP COLUMN Bolim;
select * from xodimlar

----- 5. SQL buyruqlari yordamida Xodimlar jadvalining nomini StaffMembers deb o'zgartiring.
EXEC sp_rename 'xodimlar', 'StaffMembers';
select * from StaffMembers

----- 6. Bo'limlar jadvalini ma'lumotlar bazasidan butunlay olib tashlash uchun so'rov yozing.
drop table mahsulotlar

----- *** Yuqori darajadagi vazifalar (9) *** -----
----- 1. Mahsulotlar nomli jadvalni kamida 5 ta ustundan iborat yarating, jumladan: ProductID (Birlamchi kalit), 
----- Mahsulot nomi (VARCHAR), Kategoriya (VARCHAR), Narx (DECIMAL)
create table mahsulotlar (ProductID int Primary Key, Mahsulot_nomi VARCHAR(50), Kategoriya VARCHAR(50), Narx DECIMAL)
select * from mahsulotlar

----- 2. Narx har doim 0 dan katta bo'lishini ta'minlash uchun CHECK cheklovini qo'shing.
ALTER TABLE mahsulotlar
ADD CONSTRAINT chk_narx_musbat
CHECK (Narx > 0);
insert into mahsulotlar values
(1, 'Olma', 'meva', 15000),
(2, 'Nok', 'meva', 20000),
(3, 'Bodring', 'sabsovot', 10000),
(4, 'Pamidor', 'sabzovot', 12000)
select * from mahsulotlar

----- 3. DEFAULT qiymati 50 bo'lgan StockQuantity ustunini qo'shish uchun jadvalni o'zgartiring.
ALTER TABLE mahsulotlar
ADD StockQuantity int default 50;

insert into mahsulotlar (ProductID, Mahsulot_nomi, Kategoriya, Narx)
values (5, 'Banan', 'sitrus_meva', 15000)
select * from mahsulotlar

----- 4. Turkum nomini ProductCategory deb o‘zgartiring
EXEC sp_rename 'mahsulotlar.Kategoriya', 'ProductCategory', 'COLUMN';
select * from mahsulotlar

----- 5. Standart INSERT INTO so'rovlari yordamida Mahsulotlar jadvaliga 5 ta yozuvni kiriting.
insert into mahsulotlar (ProductID, Mahsulot_nomi, ProductCategory, Narx)
values
	(6, 'Behi', 'meva', 25000),
	(7, 'Olcha', 'meva', 30000),
	(8, 'Qovoq', 'poliz', 5000),
	(9, 'Qovun', 'poliz', 7000),
	(10, 'tarvuz', 'poliz', 3000)
select * from mahsulotlar

----- 6. Barcha Mahsulotlar maʼlumotlarini oʻz ichiga olgan Products_Backup nomli 
----- zaxira jadvalini yaratish uchun SELECT INTO dan foydalaning.
SELECT * INTO Products_Backup FROM mahsulotlar;
select * from Products_Backup

----- 7. Mahsulotlar jadvalining nomini Inventar deb o'zgartiring.
EXEC sp_rename 'mahsulotlar', 'Inventar';
select * from Inventar

----- 8. Narx ma'lumotlar turini DECIMAL(10,2) dan FLOAT ga o'zgartirish uchun Inventar jadvalini o'zgartiring.
ALTER TABLE Inventar
DROP CONSTRAINT chk_narx_musbat;

ALTER TABLE Inventar
ALTER COLUMN Narx FLOAT;
SELECT * FROM Inventar;

----- 9. Inventar jadvaliga 1000 dan boshlanadigan va 5 ga oshiriladigan ProductCode nomli IDENTITY ustunini qo'shing.
SELECT 
    IDENTITY(INT, 1000, 5) AS ProductCode,
    *
INTO Inventar_temp
FROM Inventar;
DROP TABLE Inventar;
EXEC sp_rename 'Inventar_temp', 'Inventar';
SELECT * FROM Inventar;
---------------------------------------------------
#Define and explain the purpose of BULK INSERT in SQL Server.
  BULK INSERT table_name
FROM 'file_path'
WITH (
    FIELDTERMINATOR = 'delimiter',
    ROWTERMINATOR = 'line_terminator',
    FIRSTROW = n,
    ...
);

#List four file formats that can be imported into SQL Server.

BULK INSERT dbo.Customers
FROM 'C:\Data\customers.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
#Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);
select * from Products

#Insert three records into the Products table using INSERT INTO.
  INSERT INTO Products (ProductID, ProductName, Price)
VALUES
    (1, 'Laptop', 1200.00),
    (2, 'Smartphone', 800.50),
    (3, 'Headphones', 150.75);

select * from Products

#Explain the difference between NULL and NOT NULL.
    CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NULL  -- optional
);

#Explain the difference between NULL and NOT NULL.
      CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NULL  -- optional
);
select * from Employees
  
#Add a UNIQUE constraint to the ProductName column in the Products table.
  ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (4, 'Tablet', 300.00);
INSERT INTO Products (ProductID, ProductName, Price)
VALUES (5, 'Tablet', 320.00); 

#Write a comment in a SQL query explaining its purpose.
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > 500;

#Add CategoryID column to the Products table.
ALTER TABLE Products
ADD CategoryID INT;
select * from Products

#Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);
select * from Categories

#Use BULK INSERT to import data from a text file into the Products table.
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = '|',     -- Change to your file’s field delimiter (e.g., ',', '\t')
    ROWTERMINATOR = '\n',      -- Usually newline for row separation
    FIRSTROW = 1               -- Set to 2 if the file has a header row
);

#Create a FOREIGN KEY in the Products table that references the Categories table.
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);
select * from Products

#Explain the differences between PRIMARY KEY and UNIQUE KEY.
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,          -- One per table, no NULLs
    Email VARCHAR(100) UNIQUE            -- Multiple UNIQUE keys allowed, allows NULL
);
select * from Employeese

#Add a CHECK constraint to the Products table ensuring Price > 0.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive
CHECK (Price > 0);

#Modify the Products table to add a column Stock (INT, NOT NULL).
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;
select * from Products

#Use the ISNULL function to replace NULL values in Price column with a 0.
SELECT ProductID, ProductName, ISNULL(Price, 0) AS Price, Stock
FROM Products;
--------------------------
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
-------------------------------------
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
----------------------------------
#Question: Explain at least two ways to find distinct values based on two columns.
CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');
SELECT DISTINCT 
       LEAST(col1, col2) AS val1,
       GREATEST(col1, col2) AS val2
FROM InputTbl;

#Question: If all the columns have zero values, then don’t show that row. In this case, we have to remove the 5th row while selecting data.
CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);
SELECT *
FROM TestMultipleZero
WHERE A <> 0
   OR B <> 0
   OR C <> 0
   OR D <> 0;

# Find those with odd ids
create table section1(id int, name varchar(20))
insert into section1 values (1, 'Been'),
       (2, 'Roma'),
       (3, 'Steven'),
       (4, 'Paulo'),
       (5, 'Genryh'),
       (6, 'Bruno'),
       (7, 'Fred'),
       (8, 'Andro')
SELECT * FROM section1
WHERE id % 2 <> 0;
#Person with the smallest id (use the table in puzzle 3)
SELECT *
FROM section1
ORDER BY id
LIMIT 1;
#Person with the highest id (use the table in puzzle 3)
SELECT *
FROM section1
ORDER BY id DESC
LIMIT 1;
#People whose name starts with b (use the table in puzzle 3)
SELECT *
FROM section1
WHERE name LIKE 'B%';
----------------------------------
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
-----------------------------------
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
-----------------------
#Using Products, Suppliers table List all combinations of product names and supplier names.
SELECT 
    p.ProductName,
    s.SupplierName
FROM 
    Products p
CROSS JOIN 
    Suppliers s;
#Using Departments, Employees table Get all combinations of departments and employees.
SELECT 
    d.DepartmentName,
    e.Name AS EmployeeName
FROM 
    Departments d
CROSS JOIN 
    Employees e;
#Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
SELECT 
    s.SupplierName,
    p.ProductName
FROM 
    Products p
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID;
#Using Orders, Customers table List customer names and their orders ID.
SELECT 
    c.CustomerName,
    o.OrderID
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID;
#Using Courses, Students table Get all combinations of students and courses.
SELECT 
    s.StudentName,
    c.CourseName
FROM 
    Students s
CROSS JOIN 
    Courses c;
#Using Products, Orders table Get product names and orders where product IDs match.
SELECT
    p.ProductName,
    o.OrderID
FROM
    Orders o
JOIN
    Products p ON o.ProductID = p.ProductID;
#Using Departments, Employees table List employees whose DepartmentID matches the department.
SELECT 
    e.EmployeeID,
    e.Name AS EmployeeName,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;
#Using Students, Enrollments table List student names and their enrolled course IDs.
SELECT
    s.StudentName,
    e.CourseID
FROM
    Students s
JOIN
    Enrollments e ON s.StudentID = e.StudentID;
#Using Payments, Orders table List all orders that have matching payments.
SELECT DISTINCT
    o.OrderID
FROM
    Orders o
JOIN
    Payments p ON o.OrderID = p.OrderID;
#Using Orders, Products table Show orders where product price is more than 100.
SELECT
    o.OrderID,
    o.OrderDate,
    o.CustomerID,
    p.ProductName,
    p.Price
FROM
    Orders o
JOIN
    Products p ON o.ProductID = p.ProductID
WHERE
    p.Price > 100;
#Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
SELECT
    e.Name AS EmployeeName,
    d.DepartmentName
FROM
    Employees e
CROSS JOIN
    Departments d
WHERE
    e.DepartmentID <> d.DepartmentID;
#Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
SELECT
    o.OrderID,
    p.ProductName,
    o.QuantityOrdered,
    p.StockQuantity
FROM
    Orders o
JOIN
    Products p ON o.ProductID = p.ProductID
WHERE
    o.QuantityOrdered > p.StockQuantity;
#Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
  SELECT
    c.CustomerName,
    s.ProductID
FROM
    Sales s
JOIN
    Customers c ON s.CustomerID = c.CustomerID
WHERE
    s.SaleAmount >= 500;
#Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
  SELECT
    st.StudentName,
    c.CourseName
FROM
    Enrollments e
JOIN
    Students st ON e.StudentID = st.StudentID
JOIN
    Courses c ON e.CourseID = c.CourseID;
#SELECT
    p.ProductName,
    s.SupplierName
FROM
    Products p
JOIN
    Suppliers s ON p.SupplierID = s.SupplierID
WHERE
    s.SupplierName LIKE '%Tech%';
#Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
SELECT 
    p.ProductName,
    c.CategoryName
FROM 
    Products p
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
WHERE 
    c.CategoryName IN ('Electronics', 'Furniture');
#Using Sales, Customers table Show all sales from customers who are from 'USA'.
SELECT
    s.*
FROM
    Sales s
JOIN
    Customers c ON s.CustomerID = c.CustomerID
WHERE
    c.Country = 'USA';
	------------------------------------
	#Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
Expected Columns: EmployeeName, Salary, DepartmentName
SELECT 
    e.Name AS EmployeeName,
    e.Salary,
    d.DepartmentName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    e.Salary > 50000;
#Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
Expected Columns: FirstName, LastName, OrderDate
SELECT 
    c.FirstName,
    c.LastName,
    o.OrderDate
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    YEAR(o.OrderDate) = 2023;
#Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
🔁 Expected Columns: EmployeeName, DepartmentName
SELECT 
    e.Name AS EmployeeName,
    d.DepartmentName
FROM 
    Employees e
LEFT JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID;
#Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product. 🔁 Expected Columns: SupplierName, ProductName
SELECT 
    s.SupplierName,
    p.ProductName
FROM 
    Suppliers s
LEFT JOIN 
    Products p ON s.SupplierID = p.SupplierID;
#Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
SELECT
    o.OrderID,
    o.OrderDate,
    p.PaymentDate,
    p.PaymentAmount AS Amount
FROM 
    Orders o
FULL OUTER JOIN 
    Payments p ON o.OrderID = p.OrderID;
#Using the Employees table, write a query to show each employee's name along with the name of their manager.
🔁 Expected Columns: EmployeeName, ManagerName
SELECT 
    e.EmployeeName AS EmployeeName,
    m.EmployeeName AS ManagerName
FROM Employees e
LEFT JOIN Employees m 
    ON e.ManagerID = m.EmployeeID;
#Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
🔁 Expected Columns: StudentName, CourseName
SELECT 
    s.StudentName,
    c.CourseName
FROM Enrollments e
JOIN Students s 
    ON e.StudentID = s.StudentID
JOIN Courses c 
    ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Math 101';
#Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
🔁 Expected Columns: FirstName, LastName, Quantity
SELECT 
    c.FirstName,
    c.LastName,
    SUM(o.Quantity) AS Quantity
FROM Customers c
JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
HAVING SUM(o.Quantity) > 3;
#Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
🔁 Expected Columns: EmployeeName, DepartmentName
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources';
#Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
🔁 Expected Columns: DepartmentName, EmployeeCount
SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments d
JOIN Employees e 
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 5;
#Using the Products and Sales tables, write a query to find products that have never been sold.
🔁 Expected Columns: ProductID, ProductName
SELECT 
    p.ProductID,
    p.ProductName
FROM Products p
LEFT JOIN Sales s 
    ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL;
#Using the Customers and Orders tables, write a query to return customer names who have placed at least one order. 🔁 Expected Columns: FirstName, LastName, TotalOrders
SELECT 
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
HAVING COUNT(o.OrderID) >= 1;
#Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
🔁 Expected Columns: EmployeeName, DepartmentName
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
INNER JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID;
#Using the Employees table, write a query to find pairs of employees who report to the same manager.
🔁 Expected Columns: Employee1, Employee2, ManagerID
SELECT 
    e1.EmployeeName AS Employee1,
    e2.EmployeeName AS Employee2,
    e1.ManagerID
FROM Employees e1
JOIN Employees e2 
    ON e1.ManagerID = e2.ManagerID
   AND e1.EmployeeID < e2.EmployeeID
WHERE e1.ManagerID IS NOT NULL;
#Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
🔁 Expected Columns: OrderID, OrderDate, FirstName, LastName
SELECT 
    o.OrderID,
    o.OrderDate,
    c.FirstName,
    c.LastName
FROM Orders o
JOIN Customers c 
    ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 2022;
#Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
🔁 Expected Columns: EmployeeName, Salary, DepartmentName
SELECT 
    e.EmployeeName,
    e.Salary,
    d.DepartmentName
FROM Employees e
JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales'
  AND e.Salary > 60000;
  -----------------------------
  #Return: OrderID, CustomerName, OrderDate
Task: Show all orders placed after 2022 along with the names of the customers who placed them.
Tables Used: Orders, Customers
SELECT 
    o.OrderID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.OrderDate
FROM Orders o
JOIN Customers c 
    ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) > 2022;
#Return: EmployeeName, DepartmentName
Task: Display the names of employees who work in either the Sales or Marketing department.
Tables Used: Employees, Departments
SELECT 
    e.EmployeeName,
    d.DepartmentName
FROM Employees e
JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing');
#Return: DepartmentName, MaxSalary
Task: Show the highest salary for each department.
Tables Used: Departments, Employees
SELECT 
    d.DepartmentName,
    MAX(e.Salary) AS MaxSalary
FROM Employees e
JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;
#Return: CustomerName, OrderID, OrderDate
Task: List all customers from the USA who placed orders in the year 2023.
Tables Used: Customers, Orders
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
JOIN Orders o 
    ON c.CustomerID = o.CustomerID
WHERE c.Country = 'USA'
  AND YEAR(o.OrderDate) = 2023;
#Return: CustomerName, TotalOrders
Task: Show how many orders each customer has placed.
Tables Used: Orders , Customers
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;
#Return: ProductName, SupplierName
Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
Tables Used: Products, Suppliers
SELECT 
    p.ProductName,
    s.SupplierName
FROM Products p
JOIN Suppliers s 
    ON p.SupplierID = s.SupplierID
WHERE s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');
#Return: CustomerName, MostRecentOrderDate
Task: For each customer, show their most recent order. Include customers who haven't placed any orders.
Tables Used: Customers, Orders
SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    MAX(o.OrderDate) AS MostRecentOrderDate
FROM Customers c
LEFT JOIN Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;
#Return: CustomerName, OrderTotal
Task: Show the customers who have placed an order where the total amount is greater than 500.
Tables Used: Orders, Customers
Quyidagi SQL so‘rov buyurtma summasi 500 dan katta bo‘lgan mijozlarni va ularning buyurtma summasini
  SELECT 
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.TotalAmount AS OrderTotal
FROM Orders o
JOIN Customers c 
    ON o.CustomerID = c.CustomerID
WHERE o.TotalAmount > 500;
#Return: ProductName, SaleDate, SaleAmount
Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
Tables Used: Products, Sales
  Quyidagi SQL so‘rov 2022-yilda sotilgan yoki sotuv summasi 400 dan katta bo‘lgan mahsulotlarni, ularning sotuvi sanasi va summasi bilan birga ko‘rsatadi
  SELECT 
    p.ProductName,
    s.SaleDate,
    s.SaleAmount
FROM Sales s
JOIN Products p 
    ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2022
   OR s.SaleAmount > 400;
#Return: ProductName, TotalSalesAmount
Task: Display each product along with the total amount it has been sold for.
Tables Used: Sales, Products
Quyidagi SQL so‘rov har bir mahsulot bo‘yicha umumiy sotuv summasini ko‘rsatadi
SELECT 
    p.ProductName,
    SUM(s.SaleAmount) AS TotalSalesAmount
FROM Sales s
JOIN Products p 
    ON s.ProductID = p.ProductID
GROUP BY p.ProductName;
#Return: EmployeeName, DepartmentName, Salary
Task: Show the employees who work in the HR department and earn a salary greater than 60000.
Tables Used: Employees, Departments
Quyidagi SQL so‘rov HR bo‘limida ishlaydigan va oyligi 60000 dan katta bo‘lgan xodimlarni ularning bo‘lim nomi bilan birga ko‘rsatadi
  SELECT 
    e.EmployeeName,
    d.DepartmentName,
    e.Salary
FROM Employees e
JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'HR'
  AND e.Salary > 60000;
  #Return: ProductName, SaleDate, StockQuantity
Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
Tables Used: Products, Sales
  Quyidagi SQL so‘rov 2023-yilda sotilgan va omborda sotilish vaqtida 100 dan ortiq birlik mavjud bo‘lgan mahsulotlarni ko‘rsatadi
  SELECT 
    p.ProductName,
    s.SaleDate,
    s.StockQuantity
FROM Sales s
JOIN Products p 
    ON s.ProductID = p.ProductID
WHERE YEAR(s.SaleDate) = 2023
  AND s.StockQuantity > 100;
  ----------------------------------
  #Table: Person

| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
Table: Address

| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |

| personId | lastName | firstName |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;
#
Table: Employee

| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |

Input: Employee table:

| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |

Output:

| Employee |
+----------+
| Joe      |

SELECT 
    e.name AS Employee
FROM Employee e
JOIN Employee m
ON e.managerId = m.id
WHERE e.salary > m.salary;
#
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |

| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |

| Email   |
+---------+
| a@b.com |

SELECT 
    email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;

#
Table: Person
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
The result format is in the following example.
Input: Person table:

| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
Output:

| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id > p2.id;

#
Return Parent Name only.

CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

SELECT ParentName FROM boys
UNION
SELECT ParentName FROM girls;

#DROP TABLE IF EXISTS Cart1;
DROP TABLE IF EXISTS Cart2;
GO
CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO
CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO
INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO
INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO
Expected Output.

| Item Cart 1 | Item Cart 2 |  
|-------------|-------------|  
| Sugar       | Sugar       | 
| Bread       | Bread       |  
| Juice       |             |  
| Soda        |             |  
| Flour       |             |
|             | Butter      |  
|             | Cheese      |  
|             | Fruit       |
SELECT 
    ISNULL(c1.Item, '') AS [Item Cart 1],
    ISNULL(c2.Item, '') AS [Item Cart 2]
FROM Cart1 c1
FULL OUTER JOIN Cart2 c2
ON c1.Item = c2.Item;
#
Table: Customers
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
Table: Orders
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
input: Customers table:
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
Orders table:
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
Output:
| Customers |
+-----------+
| Henry     |
| Max       |
SELECT  c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.id IS NULL;
--------------------------------
#You need to write a query that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.
SELECT 
    CONCAT(emp_id, '-', first_name, ' ', last_name) AS EmployeeInfo
FROM employees;
#Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999')
WHERE department_id = 90;
#Display the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.(Employees)
SELECT 
    first_name AS "First Name",
    LENGTH(first_name) AS "Name Length"
FROM employees
WHERE first_name LIKE 'A%' 
   OR first_name LIKE 'J%' 
   OR first_name LIKE 'M%'
ORDER BY first_name;
  #Write an SQL query to find the total salary for each manager ID.(Employees table)
  SELECT 
    manager_id, 
    SUM(salary) AS total_salary
FROM employees
GROUP BY manager_id;
#Write a query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table
SELECT 
    Year,
    GREATEST(Max1, Max2, Max3) AS HighestValue
FROM TestMax;
#Find me odd numbered movies and description is not boring.(cinema)
SELECT *
FROM cinema
WHERE id % 2 = 1
  AND description != 'boring';
#You have to sort data based on the Id but Id with 0 should always be the last row. Now the question is can you do that with a single order by column.(SingleOrder)
SELECT *
FROM SingleOrder
ORDER BY (Id = 0), Id;
#Write an SQL query to select the first non-null value from a set of columns. If the first column is null, move to the next, and so on. If all columns are null, return null.(person)
SELECT 
    id,
    COALESCE(phone1, phone2, phone3) AS first_non_null_phone
FROM person;
#Split column FullName into 3 part ( Firstname, Middlename, and Lastname).(Students Table)
SELECT
    Id,
    SUBSTRING_INDEX(FullName, ' ', 1) AS FirstName,
    SUBSTRING_INDEX(SUBSTRING_INDEX(FullName, ' ', 2), ' ', -1) AS MiddleName,
    SUBSTRING_INDEX(FullName, ' ', -1) AS LastName
FROM Students;
#For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas. (Orders Table)
SELECT DISTINCT o2.CustomerID, o2.OrderID, o2.State
FROM Orders o1
JOIN Orders o2
  ON o1.CustomerID = o2.CustomerID
WHERE o1.State = 'California'
  AND o2.State = 'Texas';
#Write an SQL statement that can group concatenate the following values.(DMLTable)
SELECT GROUP_CONCAT(Name ORDER BY Id SEPARATOR ', ') AS All_DML
FROM DMLTable;
-----------------------------------
#Write a SQL query to split the Name column by a comma into two separate columns: Name and Surname.(TestMultipleColumns)
SELECT 
    LEFT(Name, CHARINDEX(',', Name) - 1) AS Name,
    SUBSTRING(Name, CHARINDEX(',', Name) + 1, LEN(Name)) AS Surname
FROM TestMultipleColumns;
#Write a SQL query to find strings from a table where the string itself contains the % character.(TestPercent)
SELECT *
FROM TestPercent
WHERE ColumnName LIKE '%[%]%';
#Split a string based on dot(.).(Splitter)
SELECT 
    SUBSTRING_INDEX(ColumnName, '.', 1) AS Part1,
    SUBSTRING_INDEX(ColumnName, '.', -1) AS Part2
FROM Splitter;
#Write a SQL query to return all rows where the value in the Vals column contains more than two dots (.).(testDots)
SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;
#Write a SQL query to count the spaces present in the string.(CountSpaces)
SELECT 
    TextValue,
    LEN(TextValue) - LEN(REPLACE(TextValue, ' ', '')) AS SpaceCount
FROM CountSpaces;
#Write a SQL query that finds out employees who earn more than their managers.(Employee)
SELECT 
    e.EmpName AS EmployeeName,
    e.Salary AS EmployeeSalary,
    m.EmpName AS ManagerName,
    m.Salary AS ManagerSalary
FROM Employee e
JOIN Employee m
    ON e.ManagerID = m.EmpID
WHERE e.Salary > m.Salary;
#Find the employees who have been with the company for more than 10 years, but less than 15 years. Display their Employee ID, First Name, Last Name, Hire Date, and the Years of Service (calculated as the number of years between the current date and the hire date).(Employees)
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    HireDate,
    DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsOfService
FROM Employees
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) > 10
  AND DATEDIFF(YEAR, HireDate, GETDATE()) < 15;
#write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.(weather)
SELECT 
    w1.Id,
    w1.RecordDate,
    w1.Temperature
FROM Weather w1
JOIN Weather w2 
    ON DATEADD(DAY, 1, w2.RecordDate) = w1.RecordDate  -- SQL Server syntax
WHERE w1.Temperature > w2.Temperature;
#Write an SQL query that reports the first login date for each player.(Activity)
SELECT 
    player_id,
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
#Your task is to return the third item from that list.(fruits)
SELECT TOP 1 name
FROM (
    SELECT TOP 3 name
    FROM fruits
    ORDER BY id
) AS temp
ORDER BY id DESC;
------------------------------
#Task: Retrieve employees who earn the minimum salary in the company. Tables: employees (columns: id, name, salary)
SELECT 
    id,
    name,
    salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);
#Task: Retrieve products priced above the average price. Tables: products (columns: id, product_name, price)
SELECT 
    id,
    product_name,
    price
FROM products
WHERE price > (SELECT AVG(price) FROM products);
#Find Employees in Sales Department Task: Retrieve employees who work in the "Sales" department. Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)
SELECT 
    e.id,
    e.name,
    d.department_name
FROM employees e
JOIN departments d 
    ON e.department_id = d.id
WHERE d.department_name = 'Sales';
#Task: Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)
SELECT 
    c.customer_id,
    c.name
FROM customers c
LEFT JOIN orders o 
    ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
#Task: Retrieve products with the highest price in each category. Tables: products (columns: id, product_name, price, category_id)
SELECT 
    p.id,
    p.product_name,
    p.price,
    p.category_id
FROM products p
JOIN (
    SELECT 
        category_id,
        MAX(price) AS max_price
    FROM products
    GROUP BY category_id
) AS mp
    ON p.category_id = mp.category_id
   AND p.price = mp.max_price;
#Task: Retrieve employees working in the department with the highest average salary. Tables: employees (columns: id, name, salary, department_id), departments (columns: id, department_name)
SELECT 
    e.id,
    e.name,
    e.salary,
    d.department_name
FROM employees e
JOIN departments d 
    ON e.department_id = d.id
WHERE e.department_id = (
    SELECT TOP 1 department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
);
#Task: Retrieve employees earning more than the average salary in their department. Tables: employees (columns: id, name, salary, department_id)
SELECT 
    e.id,
    e.name,
    e.salary,
    e.department_id
FROM employees e
JOIN (
    SELECT 
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg
    ON e.department_id = dept_avg.department_id
WHERE e.salary > dept_avg.avg_
