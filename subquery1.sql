-- subquery is the type of querey weher a query is present with in  another
 -- query this subquery is also  calleed nested subquery
 
   -- there are two parts subquery
   -- 1 outer query
   -- 2 inner ouery 
   
   
create database   shadidb;
use shadidb;
create  table  biodata(id int, name varchar(20),age int);
insert into biodata values(1,'rahul',28),(2,'anjali',28),(3,'aishwariya',40),(4,'naina',23);

select * from biodata;

select  age  from  biodata where name='rahul';-- age og rahul
select * from biodata where age=29;
select * from biodata where age=(select age   from biodata where name='rahul');

select max(age) from biodata;
select *from biodata where age=40;
select * from  biodata where age=(select max(age) from biodata);
select * from  biodata where age=(select min(age) from biodata);
select  char_length(name)  from biodata  where name='rahul';
select name from  biodata where char_length(name)=5;
select   name from biodata where char_length(name)=(select char_length(name) from  biodata where name='rahul');
-- single row  subquqrey  - it is  type subquery  in which  inner query return only one row



use sakila ;
select * from film;


 -- find the movie name  where  rental rate  is  same  for the movie of  african egg
 select    rental_rate from film  where title = 'AFRICAN EGG';
 select  title ,rental_rate  from  film where rental_rate =2.99;
select  title ,rental_rate  from  film 
where rental_rate =( select    rental_rate from film  where title = 'AFRICAN EGG');

-- get the movie name and movie id where rental is eual to  min rental rate;
select  title , film_id,rental_rate  from film   where rental_rate=(select  min(rental_rate) from film  );

--  get  the movie id ,movie name and duration where duration  is greater tehan  avg duration  of the movies
select  film_id  , title  ,rental_duration  from film where  rental_duration>(select avg(rental_duration) from film);
-- get  the movie id for  the movies where release yaer of movie should be  eual to the realsing year  of the alone trip and 
-- rating  shpuld be same  as to  
-- of the apollo teen
 select  film_id  from  film  where  release_year =(select  release_year  from  film where  title='ALONE TRIP')
 and rating= (select rating  from  film where title = 'APOLLO TEEN');
 
 -- in multy row  subquerey (it will return multu row) we can not  perform mathmatical operation
 
  use  shadidb;
  select * from biodata;
 select   age  from  biodata where  name ='anjali' or name ='aishwariya';
 
 select  * from  biodata where   age in ( select   age  from  biodata where  name ='anjali' or name ='aishwariya');
  select  * from  biodata where   age in ( select   age  from  biodata where  name ='anjali' or name ='aishwariya') and  name != 'rahul';

   select  * from  biodata where   age  not in ( select   age  from  biodata where  name ='anjali' or name ='aishwariya') and  name != 'rahul';

