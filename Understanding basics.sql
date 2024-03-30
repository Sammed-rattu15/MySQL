SELECT * FROM parks_and_recreation.employee_demographics;

SELECT 
distinct first_name, gender
FROM parks_and_recreation.employee_demographics;


# WHERE CLAUSE;

SELECT *
FROM employee_salary
WHERE salary <= 50000
;

select *
from employee_demographics
where birth_date > '1985-01-01'
;

/*	
	LOGICAL OPERATORS;
	1. AND : IS USED TO SATISFY BOTH THE LOGICS;
	2. OR : SHOULD SATISFY ATLEAST ONE CONDITION;
	3. OR NOT : ONLY ONE CONDITION CAN BE TRUE;
	4. WE CAN USE PERENTHESIS AND THEN USE ANOTHER CONDITION TO JUSTIFY THE QUERY;
	5. LIKE STATEMENT : LIKE IS A OPERATOR THAT LOOKS FOR A SPECIFIC COLOUMN AND GIVES AN EXACT MATCH. 
    AS LONG IT HAS A SPECIAL CHATACTER. WE CAN USE SPECIAL CHARACTERS IN "LIKE STATEMENT" i.e "%" and "_" 
*/

select *
from employee_demographics
where (first_name = 'Leslie' and age = 44) or age > 55
;

select *
from employee_demographics
where birth_date like '1989%'
;


# DIFFERENCE BETWEEN GROUP BY and ORDER BY

# GROUP BY : USED TO AGGERGATE FROM SELECT AND GROUPING BY THE SAME OPERATIOR USED IN SELECT;

# using average function to find the  average, maximum, minimum, age of the gender. Ex: Male & Female;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender
;

select occupation, salary
from employee_salary
group by occupation, salary
;


# ORDER BY : IT CAN BE DONE IN ASCENDING OR DECENDING ORDER

# BY DEFAULT ASCENDING ORDER;
select *
from employee_demographics
order by first_name
;

# DESCENDING ORDER USING "DESC"
select *
from employee_demographics
order by first_name desc
;

# WE CAN USE THE COLOUMN NUMBER TO GROUP BY ASIGINING VALUES TO TABLE HEADINGS;  "NOT RECOMMENDED"- CAN MESS UP 
select *
from employee_demographics
order by gender, age
;


# DIFFERENCE BETWEEN  HAVING and WHERE;

select gender, avg(age)
from employee_demographics
group by gender
having avg(age) > 40
;


select occupation, avg(salary)
from employee_salary
group by occupation
;


/*  USING BOTH HAVING AND WHERE FUNCTION: 
	HAVING WILL ONLY WORK AFTER THE AGGREGATED FUNCTIONS LIKE GROUP BY: 
	WHERE CLAUSE IS USED BEFORE AGGREGATED FUNCTIONS
*/

select occupation, avg(salary)
from employee_salary
where occupation like '%Manager%'
group by occupation
having avg(salary) > 75000
;


