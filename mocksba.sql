use mocksql;



-- Question 1 
select o.order_id, u.user_id, s.store_id
from orders as o  
join users as u on o.user_id = u.user_id
join stores as s on o.store_id = s.store_id
where u.first_name = 'Marion';

-- Question 2 
select u.*
from users as u 
left join orders as o on u.user_id = o.user_id
where o.order_id is null;

-- Question 3
select distinct  i.name, i.price
from items as i
join order_items as oi on i.item_id = oi.ITEM_ID
where i.name in (
select i.name
from items as i 
join order_items as oi on i.item_id = oi.item_id
group by i.name
having count(oi.item_id) > 1
);

-- Question 4
select oi.order_id, i.name, i.price, oi.quantity, s.city
from order_items as oi 
join items as i on oi.item_id = i.item_id
join orders as o on oi.order_id = o.order_id
right join stores as s on o.store_id = s.store_id
where s.city = 'New York'
order by order_id;

-- Question 5
select i.item_id, i.name as `Item Name`, ifNull(sum(i.price * oi.quantity), 0) as 'Revenue' 
from items as i 
left join order_items as oi on i.item_id = oi.item_id
group by `Item Name`;

-- Question 6
select s.name as `Store Name`, oi.quantity as `Order Quantity`,
case 
	when oi.quantity > 3 then 'High'
	when oi.quantity < 3 and oi.quantity > 1 then 'Medium'
	when oi.quantity <= 1 then 'Low'
	else 'NA'
end as `Sales Figure`
from stores as s 
left join orders as o on s.store_id = o.STORE_ID 
left join order_items as oi on o.order_id = oi.order_id
order by `Order Quantity` desc;



