-- Single Line Comments

/*
MultiLine
Comments
*/

## This is Also used to write single line comments

/*
Usage of Comments

1. Documentation: Comments can be used to document the purpose of a SQL query or the logic 
behind complex operations.
2.Debugging: You can temporarily disable parts of your SQL code by commenting them out, 
which is useful for debugging.
3. Collaboration: When working in teams, comments help communicate the intent and 
functionality of the code to other developers.
*/

-- ----------------------------------- Database Queries ---------------------------------

-- create a school database
create database MVM;

-- to work on this database we need to use it (to execute press ctrl+enter)
use MVM;

-- -----------------------------------------------------------------------------------------

-- ------------------------------------ Table Queries --------------------------------------

-- create table student
create table student (
id int primary key,               -- primary key = not null + unique
name varchar(50),
course varchar(100)
);

-- display table data
select * from student;

-- delete complete table structure
drop table student;

-- insert students details in table
insert into student(id,name,course)
values
(1,'Akhil','DA'),
(2,'Jitesh','DA'),
(3,'Harshal','DA'),
(4,'Om','DA'),
(5,'Niti','BBA'),
(6,'Atul','CS'),
(7,'Sunil','IT');

-- delete all records from table
truncate student;