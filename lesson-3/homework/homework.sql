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
