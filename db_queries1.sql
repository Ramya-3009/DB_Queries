 # create database
 CREATE DATABASE employeesdb;
 
 # show the created database
 SHOW CREATE DATABASE employeesdb; 
 
 # show all the databses
 SHOW dATABASES;
 
 # select the database
 USE employeesdb;
 
 # drop the database by checking if it exists
 DROP DATABASE IF EXISTS db1; 
 
 # show the tables
 SHOW TABLES;
 
 # create table
 CREATE TABLE employee_table( id int NOT NULL AUTO_INCREMENT,  name varchar(45) NOT NULL,  
 occupation varchar(35) NOT NULL,  age int NOT NULL,  PRIMARY KEY (id) ); 
 
 # show the tables
 SHOW TABLES;
 
 # to show the structure of the table, such as column names, constraints on column names
 DESCRIBE employee_table;  
 
 # Alter table is used to add or delete or modify columns in existing table
 # adding one more column with its constraint
 ALTER TABLE employee_table 
 ADD Gender varchar(40) NOT NULL;
 
 # seeing if the column is added
 SELECT* FROM employee_table;  
 
# adding multiple columns
ALTER TABLE employee_table  
ADD emp_address varchar(100) NOT NULL  
AFTER age,  
ADD emp_salary int(100) NOT NULL  
AFTER occupation ; 

 # seeing if the columns are added
 SELECT* FROM employee_table;
 
# modify column in the table
ALTER TABLE employee_table  
MODIFY name varchar(50) NULL;  

# drop the column in table
ALTER TABLE employee_table  
DROP COLUMN emp_address;  

# Rename column in table
ALTER TABLE  employee_table  
CHANGE COLUMN name emp_name  
varchar(50) NOT NULL;  

# Rename the table
ALTER TABLE employee_table  
RENAME TO emp_table; 

# show /list tables
SHOW TABLES;
# to get the type of table (Base or View)
SHOW FULL TABLES;
# to show or list the table name from 
# different databases or database to which you are not connected without switching
SHOW TABLES IN db;  
SHOW TABLES FROM db;
# Show Tables Using Pattern Matching
SHOW TABLES FROM employeesdb LIKE "emp%";  

SELECT* FROM emp_table;

# add values to this table using insert into
INSERT INTO emp_table ( Id, emp_name, occupation, emp_salary, age, gender)     
VALUES (1, 'Stephen', 'Data Scientist', 500000, 23, 'Male'),     
(2, 'Joseph', 'ML Analyst', '450000', 26, 'Male'),     
(3, 'Sara', 'Data Scientist', '500000', 25, 'Female'),    
(4, 'Donald', 'Data Scientist', '500000', 27, 'Male'),    
(5, 'Rosy', 'Data Engineer', '900000', 26, 'Female'),    
(6, 'Peter', 'Devops Engineer', '1200000', 28, 'Male'); 

 SELECT* FROM emp_table;
 
 # truncate all the values from the table
 TRUNCATE TABLE emp_table;
 
 SELECT* FROM emp_table;
 
 # How to Truncate Table with Foreign key?
 # If we perform the TRUNCATE operation for the table that uses a foreign key constraint, 
  # we will get error:
# we need to log into the MySQL server and disable foreign key checks before executing 
# the TRUNCATE statement as below:
SET FOREIGN_KEY_CHECKS=0;  
# if we are able to truncate tables. After execution, re-enable foreign key checks as given below:
SET FOREIGN_KEY_CHECKS=1;

# show columns command
SHOW COLUMNS FROM emp_table; 

# If we want to show the columns information of a table from another database or not available in the
# current database
SHOW COLUMNS FROM db.employee;  
SHOW COLUMNS FROM employee IN db; 

# If we want to display the more column information, we need to add FULL keyword with the SHOW TABLES 
# statement 
SHOW FULL COLUMNS FROM emp_table;  

# If we want to show the execution plan of a SELECT statement
EXPLAIN SELECT * FROM emp_table; 

# drop the existing the table
DROP TABLE emp_table;

# MySQL TRUNCATE Table vs. DROP Table
# You can also use the DROP TABLE command to delete the complete table, 
# but it will remove complete table data and structure both. 
# You need to re-create the table again if you have to store some data. 
# But in the case of TRUNCATE TABLE, it removes only table data, not structure. 
# You don't need to re-create the table again because the table structure already exists.

# creating a temporary table
CREATE TEMPORARY TABLE Students( student_name VARCHAR(40) NOT NULL, 
total_marks DECIMAL(12,2) NOT NULL DEFAULT 0.00, total_subjects INT UNSIGNED NOT NULL DEFAULT 0); 

# insert values into the table
INSERT INTO Students(student_name, total_marks, total_subjects) VALUES ('Joseph', 150.75, 2);

SELECT* FROM Students;

# drop tempoerary table
DROP TEMPORARY TABLE Students; 

# create table
CREATE TABLE original_table (  Id int PRIMARY KEY NOT NULL,   Name varchar(45) NOT NULL, 
Product varchar(45) DEFAULT NULL, Country varchar(25) DEFAULT NULL, Year int NOT NULL  ); 

# insert values into the table
INSERT INTO original_table( Id, Name, Product, Country, Year)   
VALUES (1, 'Stephen', 'Computer', 'USA', 2015),   
(2, 'Joseph', 'Laptop', 'India', 2016),   
(3, 'John', 'TV', 'USA', 2016),  
(4, 'Donald', 'Laptop', 'England', 2015),  
(5, 'Joseph', 'Mobile', 'India', 2015),  
(6, 'Peter', 'Mouse', 'England', 2016);

 SELECT * FROM original_table;  
 
 # execute the following statement that copies data from the existing table "original_table" 
 # to a new table named "duplicate_table" in the selected database
CREATE TABLE IF NOT EXISTS duplicate_table   
SELECT * FROM original_table; 
SELECT * FROM duplicate_table;

# Sometimes there is a need to copy only partial data from an existing table to a new table. 
# In that case, we can use the WHERE clause with the SELECT statement
CREATE TABLE IF NOT EXISTS duplicate_table   
SELECT * FROM original_table WHERE Year = '2016';  
SELECT * FROM duplicate_table;



  


 
 