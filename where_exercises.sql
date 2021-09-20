-- Q2
select * from employees
where first_name in ('Irena', 'Vidya', 'Maya');

-- Q3
select * from employees
where first_name = 'irena' or first_name = 'vidya' or first_name = 'maya';

-- Q4
select * from employees
where (gender = 'm') and (first_name = 'irena' or first_name = 'vidya' or first_name = 'maya');

-- Q5
select * from employees
where last_name like 'e%';
    -- 7330 records returned

-- Q6
select count(*) from employees
where not last_name like 'e%' and last_name like '%e';
	-- 30723 last names that start or end with 'e'
	-- 23393 last names that end with 'e', but does not start with 'e'

-- Q7
select * from employees
where last_name like '%e';
	-- 899 last names that start and end with 'e'
	-- 24292 last names that end with 'e'

-- Q8
select * from employees
where hire_date >= '1990-01-01' and hire_date <= '1999-12-31';
	-- 135214 records returned

-- Q9
select count(*) from employees
where birth_date like '%-12-25';
	-- 842 employees with a 12-25 birthday

-- Q10
select * from employees
where birth_date like '%-12-25'
and hire_date >= '1990-01-01' and hire_date <= '1999-12-31';
    -- 362 employees returned

-- Q11
select * from employees
where last_name like '%q%';
    -- 1873 employees returned

-- Q12
select * from employees
where last_name like '%q%' and not last_name like '%qu%';
	-- 547 employees returned