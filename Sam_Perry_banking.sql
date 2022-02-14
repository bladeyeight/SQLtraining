use banking;
-- Question 1
select name as 'Product', product_type_cd as 'Type'
from product;
-- Question 2
select branch.name, branch.city, employee.last_name, employee.title
from branch
join employee on branch_id = assigned_branch_id;

-- Question 3
select title from employee
group by title;

-- Question 4
select employee.last_name, employee.title, e.last_name, e.title
from employee
left join employee as e on employee.superior_emp_id = e.emp_id;
-- Question 5
select p.name, a.avail_balance, i.last_name 
from account as a 
join product as p on a.product_CD = p.PRODUCT_CD 
join customer as c on a.cust_id = c.CUST_ID 
join individual as i on c.cust_id = i.cust_id;
-- Question 6
select atran.* 
from acc_transaction as atran 
join account as a on atran.account_id = a.ACCOUNT_ID
join customer as c on a.cust_id = c.CUST_ID 
join individual as i on c.cust_id = i.CUST_ID 
where i.last_name like 'T%';




