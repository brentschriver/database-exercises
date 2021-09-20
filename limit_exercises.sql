-- Q2
select distinct(last_name) from employees
order by last_name desc
limit 10;

-- Q3
select * from employees
where birth_date like '%-12-25'
and hire_date >= '1990-01-01' and hire_date <= '1999-12-31'
order by hire_date
limit 5;
	-- The names of the employees are: Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup

-- Q4	
select * from employees
where birth_date like '%-12-25'
and hire_date >= '1990-01-01' and hire_date <= '1999-12-31'
order by hire_date
limit 5 offset 45;