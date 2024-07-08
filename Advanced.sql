### JOINS ###

##INNER JOIN 

/*
The INNER JOIN matches each row in one table with every row in other tables and allows you to query rows that contain columns 
from both tables.

The INNER JOIN keyword selects records that have matching values in both tables. It appears immediately after the FROM clause.

SELECT 
     select_list
FROM 
     t1
INNER JOIN t2 ON join_condition;
*/


SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
INNER JOIN productlines t2 
    ON t1.productline = t2.productline;
    
    
#LEFT JOIN

/*

1. The LEFT JOIN keyword returns all records from the left table (table1), and the matching records (if any) from the 
right table (table2).
2. When you use the LEFT JOIN clause, the concepts of the left table and the right table are introduced.
3. In the below syntax, t1 is the left table and t2 is the right table.
4. The LEFT JOIN clause selects data starting from the left table (t1). It matches each row from the left table (t1) 
with every row from the right table(t2) based on the join_condition.

Syntax-

SELECT 
    select_list
FROM
    t1
LEFT JOIN t2 ON 
    join_condition;

*/

SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber;
    
    
SELECT 
    c.customerNumber, 
    c.customerName, 
    o.orderNumber, 
    o.status,
    count(*)
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
group by c.customerNumber, 
    c.customerName, 
    o.orderNumber, 
    o.status;   # ERROR : We should add all the values in the SELECT 
    
# Right Join

/*
1.The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records (if any) 
from the left table (table1).

SELECT 
    select_list
FROM t1
RIGHT JOIN t2 ON (column_name);
*/

    
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;

# CROSS JOIN

/*
1. The CROSS JOIN keyword returns all records from both tables (table1 and table2).
2. Suppose you join two tables using the CROSS JOIN clause. The result set will include all rows from both tables, 
where each row is the combination of the row in the first table with the row in the second table. 
In general, if each table has n and m rows respectively, the result set will have nxm rows.
3. It has no ON clause 

SELECT select_list 
FROM t1
CROSS JOIN t2;
*/


SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
CROSS JOIN productlines t2 
WHERE t1.productline = t2.productline;


# SELF JOIN 

/*

1. A self join allows you to join a table to itself. Since MySQL does not have specific self join syntax, you need to 
perform a self join via a regular join such as left join or inner join.


*/

SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;
    
select * from employees;

select 
	concat(m.lastName, ' ', m.firstName) as Manager,
    concat(e.lastName, ' ', e.firstName) as 'Direct Report'
from 
	employees e
inner join employees m on m.employeeNumber = e.reportsTo
order by
	Manager;
    
# SUBQUERIES

/*
1. A MySQL subquery is called an inner query whereas the query that contains the subquery is called an outer query. 
A subquery can be used anywhere that expression is used and must be closed in parentheses.
*/

SELECT 
    lastName, firstName
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA');
            
            
    
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments);
    
SELECT 
    productname, 
    buyprice
FROM
    products p1
WHERE
    buyprice > (SELECT 
            AVG(buyprice)
        FROM
            products
        WHERE
            productline = p1.productline);
            
            

