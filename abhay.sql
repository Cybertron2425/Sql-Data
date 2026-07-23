use abhay;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    birth_date DATE
);


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

ALTER TABLE employee
ADD phone_no VARCHAR(15);

UPDATE employee SET phone_no = '9876543210' WHERE emp_id = 101;
UPDATE employee SET phone_no = '9876543211' WHERE emp_id = 102;
UPDATE employee SET phone_no = '9876543212' WHERE emp_id = 103;
UPDATE employee SET phone_no = '9876543213' WHERE emp_id = 104;
UPDATE employee SET phone_no = '9876543214' WHERE emp_id = 105;
UPDATE employee SET phone_no = '9876543215' WHERE emp_id = 106;
UPDATE employee SET phone_no = '9876543216' WHERE emp_id = 107;
UPDATE employee SET phone_no = '9876543217' WHERE emp_id = 108;
UPDATE employee SET phone_no = '9876543218' WHERE emp_id = 109;
UPDATE employee SET phone_no = '987654321945' WHERE emp_id = 110;

SELECT * FROM employee;

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

SELECT * FROM salary;


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

SELECT * FROM department;

select first_name,last_name,age,(age+5)*2 from employee;
#pemdas



select distinct gender from employee;

select * from employee where first_name ='Abhay' and age=21;
select * from employee where first_name ='Abhay' or age=21;


select * from employee where first_name='abhay' or not gender='female';

select* from employee where(first_name='abhay' and age=21) or age>23;
select * from employee where first_name like 'a%';
select * from employee where last_name like'j_s%';
select * from employee where first_name like'%bh_%';
select * from employee where first_name like'%___y';


#group by
select gender ,avg(age),min(age),max(age),count(age) from employee Group By gender;
select gender ,avg(age) as avg_age from employee group by gender;

#order by

select * from employee order by gender;
select * from employee order by first_name asc;
select * from employee order by gender,age;
select * from employee order by age,gender;

#having vs where
select occupation,avg(salary) from salary where first_name like '%_%'group by occupation having avg(salary)<50000;


#outer  join


#self join

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


# joing multiple table together

select * from employee E
join salary S
on E.emp_id=S.emp_id
join department D
on D.dept_id=S.dept_id;



#string function

select emp_id, first_name ,length(first_name) from employee order by 2;

select emp_id,phone_no ,length(phone_no) from employee ;

update employee set phone_no='9876543219' where emp_id=110;

select first_name ,upper(first_name) from employee order by 2;
select first_name ,lower(first_name) from employee ;

select ltrim('  abhay   ') as test;