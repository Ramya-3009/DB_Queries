# create database
CREATE DATABASE db1;

# select the database  
USE db1;

# create table
CREATE TABLE customers (id int(10), name varchar(50), city varchar(50), PRIMARY KEY (id ));  

# alter table
ALTER TABLE customers   
ADD age varchar(50); 

SELECT * FROM customers;

# insert values into the table
INSERT INTO customers VALUES (102,'amit','mumbai', 22),
(103,'preethi','bangalore', 25),
(104,'rocky','lucknow', 24),
(105,'sony','chennai', 27);   

# update name and city where id is 101
UPDATE customers SET name='bob', city='hyderabad' WHERE id=101;  

# delete information from table where id is 101
DELETE FROM customers WHERE id=101;

# remove all the information from the table
TRUNCATE TABLE customers;  

# drop table
DROP TABLE customers;



     
 
