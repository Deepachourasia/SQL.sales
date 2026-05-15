-- 12-5-26 
use shadidb;
-- Create Table
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);
-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from employees;
select avg(salary)from employees;

select max(salary) from employees;
select * from employees where salary=(select max(salary) from employees);

select salary from employees where emp_id=101;
select * from employees where salary>(select salary from employees where emp_id=101);

-- ex.2
select department from employees 
where salary=(select min(salary) from employees);

-- multi row subquery

-- find employees who earn more then at least one hr employees
-- (yha apn ko hr ki salary nhi pta toh pehle vo nikalege apn 
select name,salary from employees where salary > any (select salary from employees where department = 'HR');
-- Example 3: Find employees who earn more than ALL Finance employees
select name,salary from employees where salary > all (select salary from employees where department ='Finance');
-- Find employees who work in departments located in Bangalore or Delhi.
select name,department from employees where department in(select dept_name from departments where location in ('banglore','delhi'));
-- Find employees who are managers (i.e., their EMP_ID appears in the MANAGER_ID column).
select name from employees where emp_id in (select distinct manager_id from employees where manager_id is not null);
-- ex. jo insan hr me bhi ho ,it me bhi ho ,
select  salary from employees where name='alice' or name='bob';
select * from employees where salary=50000 and salary=80000;

select  department from employees where name='alice' or name='bob';

select * from employees 
where department in(select department from employees where name ='Alice' or name ='Bob');

-- empl.  salary not same as 103 ,105 

select * from employees 
where salary not in (select salary from employees where emp_id =103 or emp_id=107);

-- 103 se bdi ho ya 107 se bdi ho 
-- we use then any operator 
-- 

select * from employees 
where salary >any(select salary from employees where emp_id =103 or emp_id=107); -- kisi se bhi bdi ho toh any aayga or less ho toh < less then ka 

select * from employees where salary >any(select salary from employees  where department ='HR');

-- salary hr department ki 
select * from employees where salary >all (select salary from employees  where department ='HR');
select * from employees where department ='IT';
-- atleast ,minimum aajye tb any lgana hai
-- jb sbme se niklana ho tb all lgyge
  (select emp_name from employees where department in  ('IT' ,'Finance'));

 

select name from employees where salary>all( select salary from employees where department IN ('hr', 'it'));
-- finance ki salary nikalo 

-- find the employees detail who works in it department and have the salary greater then the salary of employees id=101
select * from employees where department='IT'and salary>(select salary from employees where emp_id=101);
-- find the name of a person whose salary is greater then  all the salary of hr or it department
select name from employees where salary > all(select salary from employees where department IN ('HR','IT'));
-- find the emp_id,emp_name,of the user whose salary greater then the salary of any employees working under the manager id=101
select emp_id,emp_name where salary > any(select salary from employees where manager_id=101);
-- find out the second highest salary from this table
select max(salary) from employees where salary<(select max(salary)from employees);
select emp_name , department from employees where department in (select department from employees 
where department= 'IT' or department='Finance');

-- find the employees detail who works in it department and have the salary greater then the salary of employees id=101
-- find out the second highest salary from this table
-- find the emp_id,emp_name,of the user whose salary greater then the salary of any employees working under the manager id=101
select emp_id,emp_name where salary > any(select salary from employees where manager_id=101);
select emp_id,emp_name  where salary >any (select salary from employees where manager_id =101);
-- find the name of a person whose salary is greater then  all the salary of hr or it department
select name where salary >all(select salary from employees where department = 'IT' or department='HR');
-- find the employees detail who works in it department and have the salary greater then the salary of employees id=101
select * from employees where department='IT'and salary>(select salary from employees where emp_id=101);
select * from  employees where department='IT' and salary >(select salary from employees where emp_id=101);
-- Find employees who earn more than ALL HR employees.
select name,salary from employees where salary > all (select salary from employees where department ='HR');
-- Find employees earning less than ALL Finance employees.
select name,employees where salary  <All (select salary from employees where department='Finance');

select * from employees where department ='IT' and salary >(select salary from employees where emp_id=101);

select max(salary) from employees where salary <(select max(salary) from employees);










