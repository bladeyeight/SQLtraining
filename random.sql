
use classicmodels;

delimiter // 
create procedure get_offices_for_user_pro(in countryName varchar(255))
begin
	select * from offices where country = countryName;
end //

delimiter ;

call get_offices_for_user_pro('UK');

set @total = 20;
select @total;

delimiter //
create procedure _count_order_by_status(in orderStatus varchar(25), out total int)
begin 
	select count(orderNumber) into total from orders
	where status = orderStatus;
end //
delimiter ;

call count_order_by_status('Shipped', @total);
select @total;

select firstname, 
case jobtitle
	when 'Sales Rep' then 'we depend on you'
	when 'VP Sales' then 'support reps'
	else 'You are doing a great Job!'
end as motivation,
lastName
from employees as e;

-- random example of how to do a cross join
select *from employees join products;
