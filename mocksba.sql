use mocksql;

-- Question 1 
select o.order_id, u.user_id, s.store_id
from orders as o  
join users as u on o.user_id = u.user_id
join stores as s on o.store_id = s.store_id
where u.first_name = 'Marion';

-- Question 2 
select *
from users as u 
join orders as o on u.user_id = o.user_id;

-- dont understand this one yet

-- Question 3

