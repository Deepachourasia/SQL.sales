-- ============================================================
-- SQL SUBQUERY PRACTICE WORKBOOK
-- Table Setup Script — MySQL 8+ / PostgreSQL / SQLite
-- 5 Tables | 84 Total Rows
-- ============================================================
 
-- ============================================================
-- DROP (reverse FK order)
-- ============================================================
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS departments;
 
-- ============================================================
-- 1. departments (4 rows)
-- ============================================================
CREATE TABLE departments (
dept_id INT NOT NULL,
dept_name VARCHAR(50) NOT NULL,
budget INT NOT NULL,
location VARCHAR(50) NOT NULL,
head_id INT,
PRIMARY KEY (dept_id)
);
 
INSERT INTO departments (dept_id, dept_name, budget, location, head_id) VALUES
(1, 'IT', 500000, 'Bangalore', 101),
(2, 'HR', 200000, 'Mumbai', 103),
(3, 'Finance', 600000, 'Delhi', 105),
(4, 'Marketing', 300000, 'Chennai', 108);
 
-- ============================================================
-- 2. employees (20 rows)
-- ============================================================
CREATE TABLE employees (
emp_id INT NOT NULL,
emp_name VARCHAR(100) NOT NULL,
department VARCHAR(50) NOT NULL,
salary INT NOT NULL,
manager_id INT,
hire_year INT NOT NULL,
PRIMARY KEY (emp_id)
);
 
INSERT INTO employees (emp_id, emp_name, department, salary, manager_id, hire_year) VALUES
(101, 'Alice Johnson', 'IT', 72000, NULL, 2018),
(102, 'Bob Smith', 'IT', 65000, 101, 2019),
(103, 'Carol White', 'HR', 58000, NULL, 2017),
(104, 'David Brown', 'HR', 54000, 103, 2020),
(105, 'Eva Green', 'Finance', 80000, NULL, 2016),
(106, 'Frank Black', 'Finance', 75000, 105, 2018),
(107, 'Grace Lee', 'IT', 68000, 101, 2021),
(108, 'Henry Wilson', 'Marketing', 60000, NULL, 2017),
(109, 'Ivy Turner', 'Marketing', 56000, 108, 2022),
(110, 'Jack Davis', 'Finance', 70000, 105, 2019),
(111, 'Karen Moore', 'IT', 63000, 101, 2020),
(112, 'Leo Harris', 'HR', 50000, 103, 2021),
(113, 'Mia Clark', 'Marketing', 62000, 108, 2018),
(114, 'Nate Lewis', 'Finance', 78000, 105, 2019),
(115, 'Olivia Walker', 'IT', 71000, 101, 2017),
(116, 'Paul Hall', 'HR', 53000, 103, 2020),
(117, 'Quinn Young', 'Marketing', 59000, 108, 2021),
(118, 'Rachel King', 'Finance', 82000, 105, 2016),
(119, 'Sam Scott', 'IT', 66000, 101, 2022),
(120, 'Tina Adams', 'HR', 55000, 103, 2019);
 
-- ============================================================
-- 3. customers (20 rows)
-- ============================================================
CREATE TABLE customers (
customer_id INT NOT NULL,
customer_name VARCHAR(100) NOT NULL,
city VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
join_year INT NOT NULL,
PRIMARY KEY (customer_id)
);
 
INSERT INTO customers (customer_id, customer_name, city, country, join_year) VALUES
(201, 'Aarav Mehta', 'Mumbai', 'India', 2021),
(202, 'Priya Sharma', 'Delhi', 'India', 2020),
(203, 'Rohan Gupta', 'Pune', 'India', 2022),
(204, 'Sunita Patel', 'Ahmedabad', 'India', 2021),
(205, 'Vikram Rao', 'Bangalore', 'India', 2019),
(206, 'Neha Singh', 'Chennai', 'India', 2023),
(207, 'Arjun Kumar', 'Hyderabad', 'India', 2020),
(208, 'Deepa Nair', 'Kochi', 'India', 2022),
(209, 'Sanjay Joshi', 'Jaipur', 'India', 2021),
(210, 'Meera Iyer', 'Coimbatore', 'India', 2023),
(211, 'Ravi Verma', 'Lucknow', 'India', 2020),
(212, 'Anita Das', 'Kolkata', 'India', 2019),
(213, 'Kiran Reddy', 'Vizag', 'India', 2022),
(214, 'Pooja Shah', 'Surat', 'India', 2021),
(215, 'Amit Bose', 'Nagpur', 'India', 2023),
(216, 'Tara Menon', 'Trivandrum', 'India', 2020),
(217, 'Nikhil Kulkarni', 'Nashik', 'India', 2022),
(218, 'Swati Chatterjee', 'Bhopal', 'India', 2019),
(219, 'Rahul Pandey', 'Patna', 'India', 2021),
(220, 'Divya Tiwari', 'Indore', 'India', 2023);
 
-- ============================================================
-- 4. products (20 rows)
-- ============================================================
CREATE TABLE products (
product_id INT NOT NULL,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50) NOT NULL,
price INT NOT NULL,
stock_qty INT NOT NULL,
PRIMARY KEY (product_id)
);
 
INSERT INTO products (product_id, product_name, category, price, stock_qty) VALUES
(301, 'Laptop', 'Electronics', 55000, 30),
(302, 'Smartphone', 'Electronics', 22000, 80),
(303, 'Headphones', 'Electronics', 3500, 120),
(304, 'Monitor', 'Electronics', 18000, 45),
(305, 'Keyboard', 'Accessories', 1500, 200),
(306, 'Mouse', 'Accessories', 900, 250),
(307, 'Desk Chair', 'Furniture', 8500, 40),
(308, 'Standing Desk', 'Furniture', 22000, 15),
(309, 'Webcam', 'Electronics', 4200, 70),
(310, 'USB Hub', 'Accessories', 1200, 180),
(311, 'Notebook', 'Stationery', 150, 500),
(312, 'Pen Set', 'Stationery', 250, 600),
(313, 'Printer', 'Electronics', 12000, 25),
(314, 'Scanner', 'Electronics', 9000, 20),
(315, 'External SSD', 'Electronics', 7500, 60),
(316, 'Lamp', 'Furniture', 2200, 90),
(317, 'Whiteboard', 'Office Supplies', 3800, 35),
(318, 'Cable Organiser', 'Accessories', 600, 300),
(319, 'Power Bank', 'Electronics', 2800, 100),
(320, 'Smart Watch', 'Electronics', 15000, 55);
 
-- ============================================================
-- 5. orders (20 rows)
-- ============================================================
CREATE TABLE orders (
order_id INT NOT NULL,
customer_id INT NOT NULL,
product_id INT NOT NULL,
amount DECIMAL(10,2) NOT NULL,
order_date DATE NOT NULL,
status VARCHAR(20) NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);
 
INSERT INTO orders (order_id, customer_id, product_id, amount, order_date, status) VALUES
(1001, 201, 301, 1500.00, '2024-01-05', 'Delivered'),
(1002, 202, 302, 2300.00, '2024-01-12', 'Delivered'),
(1003, 203, 303, 800.00, '2024-02-03', 'Delivered'),
(1004, 201, 304, 3200.00, '2024-02-14', 'Delivered'),
(1005, 204, 301, 1100.00, '2024-03-01', 'Pending'),
(1006, 205, 302, 4500.00, '2024-03-15', 'Delivered'),
(1007, 202, 303, 950.00, '2024-03-22', 'Cancelled'),
(1008, 206, 304, 2100.00, '2024-04-05', 'Delivered'),
(1009, 203, 301, 1750.00, '2024-04-18', 'Pending'),
(1010, 207, 302, 3300.00, '2024-04-30', 'Delivered'),
(1011, 204, 303, 680.00, '2024-05-10', 'Cancelled'),
(1012, 208, 304, 2900.00, '2024-05-22', 'Delivered'),
(1013, 205, 301, 1200.00, '2024-06-08', 'Delivered'),
(1014, 201, 302, 2700.00, '2024-06-15', 'Pending'),
(1015, 209, 303, 500.00, '2024-06-28', 'Delivered'),
(1016, 206, 304, 3800.00, '2024-07-07', 'Delivered'),
(1017, 207, 301, 1600.00, '2024-07-19', 'Delivered'),
(1018, 210, 302, 4100.00, '2024-07-25', 'Delivered'),
(1019, 208, 303, 720.00, '2024-08-02', 'Cancelled'),
(1020, 209, 304, 2200.00, '2024-08-14', 'Delivered');
 
-- ============================================================
-- Verify row counts after insert
-- Expected: 4 | 20 | 20 | 20 | 20
-- ============================================================
SELECT 'departments' AS tbl, COUNT(*)  FROM departments
UNION ALL SELECT 'employees', COUNT(*) FROM employees
UNION ALL SELECT 'customers', COUNT(*) FROM customers
UNION ALL SELECT 'products', COUNT(*) FROM products
UNION ALL SELECT 'orders', COUNT(*) FROM orders;
-- Q1. Find the names, departments, and salaries of all employees whose salary is greater than the average salary of
-- all employees in the company. The company-wide average salary should be computed inside a subquery.
select emp_name , department , salary from employees
where salary > (select avg(salary) from employees);

-- Q2. Display the emp_id, emp_name, department, and salary of the single highest-paid employee in the entire
-- company. Use a subquery that returns the maximum salary, and filter the main query to match it.
select emp_id ,emp_name,  department , salary from employees
where salary = (select max(salary) from employees);

-- Q3. Display the emp_id, emp_name, department, and salary of the employee with the lowest salary in the entire
-- company.
select emp_id, emp_name, department, salary from employees
where salary = (select min(salary) from employees);

-- Q4. Find all employees (other than Rachel King herself) who were hired in the same year as Rachel King. Return
-- their emp_name, department, and hire_year. Use a single-row subquery to find Rachel King's hire year.  
SELECT emp_name, department, hire_year from employees
where hire_year = (select hire_year from employees where emp_name ='Rachel King') And emp_name !='Rachel King';

-- Q5. List all products whose price is greater than the average price across all products in the entire products table.
-- Show product_name, category, and price, ordered by price descending.
 select product_name, category, price from products 
 where price > (select avg(price) from products)
 order by price desc;
 
 -- Q6. Retrieve the product_id, product_name, category, and price of the single most expensive product in the entire
-- products table.
select product_id, product_name, category,price from products 
where price = (select max(price) from products);

-- Q7. Retrieve the product_id, product_name, category, and price of the cheapest product in the entire products table.
select product_id, product_name, category, price from products
where price = (select min(price) from products);

-- Q8. List all orders whose amount is greater than the average order amount across all orders in the orders table.
-- Show order_id, customer_id, and amount, ordered by amount descending.
select order_id, customer_id, amount from orders 
where amount > (select avg(amount) from orders)
order by amount desc;

-- Q9. Find the order_id, customer_id, amount, and order_date of the single most expensive order ever placed (the
-- order with the highest amount in the entire orders table).
select order_id, customer_id, amount, order_date from orders
where amount = (select max(amount) from orders); 

-- Q10. Using the IN operator with a subquery, find all customers who have placed at least one order. Return
-- customer_id, customer_name, and city, ordered by customer_id.
select customer_id, customer_name , city from customers
where customer_id IN (select customer_id from orders)
order by customer_id;

-- Q11. Using the NOT IN operator with a subquery, find all customers who have NEVER placed any order. Return
-- customer_id, customer_name, and city, ordered by customer_id.
select customer_id, customer_name, city from customers
where customer_id NOT IN (select customer_id from orders)
order by customer_id;

-- Q12. Using the IN operator with a subquery on the orders table, find all products that appear in at least one order.
-- Show product_id, product_name, category, and price.
select product_id, product_name, category, price from products
where product_id IN  (select product_id from orders );

-- Q13. Using the NOT IN operator, find all products that have NEVER appeared in any order. Return product_id,
-- product_name, category, and price. 
select product_id, product_name, category, price from products
where product_id  NOT IN  (select product_id from orders );

-- Q14. Using an IN subquery against the departments table, retrieve the emp_name and salary of all employees who
-- belong to the Finance department. Order by salary descending. (Do not hardcode the department name in the
-- WHERE clause of the outer query — use a subquery to fetch it.)
select emp_name, salary from employees 
where department IN (select dept_name from departments where dept_name = 'Finance')
order by salary desc;

-- Q15. Find all employees whose salary is less than the minimum salary of any employee in the Finance department.
-- Return emp_name, department, and salary, ordered by salary descending. (Use a single-row subquery returning MIN
-- salary of Finance.)
select emp_name, department, salary from employees
where salary < (select min(salary) from employees where department = 'Finance')
order by salary desc;

-- Q16. Find the department with the highest budget from the departments table. Return dept_name, budget, and
-- location. Use a single-row subquery that returns MAX(budget).
select dept_name, budget, location from departments
where budget = (select max(budget) from departments);

-- Q17. Using a subquery with GROUP BY and HAVING, find all customers who have placed exactly 1 order. Return
-- customer_id, customer_name, and city.
select customer_id, customer_name, city from customers
where customer_id IN (select customer_id from orders
group by customer_id
having count(*) = 1);

-- Q18. Using a subquery with GROUP BY and HAVING, find all customers who have placed 2 or more orders. Return
-- customer_id, customer_name, and city, ordered by customer_id.
select customer_id, customer_name, city from customers
where customer_id IN (select customer_id from orders
group by customer_id
having count(*) >=2);

-- Q19. Find all products whose price is greater than the maximum price of any product in the 'Accessories' category.
-- Use a scalar subquery returning MAX price for Accessories. Return product_name, category, and price ordered by
-- price descending.
select product_name, category, price from products
where price > (select max(price) from products where category = 'Accessories')
order by price desc;

-- Q20. Using an IN subquery, find all orders placed by customers who joined in the year 2021. Return order_id,
-- customer_id, amount, and order_date, ordered by order_date.
SELECT order_id, customer_id, amount, order_date from orders
where customer_id IN (select customer_id from customers where join_year = 2021)
ORDER BY order_date;

-- Q21. Using EXISTS, find all employees who are managers (i.e., at least one other employee has their 
-- emp_id as manager_id). Return emp_id, emp_name, and department, ordered by emp_name.
select emp_id, emp_name, department from employees e
where exists (select 1 from employees where manager_id = e.emp_id)
order by emp_name; 

-- Q22. Using NOT EXISTS, find all employees who are NOT managers — meaning no other employee lists them as
-- their manager_id. Return emp_id, emp_name, and department, ordered by emp_id.
select  emp_id, emp_name, department from employees e
where not exists (select 1 from employees where manager_id = e.emp_id)
order by emp_id;

-- Q23. Using EXISTS with a correlated subquery on the orders table, find all customers who have placed at least one
-- order. Return customer_id, customer_name, and city, ordered by customer_id.
select customer_id, customer_name,city from customers c
where exists (select 1 from orders o  where o.customer_id = c.customer_id)
order by customer_id;

-- Q24. Using NOT EXISTS, find all customers who have never placed any order. Return customer_id, customer_name,
-- and city, ordered by customer_id.
select customer_id, customer_name, city from customers c
where not exists (select 1 from  orders o where o.customer_id = c.customer_id)
order by customer_id;

-- Q25. Using EXISTS with a correlated subquery on the orders table, find all products that appear in at least one
-- order. Return product_id, product_name, and category, ordered by product_id.
select product_id, product_name, category from products p
where exists(select 1 from orders o where o.product_id = p.product_id)
order by product_id;

-- Q26. Find all employees (excluding emp_id 105 — Eva Green herself) who work in the same department as emp_id
-- 105. Use a single-row subquery to get Eva Green's department. Return emp_name, department, and salary ordered
-- by salary descending.
select emp_name, department, salary from employees
where department = (select department from employees where emp_id = 105)
AND emp_id <> 105
ORDER BY salary DESC;



--  Q31. Using a correlated subquery, find all employees who earn more than the average salary of their own
-- department. For each qualifying employee, also display their department's average salary (rounded to 2 decimal
-- places). Order by department, then salary descending.

-- Q36. Using a correlated subquery, find all products whose price is greater than the average price of other products
-- in the same category. Display product_name, category, price, and the category average (rounded to 2 decimals) as
-- 'cat_avg'. Order by category, price descending.

select product_name , category , price ,round(
(select avg(price) from products p2 
where p2.category = p.category
) , 2) as cat_avg from products p
where p.price > (select avg(price) from products p2 
where p2.category = p.category
)
order by category , price desc;

-- Q37Find all employees whose salary is greater than the salary of AT LEAST ONE employee in the Marketing
-- department. Use ANY (or equivalently, > MIN of Marketing salaries). Return emp_name, department, and salary
-- ordered by salary descending. Note: Ivy Turner (56,000) is the lowest-paid Marketing employee — so all employees
-- earning above 56,000 qualify.
select emp_name, department,salary from employees
where salary >any (select salary from employees where department= 'Marketing' )
order by salary desc;

-- Q38Find all employees whose salary is less than the salary of EVERY employee in the Finance department. In
-- other words, their salary must be below even the minimum Finance salary (70,000). Use ALL (or < MIN of Finance).
-- Return emp_name, department, and salary ordered by salary descending.
select emp_name, department, salary from employees
where salary <All (select min(salary) from employees where department = 'Finance')
order by salary desc;

-- Q39Find customers who have placed at least one order AND whose every order has status = 'Delivered' (i.e., they
-- have no Cancelled or Pending orders). Use a combination of EXISTS and NOT EXISTS. Return customer_id and
-- customer_name ordered by customer_id.
select customer_id, customer_name from customers c
where exists (select 1 from orders o where o.customer_id = c.customer_id)And
not exists (select 1 from orders o where o.customer_id = c.customer_id And o.status != 'Delivered')
ORDER BY customer_id;

-- Q40Using nested IN subqueries, find all products that were ordered by at least one customer from the city of
-- Mumbai.
-- First find customer_ids from Mumbai, then find product_ids ordered by those customers, then return the
-- product details. Show product_id, product_name, and category, ordered by product_id.
SELECT product_id, product_name, category
FROM products             
WHERE product_id IN (
    SELECT product_id
    FROM orders
    WHERE customer_id IN (
        SELECT customer_id
        FROM customers
        WHERE city = 'Mumbai'
    )
)
ORDER BY product_id;

-- Q41
SELECT emp_name, department, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

-- Q42
SELECT d.dept_name AS department
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department = d.dept_name
    AND e.salary <= 50000
)
ORDER BY department;

-- Q43
SELECT customer_id, customer_name
FROM customers c
WHERE (
    SELECT COUNT(DISTINCT product_id)
    FROM orders o
    WHERE o.customer_id = c.customer_id
) >= 2
ORDER BY customer_id;

-- Q44
SELECT
    e.emp_name,
    e.department,
    e.salary,
    e.hire_year,
    ROUND(
        (
            SELECT AVG(salary)
            FROM employees e2
            WHERE e2.hire_year = e.hire_year
        ),2
    ) AS year_avg
FROM employees e
WHERE e.salary >
(
    SELECT AVG(salary)
    FROM employees e2
    WHERE e2.hire_year = e.hire_year
)
ORDER BY hire_year, salary DESC;

-- Q45
SELECT
    p.product_name,
    p.category,
    p.stock_qty,
    ROUND(
        (
            SELECT AVG(stock_qty)
            FROM products p2
            WHERE p2.category = p.category
        ),2
    ) AS cat_avg_stock
FROM products p
WHERE p.stock_qty < (
    SELECT AVG(stock_qty)
    FROM products p2
    WHERE p2.category = p.category
)
ORDER BY category, stock_qty ASC;  
