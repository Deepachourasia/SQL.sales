use sakila;
CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');

select * from sales;

select sum(amount) as total_sales  from sales;
-- mobile total sales 
-- when we want to change our column name then we use as
select sum(amount) as mobile_total_sales from sales where product="mobile";

-- total sales and average sales in the north region but for the product laptop and mobile
select sum(amount),avg(amount) from sales where region ='North' and  (product='laptop'or product='mobile') ;   
-- you need to find out the maximum amount and the minimumamount for februry month
select    max(amount),min(amount)   where  month(sale_date)='2';

-- 1. find out the total sales we have done for each region
-- 2.find out the average sales done by each person
-- 3 find the total amount and total sales done for each product but the amit should not be the sales person
-- 4 find the no. of sales by each person for the amount greater then 10,000
-- 5. find the no.of transactions from day 1 to day 7 for any month
-- 6 find the total amount,avg amount,max amount for each product of each region
-- 7 find the total transaction amount for each product where the product should be solved more then 13  times

select * from sales;
select   sum(sales) group by region;
select avg(sales)  from sales_person group by sales_person ;
select sum(amount) ,sum(sales) ,count(product) from sales where sales_person not in ('Amit') group  by product;
select count( sales_person) ,sales_person from sales where amount>10000  group by sales_person;
select  count(*) as total_transactions from sales where day(sales_date) between 1 and 7;
select product,region , sum(amount),avg(amount),max(amount),count(product),count(region) group by product,region;
select product, count(*) AS total_transaction from sales  where product >13 group by product ;

