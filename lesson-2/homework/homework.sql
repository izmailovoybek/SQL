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
