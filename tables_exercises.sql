-- Use the employees DB
use employees;

-- List all the tables in the DB
show tables;

-- Explore the employees table. What different data types are present on this table?
select * from employees;
	-- int, date, string, char, varchar

-- Which table(s) do you think contain a numeric type column?
	-- departments, employees, salaries
select * from salaries;

-- Which table(s) do you think contain a string type column?
	-- departments, dept_emp, dept_manager, employees, titles

-- Which table(s) do you think contain a date?
	-- dept_emp, employees, titles, salaries
select * from salaries;

-- What is the relationship between the employees and the departments tables?
	-- Each employee should be linked with a department

-- Show the SQL that created the dept_manager table.
show create table dept_manager;