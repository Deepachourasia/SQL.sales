#DCL = Data control language
select * from mysql.user;
create user ishan identified by '123';
select current_user();
create database testdb4;
use testdb4;
create table emp(id int, name varchar(20));
insert into emp values(20,'abhi'),(21,'naina');
select * from emp;

show grants for ishan; -- ishan user ke pss kon konsi permissions hai
-- on jo hai vo database ,. means all ,% sare ip address
-- kisi databse ka acesss usse kese diya jaaye

show grants for testdb4;
grant select on testdb4.emp to ishan; -- ab ishan ko access dediya ishan v use kr skta hai sirf dekh skta hai abhi
-- kyuki show likha hai bss 
grant delete on testdb4.* to ishan;
-- also  create one more table insert data select query chlakr dekhna deletee chlna
-- revoke this delete priviliges from ishan user
-- give select and insert priilige 
-- create a database 3 columns and insert atleast 2 rows
-- now give one column access to ishan user
-- also give the update priviliges to second or third privileges
-- remove all the privileges  from this ishan user

-- create table emp1(id int,name varchar(20));
-- insert into emp1 values(1,'abhi' ),(2,'naina');
-- select * from emp1;
-- grant delete on testdb4.emp2 to ishan;
-- SET SQL_SAFE_UPDATES = 1;

CREATE TABLE emp2(
id INT,
name VARCHAR(20)
);

INSERT INTO emp2
VALUES(1,'abhi'),(2,'naina');

SELECT * FROM emp2;

GRANT DELETE
ON testdb4.emp2
TO ishan;

SET SQL_SAFE_UPDATES = 0;

REVOKE DELETE
ON testdb4.emp2
FROM 'ishan';

GRANT SELECT, INSERT
ON testdb4.emp2
TO 'ishan';

CREATE DATABASE companydb4;
use companydb4;
create table employees(id int,name varchar(50), salary int);
insert into employees values
(1,'Rahul',50000),
(2,'Sneha',60000);
SELECT * FROM employees;
-- now give one column access to ishan user
grant select (name) on   companydb4.employees  to 'ishan';
-- also give the update priviliges to second or third privileges
GRANT UPDATE(name, salary)
ON companydb.employees
TO 'ishan';
-- remove all the privileges  from this ishan user
REVOKE ALL PRIVILEGES,
GRANT OPTION
ON  companydb.employees
FROM 'ishan';

-- create three users and create a group (sales name) select ,insert ,update is role ko teeno ki permission denge
-- or jo aapne user bnaya hai usko permission do
-- or cheeck kro users ke pss permissions aayi ya nhi
-- create three users and create a group (sales name) select ,insert ,update is role ko teeno ki permission denge
CREATE USER 'aman'
IDENTIFIED BY '1234';
CREATE USER 'rahul'
IDENTIFIED BY '1234';
CREATE USER 'sneha'
IDENTIFIED BY '1234';
CREATE ROLE 'sales';
-- or jo aapne user bnaya hai usko permission do
GRANT SELECT, INSERT, UPDATE
ON companydb.employees
TO 'sales';
-- or cheeck kro users ke pss permissions aayi ya nhi
SHOW GRANTS FOR 'aman';










