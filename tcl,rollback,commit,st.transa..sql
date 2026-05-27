# TCL= transaction control language
#transactions are the group of sql statements which work as  a unit
#to manage all transactions like insert ,update ,delete
-- this tcl command ensure my data is correct & accurate
-- by following 4 properties
-- 1. Automacity=( my all the transactions completely done or undone)
-- 2. consistency=(data mera correct way me ja rha hai by checking step by step steps  execution correct)
-- ex. bank khulvana hai toh first its verify aadhar ccard,then otp ,then verify
-- 3. Isolation= jo kaam ho rha hai vo aapke liye hi ho rha kisi or ko vo changes nhi dikhege
-- Durability= jo bbi aap changes change vo humesha aapke ps hi rehge mera data humesha permately 
-- save rehga
#first isolation kaam aayga
create database rajdb;
use rajdb;
create table raj45 (id int);
insert into raj45 values(10);
select * from raj45;
-- tcl
start transaction;-- keyword
insert into raj45 values(100),(99);
select * from raj45;
commit; -- data has saved becoz of commit
-- transactions kb kb start hote hai:
-- ya to start transaction ya fr hum dml operations chlyge jese insert,update,delete
-- completely changes nhi hote pending phase m hote hai
-- when the transaction end 
-- ya toh commit likhna pdega ya rollback ya koi ddl statement chlyge execute kreege
--

start transaction;
set sql_safe_update = 0;
update raj45 set id=500;
select * from raj45;
rollback; -- jo apn ne update kiya toh sbki value 500 hogyi but you haveold table answer so you use rollback
-- means pending transactions ko revert krdeta hai mtlb undo krdeta hai bnd hogya
select * from raj45;
delete from raj45;
-- start transaction nhi likha toh vo khud hi manage kr raha hai
-- bhuut bda role hota hai iska developer kch bhi kr rha ahi insert update toh start transacion 
-- like gmail password jb tk save nhi kroge tb tkmsave nhi hoyge commit means save button
-- rollback means delete button
-- autocommit it is variable by default 1 it means ye jo bhi kaamm krega automatic save krega
-- 
start transaction;
insert into raj45 values(10),(11),(56),(68);
delete from raj45 where id=10;

select * from raj45;
commit;
rollback;
-- ak baar rollback hone ke baaad aap kch bhi changes kro kch frk nhi pdega
-- commit hone ke baad rollback nhi chl skta 
-- save point

start transaction;
insert into raj45 values(100),(199),(400);
select * from raj45;
update raj45 set id=1000;
rollback;
-- sare pending transactions ko revert  krta hai
savepoint raj45_savepoint_ins;
update raj45 set id=1000;
rollback to raj45_savepoint_ins; -- rollback to savepoint to revert upto specific point

create  table tr(id int);
-- drop and truncate is ddl statement
-- delete -- dml 
-- trucate where condition nhi de skte but delete me de sktehai
-- truncate and drop caannot be rollback but delete hoskta hai becoz it is dml statement
-- 

 


