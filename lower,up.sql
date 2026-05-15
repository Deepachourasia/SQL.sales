select *from employees;
select first_name,salary
from employees;
select * from employees
where salary > 7000;
select * from employees
where department = 'IT';

 -- Salary between 60000 and 80000
 select *
 from employees 
 where salary between 6000 and 8000;
 
 select * 
 from employees
 where department in ('IT','HR');
 
 select *
 from employees
 where first_name like 'A%';
 
 select * 
 
 from employees
 where email like '%gmail.com';
 
 -- convert names to lowercase
 select first_name,lower (first_name)
 from employees;
 
 select first_name,length(first_name)
 from employees;
 
 
 
 
 
 