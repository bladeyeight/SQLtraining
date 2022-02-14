use classicmodels;

-- question 1
select productName, productLine, buyPrice
from products
order by buyPrice desc;

-- question 2 
select contactFirstName as 'First Name', contactLastName as 'Last Name', city 
from customers
where country = 'Germany'
order by contactLastName;
-- question 3 
select status
from orders
group by status;
-- question 4 
select * 
from payments
where paymentDate >= '2005-01-01'
order by paymentDate;
-- question 5
select lastName, firstName, email, jobTitle
from employees
where officeCode = 1
order by lastName;
-- question 6
select productName, productLine, productScale, productVendor
from products
where productLine like '%cars'
order by productLine desc, productName;


