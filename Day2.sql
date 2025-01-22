-- Single line Comment

# This is also a single line comment

/*
Multiline 
Comment
*/

/*
Usage of Comments

1. Documentation: Comments can be used to document the purpose of a SQL query or the logic 
behind complex operations.
2.Debugging: You can temporarily disable parts of your SQL code by commenting them out, 
which is useful for debugging.
3. Collaboration: When working in teams, comments help communicate the intent and 
functionality of the code to other developers.
*/

#Note :  SQL is not a case-sensitive language. as create & CREATE will be treated as same.

-- Create a database
create database RJThakurschool;
-- or
create database if not exists RJThakurschool;

-- use and work on any database
use RJThakurschool;

-- if you want to rename a database, that is not possible directly, 
-- you need to drop & create it within new name.

# delete any database (ctrl+enter to execute query)
drop database RJThakurschool;
-- or
drop database if exists RJThakurschool;

-- show all databases that exist in your dbms
show databases;

 /*
 In MySQL, commands are instructions that you use to interact with the database. 
 They allow you to perform various operations such as creating databases and tables, 
 inserting and updating data, querying data, and managing user permissions. 
 MySQL commands can be categorized into several types based on their functionality:

DDL(Data Definition Language): Defines database structures (CREATE, ALTER, DROP, TRUNCATE).
DML(Data Manipulation Language): Manipulates data (INSERT, UPDATE, DELETE).
DQL(Data Query Language): Queries data (SELECT).
DCL(Data Control Language): Controls access (GRANT, REVOKE).
TCL(Transaction Control Language): Manages transactions (COMMIT, ROLLBACK, SAVEPOINT).
*/



-- ------------------------------------Table Queries-------------------------------------------

-- Create a student table

create table student(
id int primary key,  -- primary key= unique + not null
name varchar(50) not null,
age int not null,
standard varchar(10) not null,
gender varchar(10),
division varchar(5)
);

-- show table data
select * from student;

-- method-1 to insert values
insert into student (id,name,age,standard,gender,division)
values
(1,'Jitesh',5,'2nd','male','A');

-- method-2 to insert values
insert into student
values
(2,'Mayuresh',5,'2nd','male','A');

-- remove all existing records from a table
truncate student;

-- remove complete table structure including attributes
drop table student;

-- method-3 to insert multiple values
insert into student
values
(1,'Mayuresh',5,'2nd','male','A'),
(2,'Mayuresh',5,'2nd','male','A'),
(3,'Mayuresh',5,'2nd','male','A'),
(4,'Mayuresh',5,'2nd','male','A'),
(5,'Mayuresh',5,'2nd','male','A');

/*

Cammands, Query & Clauses

Commands: 
These are the main instructions you use to interact with the database 
(e.g., SELECT, INSERT, UPDATE, DELETE, CREATE, etc.). They perform specific actions on the database.

Query:
In MySQL, a query is a request or command issued to the database to perform specific operations, such as retrieving, inserting, updating, or deleting data. Queries are written in Structured Query Language (SQL), which is the standard language used for interacting with relational databases.

Clauses: 
These are parts of SQL statements that provide additional details or conditions to the commands 
(e.g., WHERE, ORDER BY, GROUP BY, etc.). They help refine the command's operation.

In essence, commands are the actions you want to perform, while clauses are the conditions 
or modifications that help define how those actions should be executed. Understanding both is crucial for 
effective database management and querying.
 
*/











