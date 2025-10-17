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
