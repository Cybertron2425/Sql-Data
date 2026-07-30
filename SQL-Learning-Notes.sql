-- ============================================================
-- SQL LEARNING NOTES
-- Database: abhay | Tables: employee, salary, department
-- Each query below has a short comment explaining it in simple words.
-- ============================================================


-- ============================================================
-- 1. DATABASE SETUP
-- ============================================================

use abhay;


-- Tells SQL which database to work in. Every query after this
-- runs inside the "abhay" database.


-- ============================================================
-- 2. TABLE CREATION & DATA INSERT
-- ============================================================

-- 2.1 Employee Table
-- Creates a table to store basic employee details.
-- emp_id is the PRIMARY KEY, so every employee must have a unique id.


CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    birth_date DATE
);

-- Adds 10 employees into the employee table.

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


-- 2.2 Salary Table
-- Stores each employee's job title (occupation) and salary,
-- plus a dept_id used later to link with the department table.


CREATE TABLE salary (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    occupation VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT
);

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


-- 2.3 Department Table
-- Stores department names and their locations.
-- Joining this with salary later shows which department each employee is in.


CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO department (dept_id, dept_name, location) VALUES
(101, 'IT', 'Delhi'),
(102, 'Analytics', 'Mumbai'),
(103, 'Human Resources', 'Pune'),
(104, 'Management', 'Bangalore'),
(105, 'Design', 'Hyderabad'),
(106, 'Marketing', 'Chennai'),
(107, 'Finance', 'Kolkata'),
(108, 'Networking', 'Noida');


-- ============================================================
-- 3. ALTER & UPDATE
-- ============================================================

-- ALTER TABLE changes the structure of an existing table.
-- Here, a new column phone_no is added to the employee table.


ALTER TABLE employee
ADD phone_no VARCHAR(15);

-- UPDATE changes the value of an existing row.
-- WHERE decides exactly which row (which emp_id) gets updated.


UPDATE employee SET phone_no = '9876543210' WHERE emp_id = 101;
UPDATE employee SET phone_no = '9876543211' WHERE emp_id = 102;
UPDATE employee SET phone_no = '9876543212' WHERE emp_id = 103;
UPDATE employee SET phone_no = '9876543213' WHERE emp_id = 104;
UPDATE employee SET phone_no = '9876543214' WHERE emp_id = 105;
UPDATE employee SET phone_no = '9876543215' WHERE emp_id = 106;
UPDATE employee SET phone_no = '9876543216' WHERE emp_id = 107;
UPDATE employee SET phone_no = '9876543217' WHERE emp_id = 108;
UPDATE employee SET phone_no = '9876543218' WHERE emp_id = 109;
UPDATE employee SET phone_no = '9876543219' WHERE emp_id = 110;

-- SELECT * means "show all columns and all rows" - used to quickly
-- check the full data of a table.


SELECT * FROM employee;
SELECT * FROM salary;
SELECT * FROM department;


-- ============================================================
-- 4. BASIC SELECT QUERIES
-- ============================================================

-- Selects specific columns and adds an extra calculated column:
-- (age + 5) * 2  -- normal math order of operations applies (PEMDAS).


select first_name,last_name,age,(age+5)*2 from employee;

-- Shows only first_name and last_name, not the whole table.
-- Use column names instead of * when only certain columns are needed.


select first_name,last_name from employee;


-- ============================================================
-- 5. WHERE CONDITIONS
-- ============================================================

-- WHERE filters rows based on a condition.


select * from employee where first_name='abhay';
select* from salary where salary>=70000;
select * from employee where gender='female';

-- DISTINCT removes duplicate values and shows only unique ones.


select distinct gender from employee;

-- AND returns a row only when BOTH conditions are true.


select * from employee where first_name ='Abhay' and age=21;

-- OR returns a row when AT LEAST ONE condition is true.


select * from employee where first_name ='Abhay' or age=21;

-- NOT reverses a condition (here: not female = male).


select * from employee where first_name='abhay' or not gender='female';

-- Brackets () group conditions together, just like in math.
-- The bracketed condition is checked first, then combined with OR.


select* from employee where(first_name='abhay' and age=21) or age>23;


-- ============================================================
-- 6. LIKE OPERATOR (Pattern Matching)
-- ============================================================

-- % means "any number of characters, including none".
-- Finds names that start with 'a'.


select * from employee where first_name like 'a%';

-- _ represents exactly ONE character.
-- Finds last names starting with 'j', any 1 char, then 's', then anything.


select * from employee where last_name like'j_s%';

-- 'bh' can appear anywhere, followed by one more character.


select * from employee where first_name like'%bh_%';

-- Name must end in 'y', with exactly 3 characters right before it.


select * from employee where first_name like'%___y';


-- ============================================================
-- 7. GROUP BY
-- ============================================================

-- GROUP BY combines rows with similar values into groups (here, by gender).
-- Aggregate functions (AVG, MIN, MAX, COUNT) then summarize each group.


select gender ,avg(age),min(age),max(age),count(age) from employee Group By gender;

-- AS renames a column to make results easier to read.


select gender ,avg(age) as avg_age from employee group by gender;


-- ============================================================
-- 8. ORDER BY
-- ============================================================

-- ORDER BY sorts results. Default is ascending (ASC = smallest to largest).


select * from employee order by gender;
select * from employee order by first_name asc;

-- With two columns: sorts by the first column, then by the second
-- column when the first has matching values. Order of columns matters.


select * from employee order by gender,age;
select * from employee order by age,gender;


-- ============================================================
-- 9. HAVING CLAUSE
-- ============================================================

-- WHERE filters individual ROWS (before grouping).
-- HAVING filters GROUPS (after grouping).
-- Shows only occupations whose average salary is above 50000.


select occupation,avg(salary) from salary where first_name like '%___%'
group by occupation having avg(salary)>50000;


-- ============================================================
-- 10. LIMIT & ALIASING
-- ============================================================

-- LIMIT restricts how many rows are returned.

select* from employee limit 10;

-- LIMIT 1,4 -> skip the first row (index 0), then return the next 4 rows.
-- Useful for pagination.


select * from employee order by age desc limit 1,4;

select gender ,avg(age) as avg_age from employee  group by gender ;

-- Once an alias (avg_age) is created, it can be used directly in HAVING.
select gender,avg(age) as avg_age from employee group by gender having avg_age>30;

-- AS keyword for aliasing is optional (works fine without it too).
select gender ,avg(age) avg_age from employee group by gender having avg_age<30;


-- ============================================================
-- 11. JOINS
-- ============================================================

-- 11.1 INNER JOIN
-- Shows only rows that have a match in BOTH tables.


select * from employee as e
inner join salary as s
on e.emp_id=s.emp_id;

-- Same as inner join (JOIN = INNER JOIN by default).
-- Only specific columns selected; tables given short aliases.


select dm.first_name ,dm.last_name ,sm.salary
from employee dm
join salary sm
on dm.emp_id=sm.emp_id;


-- 11.2 OUTER JOIN
-- LEFT JOIN: shows ALL rows from employee (left table), matched or not.
-- Unmatched rows show NULL for salary columns.


select * from employee e
left join salary s
on e.emp_id=s.emp_id;

-- RIGHT JOIN: shows ALL rows from salary (right table), matched or not.


select * from employee e
right join salary s
on e.emp_id=s.emp_id;


-- 11.3 SELF JOIN
-- Joins a table with itself, so it needs two different aliases.
-- Here, each employee is matched with the "next" employee (emp_id + 1).


select
emp1.emp_id,
emp1.first_name,
emp1.last_name ,
emp2.emp_id,
emp2.first_name,
emp2.last_name
from employee emp1
join employee emp2
on emp1.emp_id+1=emp2.emp_id;


-- 11.4 MULTIPLE TABLE JOIN
-- More than two tables can be joined in one query using common columns.


select * from employee E
join salary S
on E.emp_id=S.emp_id
join department D
on D.dept_id=S.dept_id;


-- ============================================================
-- 12. UNION
-- ============================================================

-- UNION combines results of two SELECT queries into one and
-- removes duplicate rows. Both queries need matching column counts/types.


select * from employee
union
select * from salary;

-- Combines results from three different conditions into one result,
-- with a "lable" column to identify which group each row belongs to.


select first_name,last_name,'old man' as lable from employee
where age>40 and gender='male'
union
select first_name,last_name,'old women' as lable from employee where age>40 and gender ='female'
union
select first_name,last_name,'highly paid employee'
as lable from salary where salary>30000;


-- ============================================================
-- 13. STRING FUNCTIONS
-- ============================================================

-- LENGTH() returns how many characters are in a piece of text.

select length('sky fall');

-- order by 2 -> sort results by the 2nd column in the query (first_name).


select emp_id, first_name ,length(first_name) from employee order by 2;
select emp_id,phone_no ,length(phone_no) from employee ;

-- UPPER() converts text to ALL CAPITALS. LOWER() converts to all small letters.


select first_name ,upper(first_name) from employee order by 2;
select first_name ,lower(first_name) from employee ;

-- RTRIM() removes extra spaces from the RIGHT side of a string.
-- (LTRIM() = left side, TRIM() = both sides)


select rtrim('  abhay   ') as test;

-- LEFT(text, n) = first n characters. RIGHT(text, n) = last n characters.
select first_name,left(first_name,2),last_name,right(last_name,3) from employee;

-- SUBSTRING(text, start, length) extracts a part of a string from the middle.
-- Here, the month is extracted from birth_date (position 6, 2 characters).


select first_name,substring(first_name,1,3),birth_date,substring(birth_date,6,2) from employee;

-- REPLACE(text, old, new) swaps one word/character in a string with another.


select first_name,replace(first_name,'a','m') from employee;
select first_name,replace(first_name,'Abhay','amit') as new_name from employee;
select first_name,replace(first_name,'Abhay','amit') from employee;

-- LOCATE(substring, text) returns the position where the substring
-- first appears in the text. Returns 0 if not found.


select first_name ,locate('abhay',first_name) from employee;
select first_name,locate('a',first_name)from employee;


-- ============================================================
-- 14. SUBQUERIES
-- ============================================================

select first_name,last_name,salary,avg(salary) from salary group by first_name,last_name,salary;

-- A subquery is a query inside another query.
-- Adds an avg_salary column to every row showing the overall average salary.

select first_name,last_name,salary,(
select avg(salary) from salary) as avg_salary from salary;

select gender, avg(age),max(age),min(age),count(age) from employee group by gender;

-- Inner query calculates gender-wise avg_age, max_age, min_age.
-- Outer query treats that result like a temporary table (new_avg_age)
-- and calculates an overall average from it.
-- This is called a Derived Table / Nested Subquery.

select avg(`max(age)`)from
(select gender,
avg(age)as avg_age,
max(age),
min(age)as avg_min,
count(age) as avg_count
from employee group by gender) as new_avg_age;

select avg(avg_max)from
(select gender,
avg(age)as avg_age,
max(age)as avg_max,
min(age)as avg_min,
count(age) as avg_count
from employee group by gender) as new_avg_age;

-- Extends the above by adding all three values (avg_max, avg_age, avg_min)
-- together and then averaging them - further calculation on a subquery result.


select avg(avg_max+avg_age+avg_min)/3 from
(select gender,
avg(age)as avg_age,
max(age)as avg_max,
min(age)as avg_min,
count(age) as avg_count
from employee group by gender) as new_avg_age;



 
-- ============================================================
-- 15. WINDOW FUNCTIONS
-- ============================================================
 
-- OVER(PARTITION BY ...) calculates an aggregate (like AVG) for each
-- group, but WITHOUT collapsing the rows into one row per group -
-- every individual employee row is still shown, just with the group's
-- average salary attached next to it.


select dm.first_name,dm.last_name,gender,avg(salary) over( partition by gender)
from employee dm
join salary s
on dm.emp_id=s.emp_id;
 
-- Compare this to a normal GROUP BY: it DOES collapse rows into one
-- row per gender, so we lose the individual employee-level detail.
-- Window functions solve this problem by keeping both the detail
-- rows AND the group-level aggregate together.


select dm.first_name,dm.last_name,gender,avg(salary)
from employee dm
join salary s
on dm.emp_id=s.emp_id
group  by dm.first_name,dm.last_name,gender;
 
-- SUM() OVER(PARTITION BY gender) gives the total salary for each
-- gender group, shown next to every row of that group.


select dm.first_name,dm.last_name,gender,
sum(salary) over( partition by gender)
from employee dm
join salary s
on dm.emp_id=s.emp_id;
 
-- Adding ORDER BY inside OVER() turns SUM() into a RUNNING TOTAL
-- (cumulative sum) within each gender group, ordered by emp_id.


select dm.first_name,dm.last_name,gender,salary,
sum(salary) over( partition by gender order by dm.emp_id)
from employee dm
join salary s
on dm.emp_id=s.emp_id;
 
-- ROW_NUMBER() gives each row a unique, ever-increasing number
-- within its partition (here, within each gender), ordered by
-- salary descending. No ties - every row gets a different number.


select dm.first_name,dm.last_name,gender, row_number() over( partition by gender order by salary desc)
from employee dm
join salary s
on dm.emp_id=s.emp_id;
 
-- RANK() vs DENSE_RANK() vs ROW_NUMBER():

-- ROW_NUMBER  -> always unique numbers (1,2,3,4...), even if salaries tie.
-- RANK        -> equal salaries get the SAME rank, but the next rank
--                SKIPS numbers (e.g. 1,2,2,4).
-- DENSE_RANK  -> equal salaries get the SAME rank, but the next rank
--                does NOT skip any number (e.g. 1,2,2,3).


select dm.first_name,dm.last_name,gender, row_number() over( partition by gender order by salary desc) as row_num,
rank()over( partition by gender order by salary desc) as rank_,
dense_rank()over( partition by gender order by salary desc) as den_rank
from employee dm
join salary s
on dm.emp_id=s.emp_id;
 
 
 -- cte --
 
 with high_salary as (
 select* from salary where salary>=60000
 )

select* from high_salary;


with exp as(
select e.first_name,e.last_name,s.salary,s.occupation,e.gender,avg(salary)over(partition by gender) as avg_salary
from employee e
join salary s
on e.emp_id=s.emp_id
)
select * from exp;


with exp1( Gender,avg_sal,max_sal,min_sal,count_sal) as(
select e.gender,avg(salary) ,max(salary),min(salary),count(*) over(partition by gender)
from employee e
join salary s
on e.emp_id= s.emp_id
group by e.gender
)
select * from exp1;