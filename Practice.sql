-- single line comments

/*
Multi 
Line
Comment
*/

-- create database (ctrl+enter)
create database CHMSchool;

-- use databse first to work on it.
use CHMschool;

-- SQL is not a case-sensitive language.

-- ----------------------------------------------- Table Queries -----------------------------------

-- table-1 Students
-- create a table 
create table Students(
id int primary key,  -- primary key = unique + not null
name varchar(50) not null,
course varchar(50) not null,
phone_no varchar(10) not null
);

-- show table data
select * from students;

-- insert values in a table
insert into students (id,name,course,phone_no)
values 
(1,'Ram','DA','123456789'),
(2,'Abdul','DS','438569543'),
(3,'Dheeraj','DA','2345678'),
(4,'Akshata','DS','3245678'),
(5,'Pratibha','DA','456789');

-- removes all values from a table
truncate students;

-- remove complete existance of a table
drop table students;

-- table-2 Teachers
