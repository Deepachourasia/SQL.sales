create database const_db;
use const_db;
-- DDL ( data defination language) create 
create table if not exists test1(id int,age int not null );
-- DML (data manipulation language) insert
insert into test1 values(101,32),(102,"null");
select * from test1;
-- constraints they are the rules apply to  the table columns to prevent the invalid data in the table
select * from test2; 
insert into test2 values(102,"null");
select * from test3; 
insert into test3 values(102,32);
insert into test3 values(null,40);
insert into test5(age) values(20);
select * from test5;
