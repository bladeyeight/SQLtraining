use classicmodels;

-- find all customers located in USA and has average credit limit greater or equals average in USA


-- average credit limit in USA
select avg(creditLimit) from customers as c where country = 'USA';

select customerName, creditLimit 
from customers 
where country = 'USA' and creditLimit >= (
select avg(creditLimit) from customers as c where country = 'USA'
);

-- show highest purchase order (quantityordered*priceeach) and product name
select o.customerNumber, o.orderNumber, p.productName, sum(d.quantityOrdered * d.priceEach) as `Highest Purchase` 
from orderDetails as d
join products as p on d.productCode = p.productCode
join orders as o on d.orderNumber = o.orderNumber
join customers as c on o.customerNumber = c.customerNumber
group by d.orderNumber 
order by `Highest Purchase` desc;

-- combine
select c.customerNumber, c.customerName, sss.productName, max(sss.`Highest Purchase`) as `Highest Purchase`
from customers as c
join 
(
select o.customerNumber, o.orderNumber, p.productName, sum(d.quantityOrdered * d.priceEach) as `Highest Purchase` 
from orderDetails as d
join products as p on d.productCode = p.productCode
join orders as o on d.orderNumber = o.orderNumber
join customers as c on o.customerNumber = c.customerNumber
group by d.orderNumber 
order by `Highest Purchase` desc
) as sss on c.customernumber = sss.customernumber 
where c.creditlimit >= 
(
select avg(creditLimit) from customers as c where country = 'USA'
) and c.country = 'USA'
group by c.customernumber
order by `Highest Purchase` desc;



