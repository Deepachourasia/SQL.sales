select current_user;
show databases;
use sakila;
show tables;


select * from customer;

-- where clause => to filter
select first_name, customer_id from customer where customer_id=2;

select first_name, customer_id from customer where customer_id>5;

select * from customer where first_name='LISA';

-- range of  values filter => betweeen
select * from customer where customer_id between 2 and 5;
select * from customer where customer_id  not between 2 and 5;

-- in =>specfic values
select * from customer where first_name in ('LISA', 'PATRICIA'); 

