# DDL COMMANDS
#  to create database
CREATE DATABASE mydb1;
# to display all databases
SHOW DATABASES;
# select the database
USE mydb1;
# to create table with columns and its constraints
CREATE TABLE employees (ID int, NAME varchar(100),SALARY int, AGE int, GENDER varchar(20));
# to display all the tables in the present database
SHOW TABLES;
# to drop table
DROP TABLE employees;
# to drop database
DROP DATABASE mydb1;
# DML COMMANDS
# #Copy/Insert Operation
# to add values to the columns
INSERT INTO employees (ID,NAME,SALARY,AGE,GENDER) values (8,"Vijay",100000,23,"Male");
INSERT INTO employees (ID, NAME,SALARY,AGE,GENDER) values (9,"Shreyas",100000,23,"Female");
# or 
INSERT INTO employees values (10,'Faraz',100000,23,'Male');	
INSERT INTO employees values (11,'Vivek',100000,23,'Male');	
INSERT INTO employees values (12,'Dhruvi',100000,23,'Female');
# Read Operation
# to select the table
SELECT  *FROM employees;
# to select only particular columns from table
SELECT NAME,SALARY FROM employees;
# to count the records from the table
SELECT count(*) FROM employees; 
# to display different salary values from the table
SELECT DISTINCT SALARY FROM employees; 
# to count all the different salary values from the table
SELECT count(DISTINCT SALARY) from employees;
# to display different values for multiple columns from the table
SELECT DISTINCT NAME,SALARY FROM employees;
# to execute update or delete statements and to define key in the where clause
SET SQL_SAFE_UPDATES=0; # safe update mode is disabled
# delete operaation
# delete some record with certain condition
DELETE FROM employees 
WHERE AGE=23;
# to delete table
# removes the existing records in a table
DELETE FROM employees;
# removes all rows from a tabe, but the table structure and its columns, constraints, indexes and so on remains
TRUNCATE TABLE employees;

# difference between delete from table and truncate table?
# delete allows you to delete selective rows from a table using where clause or you can delete all rows from a table
# truncate removes only removes all the rows from a table

# update operation
# to update or change and to set column value based on some condition
UPDATE employees SET SALARY=200000 WHERE GENDER='Female';
# to update or change and to set multiple column values based on some condition
UPDATE employees SET SALARY=150000, AGE=30 WHERE GENDER='Female';
SELECT *FROM employees;
# Aggregate Operations: Aggregation means accumulative on the total records
# to display count of the records from table
SELECT count(*) FROM employees;
# to display minimum salary from the table
SELECT min(SALARY) FROM employees;
# to display maximum salary from the table
SELECT max(SALARY) FROM employees;
# to display average of salary from table
SELECT avg(SALARY) FROM employees;
# to display sum of all the salaries from table
SELECT sum(SALARY) FROM employees;
# Filtering Operations: Filter the rows based on conditions that are going to be applied
# to display only 4 records from the table
SELECT *FROM employees limit 4;
# to display the records where age is lesser than 30
SELECT * FROM employees WHERE age<30;
# to display only particular columns based on the condition
SELECT NAME,Salary FROM employees WHERE age<30;
SELECT * FROM employees WHERE NAME ='Vivek';
# to display table where the condition includes two values
SELECT * FROM employees WHERE NAME IN ('Vivek','Dhruvi');
# and operation (A INETRSECTION B)
SELECT * FROM employees WHERE Age<30 AND NAME IN ('Vivek','Dhruvi'); #A intersection B
# or operation ( A UNION B)
SELECT * FROM employees WHERE Age<30 OR NAME IN ('Vivek','Dhruvi');  #A Union B
SELECT * FROM employees WHERE (Age<30 AND NAME IN ('Vivek','Dhruvi')) OR (SALARY<200000 AND GENDER="Female");  #A Union B
# % Regex
SELECT * FROM employees WHERE NAME LIKE 'Dhr%';  
SELECT * FROM employees WHERE NAME LIKE '%hr%';
# Grouping Operatins: Group By clause would applied when we like to grup the data based on COLUMNS
# The result of Group By operation is always going to be aggregated output
# to display count of salary from table by grouping by salary
SELECT SALARY, count(*) FROM employees GROUP BY SALARY;
# to display count of salary, age from table with grouping by salary, age
SELECT SALARY, AGE,count(*) FROM employees GROUP BY Salary,Age;
# to display age and sum of salary from table wih grouping by age 
SELECT AGE,sum(SALARY) FROM employees GROUP BY AGE;
# to display count of age from table with grouping by age
SELECT AGE, count(*) FROM employees GROUP BY AGE;
# Order By Clause :  order the resultset either in ASC or in DESC
SELECT AGE AS AGE, count(*) AS CNT FROM employees GROUP BY AGE ORDER BY AGE DESC;
SELECT AGE AS AGE, count(*) AS CNT FROM employees GROUP BY AGE ORDER BY CNT DESC;
# Having clause with Group BY:This clause is used to filter the aggregated output resulted out of Group By clause
SELECT AGE AS AGE,count(*) AS CNT FROM employees GROUP BY AGE HAVING AGE<40;  #GROUP BY AGE THEN FILTER 
SELECT AGE AS AGE,count(*) AS CNT FROM employees GROUP BY AGE HAVING AGE<40 ORDER BY AGE DESC;
SELECT * FROM (SELECT AGE AS AGE,count(*) AS CNT FROM employees GROUP BY AGE HAVING AGE<30 
ORDER BY AGE DESC)A WHERE A.AGE>30 AND A.CNT>1;
# joins
CREATE TABLE department(departments_id int, name varchar(100), location varchar(100));
INSERT INTO department values(8,'HR','delhi'),(9,'BDA','mumbai'),
(10,'DS','delhi'),(11,'DA','hyderabad'),(12,'HR','bengaluru');
# inner join
SELECT *FROM employees
JOIN department ON employees.id = department.departments_id;
# left join
SELECT *FROM employees
LEFT JOIN department ON employees.id = department.departments_id;
# right join
SELECT *FROM employees
RIGHT JOIN department ON employees.id = department.departments_id;
# full join
SELECT employees.name,  department.name
FROM employees
LEFT JOIN department ON employees.id = department.departments_id
UNION
SELECT employees.name, department.name
FROM employees
RIGHT JOIN department ON employees.id = department.departments_id;
# cross join
SELECT employees.name,  department.name
FROM employees
CROSS JOIN department;







