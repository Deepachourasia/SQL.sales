#subquery
create database shadidb;
use  sakila;


create table biodata(id int, name varchar(20),age int);

insert into biodata values(1,'rahul',28),(2,"anjali",28),
(3,"aishwariya",40),(4,"naina",23);

select age from biodata where name="rahul"; -- age of rahul

select * from biodata where age=29; -- convert into dynamic

select * from biodata where age=(select age from biodata where name="rahul");

select  * from biodata where age=40;
select * from biodata where age=(select max(age) from biodata);
 
#total character the name of the person of total character 

select char_length(name) from biodata
where char_length(name)=5; -- compare

-- in subquery
-- single row subquery
-- it is a type of subquery in which the inner query return one query 
select name from biodata where
char_length(name)=(select char_length(name) from biodata 
where name ='Rahul');

use sakila;
select * from film;

-- un movies ka name niklana hai where rental rate is same for the movie of african egg
select rental_rate from film 
where title = 'african egg';

select title ,rental_rate from film where rental_rate=2.99;

select title,rental_rate=(select rental_rate from film
where title = 'african egg');

-- q1 get the movie id & movie name where rental rate is equal to the  

-- q2 get the movie id , movie name & the duration where the duration is 
-- greater than the average of movies

-- q3 get the movie id for the movies where the release year of the movie should be equal to the realsing date of alone trip 
-- and the rating should be same as of the movie apollo teen

SELECT movie_id, movie_name, duration
FROM movies
WHERE duration > (SELECT AVG(duration )FROM movies
);


SELECT film_id,title
FROM movies
WHERE release_year = (
    SELECT release_year
    FROM movies
    WHERE movie_name = 'Alone Trip'
)
AND rating = (
    SELECT rating
    FROM movies
    WHERE movie_name = 'Apollo teen'
);

select release_year from film where title='Alone trip';

-- select * from film
-- where release_year(select release_year from film where title ='Alone trip')
-- and rating=(select rating from film where  name 

-- ya to meri age ke equal ho ya fr 12 saal bdi ho
--  in multi  row subquery if it is written more then one row 

use shadidb;

select  * from biodata
where name = 'Rahul' and age;

select age from biodata where name='anjali' or name ='aishwarya'
select * from biodata where name ='rahul'
and age in  (select age from biodata where name ='anjali'  or name ='aishwarya')
and name='rahul';

-- i need to find out the name where the age is not equal to age of anjali and age of aishwarya
select age from biodata where name='anjali' or name ='aishwarya'
select * from biodata where name ='rahul'
and age  not in  (select age from biodata where name ='anjali'  or name ='aishwarya')
and name='rahul';


-- hackerank 3 star & sql zoo also 
-- any ,all op in multi row subquery
-- 







  