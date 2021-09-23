
use join_example_db;

select * from roles;
select * from users;

select * from dept_manager;
select * from employees;
select * from departments;
select * from dept_emp;

-- Q2
select departments.dept_name as 'Department Name', concat(employees.first_name, ' ', employees.last_name) as 'Department Manager'
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on employees.emp_no = dept_manager.emp_no
where dept_manager.to_date like '99%'
order by departments.dept_name asc;

-- Q3
select departments.dept_name as 'Department Name', concat(employees.first_name, ' ', employees.last_name) as 'Department Manager'
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on employees.emp_no = dept_manager.emp_no
where employees.gender = 'f'
and dept_manager.to_date like '99%'
order by departments.dept_name asc;

describe departments;
select * from titles;
select * from employees;
select * from dept_emp;

--Q4
select titles.title as Title, count(*) from titles
join dept_emp on dept_emp.emp_no = titles.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Customer Service'
and titles.to_date > now()
group by titles.title
order by titles.title;

select * from salaries;

-- Q5
select departments.dept_name as 'Department Name', concat(employees.first_name, ' ', employees.last_name) as 'Department Manager', salaries.salary
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on employees.emp_no = dept_manager.emp_no
join salaries on salaries.emp_no = dept_manager.emp_no
where dept_manager.to_date > now()
and salaries.to_date > now()
order by departments.dept_name asc;

select * from departments;

-- Q6
select d.dept_no, d.dept_name, count(*) from departments as d
join dept_emp as de on d.dept_no = de.dept_no
join employees as e on e.emp_no = de.emp_no
where de.to_date > now()
group by d.dept_name
order by d.dept_name;

select * from salaries;
select * from dept_emp;

-- Q7
select dept_name, avg(salary) as average_salary from departments as d
join dept_emp as de on de.dept_no = d.dept_no
join employees as e on e.emp_no = de.emp_no
join salaries as s on s.emp_no = e.emp_no
where s.to_date > now() and de.to_date > now()
group by dept_name
order by average_salary desc
limit 1;

select* from dept_emp;
select * from departments;

-- Q8
select first_name, last_name, s.salary from employees as e
join dept_emp as de on de.emp_no = e.emp_no
join departments as d on d.dept_no = de.dept_no
join salaries as s on s.emp_no = e.emp_no
where s.to_date > now() and de.to_date > now() and d.dept_no = 'd001'
order by s.salary desc
limit 1;

-- Q9
select employees.first_name, employees.last_name, salaries.salary, departments.dept_name
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on employees.emp_no = dept_manager.emp_no
join salaries on salaries.emp_no = dept_manager.emp_no
where dept_manager.to_date > now()
and salaries.to_date > now()
order by salaries.salary desc
limit 1;

select * from departments;
select * from dept_manager;
select * from dept_emp;

select concat(e.first_name, ' ', e.last_name) as 'Employee Name', d.dept_name as 'Department Name' from departments as d
join dept_emp as de on de.dept_no = d.dept_no
join employees as e on e.emp_no = de.emp_no
join dept_manager as dm on dm.emp_no = e.emp_no
join employees as managers on dm.emp_no = e.emp_no
where de.to_date > now();

-- Q10
select departments.dept_name as 'Department Name', concat(employees.first_name, ' ', employees.last_name) as 'Department Manager'
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on employees.emp_no = dept_manager.emp_no
where dept_manager.to_date like '99%'
order by departments.dept_name asc;

-- Q11
select concat(e.first_name, ' ', e.last_name), d.dept_name, s.salary from departments as d
join dept_emp as de on d.dept_no = de.dept_no
join employees as e on e.emp_no = de.emp_no
join salaries as s on s.emp_no = de.emp_no
where de.to_date > now() and s.to_date > now()
order by d.dept_name, s.salary desc;