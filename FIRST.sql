CREATE DATABASE IF NOT EXISTS school;

USE school;

CREATE TABLE IF NOT EXISTS student(
      id INT PRIMARY KEY,
      name VARCHAR(50),
      age INT NOT NULL
);

 -- INSERT INTO student VALUES(1,"DEEPA",24); For short query
 -- INSERT INTO student VALUES(2,"PRATEEK",27);
 INSERT INTO student
 (id,name,age)
 VALUES
 (5,"DEEPA",25),
 (6,"SOMYA",45);
 
select * from student;
 


SELECT * FROM student;

show databases;
show tables;

create table table_name(
column_name1 datatype constraint,
column_name2 datatype constraint
);








