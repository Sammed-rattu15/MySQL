select * from employee_demographics;
select * from employee_salary;

-- JOIN CONCEPT--


# Inner join only shows which are similar to both the tables

select * 
from employee_demographics 
inner join employee_salary 
on employee_demographics.employee_id = employee_salary.employee_id; 

# Left Join

select * 
from employee_demographics 
LEFT join employee_salary 
on employee_demographics.employee_id = employee_salary.employee_id; 

select * 
from employee_demographics 
right join employee_salary 
on employee_demographics.employee_id = employee_salary.employee_id; 

select * 
from employee_demographics 
left join employee_salary 
on employee_demographics.employee_id = employee_salary.employee_id; 

select 
employee_demographics.employee_id, 
employee_demographics.first_name,
employee_demographics.last_name,
occupation,
salary
from 
employee_demographics
right join
employee_salary
on employee_demographics.employee_id = employee_salary.employee_id;

select 
employee_salary.employee_id, 
employee_demographics.first_name,
employee_demographics.last_name,
occupation,
salary
from 
employee_demographics
left join
employee_salary
on employee_demographics.employee_id = employee_salary.employee_id;

select
employee_salary.employee_id, 
employee_demographics.first_name,
employee_demographics.last_name,
salary
from 
employee_demographics
right join
employee_salary
on employee_demographics.employee_id = employee_salary.employee_id
where employee_demographics.first_name != 'Donna'
order by salary asc;

select
occupation, avg(salary)
from 
employee_demographics
right join
employee_salary
on employee_demographics.employee_id = employee_salary.employee_id
where occupation = 'Office Manager'
group by occupation;


/*
	UNIONS AND JOOINS ARE CLOSELY RELATED
	A JOIN COMBINES BOTH BY A COMMON COLOUMN
	UNION CAN SELECT ALL THE DATA INTO ONE OUTPUT
*/

select * 
from employee_demographics
inner join employee_salary 
on employee_demographics.employee_id = employee_salary.employee_id; 

select employee_id, first_name, age
from employee_demographics
union
select employee_id, occupation, salary
from employee_salary
order by employee_id;


select first_name, last_name, age,
case 
	when age > 40 then 'old'
	when age between 30 and 40 then 'Young'
    else 'baby'
end
from employee_demographics
where age is not null
order by age;

select employee_demographics.first_name, employee_demographics.last_name, occupation, salary,
case
	when occupation = "Entrepreneur" then salary + (salary * 0.10)
    when occupation = "State Auditor" then salary + (salary * 0.08)
    when occupation = "Office Manager" then salary + (salary * 0.05)
	else salary + (salary * 0.03)
end as Salary_After_Rise
from employee_demographics
join employee_salary
on employee_demographics.employee_id = employee_salary.employee_id;


