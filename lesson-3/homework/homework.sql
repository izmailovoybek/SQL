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



