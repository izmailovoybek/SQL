#Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
  CREATE TABLE Employees(
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);

#Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).

INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'John Doe', 55000.00);
INSERT INTO Employees (EmpID, Name, Salary) VALUES (2, 'Jane Smith', 62000.50);
INSERT INTO Employees (EmpID, Name, Salary) VALUES (3, 'Sam Brown', 58000.75);

INSERT INTO Employees (EmpID, Name, Salary) 
VALUES 
    (4, 'Alice Green', 60000.00),
    (5, 'Bob White', 59000.25),
    (6, 'Carol Black', 61000.80);
select * from Employees

#Update the Salary of an employee to 7000 where EmpID = 1.
UPDATE Employees
SET Salary = 7000
WHERE EmpID = 1;

#Delete a record from the Employees table where EmpID = 2.
DELETE FROM Employees
WHERE EmpID = 2;

#Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
DELETE FROM Employees WHERE EmpID = 1;
TRUNCATE TABLE Employees;
DROP TABLE Employees;

#Modify the Name column in the Employees table to VARCHAR(100)
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

#Add a new column Department (VARCHAR(50)) to the Employees table.
ALTER TABLE Employees
ADD Department VARCHAR(50);
UPDATE Employees
SET Department = 'HR'
WHERE EmpID = 1;

#Change the data type of the Salary column to FLOAT.
  ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

#Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50))
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
select * from Departments
  
#Remove all records from the Employees table without deleting its structure.
DELETE FROM Employees;

#Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
  INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT * FROM (
    VALUES 
        (1, 'HR'),
        (2, 'IT'),
        (3, 'Sales'),
        (4, 'Finance'),
        (5, 'Marketing')
) AS Dept(DepartmentID, DepartmentName);
select * from Departments

#Update the Department of all employees where Salary > 5000 to 'Management'.
  UPDATE Employees
SET Department = 'Management'
WHERE Salary > 5000;

#Write a query that removes all employees but keeps the table structure intact.
  DELETE FROM Employees;
TRUNCATE TABLE Employees;

#Drop the Department column from the Employees table.
ALTER TABLE Employees
DROP COLUMN Department;

#Rename the Employees table to StaffMembers using SQL commands.
  EXEC sp_rename 'Employees', 'StaffMembers';

#Write a query to completely remove the Departments table from the database.
  DROP TABLE Departments;
  
