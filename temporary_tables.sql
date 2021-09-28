-- Q1 Create a temporary table called 'employees_with_departments' that contains first_name, last_name, and dept_name for employees for employees currently with that department

use employees;

select * from employees;

create temporary table hopper_1554.employees_with_departments as
select first_name, last_name, dept_name from employees
join dept_emp using(emp_no)
join departments using(dept_no);

use hopper_1554;

select * from employees_with_departments;
alter table employees_with_departments add full_name varchar(31);

UPDATE employees_with_departments
SET full_name = concat(first_name, ' ', last_name)

alter table employees_with_departments drop column first_name, drop column last_name;
-- I could have created the same table not through queries, but throgh the create temporary table command.


-- Q2 
use sakila;
describe payment;
select * from payment;

create temporary table hopper_1554.amount_in_cents as
select * from payment;

select * from hopper_1554.amount_in_cents;

use hopper_1554;
select * from amount_in_cents;

alter table amount_in_cents add cents int;
update amount_in_cents set cents = amount * 100; 


-- Q3
use employees;

select * from salaries limit 50;
-- historical average
select avg(salary) from salaries
join dept_emp using(emp_no)
join departments using(dept_no);
-- current average salary by department
select dept_name, avg(salary) curr_avg_sal from salaries s
join dept_emp de using(emp_no)
join departments d using(dept_no)
where de.to_date > now()
and s.to_date > now()
group by dept_name
limit 1000;

-- standard deviation of salaries
select stddev(salary) from salaries;

create temporary table hopper_1554.Highest_Paid_Department as
select dept_name, avg(salary) curr_avg_sal from salaries s
join dept_emp de using(emp_no)
join departments d using(dept_no)
where de.to_date > now()
and s.to_date > now()
group by dept_name;

use hopper_1554;
select * from Highest_Paid_Department;

-- add necessary columns

alter table Highest_Paid_Department add hist_avg_sal float(10,2);
alter table Highest_Paid_Department add std_deviation float(10,2);
alter table Highest_Paid_Department add zscore float(10,2);


update hopper_1554.Highest_Paid_Department set hist_avg_sal = (select avg(salary) from salaries
join dept_emp using(emp_no)
join departments using(dept_no));
update hopper_1554.Highest_Paid_Department set std_deviation = (select stddev(salary) from salaries);
update hopper_1554.Highest_Paid_Department set zscore = ((curr_avg_sal - hist_avg_sal)/std_deviation);

select * from Highest_Paid_Department;

