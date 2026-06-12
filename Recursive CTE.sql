#Recursive CTE
# Recursive CTE is a sql query that repeats itself until the condition is met
#row wise chlti set operation use krte combine krne ke liye rows ke result ke
# joins ka kaaam hai   2 table ke bich me relation nikalne ke liye  

create database userdb2;
use userdb2;

select * from sakila.actor where actor_id
between 1 and 3;
-- Except -- union ,union all,Intersect
select * from sakila.actor where actor_id
in (3,5);
 
 with cte as
 (select 1 as n)
 
 select n+5 from cte
 where n<10;
   
with recursive cte as
(select 1 as n
union all
select n+1 from cte
where n<9
)
select * from cte;
-- tables kw through
-- hirerachy find krne ke liye
-- jese aapko aapke super bosss ka niklna hai name toh aaapke boss ka name niklna hai fr super boss ka)
-- relation niklnaa hai toh

create table employees3
(
emp_id INT,
emp_name varchar(50),
manager_id int);

Insert into employees3 values
( 1, 'CEO',Null),
( 2, ' deepa',1),
( 3, 'mary',1),
( 4, 'david',2),
( 5, 'tom',2),
( 6, 'lisa',4);

-- with cte as
-- (select * from employees3
-- where manager_id is null)

-- select * from employee3 as emp
-- join cte where emp_id=2 and emp_name;

with  recursive cte as
( select emp_id as bid,emp_name as bname,emp_name as hireachy  from employees3
where manager_id is null)

select * from cte union all 
select emp.emp_id,emp.emp_name,concat(emp.emp_name,'->',cte.bname) as hireachy
from employees3 as emp
join cte where emp.manager_id=cte.bid;

with  recursive cte as
( select emp_id as bid,emp_name as bname,emp_name as hireachy  from employees3
where manager_id is null

union all 

select emp.emp_id,emp.emp_name,concat(emp.emp_name,'->',cte.hireachy) as hireachy
from employees3 as emp
join cte where emp.manager_id=cte.bid)
select * from cte;

-- what are indexes why we use it what is the use of explain keyword
-- An Index is a database object that improves the speed of data retrieval operations on a table.
-- Think of it like the index page of a book.
-- Without an index → You read every page to find a topic.
-- With an index → You directly jump to the required page.
-- Similarly, SQL uses indexes to find rows quickly instead of scanning the entire table.

-- EXPLAIN KEYWORD
-- EXPLAIN shows how MySQL executes a query.
-- It helps us understand:

-- Which table is accessed first
-- Which index is used
-- Whether full table scan happens
-- Query cost/performance
-- what is cluster index and non cluster index







 
    