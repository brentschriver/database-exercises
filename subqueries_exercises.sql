-- Q1 Find all the current employees with the same hire date as employee 101010 using a sub-query.
select * from employees;

select hire_date from employees
where emp_no = 010101;

select * from employees
where hire_date = (select hire_date from employees
where emp_no = 010101);


-- Q2 Find all the titles ever held by all current employees with the first name Aamod.
select emp_no from employees
where first_name = 'Aamod';

select * from titles
where emp_no in (select emp_no from employees
where first_name = 'Aamod') and to_date > now();


-- Q3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select emp_no from dept_emp
where to_date not like '999%';

select * from employees
where emp_no in (select emp_no from dept_emp
where to_date not like '999%');


-- Q4 Find all the current department managers that are female. List their names in a comment in your code.
select emp_no from dept_manager
where to_date like '99%';

select * from employees
where emp_no in (select emp_no from dept_manager
where to_date like '99%') and gender = 'F'; -- The current female department managers are: Isamu, Karsten, Leon, and Hilary.


-- Q5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.alter
select avg(salary) from salaries;

select * from salaries
where salary > (select avg(salary) from salaries) and to_date > now();


-- Q6 How many current salaries are within 1 standard deviation of the current highest salary? What percentage of all salaries is this?
use employees;
select max(salary) from salaries;
select std(salary) from salaries;

select count(*) from salaries
where salary > (select (max(salary) - std(salary)) from salaries
where to_date > now()) and to_date > now() 
;

select ((select count(*) from salaries
where salary > (select (max(salary) - std(salary)) from salaries
where to_date > now()) and to_date > now()))/(select count(*) from salaries where to_date > now());