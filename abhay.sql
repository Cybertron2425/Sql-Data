-- ==========================================================
--                    MYSQL PRACTICE QUERIES
-- ==========================================================
-- Author      : Abhay Gupta
-- Database    : abhay
-- Description :
-- This SQL file contains beginner to intermediate MySQL queries.
-- It covers DDL, DML, Joins, String Functions, CASE, and more.
-- ==========================================================



-- ==========================================================
-- DATABASE
-- Description:
-- Selects the database where all SQL operations will be performed.
-- This ensures that every query runs on the correct database.
-- ==========================================================

USE abhay;



-- ==========================================================
-- CREATE TABLES
-- Description:
-- Creates the required tables to store employee, salary,
-- and department information using appropriate data types.
-- ==========================================================

-- Employee Table
-- Stores employee personal details.

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    birth_date DATE
);


-- Salary Table
-- Stores salary, occupation and department details.

CREATE TABLE salary (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    occupation VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT
);


-- Department Table
-- Stores department names and locations.

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);



-- ==========================================================
-- INSERT DATA
-- Description:
-- Inserts sample records into each table.
-- These records are used for practicing SQL queries.
-- ==========================================================

-- Employee Data

INSERT INTO employee (emp_id, first_name, last_name, age, gender, birth_date) VALUES
(101, 'Abhay', 'Gupta', 21, 'Male', '2005-02-15'),
(102, 'Rahul', 'Sharma', 24, 'Male', '2002-07-10'),
(103, 'Priya', 'Verma', 23, 'Female', '2003-01-25'),
(104, 'Amit', 'Singh', 27, 'Male', '1999-11-18'),
(105, 'Neha', 'Patel', 25, 'Female', '2001-09-30'),
(106, 'Rohan', 'Kumar', 22, 'Male', '2004-05-14'),
(107, 'Sneha', 'Joshi', 26, 'Female', '2000-08-21'),
(108, 'Vikas', 'Yadav', 29, 'Male', '1997-12-03'),
(109, 'Pooja', 'Mishra', 24, 'Female', '2002-04-11'),
(110, 'Arjun', 'Mehta', 28, 'Male', '1998-06-27');


-- Salary Data

INSERT INTO salary (emp_id, first_name, last_name, occupation, salary, dept_id) VALUES
(101, 'Abhay', 'Gupta', 'Software Engineer', 65000.00, 101),
(102, 'Rahul', 'Sharma', 'Data Analyst', 55000.00, 102),
(103, 'Priya', 'Verma', 'HR Executive', 48000.00, 103),
(104, 'Amit', 'Singh', 'Project Manager', 85000.00, 104),
(105, 'Neha', 'Patel', 'UI/UX Designer', 60000.00, 105),
(106, 'Rohan', 'Kumar', 'Software Engineer', 70000.00, 101),
(107, 'Sneha', 'Joshi', 'Marketing Manager', 68000.00, 106),
(108, 'Vikas', 'Yadav', 'Database Administrator', 75000.00, 102),
(109, 'Pooja', 'Mishra', 'Accountant', 52000.00, 107),
(110, 'Arjun', 'Mehta', 'Network Engineer', 72000.00, 108);


-- Department Data

INSERT INTO department (dept_id, dept_name, location) VALUES
(101, 'IT', 'Delhi'),
(102, 'Analytics', 'Mumbai'),
(103, 'Human Resources', 'Pune'),
(104, 'Management', 'Bangalore'),
(105, 'Design', 'Hyderabad'),
(106, 'Marketing', 'Chennai'),
(107, 'Finance', 'Kolkata'),
(108, 'Networking', 'Noida');



-- ==========================================================
-- ALTER TABLE
-- Description:
-- Modifies an existing table by adding a new column.
-- Used when the table structure needs to be updated.
-- ==========================================================

ALTER TABLE employee
ADD phone_no VARCHAR(15);



-- ==========================================================
-- UPDATE
-- Description:
-- Updates existing records in a table.
-- Used to modify specific column values.
-- ==========================================================

UPDATE employee SET phone_no='9876543210' WHERE emp_id=101;
UPDATE employee SET phone_no='9876543211' WHERE emp_id=102;
UPDATE employee SET phone_no='9876543212' WHERE emp_id=103;
UPDATE employee SET phone_no='9876543213' WHERE emp_id=104;
UPDATE employee SET phone_no='9876543214' WHERE emp_id=105;
UPDATE employee SET phone_no='9876543215' WHERE emp_id=106;
UPDATE employee SET phone_no='9876543216' WHERE emp_id=107;
UPDATE employee SET phone_no='9876543217' WHERE emp_id=108;
UPDATE employee SET phone_no='9876543218' WHERE emp_id=109;
UPDATE employee SET phone_no='9876543219' WHERE emp_id=110;



-- ==========================================================
-- SELECT
-- Description:
-- Retrieves data from one or more tables.
-- Used to display all records for verification.
-- ==========================================================

SELECT * FROM employee;
SELECT * FROM salary;
SELECT * FROM department;


-- ==========================================================
-- MATHEMATICAL EXPRESSIONS
-- Description:
-- Performs arithmetic calculations on numeric values.
-- SQL follows the PEMDAS/BODMAS rule while evaluating expressions.
-- ==========================================================

SELECT
    first_name,
    last_name,
    age,
    (age + 5) * 2 AS calculated_age
FROM employee;



-- ==========================================================
-- DISTINCT
-- Description:
-- Returns only unique values from a column.
-- Duplicate records are removed from the result.
-- ==========================================================

SELECT DISTINCT gender
FROM employee;



-- ==========================================================
-- WHERE CLAUSE
-- Description:
-- Filters records based on one or more conditions.
-- AND, OR and NOT operators can be used for complex filtering.
-- ==========================================================

-- AND Operator

SELECT *
FROM employee
WHERE first_name = 'Abhay'
AND age = 21;


-- OR Operator

SELECT *
FROM employee
WHERE first_name = 'Abhay'
OR age = 21;


-- NOT Operator

SELECT *
FROM employee
WHERE first_name = 'Abhay'
OR NOT gender = 'Female';


-- Combination of AND & OR

SELECT *
FROM employee
WHERE (first_name = 'Abhay' AND age = 21)
OR age > 23;



-- ==========================================================
-- LIKE OPERATOR
-- Description:
-- Searches records using pattern matching.
-- '%' represents multiple characters and '_' represents one character.
-- ==========================================================

-- Starts With

SELECT *
FROM employee
WHERE first_name LIKE 'A%';


-- Pattern Search

SELECT *
FROM employee
WHERE last_name LIKE 'J_S%';


-- Contains Pattern

SELECT *
FROM employee
WHERE first_name LIKE '%bh_%';


-- Ends With Pattern

SELECT *
FROM employee
WHERE first_name LIKE '%___y';



-- ==========================================================
-- GROUP BY
-- Description:
-- Groups rows having the same values.
-- Commonly used with aggregate functions like AVG(), COUNT(), MIN(), MAX().
-- ==========================================================

SELECT
    gender,
    AVG(age),
    MIN(age),
    MAX(age),
    COUNT(age)
FROM employee
GROUP BY gender;


SELECT
    gender,
    AVG(age) AS avg_age
FROM employee
GROUP BY gender;



-- ==========================================================
-- ORDER BY
-- Description:
-- Sorts records in ascending or descending order.
-- Multiple columns can also be used for sorting.
-- ==========================================================

SELECT *
FROM employee
ORDER BY gender;


SELECT *
FROM employee
ORDER BY first_name ASC;


SELECT *
FROM employee
ORDER BY gender, age;


SELECT *
FROM employee
ORDER BY age, gender;



-- ==========================================================
-- HAVING CLAUSE
-- Description:
-- Filters grouped records after GROUP BY.
-- It works with aggregate functions such as AVG(), COUNT(), SUM().
-- ==========================================================

SELECT
    occupation,
    AVG(salary)
FROM salary
WHERE first_name LIKE '%_%'
GROUP BY occupation
HAVING AVG(salary) < 50000;



-- ==========================================================
-- SELF JOIN
-- Description:
-- Joins a table with itself using aliases.
-- Useful for comparing rows or finding related records.
-- ==========================================================

SELECT
    emp1.emp_id,
    emp1.first_name,
    emp1.last_name,
    emp2.emp_id,
    emp2.first_name,
    emp2.last_name
FROM employee emp1
JOIN employee emp2
ON emp1.emp_id + 1 = emp2.emp_id;



-- ==========================================================
-- MULTIPLE TABLE JOIN
-- Description:
-- Combines data from multiple related tables.
-- Retrieves complete employee, salary and department details.
-- ==========================================================

SELECT *
FROM employee e
JOIN salary s
ON e.emp_id = s.emp_id
JOIN department d
ON d.dept_id = s.dept_id;

-- ==========================================================
-- STRING FUNCTIONS
-- Description:
-- String functions are used to manipulate and format text data.
-- These functions help in searching, modifying, and combining strings.
-- ==========================================================



-- ==========================================================
-- LENGTH()
-- Description:
-- Returns the total number of characters in a string.
-- Useful for validating text length.
-- ==========================================================

SELECT
    emp_id,
    first_name,
    LENGTH(first_name) AS name_length
FROM employee
ORDER BY first_name;

SELECT
    emp_id,
    phone_no,
    LENGTH(phone_no) AS phone_length
FROM employee;



-- ==========================================================
-- UPPER()
-- Description:
-- Converts all characters of a string into uppercase.
-- Useful for displaying data in a standard format.
-- ==========================================================

SELECT
    first_name,
    UPPER(first_name) AS upper_name
FROM employee
ORDER BY upper_name;



-- ==========================================================
-- LOWER()
-- Description:
-- Converts all characters of a string into lowercase.
-- Often used for case-insensitive comparisons.
-- ==========================================================

SELECT
    first_name,
    LOWER(first_name) AS lower_name
FROM employee;



-- ==========================================================
-- LTRIM()
-- Description:
-- Removes leading spaces from the beginning of a string.
-- Helps clean unwanted whitespace.
-- ==========================================================

SELECT
    LTRIM('   abhay   ') AS trimmed_text;



-- ==========================================================
-- LEFT() & RIGHT()
-- Description:
-- LEFT() returns characters from the beginning of a string.
-- RIGHT() returns characters from the end of a string.
-- ==========================================================

SELECT
    first_name,
    LEFT(first_name,2) AS first_two_letters,
    last_name,
    RIGHT(last_name,3) AS last_three_letters
FROM employee;



-- ==========================================================
-- SUBSTRING()
-- Description:
-- Extracts a specific portion of a string.
-- Position and length determine the extracted text.
-- ==========================================================

SELECT
    first_name,
    SUBSTRING(first_name,1,3) AS short_name,
    birth_date,
    SUBSTRING(birth_date,6,2) AS birth_month
FROM employee;



-- ==========================================================
-- REPLACE()
-- Description:
-- Replaces specific characters or words with new values.
-- It changes only the query output, not the original table data.
-- ==========================================================

SELECT
    first_name,
    REPLACE(first_name,'a','m') AS replaced_letters
FROM employee;

SELECT
    first_name,
    REPLACE(first_name,'Abhay','Amit') AS new_name
FROM employee;



-- ==========================================================
-- LOCATE()
-- Description:
-- Returns the position of a character or substring.
-- Returns 0 if the text is not found.
-- ==========================================================

SELECT
    first_name,
    LOCATE('Abhay',first_name) AS position
FROM employee;

SELECT
    first_name,
    LOCATE('a',first_name) AS position
FROM employee;



-- ==========================================================
-- CONCAT()
-- Description:
-- Combines two or more strings into a single string.
-- Commonly used to create full names.
-- ==========================================================

SELECT
    first_name,
    last_name,
    CONCAT(first_name,last_name) AS full_name
FROM employee;

SELECT
    first_name,
    last_name,
    CONCAT(first_name,' ',last_name) AS full_name
FROM employee;



-- ==========================================================
-- CASE STATEMENT
-- Description:
-- CASE works like an IF-ELSE statement in programming.
-- It performs different actions based on specified conditions.
-- ==========================================================

SELECT
    first_name,
    last_name,
    age,

CASE
    WHEN age <= 24 THEN 'Young'
    WHEN age BETWEEN 25 AND 60 THEN 'Adult'
    WHEN age > 60 THEN 'Senior Citizen'
END AS age_category

FROM employee;



-- ==========================================================
-- UPDATE EXAMPLE
-- Description:
-- Updates the age of a specific employee.
-- Used to modify existing records.
-- ==========================================================

UPDATE employee
SET age = 68
WHERE emp_id = 109;



-- ==========================================================
-- CASE WITH SALARY INCREMENT & BONUS
-- Description:
-- Calculates salary increment based on salary amount.
-- Also provides a bonus for employees in the Finance department.
-- ==========================================================

SELECT
    first_name,
    last_name,
    salary,

CASE
    WHEN salary < 50000
        THEN salary + (salary * 0.05)

    WHEN salary > 50000
        THEN salary + (salary * 0.07)
END AS new_salary,

CASE
    WHEN dept_id = 107
        THEN salary * 0.10
END AS bonus

FROM salary;



-- ==========================================================
-- END OF FILE
-- Description:
-- This SQL script covers beginner to intermediate MySQL concepts.
-- It includes DDL, DML, filtering, joins, grouping, sorting,
-- string functions, conditional statements, and practical examples.
-- This project is suitable for SQL practice, learning, and GitHub portfolios.
-- ==========================================================