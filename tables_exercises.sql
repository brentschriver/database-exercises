-- Use the employees DB
use employees;

-- List all the tables in the DB
show tables;

-- Explore the employees table. What different data types are present on this table?
describe employees;
	-- int, date, string, char, varchar

-- Which table(s) do you think contain a numeric type column?
	-- employees, salaries
describe employees;

-- Which table(s) do you think contain a string type column?
	-- departments, dept_emp, dept_manager, employees, titles
describe dept_emp;

-- Which table(s) do you think contain a date?
	-- dept_emp, employees, titles, salaries
describe salaries;

-- What is the relationship between the employees and the departments tables?
	-- Each employee should be linked with a department

-- Show the SQL that created the dept_manager table.
show create table dept_manager;
	-- CREATE TABLE `dept_manager` (↵  `emp_no` int NOT NULL,↵  `dept_no` char(4) NOT NULL,↵  `from_date` date NOT NULL,↵  `to_date` date NOT NULL,↵  PRIMARY KEY (`emp_no`,`dept_no`),↵  KEY `dept_no` (`dept_no`),↵  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,↵  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT↵) ENGINE=InnoDB DEFAULT CHARSET=latin1