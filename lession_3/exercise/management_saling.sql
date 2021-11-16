drop database if exists bank_management;
create database bank_management;
use bank_management;

create table customer (
	customer_id int auto_increment primary key,
	customer_name varchar(20) not null,
	customer_age int not null
);

create table orders (
	order_id int auto_increment primary key,
	customer_id int,
	order_date date,
	order_total_price double,
	foreign key (customer_id) references customer(customer_id)
);

create table products (
	product_id int auto_increment primary key,
    product_name varchar(20),
    product_price double
);

create table order_detail (
	order_detail_qty varchar(20),
    order_id int,
    product_id int,
    primary key (order_id,product_id),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);






insert into customer (customer_name, customer_age)
value 
('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

insert into orders (customer_id, order_date, order_total_price)
values 
(1, '2006-03-21', null),
(2, '2006-03-23', null),
(1, '2006-03-16', null);

insert into products (product_name, product_price)
values
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

insert into order_detail (order_id, product_id, order_detail_qty)
values 
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

select order_id, order_date, order_total_price
from orders;

select customer_name
from customer c join orders o on c.customer_id = o.customer_id;

select product_name 
from products p join order_detail od on p.product_id = od.product_id;
