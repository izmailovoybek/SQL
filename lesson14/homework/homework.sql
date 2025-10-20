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
