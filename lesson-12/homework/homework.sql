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
