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
