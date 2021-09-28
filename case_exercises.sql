-- Q1 Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
use employees;
show tables;
select 
	emp_no, dept_no, from_date, to_date,
	case
		when de.to_date > now() then 1
        else 0
        end as is_current_employee
from employees e
join dept_emp de using(emp_no)
join departments d using(dept_no);


-- Q2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
select 
	concat(first_name, ' ', last_name),
	case
		when last_name like 'a%' or last_name like 'b%' or last_name like 'c%' or last_name like 'd%' or last_name like 'e%' or last_name like 'f%' or last_name like 'g%' or last_name like 'h%' then 'A-H'
        when last_name like 'i%' or last_name like 'j%' or last_name like 'k%' or last_name like 'l%' or last_name like 'm%' or last_name like 'n%' or last_name like 'o%' or last_name like 'p%' or last_name like 'q%' then 'I-Q'
        when last_name like 'r%' or last_name like 's%' or last_name like 't%' or last_name like 'u%' or last_name like 'v%' or last_name like 'w%' or last_name like 'x%' or last_name like 'y%' or last_name like 'z%' then 'R-Z'
        else 0
        end as alpha_group
from employees e
join dept_emp de using(emp_no)
join departments d using(dept_no)
limit 1000;


-- Q3 How many employees (current or previous) were born in each decade?
select 
	birth_date,
	case 
		when birth_date between '1900-01-01' and '1909-12-31' then '1900s'
        when birth_date between '1910-01-01' and '1919-12-31' then '1910s'
        when birth_date between '1920-01-01' and '1929-12-31' then '1920s'
		when birth_date between '1930-01-01' and '1939-12-31' then '1930s'
        when birth_date between '1940-01-01' and '1949-12-31' then '1940s'
        when birth_date between '1950-01-01' and '1959-12-31' then '1950s'
        when birth_date between '1960-01-01' and '1969-12-31' then '1960s'
        when birth_date between '1970-01-01' and '1979-12-31' then '1970s'
        when birth_date between '1980-01-01' and '1989-12-31' then '1980s'
        when birth_date between '1990-01-01' and '1999-12-31' then '1990s'
        else 0
        end as decade_born
from employees e
join dept_emp de using(emp_no)
join departments d using(dept_no)
limit 1000;