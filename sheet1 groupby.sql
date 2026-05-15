-- use sakila;

CREATE TABLE sales (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    Category VARCHAR(20),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);

INSERT INTO sales (OrderID, CustomerID, Category, OrderDate, OrderValue)
VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);

-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category.
select category,
Sum(OrderValue) as total_revenue 
from sales_data
group by (category)
order by total_revenue desc;

-- Q2. Count the total number of orders placed in each Category.
-- jb bhi total no. of order puche count lgana hai 
select category,
count(OrdersID) as total_orders 
from sales_data
group by category
order by total_orders desc;

-- 3 
select cetegory,
max(orderValue) as max_ordervalue
from sales_date
group by cetegory
order by max_ordervalue desc;

-- level 2
-- for unique used distinct 
-- Q1. List all unique product Categories that appear in the Sales_Data table.
select distinct categories,
from sales_data
order by category;

-- unique customerid
select distinct customerID
from sales_data
order by customer_id;


select  distinct customerId,category 
from sales_data
order by customerId,category;

 -- level 3 -- medium
 -- GROUP BY with Multiple Columns
-- Hint: Group records by more than one column simultaneously to create multi-dimensional summaries.
-- Revenue by CustomerID and Category
select customerID,
cetegory,
sum(ordervalue) as total_revenue
from sales_data
group by customerId,category
order by customerID,category;

-- Q2. Order Count by CustomerID and Category
select customerID,
category,
count(orderID) as order_count
from sales_data
group by customerID,category
order by customerID,category;

-- jb bhi revenue aayga sum(ordervalue) lgega as total_revenue lgega
-- Q1. Categories with Revenue > $20,000
select category,
sum(ordervalue) as total_revenue
from sales_data
group by category
having sum(ordervalue)>20000

-- jha bhi order count aajayga wha count(orderID) as order_count name se likh denge
-- Q2. Customers with More Than 1 Order
select customerID,
count(orderID) as order_count 
from sales_data
group by customerID
having count(orderID) > 1
order by order_count desc;

-- Q2. Customers with More Than 1 Order
select customerID,
count(orderId) as order_count
from sales_data
group by customerID
having count(orderID)>1
order by order_count desc;

select customerID,
count(orderID) as order_count
from sales_data
group  by customerID
having count(orderID)>1
order by order_count desc;










