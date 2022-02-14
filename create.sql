use classicmodels;

create database example_db;

use example_db;

create table employee(
	employee_id int(4) primary key auto_increment,
	name varchar(255) not null default 'MISSING',
	age tinyint check(age >= 0)
);

describe employee;

insert into employee (`name`, `age`)
values ('keith', '25');

insert into employee (`employee_id`, `name`, `age`)
values ('9', 'Jafer', 38);

select * from employee;

create table address (
	address_id int(11) primary key auto_increment,
	address_street varchar(255) not null default 'unknown',
	city varchar(255) not null default 'unknown',
	state char(2) not null default '??',
	timestamp timestamp not null default now(6),
	fk_emp_id int(4), 
	constraint some_name foreign key(fk_emp_id)
	references employee(employee_id)
);

insert into address (`address_street`, `city`, `state`, `fk_emp_id`)
values ('wolf st', 'Richmond', 'VA', 1);



describe address;
select * from address;


