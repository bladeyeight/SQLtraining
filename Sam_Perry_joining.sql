use classicmodels;

-- Question 1 
select c.customerName as 'Customer Name', CONCAT(e.lastName, ', ', e.firstName) as 'Sales Rep'
from customers as c 
join employees as e on c.salesRepEmployeeNumber = e.employeeNumber;

-- Question 2
select p.productName as'Product Name', d.quantityOrdered as 'Total # Ordered', sum(d.quantityOrdered * d.priceEach) as `Total Sale`
from products as p
join orderdetails as d on p.productCode = d.productCode
group by p.productname
order by `Total Sale` desc;

-- Question 3
select o.status as 'Order Status', count(*) as '# Orders'
from orders as o
group by o.status
order by o.status;

-- Question 4
select p.productLine as 'Product Line', d.quantityOrdered as '# Sold'
from products as p 
join orderdetails as d on p.productCode = d.productCode
order by d.quantityOrdered desc;

-- Question 5
select CONCAT(e.lastName, ', ', e.firstName) as 'Sales Rep', count(o.orderNumber) as '# Orders', IFNULL(sum(d.quantityOrdered * d.priceEach), 0) as 'Total Sales'
from employees as e 
left join customers as c on e.employeeNumber = c.salesRepEmployeeNumber 
left join orders as o on c.customerNumber = o.customerNumber
left join orderdetails as d on o.orderNumber = d.orderNumber
where e.jobTitle = 'Sales Rep'
group by CONCAT(e.lastName, ', ', e.firstName)
order by (d.quantityOrdered * d.priceEach) desc;


-- Question 6
select monthname(orderDate) as `Month`, replace(year(orderDate), ',', '') as `Year`, round(sum(d.quantityOrdered * d.priceEach), 2) as 'Payment Received'
from orders as o
join orderdetails as d on o.ordernumber = d.orderNumber 
join payments as p on o.customernumber = p.customernumber
group by `Month`;








