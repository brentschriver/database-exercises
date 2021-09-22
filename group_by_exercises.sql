-- Q2
select distinct(title) from titles;
    -- There are seven titles

-- Q3
select last_name from employees
where last_name like 'e%' and last_name like '%e'
group by last_name;

-- Q4
select concat(first_name, " ", last_name) as full_name
from employees
group by full_name;

-- Q5
select last_name from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name;
    -- The unique last names are Chleq, Lindqvist, Qiwen

-- Q6
select last_name, count(*) from employees
where last_name like '%q%' and last_name not like '%qu%'
group by last_name;

-- Q7
select first_name, gender, count(*) from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by first_name, gender;

-- Q8
select concat(lower(substr(first_name, 1,1)), 
lower(substr(last_name, 1, 4)), 
"_", 
substr(birth_date, 6,2), 
substr(year(birth_date),3)) as username, count(*) from employees
group by username
having count(*) > 1;
    -- There are 27,403 duplicate usernames (24916 + 2115 + 288 + 60 + 24)

-- Q9
select avg(salary) from salaries;
    -- Historic average salary
select avg(salary) from salaries
where to_date like '9999%';
    -- Current average salary
select emp_no, avg(salary)
from salaries
group by emp_no;
    -- Historic average salary for all employees
select * from salaries
where to_date like '9%%';
    -- Current average salary for each employee
select emp_no, max(salary) from salaries
group by emp_no;
    -- Maximum salary for each current employee
select emp_no, max(salary) from salaries
where salary > 150000
group by emp_no;
    -- Max salary for each current employee where max salary is greater than $150,000
select emp_no, avg(salary) as avg_salary from salaries
where salary between 80000 and 90000
group by emp_no;
    -- Current average salaary for each employee where that average salary is between $80,000 and $90,000
    


