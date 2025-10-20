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
