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
WHERE e.salary > dept_avg.avg_salary;
