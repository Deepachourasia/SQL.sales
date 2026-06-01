-- Views in sQL

create database if not exists viewdb;                                                                                                                                                                                                                                                                                                                                                                                               
use viewdb;


CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    name     VARCHAR(50),
    dept_id  INT,
    salary   DECIMAL(10,2),
    city     VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1,'HR'), (2,'IT'), (3,'Finance');

INSERT INTO employees VALUES
(101,'Aman',    2, 70000, 'Jaipur'),
(102,'Priya',   1, 45000, 'Delhi'),
(103,'Rahul',   2, 90000, 'Mumbai'),
(104,'Sneha',   3, 55000, 'Jaipur'),
(105,'Vikram',  2, 30000, 'Pune');

select * from departments;

create view dept_view as select * from departments where dept_id<3;
select * from dept_view;
#jiska data dekhna specific us pr view lgado 
#create krdo view or likhdo  view dept_view as
select * from employees;
#city wise niklna kitna salary khrch kiya
create view city_sum as select city ,sum(salary) from employees group by city;
select * from city_sum;
delete from emp_2_col where emp_id=101;
update emp_2_col set name='deepa' where emp_id=102;
select * from emp_2_col;
select * from employees;

#non-updatable view (read only)
-- if its definition contains any of the following 
# jisme sirf read kiya jata hai write nhi kiya jata
# aggregate function-sum,avg,count,min,max
-- group by or having
-- district
-- set operations - union ,intersect,except/minus
-- joins ( in many dbmss you can update only one side ;some disallow it entirely)
-- subqueries in the select list
-- window function(row_number(),rank(),etc)
-- commputed/derived columns -eg salary *12 as amount ('you can't update mannually directly)
-- views built on top of other non-updatable views







insert into emp_2_col values(107,'yash');
select * from emp_2_col;
select * from employees;

CREATE VIEW dept_avg_salary AS
SELECT department,AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

INSERT INTO employees
VALUES(4,'David','IT',80000);

UPDATE employees
SET salary = 90000
WHERE emp_id = 2;

create view dept_salary as select emp_id,avg(salary) as avg_salary from employees group by emp_id;
insert into dept_salary values(1,50000); -- error

create view emp_dept as select e.emp_id,e.name,d.dept_name
from employees e join departments d on e.dept_id = d.dept_id;

insert into emp_dept
values(101,'riya','it');

create or replace view emp_view as
select e.emp_id,e.name,d.dept_name from employees  as e
join departments d where e.dept_id= d.dept_id;





