-- Q2
select * from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name;
	-- The first row is 'Irena Reutenauer'
	-- The last row is 'Vidya Simmen'


-- Q3
select * from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name asc, last_name asc;
	-- The first row in the list is 'Irena Acton'
	-- The last row in the list is 'Vidya Zweizig'

-- Q4
select * from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name asc, first_name asc;
	-- The first row in the list is 'Irena Acton'
	-- The last row in the list is 'Maya Zyda'

-- Q5
select * from employees
where last_name like 'e%' and last_name like '%e'
order by emp_no;
	-- 899 records returned
	-- First employee number and name is 10021, Ramzi Erde
	-- Last employee number and name is 499648, Tadahiro Erde

-- Q6
select * from employees
where last_name like 'e%' and last_name like '%e'
order by hire_date desc;
	-- 899 records returned
	-- Newest employee: Teiji Eldridge
	-- Oldest employee: Sergi Erde
	
-- Q7
select * from employees
where birth_date like '%-12-25'
and hire_date >= '1990-01-01' and hire_date <= '1999-12-31'
order by year(birth_date), year(hire_date) desc;
	-- 362 records returned
	-- Oldest employee hired last: Khun Bernini
	-- Youngest employee hired first: Douadi Pettis