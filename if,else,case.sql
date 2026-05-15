-- 5--5-26 
-- if else functions
use sakila;
-- if(condition ,True stament,False statement)
select first_name,department,salary, if (department="IT", True,False) 
from employees;

select first_name,department,salary,if(department="IT",salary*1.1,salary*1.05)
from employees;

select first_name,department,salary,
if(department="IT",salary*1.1,if(department='HR',salary*1.05,salary)) from employees;


select first_name,department,salary,
case 
    when department='IT' then salary
    else 'NON IT'
end
from employees;
/* 
select col1,col2,
case
   when condition then statement
end
 from table_name
 */
-- if the hiring date of an emplyoees is before year 2020 job title print with senior hr manAGER,senior  engineer
-- if the year 2021 print associate vrna jo name vo vesa ka vesa chlega

select * from employees;
select job title,
case
    when year < 2020 and job_title ('senior','HR Manager','software engineer')  
	when year =2021 and job_title('associate')
    
    end as
    from employees;
    
    -- salary create are 3 categories if salary greater then 70000 create the category name as average salary 
    -- if the sal is greater then 85000 print high salary , if sal greater then 100000 print extreme high salary , othrrwise print category name as 
    -- low salary
    
select (salary) as averagesalary ,
case 
	when salary >70000  then 'averagesalary'
    when salary > 85000 then 'high salary'
    when salary > 100000 then 'extreme high salary' 
    else salary 
end as 'low salary'
from employees;


-- select the job title & print the colm value baesd folloeing condition
-- job title greter then 1 