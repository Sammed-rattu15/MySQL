USE classicmodels;

select LastName,
	   firstName,
       jobtitle
FROM 
employees
WHERE 
jobtitle = 'Sales Rep' 
and officecode = 1;

select
officecode,
city,
phone,
country
From 
offices
where
country in ("USA","France");

