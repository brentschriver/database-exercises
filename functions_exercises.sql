-- Q2
select concat(first_name, " ", last_name) as full_name from employees
where last_name like 'e%' and last_name like '%e';

-- Q3
select upper(concat(first_name, " ", last_name)) as full_name from employees

-- Q4
select datediff(curdate(), hire_date) as days_worked from employees
where birth_date like '%-12-25'
and hire_date >= '1990-01-01' and hire_date <= '1999-12-31';

-- Q5
select min(salary), max(salary) from salaries;

-- Q6
select concat(lower(substr(first_name, 1,1)), lower(substr(last_name, 1, 4)), "_", substr(birth_date, 6,2), substr(year(birth_date),3)) as username from employees
limit 10;