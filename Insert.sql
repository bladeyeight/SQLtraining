use classicmodels;
select * from offices;
insert into offices values ('8', 'Plano', '5554443333', '123 street', null, 'TX', 'USA', '12345', 'NA');
delete from offices where officeCode = '8';

insert into offices (`officeCode`, `city`, `phone`, `addressLine1`, `country`, `postalCode`, `territory`)
values 
('9', 'Plano', '5554443333', '123 street', 'USA', '12345', 'NA'),
('10', 'Plano', '5554443333', '123 street', 'USA', '12345', 'NA');

delete from offices where phone = '5554443333';

select * from customers;
update customers 
set phone = '477-931-2258'
where customerNumber=487;